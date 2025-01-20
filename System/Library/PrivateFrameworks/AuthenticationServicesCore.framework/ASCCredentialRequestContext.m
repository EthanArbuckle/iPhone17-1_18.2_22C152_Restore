@interface ASCCredentialRequestContext
+ (BOOL)supportsSecureCoding;
- (AKAuthorizationRequest)appleIDAuthorizationRequest;
- (ASCCredentialRequestContext)initWithCoder:(id)a3;
- (ASCCredentialRequestContext)initWithRequestTypes:(unint64_t)a3;
- (ASCPublicKeyCredentialAssertionOptions)platformKeyCredentialAssertionOptions;
- (ASCPublicKeyCredentialAssertionOptions)securityKeyCredentialAssertionOptions;
- (ASCPublicKeyCredentialCreationOptions)platformKeyCredentialCreationOptions;
- (ASCPublicKeyCredentialCreationOptions)securityKeyCredentialCreationOptions;
- (ASGlobalFrameIdentifier)globalFrameID;
- (BOOL)isCABLEAuthenticatorRequest;
- (BOOL)isClientLinkedOnOrAfterIOS15Aligned;
- (BOOL)isConditionalRegistrationRequest;
- (BOOL)isProxiedRequest;
- (BOOL)isRegistrationRequest;
- (BOOL)isUsingWebBrowserOnlyOptions;
- (BOOL)useAlternativeSecurityKeysIcon;
- (LAContext)authenticatedContext;
- (NSArray)proxiedAssociatedDomains;
- (NSData)proxiedIconData;
- (NSNumber)proxiedIconScale;
- (NSString)proxiedAppIdentifier;
- (NSString)proxiedAppName;
- (NSString)proxiedBundleIdentifier;
- (NSString)proxiedOriginDeviceName;
- (NSString)proxiedTeamIdentifier;
- (NSString)proxySheetHeaderOverride;
- (NSString)proxySheetNoCredentialsErrorMessageOverride;
- (NSString)proxySheetNoCredentialsErrorTitleOverride;
- (NSString)proxySheetSubtitleOverride;
- (NSString)proxySheetTitleOverride;
- (NSString)relyingPartyIdentifier;
- (NSString)windowSceneIdentifier;
- (WBSSavedAccountContext)savedAccountContext;
- (int64_t)requestStyle;
- (unint64_t)requestOptions;
- (unint64_t)requestTypes;
- (void)applyMagicCredentialIDIfNecessary;
- (void)encodeWithCoder:(id)a3;
- (void)logRequest;
- (void)removePasskeyRequests;
- (void)removeSecurityKeyRequests;
- (void)sanitizeRequestTypesForAutoFillRequestIfNecessary;
- (void)setAppleIDAuthorizationRequest:(id)a3;
- (void)setAuthenticatedContext:(id)a3;
- (void)setGlobalFrameID:(id)a3;
- (void)setIsCABLEAuthenticatorRequest:(BOOL)a3;
- (void)setIsConditionalRegistrationRequest:(BOOL)a3;
- (void)setPlatformKeyCredentialAssertionOptions:(id)a3;
- (void)setPlatformKeyCredentialCreationOptions:(id)a3;
- (void)setProxiedAppIdentifier:(id)a3;
- (void)setProxiedAppName:(id)a3;
- (void)setProxiedAssociatedDomains:(id)a3;
- (void)setProxiedBundleIdentifier:(id)a3;
- (void)setProxiedIconData:(id)a3;
- (void)setProxiedIconScale:(id)a3;
- (void)setProxiedOriginDeviceName:(id)a3;
- (void)setProxiedTeamIdentifier:(id)a3;
- (void)setProxySheetHeaderOverride:(id)a3;
- (void)setProxySheetNoCredentialsErrorMessageOverride:(id)a3;
- (void)setProxySheetNoCredentialsErrorTitleOverride:(id)a3;
- (void)setProxySheetSubtitleOverride:(id)a3;
- (void)setProxySheetTitleOverride:(id)a3;
- (void)setRelyingPartyIdentifier:(id)a3;
- (void)setRequestOptions:(unint64_t)a3;
- (void)setRequestStyle:(int64_t)a3;
- (void)setSavedAccountContext:(id)a3;
- (void)setSecurityKeyCredentialAssertionOptions:(id)a3;
- (void)setSecurityKeyCredentialCreationOptions:(id)a3;
- (void)setUseAlternativeSecurityKeysIcon:(BOOL)a3;
- (void)setWindowSceneIdentifier:(id)a3;
@end

@implementation ASCCredentialRequestContext

- (ASCCredentialRequestContext)initWithRequestTypes:(unint64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)ASCCredentialRequestContext;
  v4 = [(ASCCredentialRequestContext *)&v8 init];
  v5 = v4;
  if (v4)
  {
    v4->_requestTypes = a3;
    v4->_isClientLinkedOnOrAfterIOS15Aligned = dyld_program_sdk_at_least();
    v6 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v4 = NSNumber;
  unint64_t requestTypes = self->_requestTypes;
  id v7 = a3;
  v6 = [v4 numberWithUnsignedInteger:requestTypes];
  [v7 encodeObject:v6 forKey:@"requestTypes"];

  [v7 encodeObject:self->_proxiedAppName forKey:@"appName"];
  [v7 encodeObject:self->_proxiedAppIdentifier forKey:@"appIdentifier"];
  [v7 encodeObject:self->_proxiedBundleIdentifier forKey:@"bundleIdentifier"];
  [v7 encodeObject:self->_proxiedTeamIdentifier forKey:@"teamIdentifier"];
  [v7 encodeObject:self->_proxiedAssociatedDomains forKey:@"associatedDomains"];
  [v7 encodeObject:self->_proxiedIconData forKey:@"iconData"];
  [v7 encodeObject:self->_proxiedIconScale forKey:@"iconScale"];
  [v7 encodeObject:self->_proxiedOriginDeviceName forKey:@"proxiedOriginDeviceName"];
  [v7 encodeObject:self->_proxySheetHeaderOverride forKey:@"proxySheetHeaderOverride"];
  [v7 encodeObject:self->_proxySheetTitleOverride forKey:@"proxySheetTitleOverride"];
  [v7 encodeObject:self->_proxySheetSubtitleOverride forKey:@"proxySheetSubtitleOverride"];
  [v7 encodeObject:self->_proxySheetNoCredentialsErrorTitleOverride forKey:@"proxySheetNoCredentialsErrorTitleOverride"];
  [v7 encodeObject:self->_proxySheetNoCredentialsErrorMessageOverride forKey:@"proxySheetNoCredentialsErrorMessageOverride"];
  [v7 encodeInteger:self->_requestStyle forKey:@"requestStyle"];
  [v7 encodeObject:self->_globalFrameID forKey:@"webGlobalFrameID"];
  [v7 encodeInteger:self->_requestOptions forKey:@"requestOptions"];
  [v7 encodeObject:self->_authenticatedContext forKey:@"authenticatedContext"];
  [v7 encodeBool:self->_useAlternativeSecurityKeysIcon forKey:@"useAlternativeSecurityKeysIcon"];
  [v7 encodeObject:self->_appleIDAuthorizationRequest forKey:@"appleIDAuthorizationRequest"];
  [v7 encodeBool:self->_isClientLinkedOnOrAfterIOS15Aligned forKey:@"linkedOnOrAfterIOS15Aligned"];
  [v7 encodeObject:self->_relyingPartyIdentifier forKey:@"relyingPartyIdentifier"];
  [v7 encodeObject:self->_platformKeyCredentialCreationOptions forKey:@"platformCredentialCreationOptions"];
  [v7 encodeObject:self->_platformKeyCredentialAssertionOptions forKey:@"platformCredentialAssertionOptions"];
  [v7 encodeObject:self->_securityKeyCredentialCreationOptions forKey:@"securityKeyCredentialCreationOptions"];
  [v7 encodeObject:self->_securityKeyCredentialAssertionOptions forKey:@"securityKeyCredentialAssertionOptions"];
  [v7 encodeObject:self->_savedAccountContext forKey:@"savedAccountContext"];
  [v7 encodeBool:self->_isConditionalRegistrationRequest forKey:@"isConditionalRegistrationRequest"];
  [v7 encodeObject:self->_windowSceneIdentifier forKey:@"windowSceneIdentifier"];
}

- (ASCCredentialRequestContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v60.receiver = self;
  v60.super_class = (Class)ASCCredentialRequestContext;
  v5 = [(ASCCredentialRequestContext *)&v60 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"requestTypes"];
    v5->_unint64_t requestTypes = [v6 unsignedIntegerValue];
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"appName"];
    proxiedAppName = v5->_proxiedAppName;
    v5->_proxiedAppName = (NSString *)v7;

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"appIdentifier"];
    proxiedAppIdentifier = v5->_proxiedAppIdentifier;
    v5->_proxiedAppIdentifier = (NSString *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleIdentifier"];
    proxiedBundleIdentifier = v5->_proxiedBundleIdentifier;
    v5->_proxiedBundleIdentifier = (NSString *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"teamIdentifier"];
    proxiedTeamIdentifier = v5->_proxiedTeamIdentifier;
    v5->_proxiedTeamIdentifier = (NSString *)v13;

    v15 = (void *)MEMORY[0x263EFFA08];
    uint64_t v16 = objc_opt_class();
    v17 = objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
    uint64_t v18 = [v4 decodeObjectOfClasses:v17 forKey:@"associatedDomains"];
    proxiedAssociatedDomains = v5->_proxiedAssociatedDomains;
    v5->_proxiedAssociatedDomains = (NSArray *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"iconData"];
    proxiedIconData = v5->_proxiedIconData;
    v5->_proxiedIconData = (NSData *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"iconScale"];
    proxiedIconScale = v5->_proxiedIconScale;
    v5->_proxiedIconScale = (NSNumber *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"proxiedOriginDeviceName"];
    proxiedOriginDeviceName = v5->_proxiedOriginDeviceName;
    v5->_proxiedOriginDeviceName = (NSString *)v24;

    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"proxySheetHeaderOverride"];
    proxySheetHeaderOverride = v5->_proxySheetHeaderOverride;
    v5->_proxySheetHeaderOverride = (NSString *)v26;

    uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"proxySheetTitleOverride"];
    proxySheetTitleOverride = v5->_proxySheetTitleOverride;
    v5->_proxySheetTitleOverride = (NSString *)v28;

    uint64_t v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"proxySheetSubtitleOverride"];
    proxySheetSubtitleOverride = v5->_proxySheetSubtitleOverride;
    v5->_proxySheetSubtitleOverride = (NSString *)v30;

    uint64_t v32 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"proxySheetNoCredentialsErrorTitleOverride"];
    proxySheetNoCredentialsErrorTitleOverride = v5->_proxySheetNoCredentialsErrorTitleOverride;
    v5->_proxySheetNoCredentialsErrorTitleOverride = (NSString *)v32;

    uint64_t v34 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"proxySheetNoCredentialsErrorMessageOverride"];
    proxySheetNoCredentialsErrorMessageOverride = v5->_proxySheetNoCredentialsErrorMessageOverride;
    v5->_proxySheetNoCredentialsErrorMessageOverride = (NSString *)v34;

    unint64_t v36 = [v4 decodeIntegerForKey:@"requestStyle"];
    if (v36 >= 3) {
      unint64_t v37 = 0;
    }
    else {
      unint64_t v37 = v36;
    }
    v5->_requestStyle = v37;
    uint64_t v38 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"webGlobalFrameID"];
    globalFrameID = v5->_globalFrameID;
    v5->_globalFrameID = (ASGlobalFrameIdentifier *)v38;

    v5->_requestOptions = [v4 decodeIntegerForKey:@"requestOptions"];
    uint64_t v40 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"authenticatedContext"];
    authenticatedContext = v5->_authenticatedContext;
    v5->_authenticatedContext = (LAContext *)v40;

    v5->_useAlternativeSecurityKeysIcon = [v4 decodeBoolForKey:@"useAlternativeSecurityKeysIcon"];
    uint64_t v42 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"appleIDAuthorizationRequest"];
    appleIDAuthorizationRequest = v5->_appleIDAuthorizationRequest;
    v5->_appleIDAuthorizationRequest = (AKAuthorizationRequest *)v42;

    v5->_isClientLinkedOnOrAfterIOS15Aligned = [v4 decodeBoolForKey:@"linkedOnOrAfterIOS15Aligned"];
    uint64_t v44 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"relyingPartyIdentifier"];
    relyingPartyIdentifier = v5->_relyingPartyIdentifier;
    v5->_relyingPartyIdentifier = (NSString *)v44;

    uint64_t v46 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"platformCredentialCreationOptions"];
    platformKeyCredentialCreationOptions = v5->_platformKeyCredentialCreationOptions;
    v5->_platformKeyCredentialCreationOptions = (ASCPublicKeyCredentialCreationOptions *)v46;

    uint64_t v48 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"platformCredentialAssertionOptions"];
    platformKeyCredentialAssertionOptions = v5->_platformKeyCredentialAssertionOptions;
    v5->_platformKeyCredentialAssertionOptions = (ASCPublicKeyCredentialAssertionOptions *)v48;

    uint64_t v50 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"securityKeyCredentialCreationOptions"];
    securityKeyCredentialCreationOptions = v5->_securityKeyCredentialCreationOptions;
    v5->_securityKeyCredentialCreationOptions = (ASCPublicKeyCredentialCreationOptions *)v50;

    uint64_t v52 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"securityKeyCredentialAssertionOptions"];
    securityKeyCredentialAssertionOptions = v5->_securityKeyCredentialAssertionOptions;
    v5->_securityKeyCredentialAssertionOptions = (ASCPublicKeyCredentialAssertionOptions *)v52;

    v5->_isConditionalRegistrationRequest = [v4 decodeBoolForKey:@"isConditionalRegistrationRequest"];
    uint64_t v54 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"windowSceneIdentifier"];
    windowSceneIdentifier = v5->_windowSceneIdentifier;
    v5->_windowSceneIdentifier = (NSString *)v54;

    uint64_t v56 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"savedAccountContext"];
    savedAccountContext = v5->_savedAccountContext;
    v5->_savedAccountContext = (WBSSavedAccountContext *)v56;

    v58 = v5;
  }

  return v5;
}

- (BOOL)isProxiedRequest
{
  return self->_proxiedAppName
      || self->_proxiedAppIdentifier
      || self->_proxiedBundleIdentifier
      || self->_proxiedTeamIdentifier
      || self->_proxiedAssociatedDomains
      || self->_proxiedIconData
      || self->_proxiedIconScale
      || self->_proxiedOriginDeviceName
      || self->_proxySheetHeaderOverride
      || self->_proxySheetTitleOverride
      || self->_proxySheetSubtitleOverride
      || self->_proxySheetNoCredentialsErrorTitleOverride
      || self->_proxySheetNoCredentialsErrorMessageOverride != 0;
}

- (BOOL)isRegistrationRequest
{
  return (self->_requestTypes & 0x14) != 0;
}

- (BOOL)isUsingWebBrowserOnlyOptions
{
  v3 = self->_platformKeyCredentialAssertionOptions;
  uint64_t v4 = [(ASCPublicKeyCredentialAssertionOptions *)v3 clientDataHash];
  if (!v4)
  {
    v5 = [(ASCPublicKeyCredentialAssertionOptions *)v3 clientDataJSON];
    if (v5 || [(ASCPublicKeyCredentialAssertionOptions *)v3 shouldHideHybrid]) {
      goto LABEL_5;
    }
    objc_super v8 = [(ASCPublicKeyCredentialAssertionOptions *)v3 appIDForSecurityKeys];

    if (v8)
    {
      BOOL v6 = 1;
      goto LABEL_7;
    }
    v5 = self->_platformKeyCredentialCreationOptions;
    uint64_t v9 = [(ASCPublicKeyCredentialCreationOptions *)v5 clientDataHash];
    if (v9
      || ([(ASCPublicKeyCredentialCreationOptions *)v5 clientDataJSON],
          (uint64_t v9 = objc_claimAutoreleasedReturnValue()) != 0)
      || ([(ASCPublicKeyCredentialCreationOptions *)v5 excludedCredentials],
          (uint64_t v9 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v10 = (ASCPublicKeyCredentialAssertionOptions *)v9;
LABEL_14:
      BOOL v6 = 1;
LABEL_15:

      goto LABEL_6;
    }
    if ([(ASCPublicKeyCredentialCreationOptions *)v5 shouldHideHybrid]) {
      goto LABEL_5;
    }
    v10 = self->_securityKeyCredentialAssertionOptions;
    uint64_t v11 = [(ASCPublicKeyCredentialAssertionOptions *)v10 clientDataHash];
    if (v11
      || ([(ASCPublicKeyCredentialAssertionOptions *)v10 clientDataJSON],
          (uint64_t v11 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      BOOL v6 = 1;
LABEL_20:

      goto LABEL_15;
    }
    v12 = [(ASCPublicKeyCredentialAssertionOptions *)v10 appIDForSecurityKeys];

    if (v12) {
      goto LABEL_14;
    }
    v17 = self->_securityKeyCredentialCreationOptions;
    uint64_t v13 = [(ASCPublicKeyCredentialCreationOptions *)v17 clientDataHash];
    if (v13) {
      goto LABEL_23;
    }
    v14 = [(ASCPublicKeyCredentialCreationOptions *)v17 clientDataJSON];

    if (v14) {
      goto LABEL_25;
    }
    uint64_t v13 = [(ASCPublicKeyCredentialAssertionOptions *)v3 origin];
    if (v13) {
      goto LABEL_23;
    }
    v15 = [(ASCPublicKeyCredentialAssertionOptions *)v10 origin];

    if (v15) {
      goto LABEL_25;
    }
    uint64_t v13 = [(ASCPublicKeyCredentialCreationOptions *)v5 origin];
    if (v13)
    {
LABEL_23:
    }
    else
    {
      uint64_t v16 = [(ASCPublicKeyCredentialCreationOptions *)v17 origin];

      if (!v16)
      {
        BOOL v6 = self->_authenticatedContext != 0;
        goto LABEL_26;
      }
    }
LABEL_25:
    BOOL v6 = 1;
LABEL_26:
    uint64_t v11 = v17;
    goto LABEL_20;
  }
  v5 = (ASCPublicKeyCredentialCreationOptions *)v4;
LABEL_5:
  BOOL v6 = 1;
LABEL_6:

LABEL_7:
  return v6;
}

- (void)setProxiedOriginDeviceName:(id)a3
{
  id v5 = a3;
  if ([v5 length]) {
    uint64_t v4 = v5;
  }
  else {
    uint64_t v4 = 0;
  }
  objc_storeStrong((id *)&self->_proxiedOriginDeviceName, v4);
}

- (void)removePasskeyRequests
{
  self->_requestTypes &= 0xFFFFFFFFFFFFFFF3;
}

- (void)removeSecurityKeyRequests
{
  self->_requestTypes &= 0xFFFFFFFFFFFFFFCFLL;
}

- (void)sanitizeRequestTypesForAutoFillRequestIfNecessary
{
  if (self->_requestStyle == 1) {
    self->_requestTypes &= 8uLL;
  }
}

- (void)applyMagicCredentialIDIfNecessary
{
  if ((self->_requestTypes & 8) != 0)
  {
    v3 = [(ASCPublicKeyCredentialAssertionOptions *)self->_platformKeyCredentialAssertionOptions allowedCredentials];
    if ([v3 count] == 1)
    {
      uint64_t v4 = [v3 objectAtIndexedSubscript:0];
      id v5 = v4;
      if (v4)
      {
        BOOL v6 = [v4 credentialID];
        uint64_t v7 = +[ASCPublicKeyCredentialDescriptor magicCredentialID];
        int v8 = [v6 isEqualToData:v7];

        if (v8)
        {
          uint64_t v9 = WBS_LOG_CHANNEL_PREFIXAuthorization();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)v10 = 0;
            _os_log_impl(&dword_219326000, v9, OS_LOG_TYPE_INFO, "Updating request.", v10, 2u);
          }
          self->_unint64_t requestTypes = 8;
          [(ASCPublicKeyCredentialAssertionOptions *)self->_platformKeyCredentialAssertionOptions setAllowedCredentials:0];
        }
      }
    }
  }
}

- (void)logRequest
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  unint64_t requestTypes = self->_requestTypes;
  if (requestTypes)
  {
    uint64_t v4 = 1;
    do
    {
LABEL_3:
      while ((requestTypes & v4) == 0)
        v4 *= 2;
    }
    while (!v4);
    switch(v4)
    {
      case 1:
        id v5 = WBS_LOG_CHANNEL_PREFIXAuthorization();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v19 = 0;
          BOOL v6 = v5;
          uint64_t v7 = "Password request";
          goto LABEL_16;
        }
        goto LABEL_27;
      case 2:
        v10 = WBS_LOG_CHANNEL_PREFIXAuthorization();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v19 = 0;
          BOOL v6 = v10;
          uint64_t v7 = "Apple ID request";
LABEL_16:
          _os_log_impl(&dword_219326000, v6, OS_LOG_TYPE_INFO, v7, v19, 2u);
        }
        goto LABEL_27;
      case 3:
      case 5:
      case 6:
      case 7:
        goto LABEL_27;
      case 4:
        uint64_t v11 = WBS_LOG_CHANNEL_PREFIXAuthorization();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v19 = 0;
          _os_log_impl(&dword_219326000, v11, OS_LOG_TYPE_INFO, "Platform registration request:", v19, 2u);
        }
        platformKeyCredentialCreationOptions = self->_platformKeyCredentialCreationOptions;
        goto LABEL_26;
      case 8:
        v12 = WBS_LOG_CHANNEL_PREFIXAuthorization();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v19 = 0;
          _os_log_impl(&dword_219326000, v12, OS_LOG_TYPE_INFO, "Platform assertion request:", v19, 2u);
        }
        platformKeyCredentialCreationOptions = self->_platformKeyCredentialAssertionOptions;
        goto LABEL_26;
      default:
        if (v4 == 16)
        {
          uint64_t v13 = WBS_LOG_CHANNEL_PREFIXAuthorization();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)v19 = 0;
            _os_log_impl(&dword_219326000, v13, OS_LOG_TYPE_INFO, "Security key registration request:", v19, 2u);
          }
          platformKeyCredentialCreationOptions = self->_securityKeyCredentialCreationOptions;
        }
        else
        {
          if (v4 != 32) {
            goto LABEL_27;
          }
          int v8 = WBS_LOG_CHANNEL_PREFIXAuthorization();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)v19 = 0;
            _os_log_impl(&dword_219326000, v8, OS_LOG_TYPE_INFO, "Security key assertion request:", v19, 2u);
          }
          platformKeyCredentialCreationOptions = self->_securityKeyCredentialAssertionOptions;
        }
LABEL_26:
        objc_msgSend(platformKeyCredentialCreationOptions, "logRequest", *(void *)v19);
LABEL_27:
        requestTypes &= ~v4;
        v4 *= 2;
        if (!requestTypes) {
          break;
        }
        goto LABEL_3;
    }
  }
  v14 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    unint64_t requestStyle = self->_requestStyle;
    if (requestStyle > 2) {
      uint64_t v16 = @"Unknown";
    }
    else {
      uint64_t v16 = off_26439F408[requestStyle];
    }
    unint64_t requestOptions = self->_requestOptions;
    globalFrameID = self->_globalFrameID;
    *(_DWORD *)v19 = 138544130;
    *(void *)&v19[4] = v16;
    __int16 v20 = 2114;
    v21 = globalFrameID;
    __int16 v22 = 2050;
    unint64_t v23 = requestOptions;
    __int16 v24 = 2114;
    v25 = @"authenticatedContext";
    _os_log_impl(&dword_219326000, v14, OS_LOG_TYPE_INFO, "style: %{public}@\nframeID: %{public}@\noptions: %{public}lx\ncontext: %{public}@\n", v19, 0x2Au);
  }
}

- (unint64_t)requestTypes
{
  return self->_requestTypes;
}

- (NSString)relyingPartyIdentifier
{
  return self->_relyingPartyIdentifier;
}

- (void)setRelyingPartyIdentifier:(id)a3
{
}

- (ASCPublicKeyCredentialCreationOptions)platformKeyCredentialCreationOptions
{
  return self->_platformKeyCredentialCreationOptions;
}

- (void)setPlatformKeyCredentialCreationOptions:(id)a3
{
}

- (ASCPublicKeyCredentialCreationOptions)securityKeyCredentialCreationOptions
{
  return self->_securityKeyCredentialCreationOptions;
}

- (void)setSecurityKeyCredentialCreationOptions:(id)a3
{
}

- (ASCPublicKeyCredentialAssertionOptions)platformKeyCredentialAssertionOptions
{
  return self->_platformKeyCredentialAssertionOptions;
}

- (void)setPlatformKeyCredentialAssertionOptions:(id)a3
{
}

- (ASCPublicKeyCredentialAssertionOptions)securityKeyCredentialAssertionOptions
{
  return self->_securityKeyCredentialAssertionOptions;
}

- (void)setSecurityKeyCredentialAssertionOptions:(id)a3
{
}

- (AKAuthorizationRequest)appleIDAuthorizationRequest
{
  return self->_appleIDAuthorizationRequest;
}

- (void)setAppleIDAuthorizationRequest:(id)a3
{
}

- (BOOL)isConditionalRegistrationRequest
{
  return self->_isConditionalRegistrationRequest;
}

- (void)setIsConditionalRegistrationRequest:(BOOL)a3
{
  self->_isConditionalRegistrationRequest = a3;
}

- (int64_t)requestStyle
{
  return self->_requestStyle;
}

- (void)setRequestStyle:(int64_t)a3
{
  self->_unint64_t requestStyle = a3;
}

- (unint64_t)requestOptions
{
  return self->_requestOptions;
}

- (void)setRequestOptions:(unint64_t)a3
{
  self->_unint64_t requestOptions = a3;
}

- (ASGlobalFrameIdentifier)globalFrameID
{
  return self->_globalFrameID;
}

- (void)setGlobalFrameID:(id)a3
{
}

- (LAContext)authenticatedContext
{
  return self->_authenticatedContext;
}

- (void)setAuthenticatedContext:(id)a3
{
}

- (NSString)windowSceneIdentifier
{
  return self->_windowSceneIdentifier;
}

- (void)setWindowSceneIdentifier:(id)a3
{
}

- (WBSSavedAccountContext)savedAccountContext
{
  return self->_savedAccountContext;
}

- (void)setSavedAccountContext:(id)a3
{
}

- (NSString)proxiedAppName
{
  return self->_proxiedAppName;
}

- (void)setProxiedAppName:(id)a3
{
}

- (NSString)proxiedAppIdentifier
{
  return self->_proxiedAppIdentifier;
}

- (void)setProxiedAppIdentifier:(id)a3
{
}

- (NSString)proxiedBundleIdentifier
{
  return self->_proxiedBundleIdentifier;
}

- (void)setProxiedBundleIdentifier:(id)a3
{
}

- (NSString)proxiedTeamIdentifier
{
  return self->_proxiedTeamIdentifier;
}

- (void)setProxiedTeamIdentifier:(id)a3
{
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

- (NSString)proxySheetHeaderOverride
{
  return self->_proxySheetHeaderOverride;
}

- (void)setProxySheetHeaderOverride:(id)a3
{
}

- (NSString)proxySheetTitleOverride
{
  return self->_proxySheetTitleOverride;
}

- (void)setProxySheetTitleOverride:(id)a3
{
}

- (NSString)proxySheetSubtitleOverride
{
  return self->_proxySheetSubtitleOverride;
}

- (void)setProxySheetSubtitleOverride:(id)a3
{
}

- (NSString)proxySheetNoCredentialsErrorTitleOverride
{
  return self->_proxySheetNoCredentialsErrorTitleOverride;
}

- (void)setProxySheetNoCredentialsErrorTitleOverride:(id)a3
{
}

- (NSString)proxySheetNoCredentialsErrorMessageOverride
{
  return self->_proxySheetNoCredentialsErrorMessageOverride;
}

- (void)setProxySheetNoCredentialsErrorMessageOverride:(id)a3
{
}

- (BOOL)useAlternativeSecurityKeysIcon
{
  return self->_useAlternativeSecurityKeysIcon;
}

- (void)setUseAlternativeSecurityKeysIcon:(BOOL)a3
{
  self->_useAlternativeSecurityKeysIcon = a3;
}

- (BOOL)isClientLinkedOnOrAfterIOS15Aligned
{
  return self->_isClientLinkedOnOrAfterIOS15Aligned;
}

- (BOOL)isCABLEAuthenticatorRequest
{
  return self->_isCABLEAuthenticatorRequest;
}

- (void)setIsCABLEAuthenticatorRequest:(BOOL)a3
{
  self->_isCABLEAuthenticatorRequest = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxySheetNoCredentialsErrorMessageOverride, 0);
  objc_storeStrong((id *)&self->_proxySheetNoCredentialsErrorTitleOverride, 0);
  objc_storeStrong((id *)&self->_proxySheetSubtitleOverride, 0);
  objc_storeStrong((id *)&self->_proxySheetTitleOverride, 0);
  objc_storeStrong((id *)&self->_proxySheetHeaderOverride, 0);
  objc_storeStrong((id *)&self->_proxiedOriginDeviceName, 0);
  objc_storeStrong((id *)&self->_proxiedIconScale, 0);
  objc_storeStrong((id *)&self->_proxiedIconData, 0);
  objc_storeStrong((id *)&self->_proxiedAssociatedDomains, 0);
  objc_storeStrong((id *)&self->_proxiedTeamIdentifier, 0);
  objc_storeStrong((id *)&self->_proxiedBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_proxiedAppIdentifier, 0);
  objc_storeStrong((id *)&self->_proxiedAppName, 0);
  objc_storeStrong((id *)&self->_savedAccountContext, 0);
  objc_storeStrong((id *)&self->_windowSceneIdentifier, 0);
  objc_storeStrong((id *)&self->_authenticatedContext, 0);
  objc_storeStrong((id *)&self->_globalFrameID, 0);
  objc_storeStrong((id *)&self->_appleIDAuthorizationRequest, 0);
  objc_storeStrong((id *)&self->_securityKeyCredentialAssertionOptions, 0);
  objc_storeStrong((id *)&self->_platformKeyCredentialAssertionOptions, 0);
  objc_storeStrong((id *)&self->_securityKeyCredentialCreationOptions, 0);
  objc_storeStrong((id *)&self->_platformKeyCredentialCreationOptions, 0);

  objc_storeStrong((id *)&self->_relyingPartyIdentifier, 0);
}

@end
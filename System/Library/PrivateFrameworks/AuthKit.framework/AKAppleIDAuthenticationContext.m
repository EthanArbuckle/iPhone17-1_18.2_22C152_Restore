@interface AKAppleIDAuthenticationContext
+ (BOOL)supportsSecureCoding;
+ (id)_identifierForContext:(id)a3;
- (AKAnisetteData)companionDeviceAnisetteData;
- (AKAnisetteData)proxiedDeviceAnisetteData;
- (AKAnisetteServiceProtocol)anisetteDataProvider;
- (AKAppleIDAuthenticationContext)init;
- (AKAppleIDAuthenticationContext)initWithAuthenticatedServerRequestContext:(id)a3;
- (AKAppleIDAuthenticationContext)initWithCoder:(id)a3;
- (AKAppleIDAuthenticationContext)initWithContext:(id)a3;
- (AKCompanionKeyEnvelope)companionKeyEnvelope;
- (AKDevice)companionDevice;
- (AKDevice)proxiedDevice;
- (BOOL)_ignoreShouldContinueProxy;
- (BOOL)_isEligibleForPasscodeAuth;
- (BOOL)_isForcedEligibleForForegroundAuthentication;
- (BOOL)_isPasswordEditable;
- (BOOL)_isProxyingForApp;
- (BOOL)_isVerifyCredentialReasonEligibleForBiometricOrPasscodeAuth;
- (BOOL)_keepAlive;
- (BOOL)_localUserHasEmptyPassword;
- (BOOL)_performUIOutOfProcess;
- (BOOL)_requiresPasswordInput;
- (BOOL)_shouldBroadcastForProximityAuthOnly;
- (BOOL)_shouldRefreshAccountAndUpdateContext;
- (BOOL)_shouldSendGrandSlamTokensForRemoteUI;
- (BOOL)_shouldSendIdentityTokenForRemoteUI;
- (BOOL)_shouldSkipInitialReachabilityCheck;
- (BOOL)allowAuthenticationBeforeFirstUnlock;
- (BOOL)alwaysShowUsernameField;
- (BOOL)anticipateEscrowAttempt;
- (BOOL)cliMode;
- (BOOL)clientShouldHandleAlternativeButtonAction;
- (BOOL)deviceRegionRequired;
- (BOOL)disableProximityAuth;
- (BOOL)enablePasscodeAuth;
- (BOOL)hideAlternativeButton;
- (BOOL)hideCancelButton;
- (BOOL)hideReasonString;
- (BOOL)ignorePasswordCache;
- (BOOL)isConfiguredForTokenUpgrade;
- (BOOL)isContextEligibleForBiometricOrPasscodeAuth;
- (BOOL)isContextEligibleForPasscodeAuth;
- (BOOL)isContextEligibleForSilentAuth;
- (BOOL)isContextEligibleForSilentAuthCoercion;
- (BOOL)isContextRequestingReauthForExistingService;
- (BOOL)isEphemeral;
- (BOOL)isFirstTimeLogin;
- (BOOL)isMDMInformationRequired;
- (BOOL)isNativeTakeover;
- (BOOL)isPasscodeOnlyPolicy;
- (BOOL)isRKVerification;
- (BOOL)isRequestedFromOOPViewService;
- (BOOL)isTriggeredByNotification;
- (BOOL)isUsernameEditable;
- (BOOL)needsCredentialRecovery;
- (BOOL)needsNewAppleID;
- (BOOL)needsNewChildAccount;
- (BOOL)needsPasswordChange;
- (BOOL)needsRepair;
- (BOOL)needsSecurityUpgradeUI;
- (BOOL)piggybackingForTrustedDevice;
- (BOOL)shouldAllowAppleIDCreation;
- (BOOL)shouldForceInteractiveAuth;
- (BOOL)shouldOfferSecurityUpgrade;
- (BOOL)shouldPreventInteractiveAuth;
- (BOOL)shouldPromptForPasswordOnly;
- (BOOL)shouldRequestConfigurationInfo;
- (BOOL)shouldRequestRecoveryPET;
- (BOOL)shouldRequestShortLivedToken;
- (BOOL)shouldSkipSettingsLaunchAlert;
- (BOOL)shouldUpdatePersistentServiceTokens;
- (BOOL)supportsPiggybacking;
- (NSArray)serviceIdentifiers;
- (NSData)displayImageData;
- (NSDictionary)appProvidedData;
- (NSDictionary)httpHeadersForRemoteUI;
- (NSNumber)hasEmptyPassword;
- (NSNumber)isAppleIDLoginEnabled;
- (NSNumber)latitude;
- (NSNumber)longitude;
- (NSSet)desiredInternalTokens;
- (NSString)DSID;
- (NSString)_identityToken;
- (NSString)_interpolatedReason;
- (NSString)_interpolatedReasonWithBlame;
- (NSString)_masterKey;
- (NSString)_message;
- (NSString)_password;
- (NSString)_passwordPromptTitle;
- (NSString)_proxiedAppBundleID;
- (NSString)_proxiedAppName;
- (NSString)_remoteUIIdentityToken;
- (NSString)_shortLivedToken;
- (NSString)altDSID;
- (NSString)alternativeButtonString;
- (NSString)appProvidedContext;
- (NSString)callerIconBundlePath;
- (NSString)cancelButtonString;
- (NSString)cellularDataAttributionAppBundleID;
- (NSString)custodianRecoveryToken;
- (NSString)debugDescription;
- (NSString)defaultButtonString;
- (NSString)dependentAltDSID;
- (NSString)description;
- (NSString)deviceClass;
- (NSString)deviceColor;
- (NSString)deviceEnclosureColor;
- (NSString)displayString;
- (NSString)displayTitle;
- (NSString)generatedCode;
- (NSString)helpAnchor;
- (NSString)helpBook;
- (NSString)idmsDataToken;
- (NSString)localizedCallerName;
- (NSString)notificationDisclaimer;
- (NSString)passwordlessToken;
- (NSString)privacyBundleIdentifier;
- (NSString)proxiedAppleID;
- (NSString)reason;
- (NSString)securityUpgradeContext;
- (NSString)serviceIdentifier;
- (NSString)serviceToken;
- (NSString)sourceAltDSID;
- (NSString)telemetryDeviceSessionID;
- (NSString)telemetryFlowID;
- (NSString)title;
- (NSString)username;
- (NSString)windowTitle;
- (NSUUID)_identifier;
- (id)_appendBlameIfRequiredTo:(id)a3;
- (id)_initWithIdentifier:(id)a3;
- (id)_sanitizedCopy;
- (id)_secondFactorQueue;
- (id)authKitAccount:(id *)a3;
- (id)authKitAccountForSilentServiceToken:(id *)a3;
- (id)clientInfo;
- (id)proximityAIDAHandler;
- (int64_t)authenticationPromptStyle;
- (int64_t)maximumLoginAttempts;
- (int64_t)serviceType;
- (int64_t)verifyCredentialReason;
- (unint64_t)_attemptIndex;
- (unint64_t)_capabilityForUIDisplay;
- (unint64_t)authenticationMode;
- (unint64_t)authenticationType;
- (unint64_t)securityCode;
- (void)_handleSecondFactorCodeEntry;
- (void)_interpolatedReason;
- (void)_sanitizedCopy;
- (void)_setIdentityToken:(id)a3;
- (void)_setMasterKey:(id)a3;
- (void)_setMessage:(id)a3;
- (void)_setPassword:(id)a3;
- (void)_setProxiedAppBundleID:(id)a3;
- (void)_setProxiedAppName:(id)a3;
- (void)_setProxyingForApp:(BOOL)a3;
- (void)_setRemoteUIIdentityToken:(id)a3;
- (void)_setShortLivedToken:(id)a3;
- (void)_startListeningForSecondFactorCodeEntryNotification;
- (void)_stopListeningForSecondFactorCodeEntryNotification;
- (void)_updateWithValuesFromContext:(id)a3;
- (void)dismissBasicLoginUIWithCompletion:(id)a3;
- (void)dismissSecondFactorUIWithCompletion:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)isConfiguredForTokenUpgrade;
- (void)isContextEligibleForPasscodeAuth;
- (void)presentBasicLoginUIWithCompletion:(id)a3;
- (void)presentBiometricOrPasscodeValidationForAppleID:(id)a3 completion:(id)a4;
- (void)presentLoginAlertWithError:(id)a3 title:(id)a4 message:(id)a5 completion:(id)a6;
- (void)presentSecondFactorAlertWithError:(id)a3 title:(id)a4 message:(id)a5 completion:(id)a6;
- (void)presentSecondFactorUIWithCompletion:(id)a3;
- (void)setAllowAuthenticationBeforeFirstUnlock:(BOOL)a3;
- (void)setAltDSID:(id)a3;
- (void)setAlternativeButtonString:(id)a3;
- (void)setAlwaysShowUsernameField:(BOOL)a3;
- (void)setAnisetteDataProvider:(id)a3;
- (void)setAnticipateEscrowAttempt:(BOOL)a3;
- (void)setAppProvidedContext:(id)a3;
- (void)setAppProvidedData:(id)a3;
- (void)setAppleIDLoginEnabled:(id)a3;
- (void)setAuthenticationMode:(unint64_t)a3;
- (void)setAuthenticationPromptStyle:(int64_t)a3;
- (void)setAuthenticationType:(unint64_t)a3;
- (void)setCallerIconBundlePath:(id)a3;
- (void)setCancelButtonString:(id)a3;
- (void)setCellularDataAttributionAppBundleID:(id)a3;
- (void)setCliMode:(BOOL)a3;
- (void)setClientInfo:(id)a3;
- (void)setClientShouldHandleAlternativeButtonAction:(BOOL)a3;
- (void)setCompanionDevice:(id)a3;
- (void)setCompanionDeviceAnisetteData:(id)a3;
- (void)setCompanionKeyEnvelope:(id)a3;
- (void)setCustodianRecoveryToken:(id)a3;
- (void)setDSID:(id)a3;
- (void)setDefaultButtonString:(id)a3;
- (void)setDependentAltDSID:(id)a3;
- (void)setDesiredInternalTokens:(id)a3;
- (void)setDeviceClass:(id)a3;
- (void)setDeviceColor:(id)a3;
- (void)setDeviceEnclosureColor:(id)a3;
- (void)setDeviceRegionRequired:(BOOL)a3;
- (void)setDisableProximityAuth:(BOOL)a3;
- (void)setDisplayImageData:(id)a3;
- (void)setDisplayString:(id)a3;
- (void)setDisplayTitle:(id)a3;
- (void)setEnablePasscodeAuth:(BOOL)a3;
- (void)setFirstTimeLogin:(BOOL)a3;
- (void)setGeneratedCode:(id)a3;
- (void)setHasEmptyPassword:(id)a3;
- (void)setHelpAnchor:(id)a3;
- (void)setHelpBook:(id)a3;
- (void)setHideAlternativeButton:(BOOL)a3;
- (void)setHideCancelButton:(BOOL)a3;
- (void)setHideReasonString:(BOOL)a3;
- (void)setHttpHeadersForRemoteUI:(id)a3;
- (void)setIdmsDataToken:(id)a3;
- (void)setIgnorePasswordCache:(BOOL)a3;
- (void)setIsEphemeral:(BOOL)a3;
- (void)setIsMDMInformationRequired:(BOOL)a3;
- (void)setIsNativeTakeover:(BOOL)a3;
- (void)setIsRKVerification:(BOOL)a3;
- (void)setIsRequestedFromOOPViewService:(BOOL)a3;
- (void)setIsUsernameEditable:(BOOL)a3;
- (void)setLatitude:(id)a3;
- (void)setLocalizedCallerName:(id)a3;
- (void)setLongitude:(id)a3;
- (void)setMaximumLoginAttempts:(int64_t)a3;
- (void)setNeedsCredentialRecovery:(BOOL)a3;
- (void)setNeedsNewAppleID:(BOOL)a3;
- (void)setNeedsNewChildAccount:(BOOL)a3;
- (void)setNeedsPasswordChange:(BOOL)a3;
- (void)setNeedsRepair:(BOOL)a3;
- (void)setNeedsSecurityUpgradeUI:(BOOL)a3;
- (void)setNotificationDisclaimer:(id)a3;
- (void)setPasscodeOnlyPolicy:(BOOL)a3;
- (void)setPasswordlessToken:(id)a3;
- (void)setPiggybackingForTrustedDevice:(BOOL)a3;
- (void)setPrivacyBundleIdentifier:(id)a3;
- (void)setProxiedAppleID:(id)a3;
- (void)setProxiedDevice:(id)a3;
- (void)setProxiedDeviceAnisetteData:(id)a3;
- (void)setProximityAIDAHandler:(id)a3;
- (void)setReason:(id)a3;
- (void)setSecurityCode:(unint64_t)a3;
- (void)setSecurityUpgradeContext:(id)a3;
- (void)setServiceIdentifier:(id)a3;
- (void)setServiceIdentifiers:(id)a3;
- (void)setServiceToken:(id)a3;
- (void)setServiceType:(int64_t)a3;
- (void)setShouldAllowAppleIDCreation:(BOOL)a3;
- (void)setShouldForceInteractiveAuth:(BOOL)a3;
- (void)setShouldOfferSecurityUpgrade:(BOOL)a3;
- (void)setShouldPreventInteractiveAuth:(BOOL)a3;
- (void)setShouldPromptForPasswordOnly:(BOOL)a3;
- (void)setShouldRequestConfigurationInfo:(BOOL)a3;
- (void)setShouldRequestRecoveryPET:(BOOL)a3;
- (void)setShouldRequestShortLivedToken:(BOOL)a3;
- (void)setShouldSkipSettingsLaunchAlert:(BOOL)a3;
- (void)setShouldUpdatePersistentServiceTokens:(BOOL)a3;
- (void)setSourceAltDSID:(id)a3;
- (void)setSupportsPiggybacking:(BOOL)a3;
- (void)setTelemetryDeviceSessionID:(id)a3;
- (void)setTelemetryFlowID:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTriggeredByNotification:(BOOL)a3;
- (void)setUsername:(id)a3;
- (void)setVerifyCredentialReason:(int64_t)a3;
- (void)setWindowTitle:(id)a3;
- (void)set_attemptIndex:(unint64_t)a3;
- (void)set_forceEligibleForForegroundAuthentication:(BOOL)a3;
- (void)set_ignoreShouldContinueProxy:(BOOL)a3;
- (void)set_isPasswordEditable:(BOOL)a3;
- (void)set_keepAlive:(BOOL)a3;
- (void)set_passwordPromptTitle:(id)a3;
- (void)set_performUIOutOfProcess:(BOOL)a3;
- (void)set_shouldBroadcastForProximityAuthOnly:(BOOL)a3;
- (void)set_shouldSendGrandSlamTokensForRemoteUI:(BOOL)a3;
- (void)set_shouldSendIdentityTokenForRemoteUI:(BOOL)a3;
- (void)set_shouldSkipInitialReachabilityCheck:(BOOL)a3;
@end

@implementation AKAppleIDAuthenticationContext

- (id)authKitAccount:(id *)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v5 = [(AKAppleIDAuthenticationContext *)self altDSID];
  v6 = [(AKAppleIDAuthenticationContext *)self DSID];
  v7 = [(AKAppleIDAuthenticationContext *)self username];
  if ([v5 length])
  {
    v8 = +[AKAccountManager sharedInstance];
    v9 = [v8 authKitAccountWithAltDSID:v5 error:0];

    if (!v9)
    {
      v10 = _AKLogSystem();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 138412290;
        v18 = v5;
        _os_log_impl(&dword_193494000, v10, OS_LOG_TYPE_DEFAULT, "No existing IdMS account for altDSID %@", (uint8_t *)&v17, 0xCu);
      }
      uint64_t v11 = -7055;
      goto LABEL_24;
    }
LABEL_13:
    v15 = 0;
    if (!a3) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  if ([v6 length])
  {
    v12 = +[AKAccountManager sharedInstance];
    v13 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v6, "longLongValue"));
    v9 = [v12 authKitAccountWithDSID:v13];

    if (v9) {
      goto LABEL_13;
    }
    v10 = _AKLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138412290;
      v18 = v6;
      _os_log_impl(&dword_193494000, v10, OS_LOG_TYPE_DEFAULT, "No existing IdMS account for DSID %@", (uint8_t *)&v17, 0xCu);
    }
    uint64_t v11 = -7067;
  }
  else if ([v7 length])
  {
    v14 = +[AKAccountManager sharedInstance];
    v9 = [v14 authKitAccountWithAppleID:v7 error:0];

    if (v9) {
      goto LABEL_13;
    }
    v10 = _AKLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138412290;
      v18 = v7;
      _os_log_impl(&dword_193494000, v10, OS_LOG_TYPE_DEFAULT, "No existing IdMS account for username %@", (uint8_t *)&v17, 0xCu);
    }
    uint64_t v11 = -7023;
  }
  else
  {
    v10 = _AKLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_193494000, v10, OS_LOG_TYPE_DEFAULT, "No altDSID, DSID or username passed on context, unable to find account", (uint8_t *)&v17, 2u);
    }
    uint64_t v11 = -7044;
  }
LABEL_24:

  v15 = objc_msgSend(MEMORY[0x1E4F28C58], "ak_errorWithCode:", v11);
  v9 = 0;
  if (a3) {
LABEL_14:
  }
    *a3 = v15;
LABEL_15:

  return v9;
}

- (id)authKitAccountForSilentServiceToken:(id *)a3
{
  uint64_t v5 = [(AKAppleIDAuthenticationContext *)self username];
  uint64_t v6 = [(AKAppleIDAuthenticationContext *)self altDSID];
  if (v5 | v6 && ![(AKAppleIDAuthenticationContext *)self isUsernameEditable])
  {
    v8 = [(AKAppleIDAuthenticationContext *)self authKitAccount:a3];
  }
  else
  {
    v7 = _AKLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_193494000, v7, OS_LOG_TYPE_DEFAULT, "Cannot pull up IDMS account without immutable username or altDSID.", v10, 2u);
    }

    if (a3)
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "ak_errorWithCode:", -7044);
      v8 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AKAppleIDAuthenticationContext)init
{
  v3 = [MEMORY[0x1E4F29128] UUID];
  v4 = [(AKAppleIDAuthenticationContext *)self _initWithIdentifier:v3];

  return v4;
}

- (id)_initWithIdentifier:(id)a3
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)AKAppleIDAuthenticationContext;
  uint64_t v5 = [(AKAppleIDAuthenticationContext *)&v17 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v6;

    v5->_isUsernameEditable = 1;
    v5->_isPasswordEditable = 1;
    *(_WORD *)&v5->_shouldSendIdentityTokenForRemoteUI = 257;
    v5->_maximumLoginAttempts = 3;
    v5->_shouldUpdatePersistentServiceTokens = 1;
    v8 = (void *)MEMORY[0x1E4F1CAD0];
    v18[0] = @"AKAuthenticationInternalTokenCK";
    v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
    uint64_t v10 = [v8 setWithArray:v9];
    desiredInternalTokens = v5->_desiredInternalTokens;
    v5->_desiredInternalTokens = (NSSet *)v10;

    securityUpgradeContext = v5->_securityUpgradeContext;
    v5->_securityUpgradeContext = (NSString *)@"com.apple.authkit.generic";

    v5->_supportsPiggybacking = 0;
    v5->_enablePasscodeAuth = 1;
    v5->_passcodeOnlyPolicy = 0;
    v13 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v14 = [v13 UUIDString];
    telemetryFlowID = v5->_telemetryFlowID;
    v5->_telemetryFlowID = (NSString *)v14;

    v5->_isRequestedFromOOPViewService = 0;
    v5->_shouldRequestConfigurationInfo = 1;
    v5->_allowAuthenticationBeforeFirstUnlock = 0;
  }

  return v5;
}

- (AKAppleIDAuthenticationContext)initWithAuthenticatedServerRequestContext:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AKAppleIDAuthenticationContext;
  uint64_t v5 = [(AKAppleIDAuthenticationContext *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [(id)objc_opt_class() _identifierForContext:v4];
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v6;

    uint64_t v8 = [v4 altDSID];
    altDSID = v5->_altDSID;
    v5->_altDSID = (NSString *)v8;
  }
  return v5;
}

- (AKAppleIDAuthenticationContext)initWithContext:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)AKAppleIDAuthenticationContext;
  uint64_t v5 = [(AKAppleIDAuthenticationContext *)&v21 init];
  if (v5)
  {
    uint64_t v6 = [(id)objc_opt_class() _identifierForContext:v4];
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v6;

    uint64_t v8 = [v4 _proxiedAppName];
    proxiedAppName = v5->_proxiedAppName;
    v5->_proxiedAppName = (NSString *)v8;

    uint64_t v10 = [v4 altDSID];
    altDSID = v5->_altDSID;
    v5->_altDSID = (NSString *)v10;

    uint64_t v12 = [v4 appProvidedData];
    appProvidedData = v5->_appProvidedData;
    v5->_appProvidedData = (NSDictionary *)v12;

    uint64_t v14 = [v4 companionDevice];
    companionDevice = v5->_companionDevice;
    v5->_companionDevice = (AKDevice *)v14;

    uint64_t v16 = [v4 proxiedDevice];
    proxiedDevice = v5->_proxiedDevice;
    v5->_proxiedDevice = (AKDevice *)v16;

    v5->_serviceType = [v4 serviceType];
    uint64_t v18 = [v4 appProvidedContext];
    appProvidedContext = v5->_appProvidedContext;
    v5->_appProvidedContext = (NSString *)v18;
  }
  return v5;
}

- (AKAppleIDAuthenticationContext)initWithCoder:(id)a3
{
  v148[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v146.receiver = self;
  v146.super_class = (Class)AKAppleIDAuthenticationContext;
  uint64_t v5 = [(AKAppleIDAuthenticationContext *)&v146 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_reason"];
    reason = v5->_reason;
    v5->_reason = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_username"];
    username = v5->_username;
    v5->_username = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_isUsernameEditable"];
    v5->_isUsernameEditable = [v10 BOOLValue];

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_DSID"];
    DSID = v5->_DSID;
    v5->_DSID = (NSString *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_altDSID"];
    altDSID = v5->_altDSID;
    v5->_altDSID = (NSString *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_telemetryDeviceSessionID"];
    telemetryDeviceSessionID = v5->_telemetryDeviceSessionID;
    v5->_telemetryDeviceSessionID = (NSString *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_telemetryFlowID"];
    telemetryFlowID = v5->_telemetryFlowID;
    v5->_telemetryFlowID = (NSString *)v17;

    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_dependentAltDSID"];
    dependentAltDSID = v5->_dependentAltDSID;
    v5->_dependentAltDSID = (NSString *)v19;

    objc_super v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_isProxyingForApp"];
    v5->_isProxyingForApp = [v21 BOOLValue];

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_proxiedAppBundleID"];
    proxiedAppBundleID = v5->_proxiedAppBundleID;
    v5->_proxiedAppBundleID = (NSString *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_proxiedAppName"];
    proxiedAppName = v5->_proxiedAppName;
    v5->_proxiedAppName = (NSString *)v24;

    v26 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v27 = objc_opt_class();
    v28 = objc_msgSend(v26, "setWithObjects:", v27, objc_opt_class(), 0);
    uint64_t v29 = [v4 decodeObjectOfClasses:v28 forKey:@"_serviceIdentifiers"];
    serviceIdentifiers = v5->_serviceIdentifiers;
    v5->_serviceIdentifiers = (NSArray *)v29;

    uint64_t v31 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v31;

    v33 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_serviceType"];
    v5->_serviceType = [v33 integerValue];

    v34 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_maximumLoginAttempts"];
    v5->_maximumLoginAttempts = [v34 integerValue];

    v35 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_isEphemeral"];
    v5->_isEphemeral = [v35 BOOLValue];

    v36 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_shouldAllowAppleIDCreation"];
    v5->_shouldAllowAppleIDCreation = [v36 BOOLValue];

    v37 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_shouldPromptForPasswordOnly"];
    v5->_shouldPromptForPasswordOnly = [v37 BOOLValue];

    uint64_t v38 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_passwordPromptTitle"];
    passwordPromptTitle = v5->_passwordPromptTitle;
    v5->_passwordPromptTitle = (NSString *)v38;

    uint64_t v40 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_defaultButtonString"];
    defaultButtonString = v5->_defaultButtonString;
    v5->_defaultButtonString = (NSString *)v40;

    v42 = (void *)MEMORY[0x1E4F1CAD0];
    v148[0] = objc_opt_class();
    v148[1] = objc_opt_class();
    v43 = [MEMORY[0x1E4F1C978] arrayWithObjects:v148 count:2];
    v44 = [v42 setWithArray:v43];
    uint64_t v45 = [v4 decodeObjectOfClasses:v44 forKey:@"_httpHeadersForRemoteUI"];
    httpHeadersForRemoteUI = v5->_httpHeadersForRemoteUI;
    v5->_httpHeadersForRemoteUI = (NSDictionary *)v45;

    uint64_t v47 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_remoteUIIdentityToken"];
    remoteUIIdentityToken = v5->_remoteUIIdentityToken;
    v5->_remoteUIIdentityToken = (NSString *)v47;

    uint64_t v49 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_password"];
    password = v5->_password;
    v5->_password = (NSString *)v49;

    v51 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_isPasswordEditable"];
    v5->_isPasswordEditable = [v51 BOOLValue];

    v52 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_shouldUpdatePersistentServiceTokens"];
    v5->_shouldUpdatePersistentServiceTokens = [v52 BOOLValue];

    v53 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_shouldOfferSecurityUpgrade"];
    v5->_shouldOfferSecurityUpgrade = [v53 BOOLValue];

    v54 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_needsCredentialRecovery"];
    v5->_needsCredentialRecovery = [v54 BOOLValue];

    v55 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_needsNewAppleID"];
    v5->_needsNewAppleID = [v55 BOOLValue];

    v56 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_needsPasswordChange"];
    v5->_needsPasswordChange = [v56 BOOLValue];

    v57 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_shouldPreventInteractiveAuth"];
    v5->_shouldPreventInteractiveAuth = [v57 BOOLValue];

    uint64_t v58 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_generatedCode"];
    generatedCode = v5->_generatedCode;
    v5->_generatedCode = (NSString *)v58;

    uint64_t v60 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_latitude"];
    latitude = v5->_latitude;
    v5->_latitude = (NSNumber *)v60;

    uint64_t v62 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_longitude"];
    longitude = v5->_longitude;
    v5->_longitude = (NSNumber *)v62;

    uint64_t v64 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_deviceClass"];
    deviceClass = v5->_deviceClass;
    v5->_deviceClass = (NSString *)v64;

    uint64_t v66 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_deviceColor"];
    deviceColor = v5->_deviceColor;
    v5->_deviceColor = (NSString *)v66;

    uint64_t v68 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_deviceEnclosureColor"];
    deviceEnclosureColor = v5->_deviceEnclosureColor;
    v5->_deviceEnclosureColor = (NSString *)v68;

    uint64_t v70 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_notificationDisclaimer"];
    notificationDisclaimer = v5->_notificationDisclaimer;
    v5->_notificationDisclaimer = (NSString *)v70;

    v72 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_shouldForceInteractiveAuth"];
    v5->_shouldForceInteractiveAuth = [v72 BOOLValue];

    v73 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_capabilityForUIDisplay"];
    v5->_capabilityForUIDisplay = [v73 unsignedIntegerValue];

    uint64_t v74 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_proxiedDeviceAnisetteData"];
    proxiedDeviceAnisetteData = v5->_proxiedDeviceAnisetteData;
    v5->_proxiedDeviceAnisetteData = (AKAnisetteData *)v74;

    uint64_t v76 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_proxiedDevice"];
    proxiedDevice = v5->_proxiedDevice;
    v5->_proxiedDevice = (AKDevice *)v76;

    uint64_t v78 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_companionDeviceAnisetteData"];
    companionDeviceAnisetteData = v5->_companionDeviceAnisetteData;
    v5->_companionDeviceAnisetteData = (AKAnisetteData *)v78;

    uint64_t v80 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_companionDevice"];
    companionDevice = v5->_companionDevice;
    v5->_companionDevice = (AKDevice *)v80;

    uint64_t v82 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_isAppleIDLoginEnabled"];
    isAppleIDLoginEnabled = v5->_isAppleIDLoginEnabled;
    v5->_isAppleIDLoginEnabled = (NSNumber *)v82;

    uint64_t v84 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_hasEmptyPassword"];
    hasEmptyPassword = v5->_hasEmptyPassword;
    v5->_hasEmptyPassword = (NSNumber *)v84;

    v86 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_shouldRequestShortLivedToken"];
    v5->_shouldRequestShortLivedToken = [v86 BOOLValue];

    uint64_t v87 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_shortLivedToken"];
    shortLivedToken = v5->_shortLivedToken;
    v5->_shortLivedToken = (NSString *)v87;

    uint64_t v89 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_identityToken"];
    identityToken = v5->_identityToken;
    v5->_identityToken = (NSString *)v89;

    v91 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_shouldRequestConfigurationInfo"];
    v5->_shouldRequestConfigurationInfo = [v91 BOOLValue];

    v92 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_isTriggeredByNotification"];
    v5->_isTriggeredByNotification = [v92 BOOLValue];

    uint64_t v93 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_message"];
    message = v5->_message;
    v5->_message = (NSString *)v93;

    v5->_anticipateEscrowAttempt = [v4 decodeBoolForKey:@"_anticipateEscrowAttempt"];
    v5->_isFirstTimeLogin = [v4 decodeBoolForKey:@"_isFirstTimeLogin"];
    v5->_supportsPiggybacking = [v4 decodeBoolForKey:@"_supportsPiggybacking"];
    v95 = (void *)MEMORY[0x1E4F1CAD0];
    v147[0] = objc_opt_class();
    v147[1] = objc_opt_class();
    v96 = [MEMORY[0x1E4F1C978] arrayWithObjects:v147 count:2];
    v97 = [v95 setWithArray:v96];
    uint64_t v98 = [v4 decodeObjectOfClasses:v97 forKey:@"_desiredInternalTokens"];
    desiredInternalTokens = v5->_desiredInternalTokens;
    v5->_desiredInternalTokens = (NSSet *)v98;

    v5->_shouldSkipSettingsLaunchAlert = [v4 decodeBoolForKey:@"_shouldSkipSettingsLaunchAlert"];
    v5->_shouldSendIdentityTokenForRemoteUI = [v4 decodeBoolForKey:@"_shouldSendIdentityTokenForRemoteUI"];
    v5->_shouldRequestRecoveryPET = [v4 decodeBoolForKey:@"_shouldRequestRecoveryPET"];
    uint64_t v100 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_title"];
    title = v5->_title;
    v5->_title = (NSString *)v100;

    v102 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_shouldSkipInitialReachabilityCheck"];
    v5->_shouldSkipInitialReachabilityCheck = [v102 BOOLValue];

    v5->_attemptIndex = [v4 decodeIntegerForKey:@"_attemptIndex"];
    uint64_t v103 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_securityUpgradeContext"];
    securityUpgradeContext = v5->_securityUpgradeContext;
    v5->_securityUpgradeContext = (NSString *)v103;

    v5->_authenticationType = [v4 decodeIntegerForKey:@"_authenticationType"];
    v5->_shouldSendGrandSlamTokensForRemoteUI = [v4 decodeBoolForKey:@"_shouldSendGrandSlamTokensForRemoteUI"];
    v5->_needsRepair = [v4 decodeBoolForKey:@"_needsRepair"];
    v105 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v106 = objc_opt_class();
    uint64_t v107 = objc_opt_class();
    uint64_t v108 = objc_opt_class();
    uint64_t v109 = objc_opt_class();
    v110 = objc_msgSend(v105, "setWithObjects:", v106, v107, v108, v109, objc_opt_class(), 0);
    uint64_t v111 = [v4 decodeObjectOfClasses:v110 forKey:@"_appProvidedData"];
    appProvidedData = v5->_appProvidedData;
    v5->_appProvidedData = (NSDictionary *)v111;

    uint64_t v113 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_appProvidedContext"];
    appProvidedContext = v5->_appProvidedContext;
    v5->_appProvidedContext = (NSString *)v113;

    uint64_t v115 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_masterKey"];
    masterKey = v5->_masterKey;
    v5->_masterKey = (NSString *)v115;

    v5->_performUIOutOfProcess = [v4 decodeBoolForKey:@"_performUIOutOfProcess"];
    v5->_keepAlive = [v4 decodeBoolForKey:@"_keepAlive"];
    uint64_t v117 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_cancelButtonString"];
    cancelButtonString = v5->_cancelButtonString;
    v5->_cancelButtonString = (NSString *)v117;

    uint64_t v119 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_alternativeButtonString"];
    alternativeButtonString = v5->_alternativeButtonString;
    v5->_alternativeButtonString = (NSString *)v119;

    v5->_hideAlternativeButton = [v4 decodeBoolForKey:@"_hideAlternativeButton"];
    v5->_hideCancelButton = [v4 decodeBoolForKey:@"_hideCancelButton"];
    v5->_hideReasonString = [v4 decodeBoolForKey:@"_hideReasonString"];
    v5->_clientShouldHandleAlternativeButtonAction = [v4 decodeBoolForKey:@"_clientShouldHandleAlternativeButtonAction"];
    uint64_t v121 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_windowTitle"];
    windowTitle = v5->_windowTitle;
    v5->_windowTitle = (NSString *)v121;

    v5->_alwaysShowUsernameField = [v4 decodeBoolForKey:@"_alwaysShowUsernameField"];
    uint64_t v123 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_privacyBundleIdentifier"];
    privacyBundleIdentifier = v5->_privacyBundleIdentifier;
    v5->_privacyBundleIdentifier = (NSString *)v123;

    v5->_authenticationPromptStyle = [v4 decodeIntegerForKey:@"_authenticationPromptStyle"];
    v5->_needsNewChildAccount = [v4 decodeBoolForKey:@"_needsNewChildAccount"];
    v5->_authenticationMode = [v4 decodeIntegerForKey:@"_authenticationMode"];
    v5->_isMDMInformationRequired = [v4 decodeBoolForKey:@"_isMDMInformationRequired"];
    v5->_cliMode = [v4 decodeBoolForKey:@"_cliMode"];
    uint64_t v125 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"passwordlessToken"];
    passwordlessToken = v5->_passwordlessToken;
    v5->_passwordlessToken = (NSString *)v125;

    uint64_t v127 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"idmsDataToken"];
    idmsDataToken = v5->_idmsDataToken;
    v5->_idmsDataToken = (NSString *)v127;

    v5->_needsSecurityUpgradeUI = [v4 decodeBoolForKey:@"_needsSecurityUpgradeUI"];
    v5->_isRKVerification = [v4 decodeBoolForKey:@"_isRKVerification"];
    uint64_t v129 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_displayImageData"];
    displayImageData = v5->_displayImageData;
    v5->_displayImageData = (NSData *)v129;

    v5->_verifyCredentialReason = [v4 decodeIntegerForKey:@"_verifyCredentialReason"];
    uint64_t v131 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_callerIconBundlePath"];
    callerIconBundlePath = v5->_callerIconBundlePath;
    v5->_callerIconBundlePath = (NSString *)v131;

    uint64_t v133 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_localizedCallerName"];
    localizedCallerName = v5->_localizedCallerName;
    v5->_localizedCallerName = (NSString *)v133;

    uint64_t v135 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_custodianRecoveryToken"];
    custodianRecoveryToken = v5->_custodianRecoveryToken;
    v5->_custodianRecoveryToken = (NSString *)v135;

    v5->_forceEligibleForForegroundAuthentication = [v4 decodeBoolForKey:@"_forceEligibleForForegroundAuthentication"];
    v5->_deviceRegionRequired = [v4 decodeBoolForKey:@"_deviceRegionRequired"];
    v5->_disableProximityAuth = [v4 decodeBoolForKey:@"_disableProximityAuth"];
    v5->_shouldBroadcastForProximityAuthOnly = [v4 decodeBoolForKey:@"_shouldBroadcastForProximityAuthOnly"];
    v5->_enablePasscodeAuth = [v4 decodeBoolForKey:@"_enablePasscodeAuth"];
    v5->_passcodeOnlyPolicy = [v4 decodeBoolForKey:@"_passcodeOnlyPolicy"];
    uint64_t v137 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_sourceAltDSID"];
    sourceAltDSID = v5->_sourceAltDSID;
    v5->_sourceAltDSID = (NSString *)v137;

    uint64_t v139 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_serviceToken"];
    serviceToken = v5->_serviceToken;
    v5->_serviceToken = (NSString *)v139;

    v5->_isNativeTakeover = [v4 decodeBoolForKey:@"_isNativeTakeover"];
    v5->_ignorePasswordCache = [v4 decodeBoolForKey:@"_ignorePasswordCache"];
    v5->_ignoreShouldContinueProxy = [v4 decodeBoolForKey:@"_ignoreShouldContinueProxy"];
    v5->_isRequestedFromOOPViewService = [v4 decodeBoolForKey:@"_isRequestedFromOOPViewService"];
    uint64_t v141 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_proxiedAppleID"];
    proxiedAppleID = v5->_proxiedAppleID;
    v5->_proxiedAppleID = (NSString *)v141;

    uint64_t v143 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_companionKeyEnvelope"];
    companionKeyEnvelope = v5->_companionKeyEnvelope;
    v5->_companionKeyEnvelope = (AKCompanionKeyEnvelope *)v143;

    v5->_piggybackingForTrustedDevice = [v4 decodeBoolForKey:@"_piggybackingForTrustedDevice"];
    v5->_allowAuthenticationBeforeFirstUnlock = [v4 decodeBoolForKey:@"_allowAuthenticationBeforeFirstUnlock"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  reason = self->_reason;
  id v25 = a3;
  [v25 encodeObject:reason forKey:@"_reason"];
  [v25 encodeObject:self->_username forKey:@"_username"];
  uint64_t v5 = [NSNumber numberWithBool:self->_isUsernameEditable];
  [v25 encodeObject:v5 forKey:@"_isUsernameEditable"];

  [v25 encodeObject:self->_DSID forKey:@"_DSID"];
  [v25 encodeObject:self->_altDSID forKey:@"_altDSID"];
  [v25 encodeObject:self->_telemetryDeviceSessionID forKey:@"_telemetryDeviceSessionID"];
  [v25 encodeObject:self->_telemetryFlowID forKey:@"_telemetryFlowID"];
  [v25 encodeObject:self->_dependentAltDSID forKey:@"_dependentAltDSID"];
  uint64_t v6 = [NSNumber numberWithBool:self->_isProxyingForApp];
  [v25 encodeObject:v6 forKey:@"_isProxyingForApp"];

  [v25 encodeObject:self->_proxiedAppBundleID forKey:@"_proxiedAppBundleID"];
  [v25 encodeObject:self->_proxiedAppName forKey:@"_proxiedAppName"];
  [v25 encodeObject:self->_serviceIdentifiers forKey:@"_serviceIdentifiers"];
  [v25 encodeObject:self->_identifier forKey:@"_identifier"];
  v7 = [NSNumber numberWithInteger:self->_serviceType];
  [v25 encodeObject:v7 forKey:@"_serviceType"];

  uint64_t v8 = [NSNumber numberWithInteger:self->_maximumLoginAttempts];
  [v25 encodeObject:v8 forKey:@"_maximumLoginAttempts"];

  v9 = [NSNumber numberWithBool:self->_isEphemeral];
  [v25 encodeObject:v9 forKey:@"_isEphemeral"];

  uint64_t v10 = [NSNumber numberWithBool:self->_shouldAllowAppleIDCreation];
  [v25 encodeObject:v10 forKey:@"_shouldAllowAppleIDCreation"];

  uint64_t v11 = [NSNumber numberWithBool:self->_shouldPromptForPasswordOnly];
  [v25 encodeObject:v11 forKey:@"_shouldPromptForPasswordOnly"];

  [v25 encodeObject:self->_passwordPromptTitle forKey:@"_passwordPromptTitle"];
  [v25 encodeObject:self->_defaultButtonString forKey:@"_defaultButtonString"];
  [v25 encodeObject:self->_httpHeadersForRemoteUI forKey:@"_httpHeadersForRemoteUI"];
  [v25 encodeObject:self->_remoteUIIdentityToken forKey:@"_remoteUIIdentityToken"];
  [v25 encodeObject:self->_password forKey:@"_password"];
  uint64_t v12 = [NSNumber numberWithBool:self->_isPasswordEditable];
  [v25 encodeObject:v12 forKey:@"_isPasswordEditable"];

  uint64_t v13 = [NSNumber numberWithBool:self->_shouldUpdatePersistentServiceTokens];
  [v25 encodeObject:v13 forKey:@"_shouldUpdatePersistentServiceTokens"];

  uint64_t v14 = [NSNumber numberWithBool:self->_shouldOfferSecurityUpgrade];
  [v25 encodeObject:v14 forKey:@"_shouldOfferSecurityUpgrade"];

  uint64_t v15 = [NSNumber numberWithBool:self->_needsCredentialRecovery];
  [v25 encodeObject:v15 forKey:@"_needsCredentialRecovery"];

  uint64_t v16 = [NSNumber numberWithBool:self->_needsNewAppleID];
  [v25 encodeObject:v16 forKey:@"_needsNewAppleID"];

  uint64_t v17 = [NSNumber numberWithBool:self->_needsPasswordChange];
  [v25 encodeObject:v17 forKey:@"_needsPasswordChange"];

  uint64_t v18 = [NSNumber numberWithBool:self->_shouldPreventInteractiveAuth];
  [v25 encodeObject:v18 forKey:@"_shouldPreventInteractiveAuth"];

  [v25 encodeObject:self->_generatedCode forKey:@"_generatedCode"];
  [v25 encodeObject:self->_latitude forKey:@"_latitude"];
  [v25 encodeObject:self->_longitude forKey:@"_longitude"];
  [v25 encodeObject:self->_deviceClass forKey:@"_deviceClass"];
  [v25 encodeObject:self->_deviceColor forKey:@"_deviceColor"];
  [v25 encodeObject:self->_deviceEnclosureColor forKey:@"_deviceEnclosureColor"];
  [v25 encodeObject:self->_notificationDisclaimer forKey:@"_notificationDisclaimer"];
  uint64_t v19 = [NSNumber numberWithBool:self->_shouldForceInteractiveAuth];
  [v25 encodeObject:v19 forKey:@"_shouldForceInteractiveAuth"];

  v20 = [NSNumber numberWithUnsignedInteger:self->_capabilityForUIDisplay];
  [v25 encodeObject:v20 forKey:@"_capabilityForUIDisplay"];

  [v25 encodeObject:self->_proxiedDeviceAnisetteData forKey:@"_proxiedDeviceAnisetteData"];
  [v25 encodeObject:self->_proxiedDevice forKey:@"_proxiedDevice"];
  [v25 encodeObject:self->_companionDeviceAnisetteData forKey:@"_companionDeviceAnisetteData"];
  [v25 encodeObject:self->_companionDevice forKey:@"_companionDevice"];
  [v25 encodeObject:self->_isAppleIDLoginEnabled forKey:@"_isAppleIDLoginEnabled"];
  [v25 encodeObject:self->_hasEmptyPassword forKey:@"_hasEmptyPassword"];
  objc_super v21 = [NSNumber numberWithBool:self->_shouldRequestShortLivedToken];
  [v25 encodeObject:v21 forKey:@"_shouldRequestShortLivedToken"];

  [v25 encodeObject:self->_shortLivedToken forKey:@"_shortLivedToken"];
  [v25 encodeObject:self->_identityToken forKey:@"_identityToken"];
  uint64_t v22 = [NSNumber numberWithBool:self->_shouldRequestConfigurationInfo];
  [v25 encodeObject:v22 forKey:@"_shouldRequestConfigurationInfo"];

  v23 = [NSNumber numberWithBool:self->_isTriggeredByNotification];
  [v25 encodeObject:v23 forKey:@"_isTriggeredByNotification"];

  [v25 encodeObject:self->_message forKey:@"_message"];
  [v25 encodeBool:self->_anticipateEscrowAttempt forKey:@"_anticipateEscrowAttempt"];
  [v25 encodeBool:self->_isFirstTimeLogin forKey:@"_isFirstTimeLogin"];
  [v25 encodeBool:self->_supportsPiggybacking forKey:@"_supportsPiggybacking"];
  [v25 encodeObject:self->_desiredInternalTokens forKey:@"_desiredInternalTokens"];
  [v25 encodeBool:self->_shouldSkipSettingsLaunchAlert forKey:@"_shouldSkipSettingsLaunchAlert"];
  [v25 encodeBool:self->_shouldSendIdentityTokenForRemoteUI forKey:@"_shouldSendIdentityTokenForRemoteUI"];
  [v25 encodeBool:self->_shouldRequestRecoveryPET forKey:@"_shouldRequestRecoveryPET"];
  [v25 encodeObject:self->_title forKey:@"_title"];
  [v25 encodeObject:self->_helpAnchor forKey:@"_helpAnchor"];
  [v25 encodeObject:self->_helpBook forKey:@"_helpBook"];
  uint64_t v24 = [NSNumber numberWithBool:self->_shouldSkipInitialReachabilityCheck];
  [v25 encodeObject:v24 forKey:@"_shouldSkipInitialReachabilityCheck"];

  [v25 encodeInteger:self->_attemptIndex forKey:@"_attemptIndex"];
  [v25 encodeObject:self->_securityUpgradeContext forKey:@"_securityUpgradeContext"];
  [v25 encodeInteger:self->_authenticationType forKey:@"_authenticationType"];
  [v25 encodeBool:self->_shouldSendGrandSlamTokensForRemoteUI forKey:@"_shouldSendGrandSlamTokensForRemoteUI"];
  [v25 encodeBool:self->_needsRepair forKey:@"_needsRepair"];
  [v25 encodeObject:self->_appProvidedData forKey:@"_appProvidedData"];
  [v25 encodeObject:self->_appProvidedContext forKey:@"_appProvidedContext"];
  [v25 encodeObject:self->_masterKey forKey:@"_masterKey"];
  [v25 encodeBool:self->_performUIOutOfProcess forKey:@"_performUIOutOfProcess"];
  [v25 encodeBool:self->_keepAlive forKey:@"_keepAlive"];
  [v25 encodeObject:self->_cancelButtonString forKey:@"_cancelButtonString"];
  [v25 encodeObject:self->_alternativeButtonString forKey:@"_alternativeButtonString"];
  [v25 encodeBool:self->_hideAlternativeButton forKey:@"_hideAlternativeButton"];
  [v25 encodeBool:self->_hideCancelButton forKey:@"_hideCancelButton"];
  [v25 encodeBool:self->_hideReasonString forKey:@"_hideReasonString"];
  [v25 encodeBool:self->_clientShouldHandleAlternativeButtonAction forKey:@"_clientShouldHandleAlternativeButtonAction"];
  [v25 encodeObject:self->_windowTitle forKey:@"_windowTitle"];
  [v25 encodeBool:self->_alwaysShowUsernameField forKey:@"_alwaysShowUsernameField"];
  [v25 encodeObject:self->_privacyBundleIdentifier forKey:@"_privacyBundleIdentifier"];
  [v25 encodeInteger:self->_authenticationPromptStyle forKey:@"_authenticationPromptStyle"];
  [v25 encodeBool:self->_needsNewChildAccount forKey:@"_needsNewChildAccount"];
  [v25 encodeInteger:self->_authenticationMode forKey:@"_authenticationMode"];
  [v25 encodeBool:self->_isMDMInformationRequired forKey:@"_isMDMInformationRequired"];
  [v25 encodeBool:self->_cliMode forKey:@"_cliMode"];
  [v25 encodeObject:self->_passwordlessToken forKey:@"passwordlessToken"];
  [v25 encodeObject:self->_idmsDataToken forKey:@"idmsDataToken"];
  [v25 encodeBool:self->_needsSecurityUpgradeUI forKey:@"_needsSecurityUpgradeUI"];
  [v25 encodeBool:self->_isRKVerification forKey:@"_isRKVerification"];
  [v25 encodeObject:self->_displayImageData forKey:@"_displayImageData"];
  [v25 encodeInteger:self->_verifyCredentialReason forKey:@"_verifyCredentialReason"];
  [v25 encodeObject:self->_callerIconBundlePath forKey:@"_callerIconBundlePath"];
  [v25 encodeObject:self->_localizedCallerName forKey:@"_localizedCallerName"];
  [v25 encodeObject:self->_custodianRecoveryToken forKey:@"_custodianRecoveryToken"];
  [v25 encodeBool:self->_forceEligibleForForegroundAuthentication forKey:@"_forceEligibleForForegroundAuthentication"];
  [v25 encodeBool:self->_deviceRegionRequired forKey:@"_deviceRegionRequired"];
  [v25 encodeBool:self->_disableProximityAuth forKey:@"_disableProximityAuth"];
  [v25 encodeBool:self->_shouldBroadcastForProximityAuthOnly forKey:@"_shouldBroadcastForProximityAuthOnly"];
  [v25 encodeBool:self->_enablePasscodeAuth forKey:@"_enablePasscodeAuth"];
  [v25 encodeBool:self->_passcodeOnlyPolicy forKey:@"_passcodeOnlyPolicy"];
  [v25 encodeObject:self->_sourceAltDSID forKey:@"_sourceAltDSID"];
  [v25 encodeObject:self->_serviceToken forKey:@"_serviceToken"];
  [v25 encodeBool:self->_isNativeTakeover forKey:@"_isNativeTakeover"];
  [v25 encodeBool:self->_ignorePasswordCache forKey:@"_ignorePasswordCache"];
  [v25 encodeBool:self->_ignoreShouldContinueProxy forKey:@"_ignoreShouldContinueProxy"];
  [v25 encodeBool:self->_isRequestedFromOOPViewService forKey:@"_isRequestedFromOOPViewService"];
  [v25 encodeObject:self->_proxiedAppleID forKey:@"_proxiedAppleID"];
  [v25 encodeObject:self->_companionKeyEnvelope forKey:@"_companionKeyEnvelope"];
  [v25 encodeBool:self->_piggybackingForTrustedDevice forKey:@"_piggybackingForTrustedDevice"];
  [v25 encodeBool:self->_allowAuthenticationBeforeFirstUnlock forKey:@"_allowAuthenticationBeforeFirstUnlock"];
}

- (id)_sanitizedCopy
{
  v3 = objc_alloc_init(AKAppleIDAuthenticationContext);
  uint64_t v4 = [(NSString *)self->_reason copy];
  reason = v3->_reason;
  v3->_reason = (NSString *)v4;

  uint64_t v6 = [(NSString *)self->_username copy];
  username = v3->_username;
  v3->_username = (NSString *)v6;

  v3->_isUsernameEditable = self->_isUsernameEditable;
  uint64_t v8 = [(NSString *)self->_DSID copy];
  DSID = v3->_DSID;
  v3->_DSID = (NSString *)v8;

  if ([(NSString *)self->_altDSID ak_isEmailAddress])
  {
    uint64_t v10 = _AKLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      -[AKAppleIDAuthenticationContext _sanitizedCopy]();
    }
  }
  else
  {
    uint64_t v11 = [(NSString *)self->_altDSID copy];
    altDSID = v3->_altDSID;
    v3->_altDSID = (NSString *)v11;
  }
  uint64_t v13 = [(NSString *)self->_telemetryDeviceSessionID copy];
  telemetryDeviceSessionID = v3->_telemetryDeviceSessionID;
  v3->_telemetryDeviceSessionID = (NSString *)v13;

  uint64_t v15 = [(NSString *)self->_telemetryFlowID copy];
  telemetryFlowID = v3->_telemetryFlowID;
  v3->_telemetryFlowID = (NSString *)v15;

  uint64_t v17 = [(NSString *)self->_dependentAltDSID copy];
  dependentAltDSID = v3->_dependentAltDSID;
  v3->_dependentAltDSID = (NSString *)v17;

  v3->_isProxyingForApp = self->_isProxyingForApp;
  uint64_t v19 = [(NSString *)self->_proxiedAppBundleID copy];
  proxiedAppBundleID = v3->_proxiedAppBundleID;
  v3->_proxiedAppBundleID = (NSString *)v19;

  uint64_t v21 = [(NSString *)self->_proxiedAppName copy];
  proxiedAppName = v3->_proxiedAppName;
  v3->_proxiedAppName = (NSString *)v21;

  uint64_t v23 = [(NSArray *)self->_serviceIdentifiers copy];
  serviceIdentifiers = v3->_serviceIdentifiers;
  v3->_serviceIdentifiers = (NSArray *)v23;

  uint64_t v25 = [(NSUUID *)self->_identifier copy];
  identifier = v3->_identifier;
  v3->_identifier = (NSUUID *)v25;

  v3->_serviceType = self->_serviceType;
  v3->_maximumLoginAttempts = self->_maximumLoginAttempts;
  v3->_isEphemeral = self->_isEphemeral;
  v3->_shouldAllowAppleIDCreation = self->_shouldAllowAppleIDCreation;
  v3->_shouldPromptForPasswordOnly = self->_shouldPromptForPasswordOnly;
  uint64_t v27 = [(NSString *)self->_passwordPromptTitle copy];
  passwordPromptTitle = v3->_passwordPromptTitle;
  v3->_passwordPromptTitle = (NSString *)v27;

  uint64_t v29 = [(NSString *)self->_defaultButtonString copy];
  defaultButtonString = v3->_defaultButtonString;
  v3->_defaultButtonString = (NSString *)v29;

  uint64_t v31 = [(NSDictionary *)self->_httpHeadersForRemoteUI copy];
  httpHeadersForRemoteUI = v3->_httpHeadersForRemoteUI;
  v3->_httpHeadersForRemoteUI = (NSDictionary *)v31;

  uint64_t v33 = [(NSString *)self->_remoteUIIdentityToken copy];
  remoteUIIdentityToken = v3->_remoteUIIdentityToken;
  v3->_remoteUIIdentityToken = (NSString *)v33;

  uint64_t v35 = [(NSString *)self->_password copy];
  password = v3->_password;
  v3->_password = (NSString *)v35;

  v3->_isPasswordEditable = self->_isPasswordEditable;
  v3->_shouldUpdatePersistentServiceTokens = self->_shouldUpdatePersistentServiceTokens;
  v3->_shouldOfferSecurityUpgrade = self->_shouldOfferSecurityUpgrade;
  v3->_needsCredentialRecovery = self->_needsCredentialRecovery;
  v3->_needsNewAppleID = self->_needsNewAppleID;
  v3->_needsPasswordChange = self->_needsPasswordChange;
  v3->_shouldPreventInteractiveAuth = self->_shouldPreventInteractiveAuth;
  uint64_t v37 = [(NSString *)self->_generatedCode copy];
  generatedCode = v3->_generatedCode;
  v3->_generatedCode = (NSString *)v37;

  uint64_t v39 = [(NSNumber *)self->_latitude copy];
  latitude = v3->_latitude;
  v3->_latitude = (NSNumber *)v39;

  uint64_t v41 = [(NSNumber *)self->_longitude copy];
  longitude = v3->_longitude;
  v3->_longitude = (NSNumber *)v41;

  uint64_t v43 = [(NSString *)self->_deviceClass copy];
  deviceClass = v3->_deviceClass;
  v3->_deviceClass = (NSString *)v43;

  uint64_t v45 = [(NSString *)self->_deviceColor copy];
  deviceColor = v3->_deviceColor;
  v3->_deviceColor = (NSString *)v45;

  uint64_t v47 = [(NSString *)self->_deviceEnclosureColor copy];
  deviceEnclosureColor = v3->_deviceEnclosureColor;
  v3->_deviceEnclosureColor = (NSString *)v47;

  uint64_t v49 = [(NSString *)self->_notificationDisclaimer copy];
  notificationDisclaimer = v3->_notificationDisclaimer;
  v3->_notificationDisclaimer = (NSString *)v49;

  v3->_shouldForceInteractiveAuth = self->_shouldForceInteractiveAuth;
  v3->_capabilityForUIDisplay = [(AKAppleIDAuthenticationContext *)self _capabilityForUIDisplay];
  uint64_t v51 = [(AKAnisetteData *)self->_proxiedDeviceAnisetteData copy];
  proxiedDeviceAnisetteData = v3->_proxiedDeviceAnisetteData;
  v3->_proxiedDeviceAnisetteData = (AKAnisetteData *)v51;

  uint64_t v53 = [(AKDevice *)self->_proxiedDevice copy];
  proxiedDevice = v3->_proxiedDevice;
  v3->_proxiedDevice = (AKDevice *)v53;

  uint64_t v55 = [(AKAnisetteData *)self->_companionDeviceAnisetteData copy];
  companionDeviceAnisetteData = v3->_companionDeviceAnisetteData;
  v3->_companionDeviceAnisetteData = (AKAnisetteData *)v55;

  uint64_t v57 = [(AKDevice *)self->_companionDevice copy];
  companionDevice = v3->_companionDevice;
  v3->_companionDevice = (AKDevice *)v57;

  uint64_t v59 = [(NSNumber *)self->_isAppleIDLoginEnabled copy];
  isAppleIDLoginEnabled = v3->_isAppleIDLoginEnabled;
  v3->_isAppleIDLoginEnabled = (NSNumber *)v59;

  uint64_t v61 = [(NSNumber *)self->_hasEmptyPassword copy];
  hasEmptyPassword = v3->_hasEmptyPassword;
  v3->_hasEmptyPassword = (NSNumber *)v61;

  v3->_shouldRequestShortLivedToken = self->_shouldRequestShortLivedToken;
  uint64_t v63 = [(NSString *)self->_shortLivedToken copy];
  shortLivedToken = v3->_shortLivedToken;
  v3->_shortLivedToken = (NSString *)v63;

  uint64_t v65 = [(NSString *)self->_identityToken copy];
  identityToken = v3->_identityToken;
  v3->_identityToken = (NSString *)v65;

  v3->_shouldRequestConfigurationInfo = self->_shouldRequestConfigurationInfo;
  v3->_isTriggeredByNotification = self->_isTriggeredByNotification;
  uint64_t v67 = [(NSString *)self->_message copy];
  message = v3->_message;
  v3->_message = (NSString *)v67;

  v3->_anticipateEscrowAttempt = self->_anticipateEscrowAttempt;
  v3->_isFirstTimeLogin = self->_isFirstTimeLogin;
  v3->_supportsPiggybacking = self->_supportsPiggybacking;
  uint64_t v69 = [(NSSet *)self->_desiredInternalTokens copy];
  desiredInternalTokens = v3->_desiredInternalTokens;
  v3->_desiredInternalTokens = (NSSet *)v69;

  v3->_shouldSkipSettingsLaunchAlert = self->_shouldSkipSettingsLaunchAlert;
  v3->_shouldSendIdentityTokenForRemoteUI = self->_shouldSendIdentityTokenForRemoteUI;
  v3->_shouldRequestRecoveryPET = self->_shouldRequestRecoveryPET;
  uint64_t v71 = [(NSString *)self->_title copy];
  title = v3->_title;
  v3->_title = (NSString *)v71;

  uint64_t v73 = [(NSString *)self->_helpAnchor copy];
  helpAnchor = v3->_helpAnchor;
  v3->_helpAnchor = (NSString *)v73;

  uint64_t v75 = [(NSString *)self->_helpBook copy];
  helpBook = v3->_helpBook;
  v3->_helpBook = (NSString *)v75;

  v3->_shouldSkipInitialReachabilityCheck = [(AKAppleIDAuthenticationContext *)self _shouldSkipInitialReachabilityCheck];
  v3->_attemptIndex = self->_attemptIndex;
  objc_storeStrong((id *)&v3->_securityUpgradeContext, self->_securityUpgradeContext);
  v3->_authenticationType = self->_authenticationType;
  v3->_shouldSendGrandSlamTokensForRemoteUI = self->_shouldSendGrandSlamTokensForRemoteUI;
  v3->_needsRepair = self->_needsRepair;
  uint64_t v77 = [(NSDictionary *)self->_appProvidedData copy];
  appProvidedData = v3->_appProvidedData;
  v3->_appProvidedData = (NSDictionary *)v77;

  objc_storeStrong((id *)&v3->_appProvidedContext, self->_appProvidedContext);
  uint64_t v79 = [(NSString *)self->_masterKey copy];
  masterKey = v3->_masterKey;
  v3->_masterKey = (NSString *)v79;

  v3->_performUIOutOfProcess = self->_performUIOutOfProcess;
  v3->_keepAlive = self->_keepAlive;
  uint64_t v81 = [(NSString *)self->_cancelButtonString copy];
  cancelButtonString = v3->_cancelButtonString;
  v3->_cancelButtonString = (NSString *)v81;

  uint64_t v83 = [(NSString *)self->_alternativeButtonString copy];
  alternativeButtonString = v3->_alternativeButtonString;
  v3->_alternativeButtonString = (NSString *)v83;

  v3->_hideAlternativeButton = self->_hideAlternativeButton;
  v3->_hideCancelButton = self->_hideCancelButton;
  v3->_hideReasonString = self->_hideReasonString;
  v3->_clientShouldHandleAlternativeButtonAction = self->_clientShouldHandleAlternativeButtonAction;
  uint64_t v85 = [(NSString *)self->_windowTitle copy];
  windowTitle = v3->_windowTitle;
  v3->_windowTitle = (NSString *)v85;

  v3->_alwaysShowUsernameField = self->_alwaysShowUsernameField;
  uint64_t v87 = [(NSString *)self->_privacyBundleIdentifier copy];
  privacyBundleIdentifier = v3->_privacyBundleIdentifier;
  v3->_privacyBundleIdentifier = (NSString *)v87;

  v3->_authenticationPromptStyle = self->_authenticationPromptStyle;
  v3->_needsNewChildAccount = self->_needsNewChildAccount;
  v3->_authenticationMode = self->_authenticationMode;
  v3->_isMDMInformationRequired = self->_isMDMInformationRequired;
  v3->_cliMode = self->_cliMode;
  objc_storeStrong((id *)&v3->_passwordlessToken, self->_passwordlessToken);
  objc_storeStrong((id *)&v3->_idmsDataToken, self->_idmsDataToken);
  v3->_needsSecurityUpgradeUI = self->_needsSecurityUpgradeUI;
  v3->_isRKVerification = self->_isRKVerification;
  uint64_t v89 = [(NSData *)self->_displayImageData copy];
  displayImageData = v3->_displayImageData;
  v3->_displayImageData = (NSData *)v89;

  v3->_verifyCredentialReason = self->_verifyCredentialReason;
  uint64_t v91 = [(NSString *)self->_callerIconBundlePath copy];
  callerIconBundlePath = v3->_callerIconBundlePath;
  v3->_callerIconBundlePath = (NSString *)v91;

  uint64_t v93 = [(NSString *)self->_localizedCallerName copy];
  localizedCallerName = v3->_localizedCallerName;
  v3->_localizedCallerName = (NSString *)v93;

  uint64_t v95 = [(NSString *)self->_custodianRecoveryToken copy];
  custodianRecoveryToken = v3->_custodianRecoveryToken;
  v3->_custodianRecoveryToken = (NSString *)v95;

  v3->_forceEligibleForForegroundAuthentication = self->_forceEligibleForForegroundAuthentication;
  v3->_deviceRegionRequired = self->_deviceRegionRequired;
  v3->_disableProximityAuth = self->_disableProximityAuth;
  v3->_shouldBroadcastForProximityAuthOnly = [(AKAppleIDAuthenticationContext *)self _shouldBroadcastForProximityAuthOnly];
  v3->_enablePasscodeAuth = self->_enablePasscodeAuth;
  v3->_passcodeOnlyPolicy = self->_passcodeOnlyPolicy;
  uint64_t v97 = [(NSString *)self->_sourceAltDSID copy];
  sourceAltDSID = v3->_sourceAltDSID;
  v3->_sourceAltDSID = (NSString *)v97;

  uint64_t v99 = [(NSString *)self->_serviceToken copy];
  serviceToken = v3->_serviceToken;
  v3->_serviceToken = (NSString *)v99;

  v3->_isRequestedFromOOPViewService = self->_isRequestedFromOOPViewService;
  v3->_isNativeTakeover = self->_isNativeTakeover;
  v3->_ignorePasswordCache = self->_ignorePasswordCache;
  v3->_ignoreShouldContinueProxy = self->_ignoreShouldContinueProxy;
  uint64_t v101 = [(NSString *)self->_proxiedAppleID copy];
  proxiedAppleID = v3->_proxiedAppleID;
  v3->_proxiedAppleID = (NSString *)v101;

  uint64_t v103 = [(AKCompanionKeyEnvelope *)self->_companionKeyEnvelope copy];
  companionKeyEnvelope = v3->_companionKeyEnvelope;
  v3->_companionKeyEnvelope = (AKCompanionKeyEnvelope *)v103;

  v3->_piggybackingForTrustedDevice = self->_piggybackingForTrustedDevice;
  v3->_allowAuthenticationBeforeFirstUnlock = self->_allowAuthenticationBeforeFirstUnlock;

  return v3;
}

- (void)_updateWithValuesFromContext:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _AKLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    [(AKAppleIDAuthenticationContext *)(uint64_t)self _updateWithValuesFromContext:v5];
  }

  if (v4)
  {
    uint64_t v6 = (NSString *)[*((id *)v4 + 47) copy];
    reason = self->_reason;
    self->_reason = v6;

    uint64_t v8 = (NSString *)[*((id *)v4 + 22) copy];
    username = self->_username;
    self->_username = v8;

    self->_isUsernameEditable = *((unsigned char *)v4 + 139);
    uint64_t v10 = (NSString *)[*((id *)v4 + 51) copy];
    DSID = self->_DSID;
    self->_DSID = v10;

    uint64_t v12 = (NSString *)[*((id *)v4 + 35) copy];
    altDSID = self->_altDSID;
    self->_altDSID = v12;

    uint64_t v14 = (NSString *)[*((id *)v4 + 44) copy];
    telemetryDeviceSessionID = self->_telemetryDeviceSessionID;
    self->_telemetryDeviceSessionID = v14;

    uint64_t v16 = (NSString *)[*((id *)v4 + 45) copy];
    telemetryFlowID = self->_telemetryFlowID;
    self->_telemetryFlowID = v16;

    objc_storeStrong((id *)&self->_dependentAltDSID, *((id *)v4 + 70));
    uint64_t v18 = (NSArray *)[*((id *)v4 + 50) copy];
    serviceIdentifiers = self->_serviceIdentifiers;
    self->_serviceIdentifiers = v18;

    self->_serviceType = *((void *)v4 + 36);
    self->_maximumLoginAttempts = *((void *)v4 + 49);
    self->_isEphemeral = *((unsigned char *)v4 + 145);
    self->_shouldAllowAppleIDCreation = *((unsigned char *)v4 + 140);
    self->_shouldPromptForPasswordOnly = *((unsigned char *)v4 + 156);
    v20 = (NSString *)[*((id *)v4 + 27) copy];
    passwordPromptTitle = self->_passwordPromptTitle;
    self->_passwordPromptTitle = v20;

    uint64_t v22 = (NSString *)[*((id *)v4 + 48) copy];
    defaultButtonString = self->_defaultButtonString;
    self->_defaultButtonString = v22;

    uint64_t v24 = (NSDictionary *)[*((id *)v4 + 52) copy];
    httpHeadersForRemoteUI = self->_httpHeadersForRemoteUI;
    self->_httpHeadersForRemoteUI = v24;

    v26 = (NSString *)[*((id *)v4 + 26) copy];
    remoteUIIdentityToken = self->_remoteUIIdentityToken;
    self->_remoteUIIdentityToken = v26;

    v28 = (NSString *)[*((id *)v4 + 28) copy];
    password = self->_password;
    self->_password = v28;

    self->_shouldUpdatePersistentServiceTokens = *((unsigned char *)v4 + 157);
    self->_shouldOfferSecurityUpgrade = *((unsigned char *)v4 + 146);
    self->_shouldPreventInteractiveAuth = *((unsigned char *)v4 + 128);
    v30 = (NSString *)[*((id *)v4 + 1) copy];
    generatedCode = self->_generatedCode;
    self->_generatedCode = v30;

    self->_shouldForceInteractiveAuth = *((unsigned char *)v4 + 129);
    v32 = (AKAnisetteData *)[*((id *)v4 + 33) copy];
    proxiedDeviceAnisetteData = self->_proxiedDeviceAnisetteData;
    self->_proxiedDeviceAnisetteData = v32;

    v34 = (AKDevice *)[*((id *)v4 + 11) copy];
    proxiedDevice = self->_proxiedDevice;
    self->_proxiedDevice = v34;

    v36 = (AKAnisetteData *)[*((id *)v4 + 32) copy];
    companionDeviceAnisetteData = self->_companionDeviceAnisetteData;
    self->_companionDeviceAnisetteData = v36;

    uint64_t v38 = (AKDevice *)[*((id *)v4 + 12) copy];
    companionDevice = self->_companionDevice;
    self->_companionDevice = v38;

    self->_needsNewAppleID = *((unsigned char *)v4 + 142);
    uint64_t v40 = (NSNumber *)[*((id *)v4 + 66) copy];
    isAppleIDLoginEnabled = self->_isAppleIDLoginEnabled;
    self->_isAppleIDLoginEnabled = v40;

    v42 = (NSNumber *)[*((id *)v4 + 67) copy];
    hasEmptyPassword = self->_hasEmptyPassword;
    self->_hasEmptyPassword = v42;

    self->_shouldRequestShortLivedToken = *((unsigned char *)v4 + 159);
    v44 = (NSString *)[*((id *)v4 + 30) copy];
    shortLivedToken = self->_shortLivedToken;
    self->_shortLivedToken = v44;

    v46 = (NSString *)[*((id *)v4 + 25) copy];
    identityToken = self->_identityToken;
    self->_identityToken = v46;

    self->_shouldRequestConfigurationInfo = *((unsigned char *)v4 + 160);
    self->_isTriggeredByNotification = *((unsigned char *)v4 + 144);
    v48 = (NSString *)[*((id *)v4 + 31) copy];
    message = self->_message;
    self->_message = v48;

    self->_anticipateEscrowAttempt = *((unsigned char *)v4 + 162);
    self->_isFirstTimeLogin = *((unsigned char *)v4 + 163);
    self->_supportsPiggybacking = *((unsigned char *)v4 + 161);
    v50 = (NSSet *)[*((id *)v4 + 68) copy];
    desiredInternalTokens = self->_desiredInternalTokens;
    self->_desiredInternalTokens = v50;

    self->_shouldSkipSettingsLaunchAlert = *((unsigned char *)v4 + 164);
    self->_shouldSendIdentityTokenForRemoteUI = *((unsigned char *)v4 + 124);
    self->_shouldRequestRecoveryPET = *((unsigned char *)v4 + 158);
    objc_storeStrong((id *)&self->_title, *((id *)v4 + 54));
    objc_storeStrong((id *)&self->_helpAnchor, *((id *)v4 + 55));
    objc_storeStrong((id *)&self->_helpBook, *((id *)v4 + 56));
    self->_attemptIndex = *((void *)v4 + 14);
    objc_storeStrong((id *)&self->_securityUpgradeContext, *((id *)v4 + 69));
    self->_authenticationType = *((void *)v4 + 37);
    self->_shouldSendGrandSlamTokensForRemoteUI = *((unsigned char *)v4 + 125);
    self->_needsRepair = *((unsigned char *)v4 + 147);
    objc_storeStrong((id *)&self->_appProvidedData, *((id *)v4 + 40));
    objc_storeStrong((id *)&self->_appProvidedContext, *((id *)v4 + 41));
    v52 = (NSString *)[*((id *)v4 + 34) copy];
    masterKey = self->_masterKey;
    self->_masterKey = v52;

    self->_keepAlive = *((unsigned char *)v4 + 122);
    v54 = (NSString *)[*((id *)v4 + 58) copy];
    cancelButtonString = self->_cancelButtonString;
    self->_cancelButtonString = v54;

    v56 = (NSString *)[*((id *)v4 + 59) copy];
    alternativeButtonString = self->_alternativeButtonString;
    self->_alternativeButtonString = v56;

    self->_hideAlternativeButton = *((unsigned char *)v4 + 148);
    self->_hideCancelButton = *((unsigned char *)v4 + 149);
    self->_hideReasonString = *((unsigned char *)v4 + 150);
    self->_clientShouldHandleAlternativeButtonAction = *((unsigned char *)v4 + 151);
    uint64_t v58 = (NSString *)[*((id *)v4 + 60) copy];
    windowTitle = self->_windowTitle;
    self->_windowTitle = v58;

    self->_alwaysShowUsernameField = *((unsigned char *)v4 + 152);
    objc_storeStrong((id *)&self->_privacyBundleIdentifier, *((id *)v4 + 61));
    self->_authenticationPromptStyle = *((void *)v4 + 57);
    self->_needsNewChildAccount = *((unsigned char *)v4 + 165);
    self->_authenticationMode = *((void *)v4 + 38);
    self->_isMDMInformationRequired = *((unsigned char *)v4 + 132);
    self->_cliMode = *((unsigned char *)v4 + 133);
    objc_storeStrong((id *)&self->_passwordlessToken, *((id *)v4 + 42));
    objc_storeStrong((id *)&self->_idmsDataToken, *((id *)v4 + 43));
    self->_needsSecurityUpgradeUI = *((unsigned char *)v4 + 166);
    self->_isRKVerification = *((unsigned char *)v4 + 167);
    uint64_t v60 = (NSData *)[*((id *)v4 + 63) copy];
    displayImageData = self->_displayImageData;
    self->_displayImageData = v60;

    self->_verifyCredentialReason = *((void *)v4 + 72);
    uint64_t v62 = (NSString *)[*((id *)v4 + 74) copy];
    callerIconBundlePath = self->_callerIconBundlePath;
    self->_callerIconBundlePath = v62;

    uint64_t v64 = (NSString *)[*((id *)v4 + 75) copy];
    localizedCallerName = self->_localizedCallerName;
    self->_localizedCallerName = v64;

    uint64_t v66 = (NSString *)[*((id *)v4 + 73) copy];
    custodianRecoveryToken = self->_custodianRecoveryToken;
    self->_custodianRecoveryToken = v66;

    self->_forceEligibleForForegroundAuthentication = *((unsigned char *)v4 + 130);
    self->_deviceRegionRequired = *((unsigned char *)v4 + 154);
    self->_disableProximityAuth = *((unsigned char *)v4 + 153);
    self->_shouldBroadcastForProximityAuthOnly = *((unsigned char *)v4 + 131);
    self->_enablePasscodeAuth = *((unsigned char *)v4 + 168);
    self->_passcodeOnlyPolicy = *((unsigned char *)v4 + 155);
    objc_storeStrong((id *)&self->_sourceAltDSID, *((id *)v4 + 78));
    objc_storeStrong((id *)&self->_serviceToken, *((id *)v4 + 76));
    self->_isNativeTakeover = *((unsigned char *)v4 + 134);
    self->_ignorePasswordCache = *((unsigned char *)v4 + 135);
    self->_ignoreShouldContinueProxy = *((unsigned char *)v4 + 136);
    self->_isRequestedFromOOPViewService = *((unsigned char *)v4 + 137);
    objc_storeStrong((id *)&self->_proxiedAppleID, *((id *)v4 + 77));
    objc_storeStrong((id *)&self->_companionKeyEnvelope, *((id *)v4 + 46));
    self->_piggybackingForTrustedDevice = *((unsigned char *)v4 + 138);
  }
  else
  {
    uint64_t v68 = _AKLogSystem();
    if (os_log_type_enabled(v68, OS_LOG_TYPE_FAULT)) {
      -[AKAppleIDAuthenticationContext _updateWithValuesFromContext:]();
    }
  }
}

- (BOOL)_localUserHasEmptyPassword
{
  hasEmptyPassword = self->_hasEmptyPassword;
  if (hasEmptyPassword)
  {
    return [(NSNumber *)hasEmptyPassword BOOLValue];
  }
  else
  {
    id v4 = +[AKDevice currentDevice];
    char v5 = [v4 isProtectedWithPasscode] ^ 1;

    return v5;
  }
}

- (NSString)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  char v5 = NSStringFromClass(v4);
  uint64_t v6 = [v3 stringWithFormat:@"<%@: %p { UUID: %@ - FlowID: %@ - SessionID: %@ }>", v5, self, self->_identifier, self->_telemetryFlowID, self->_telemetryDeviceSessionID];

  return (NSString *)v6;
}

- (NSString)debugDescription
{
  uint64_t v80 = NSString;
  v3 = (objc_class *)objc_opt_class();
  uint64_t v81 = NSStringFromClass(v3);
  username = self->_username;
  identifier = self->_identifier;
  BOOL isUsernameEditable = self->_isUsernameEditable;
  DSID = self->_DSID;
  altDSID = self->_altDSID;
  dependentAltDSID = self->_dependentAltDSID;
  password = self->_password;
  if (password)
  {
    if ([(NSString *)password length]) {
      char v5 = @"(******)";
    }
    else {
      char v5 = @"(empty)";
    }
  }
  else
  {
    char v5 = @"(null)";
  }
  uint64_t v74 = v5;
  serviceIdentifiers = self->_serviceIdentifiers;
  int64_t serviceType = self->_serviceType;
  reason = self->_reason;
  BOOL isEphemeral = self->_isEphemeral;
  BOOL shouldPromptForPasswordOnly = self->_shouldPromptForPasswordOnly;
  passwordlessToken = self->_passwordlessToken;
  if (passwordlessToken)
  {
    if ([(NSString *)passwordlessToken length]) {
      v7 = @"(******)";
    }
    else {
      v7 = @"(empty)";
    }
  }
  else
  {
    v7 = @"(null)";
  }
  uint64_t v70 = v7;
  idmsDataToken = self->_idmsDataToken;
  if (idmsDataToken)
  {
    if ([(NSString *)idmsDataToken length]) {
      v9 = @"(******)";
    }
    else {
      v9 = @"(empty)";
    }
  }
  else
  {
    v9 = @"(null)";
  }
  uint64_t v67 = v9;
  uint64_t v69 = [NSNumber numberWithUnsignedInteger:self->_authenticationType];
  uint64_t v68 = [NSNumber numberWithUnsignedInteger:self->_authenticationMode];
  BOOL isMDMInformationRequired = self->_isMDMInformationRequired;
  BOOL shouldUpdatePersistentServiceTokens = self->_shouldUpdatePersistentServiceTokens;
  BOOL shouldOfferSecurityUpgrade = self->_shouldOfferSecurityUpgrade;
  BOOL isProxyingForApp = self->_isProxyingForApp;
  proxiedAppBundleID = self->_proxiedAppBundleID;
  securityUpgradeContext = self->_securityUpgradeContext;
  companionDevice = self->_companionDevice;
  proxiedDevice = self->_proxiedDevice;
  uint64_t v66 = [NSNumber numberWithInteger:self->_maximumLoginAttempts];
  hasEmptyPassword = self->_hasEmptyPassword;
  isAppleIDLoginEnabled = self->_isAppleIDLoginEnabled;
  BOOL shouldRequestShortLivedToken = self->_shouldRequestShortLivedToken;
  shortLivedToken = self->_shortLivedToken;
  if (shortLivedToken)
  {
    if ([(NSString *)shortLivedToken length]) {
      uint64_t v13 = @"(******)";
    }
    else {
      uint64_t v13 = @"(empty)";
    }
  }
  else
  {
    uint64_t v13 = @"(null)";
  }
  uint64_t v53 = v13;
  identityToken = self->_identityToken;
  if (identityToken)
  {
    if ([(NSString *)identityToken length]) {
      uint64_t v15 = @"(******)";
    }
    else {
      uint64_t v15 = @"(empty)";
    }
  }
  else
  {
    uint64_t v15 = @"(null)";
  }
  v52 = v15;
  BOOL isTriggeredByNotification = self->_isTriggeredByNotification;
  BOOL shouldSkipSettingsLaunchAlert = self->_shouldSkipSettingsLaunchAlert;
  BOOL v18 = [(AKAppleIDAuthenticationContext *)self _shouldSkipInitialReachabilityCheck];
  unint64_t attemptIndex = self->_attemptIndex;
  masterKey = self->_masterKey;
  if (masterKey)
  {
    if ([(NSString *)masterKey length]) {
      v20 = @"(******)";
    }
    else {
      v20 = @"(empty)";
    }
  }
  else
  {
    v20 = @"(null)";
  }
  v44 = v20;
  if (v18) {
    uint64_t v21 = @"YES";
  }
  else {
    uint64_t v21 = @"NO";
  }
  if (shouldSkipSettingsLaunchAlert) {
    uint64_t v22 = @"YES";
  }
  else {
    uint64_t v22 = @"NO";
  }
  if (isTriggeredByNotification) {
    uint64_t v23 = @"YES";
  }
  else {
    uint64_t v23 = @"NO";
  }
  if (shouldRequestShortLivedToken) {
    uint64_t v24 = @"YES";
  }
  else {
    uint64_t v24 = @"NO";
  }
  if (isProxyingForApp) {
    uint64_t v25 = @"YES";
  }
  else {
    uint64_t v25 = @"NO";
  }
  uint64_t v43 = v25;
  if (shouldOfferSecurityUpgrade) {
    v26 = @"YES";
  }
  else {
    v26 = @"NO";
  }
  if (shouldUpdatePersistentServiceTokens) {
    uint64_t v27 = @"YES";
  }
  else {
    uint64_t v27 = @"NO";
  }
  uint64_t v47 = v26;
  uint64_t v49 = v27;
  if (isMDMInformationRequired) {
    v28 = @"YES";
  }
  else {
    v28 = @"NO";
  }
  uint64_t v51 = v28;
  if (shouldPromptForPasswordOnly) {
    uint64_t v29 = @"YES";
  }
  else {
    uint64_t v29 = @"NO";
  }
  if (isEphemeral) {
    v30 = @"YES";
  }
  else {
    v30 = @"NO";
  }
  uint64_t v57 = v29;
  uint64_t v59 = v30;
  if (isUsernameEditable) {
    uint64_t v31 = @"YES";
  }
  else {
    uint64_t v31 = @"NO";
  }
  uint64_t v65 = v31;
  if (self->_performUIOutOfProcess) {
    v32 = @"YES";
  }
  else {
    v32 = @"NO";
  }
  if (self->_shouldBroadcastForProximityAuthOnly) {
    uint64_t v33 = @"YES";
  }
  else {
    uint64_t v33 = @"NO";
  }
  v34 = [NSNumber numberWithInteger:self->_verifyCredentialReason];
  if (self->_enablePasscodeAuth) {
    uint64_t v35 = @"YES";
  }
  else {
    uint64_t v35 = @"NO";
  }
  if (self->_passcodeOnlyPolicy) {
    v36 = @"YES";
  }
  else {
    v36 = @"NO";
  }
  if (self->_isNativeTakeover) {
    uint64_t v37 = @"YES";
  }
  else {
    uint64_t v37 = @"NO";
  }
  if (self->_ignorePasswordCache) {
    uint64_t v38 = @"YES";
  }
  else {
    uint64_t v38 = @"NO";
  }
  if (self->_isRequestedFromOOPViewService) {
    uint64_t v39 = @"YES";
  }
  else {
    uint64_t v39 = @"NO";
  }
  if (self->_piggybackingForTrustedDevice) {
    uint64_t v40 = @"YES";
  }
  else {
    uint64_t v40 = @"NO";
  }
  objc_msgSend(v80, "stringWithFormat:", @"<%@: %p {\n\tUUID: %@,\n\tusername: %@,\n\teditable-username: %@,\n\taltDSID: %@,\n\tDSID: %@,\n\tdependentAltDSID: %@,\n\tpassword: %@,\n\tservice-type: %ld,\n\tservice IDs: %@,\n\treason: %@\n\tephemeral: %@,\n\tpassword-only: %@,\n\tpasswordlessToken: %@,\n\tidmsDataToken: %@,\n\tauthentication-type: %@,\n\tauthenticationMode: %@, \n\tisMDMInfoRequired: %@, \n\tupdate-service-tokens: %@,\n\toffer-upgrade: %@,\n\toffer-upgrade-context: %@,\n\tproxying-for-app: %@,\n\tproxied-app-id: %@,\n\tproxied-device: %@,\n\tcompanion-device: %@\n\tmax-login-attempts: %@\n\tappleid-login-enabled: %@\n\thas-empty-password: %@\n\trequest-slt: %@\n\tshort-lived-token: %@\n\tidentity-token: %@\n\ttriggered-by-push: %@\n\tskip-alert: %@\n\tskip-reachability-check: %@\n\tattempt-index: %lu,\n\tmasterKey: %@,\n\tperformUIOutOfProcess: %@,\n\tbroadcastProximityAuthOnly: %@, \n\tVerifyCredentialReason: %@, \n\tEnablePasscodeAuth: %@, \n\tPasscodeOnlyPolicy: %@, \n\tSourceAltDSID: %@, \n\tServiceToken: %@, \n\tisNativeTakeover: %@, \n\tignorePasswordCache: %@, \n\tisRequestedFromOOPViewService: %@, \n\tProxiedAppleID: %@, \n\ttelemetryDeviceSessionID: %@, \n\ttelemetryFlowID: %@, \n\tpiggybackingForTrustedDevice: %@, \n}>", v81, self, identifier, username, v65, altDSID, DSID, dependentAltDSID, v74, serviceType, serviceIdentifiers, reason, v59, v57, v70, v67,
    v69,
    v68,
    v51,
    v49,
    v47,
    securityUpgradeContext,
    v43,
    proxiedAppBundleID,
    proxiedDevice,
    companionDevice,
    v66,
    isAppleIDLoginEnabled,
    hasEmptyPassword,
    v24,
    v53,
    v52,
    v23,
    v22,
    v21,
    attemptIndex,
    v44,
    v32,
    v33,
    v34,
    v35,
    v36,
    self->_sourceAltDSID,
    self->_serviceToken,
    v37,
    v38,
    v39,
    self->_proxiedAppleID,
    self->_telemetryDeviceSessionID,
    self->_telemetryFlowID,
  uint64_t v41 = v40);

  return (NSString *)v41;
}

- (BOOL)isContextEligibleForSilentAuthCoercion
{
  v3 = [(AKAppleIDAuthenticationContext *)self _proxiedAppName];
  char v4 = [v3 hasPrefix:@"findmydeviced"];

  if ([(AKAppleIDAuthenticationContext *)self _capabilityForUIDisplay] == 1) {
    return [(AKAppleIDAuthenticationContext *)self isContextEligibleForSilentAuth] & (v4 ^ 1);
  }
  else {
    return 0;
  }
}

- (BOOL)isContextEligibleForSilentAuth
{
  if ([(AKAppleIDAuthenticationContext *)self authenticationType] != 2
    || [(AKAppleIDAuthenticationContext *)self shouldPromptForPasswordOnly]
    || [(AKAppleIDAuthenticationContext *)self isEphemeral]
    || [(AKAppleIDAuthenticationContext *)self isUsernameEditable])
  {
    return 0;
  }
  char v5 = +[AKAccountManager sharedInstance];
  uint64_t v6 = [(AKAppleIDAuthenticationContext *)self authKitAccount:0];
  v7 = [v5 continuationTokenForAccount:v6];
  BOOL v3 = v7 != 0;

  return v3;
}

- (BOOL)isContextEligibleForBiometricOrPasscodeAuth
{
  BOOL v3 = [(AKAppleIDAuthenticationContext *)self _isVerifyCredentialReasonEligibleForBiometricOrPasscodeAuth];
  if (v3)
  {
    LOBYTE(v3) = [(AKAppleIDAuthenticationContext *)self _isEligibleForPasscodeAuth];
  }
  return v3;
}

- (BOOL)isContextEligibleForPasscodeAuth
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  BOOL v3 = +[AKAccountManager sharedInstance];
  char v4 = [(AKAppleIDAuthenticationContext *)self authKitAccount:0];
  char v5 = +[AKConfiguration sharedConfiguration];
  if ([v5 shouldAskToBuy] == 1) {
    char v6 = 1;
  }
  else {
    char v6 = [v3 isAskToBuyForAccount:v4];
  }

  v7 = _AKLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[AKAppleIDAuthenticationContext isContextEligibleForPasscodeAuth]();
  }

  if ([(AKAppleIDAuthenticationContext *)self serviceType] == 2) {
    char v8 = v6;
  }
  else {
    char v8 = 1;
  }
  if (v8)
  {
    v9 = [(AKAppleIDAuthenticationContext *)self companionDevice];
    if (v9)
    {
    }
    else
    {
      uint64_t v12 = [(AKAppleIDAuthenticationContext *)self proxiedDevice];

      if (!v12)
      {
        uint64_t v15 = _AKLogSystem();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v16 = +[AKFeatureManager sharedManager];
          v17[0] = 67110144;
          v17[1] = [v16 isChildPasscodeEnabled];
          __int16 v18 = 1024;
          BOOL v19 = [(AKAppleIDAuthenticationContext *)self enablePasscodeAuth];
          __int16 v20 = 1024;
          int v21 = [v3 isPasscodeAuthEnabledForAccount:v4];
          __int16 v22 = 1024;
          int v23 = [v3 userUnderAgeForAccount:v4];
          __int16 v24 = 1024;
          BOOL v25 = [(AKAppleIDAuthenticationContext *)self _isEligibleForPasscodeAuth];
          _os_log_debug_impl(&dword_193494000, v15, OS_LOG_TYPE_DEBUG, "isContextEligibleForPasscodeAuth: {\n\tisChildPasscodeEnabled: %d, \n\tenablePasscodeAuth: %d, \n\tisPasscodeAuthEnabled: %d, \n\tuserUnderAge: %d, \n\tisEligibleForPasscodeAuth: %d, \n}", (uint8_t *)v17, 0x20u);
        }
        uint64_t v10 = +[AKFeatureManager sharedManager];
        if ([v10 isChildPasscodeEnabled]
          && [(AKAppleIDAuthenticationContext *)self enablePasscodeAuth]
          && [v3 isPasscodeAuthEnabledForAccount:v4]
          && [v3 userUnderAgeForAccount:v4])
        {
          BOOL v13 = [(AKAppleIDAuthenticationContext *)self _isEligibleForPasscodeAuth];
          goto LABEL_19;
        }
        goto LABEL_18;
      }
    }
    uint64_t v10 = _AKLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v17[0]) = 0;
      uint64_t v11 = "Account is not passcode auth eligible for magic and prox auth flows.";
      goto LABEL_17;
    }
  }
  else
  {
    uint64_t v10 = _AKLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v17[0]) = 0;
      uint64_t v11 = "Account is not passcode auth eligible. AskToBuy is disabled.";
LABEL_17:
      _os_log_impl(&dword_193494000, v10, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)v17, 2u);
    }
  }
LABEL_18:
  BOOL v13 = 0;
LABEL_19:

  return v13;
}

- (BOOL)isConfiguredForTokenUpgrade
{
  uint64_t v3 = [(AKAppleIDAuthenticationContext *)self serviceToken];
  char v4 = +[AKFeatureManager sharedManager];
  int v5 = [v4 isPltUpgradeEnabled];

  if (v5)
  {
    char v6 = _AKLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[AKAppleIDAuthenticationContext isConfiguredForTokenUpgrade]();
    }

    uint64_t v7 = [(AKAppleIDAuthenticationContext *)self passwordlessToken];
  }
  else
  {
    uint64_t v7 = 0;
  }
  char v8 = [(AKAppleIDAuthenticationContext *)self _shortLivedToken];
  if (v8)
  {
    BOOL v9 = 1;
  }
  else
  {
    uint64_t v10 = [(AKAppleIDAuthenticationContext *)self _identityToken];
    if (v10 | v7) {
      uint64_t v11 = (void *)v10;
    }
    else {
      uint64_t v11 = 0;
    }
    BOOL v9 = (v10 | v7 | v3) != 0;
  }
  return v9;
}

- (BOOL)_isEligibleForPasscodeAuth
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = +[AKAccountManager sharedInstance];
  char v4 = [(AKAppleIDAuthenticationContext *)self authKitAccount:0];
  int v5 = [v3 continuationTokenForAccount:v4];

  char v6 = +[AKAccountManager sharedInstance];
  uint64_t v7 = [(AKAppleIDAuthenticationContext *)self authKitAccount:0];
  char v8 = [v6 passwordResetTokenForAccount:v7];

  BOOL v9 = _AKLogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v12[0] = 67110656;
    v12[1] = 1;
    __int16 v13 = 2048;
    unint64_t v14 = [(AKAppleIDAuthenticationContext *)self authenticationType];
    __int16 v15 = 1024;
    BOOL v16 = [(AKAppleIDAuthenticationContext *)self shouldPromptForPasswordOnly];
    __int16 v17 = 1024;
    BOOL v18 = [(AKAppleIDAuthenticationContext *)self isEphemeral];
    __int16 v19 = 1024;
    BOOL v20 = [(AKAppleIDAuthenticationContext *)self isUsernameEditable];
    __int16 v21 = 1024;
    BOOL v22 = v5 != 0;
    __int16 v23 = 1024;
    BOOL v24 = v8 != 0;
    _os_log_debug_impl(&dword_193494000, v9, OS_LOG_TYPE_DEBUG, "_isEligibleForPasscodeAuth: {\n\thasRequiredCapabilityForUIDisplay: %d, \n\tauthenticationType: %lu, \n\tshouldPromptForPasswordOnly: %d, \n\tisEphemeral: %d, \n\tisUsernameEditable: %d, \n\tvalidContinuationToken: %d, \n\tvalidPasswordResetToken: %d, \n}", (uint8_t *)v12, 0x30u);
  }

  if ([(AKAppleIDAuthenticationContext *)self authenticationType] != 2
    || [(AKAppleIDAuthenticationContext *)self shouldPromptForPasswordOnly]
    || [(AKAppleIDAuthenticationContext *)self isEphemeral])
  {
    return 0;
  }
  unsigned int v11 = (v5 != 0) & ~[(AKAppleIDAuthenticationContext *)self isUsernameEditable];
  if (v8) {
    return v11;
  }
  else {
    return 0;
  }
}

- (BOOL)_isVerifyCredentialReasonEligibleForBiometricOrPasscodeAuth
{
  return (unint64_t)([(AKAppleIDAuthenticationContext *)self verifyCredentialReason] - 1) < 4;
}

- (BOOL)isContextRequestingReauthForExistingService
{
  if (self->_isContextRequestingReauthForExistingService) {
    return 1;
  }
  char v4 = [(AKAppleIDAuthenticationContext *)self authKitAccount:0];
  if (v4)
  {
    int v5 = +[AKAccountManager sharedInstance];
    char v6 = [v5 servicesUsingAccount:v4];

    uint64_t v7 = [v6 count];
    BOOL v2 = v7 != 0;
    if (v7) {
      self->_isContextRequestingReauthForExistingService = 1;
    }
  }
  else
  {
    BOOL v2 = 0;
  }

  return v2;
}

- (unint64_t)_capabilityForUIDisplay
{
  unint64_t result = self->_capabilityForUIDisplay;
  if (!result)
  {
    if ([(AKAppleIDAuthenticationContext *)self conformsToProtocol:&unk_1EE4623B0])
    {
      unint64_t result = 3;
    }
    else if ([(AKAppleIDAuthenticationContext *)self conformsToProtocol:&unk_1EE45EF20])
    {
      unint64_t result = 2;
    }
    else
    {
      if (([(AKAppleIDAuthenticationContext *)self conformsToProtocol:&unk_1EE455670] & 1) == 0) {
        return self->_capabilityForUIDisplay;
      }
      unint64_t result = 1;
    }
    self->_capabilityForUIDisplay = result;
  }
  return result;
}

- (void)setReason:(id)a3
{
  id v7 = a3;
  if (([v7 isEqualToString:self->_reason] & 1) == 0)
  {
    char v4 = (NSString *)[v7 copy];
    reason = self->_reason;
    self->_reason = v4;

    interpolatedReason = self->_interpolatedReason;
    self->_interpolatedReason = 0;
  }
}

- (void)setUsername:(id)a3
{
  id v7 = a3;
  if (([v7 isEqualToString:self->_username] & 1) == 0)
  {
    char v4 = (NSString *)[v7 copy];
    username = self->_username;
    self->_username = v4;

    interpolatedReason = self->_interpolatedReason;
    self->_interpolatedReason = 0;
  }
}

- (void)_setPassword:(id)a3
{
  id v5 = a3;
  password = self->_password;
  p_password = &self->_password;
  if (([v5 isEqualToString:password] & 1) == 0)
  {
    objc_storeStrong((id *)p_password, a3);
    if ([(NSString *)*p_password length] >= 0xBE)
    {
      if ([(NSString *)*p_password hasSuffix:@"PET"])
      {
        char v8 = _AKLogSystem();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
          -[AKAppleIDAuthenticationContext _setPassword:]();
        }
      }
    }
  }
}

- (BOOL)_shouldRefreshAccountAndUpdateContext
{
  appProvidedContext = self->_appProvidedContext;
  if (!appProvidedContext
    || [(NSString *)appProvidedContext isEqualToString:@"appleIdSettings"]
    || (BOOL v4 = [(NSString *)self->_appProvidedContext isEqualToString:@"appleManagedAccountSignIn"]))
  {
    LOBYTE(v4) = 1;
  }
  return v4;
}

+ (id)_identifierForContext:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v4 = [v3 _identifier];
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (void)setShouldPreventInteractiveAuth:(BOOL)a3
{
  self->_shouldPreventInteractiveAuth = a3;
  if (a3)
  {
    unint64_t v3 = 1;
  }
  else
  {
    if (self->_authenticationType != 1) {
      return;
    }
    unint64_t v3 = 0;
  }
  self->_authenticationType = v3;
}

- (BOOL)shouldPreventInteractiveAuth
{
  return self->_shouldPreventInteractiveAuth;
}

- (void)setShouldForceInteractiveAuth:(BOOL)a3
{
  self->_shouldForceInteractiveAuth = a3;
  if (a3)
  {
    unint64_t v3 = 2;
  }
  else
  {
    if ((self->_authenticationType & 0xFFFFFFFFFFFFFFFELL) != 2) {
      return;
    }
    unint64_t v3 = 0;
  }
  self->_authenticationType = v3;
}

- (BOOL)shouldForceInteractiveAuth
{
  return self->_shouldForceInteractiveAuth;
}

- (NSString)_interpolatedReason
{
  if (![(NSString *)self->_interpolatedReason length])
  {
    unint64_t v3 = [(AKAppleIDAuthenticationContext *)self reason];
    uint64_t v4 = [v3 length];

    if (v4)
    {
      id v5 = [(AKAppleIDAuthenticationContext *)self reason];
      interpolatedReason = self->_interpolatedReason;
      self->_interpolatedReason = v5;

      id v7 = [(AKAppleIDAuthenticationContext *)self username];
      char v8 = +[AKUsernameFormatter formattedUsernameFromUsername:v7];

      if ([v8 length])
      {
        BOOL v9 = [(NSString *)self->_interpolatedReason stringByReplacingOccurrencesOfString:@"%username%" withString:v8];
        uint64_t v10 = self->_interpolatedReason;
        self->_interpolatedReason = v9;
      }
      else
      {
        unsigned int v11 = _AKLogSystem();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          -[AKAppleIDAuthenticationContext _interpolatedReason]();
        }
      }
    }
  }
  uint64_t v12 = self->_interpolatedReason;

  return v12;
}

- (NSString)_interpolatedReasonWithBlame
{
  uint64_t v4 = [(AKAppleIDAuthenticationContext *)self _interpolatedReason];
  id v5 = (void *)v4;
  if (self->_username) {
    BOOL v6 = v4 == 0;
  }
  else {
    BOOL v6 = 0;
  }
  if (v6)
  {
    if (self->_isUsernameEditable)
    {
      id v5 = 0;
    }
    else
    {
      id v7 = +[AKDevice currentDevice];
      int v8 = [v7 isMultiUserMode];

      if (v8)
      {
        id v5 = AKSharedDevicePasscodePromptAlertMessageWithServiceType(self->_serviceType);
      }
      else
      {
        BOOL v9 = NSString;
        uint64_t v10 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AuthKit"];
        unsigned int v11 = @"INLINE_PASSWORD_ALERT_MESSAGE";
        char v12 = [@"INLINE_PASSWORD_ALERT_MESSAGE" containsString:@"REBRAND"];
        if (v12)
        {
          int v13 = 0;
        }
        else
        {
          BOOL v2 = +[AKFeatureManager sharedManager];
          if ([v2 isAABrandingEnabled])
          {
            unsigned int v11 = [@"INLINE_PASSWORD_ALERT_MESSAGE" stringByAppendingString:@"_REBRAND"];
            int v13 = 1;
          }
          else
          {
            int v13 = 0;
          }
        }
        unint64_t v14 = [v10 localizedStringForKey:v11 value:&stru_1EE40D360 table:@"Localizable"];
        __int16 v15 = +[AKUsernameFormatter formattedUsernameFromUsername:self->_username];
        id v5 = objc_msgSend(v9, "stringWithFormat:", v14, v15);

        if (v13) {
        if ((v12 & 1) == 0)
        }
      }
    }
  }
  BOOL v16 = [(AKAppleIDAuthenticationContext *)self _appendBlameIfRequiredTo:v5];

  return (NSString *)v16;
}

- (id)_appendBlameIfRequiredTo:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v13 = 0;
    goto LABEL_11;
  }
  id v5 = +[AKDevice currentDevice];
  int v6 = [v5 isInternalBuild];

  if (!v6)
  {
    id v13 = v4;
    goto LABEL_11;
  }
  id v7 = [NSString stringWithUTF8String:getprogname()];
  int v8 = [(AKAppleIDAuthenticationContext *)self _proxiedAppName];

  if (v8)
  {
    BOOL v9 = NSString;
    uint64_t v10 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AuthKit"];
    unsigned int v11 = [v10 localizedStringForKey:@"PASSWORD_ALERT_MESSAGE_PROXY_INTERNAL_BLAME" value:&stru_1EE40D360 table:@"Localizable"];
    char v12 = [(AKAppleIDAuthenticationContext *)self _proxiedAppName];
    objc_msgSend(v9, "stringWithFormat:", v11, v12, v7);
  }
  else
  {
    int64_t v14 = [(AKAppleIDAuthenticationContext *)self serviceType];
    __int16 v15 = NSString;
    BOOL v16 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AuthKit"];
    uint64_t v10 = v16;
    if (!v14)
    {
      unsigned int v11 = [v16 localizedStringForKey:@"PASSWORD_ALERT_MESSAGE_INTERNAL_BLAME" value:&stru_1EE40D360 table:@"Localizable"];
      __int16 v19 = objc_msgSend(v15, "stringWithFormat:", v11, v7);
      goto LABEL_10;
    }
    unsigned int v11 = [v16 localizedStringForKey:@"PASSWORD_ALERT_MESSAGE_SERVICE_TYPE_INTERNAL_BLAME" value:&stru_1EE40D360 table:@"Localizable"];
    unint64_t v17 = [(AKAppleIDAuthenticationContext *)self serviceType];
    char v12 = AKStringFromServiceType(v17, v18);
    objc_msgSend(v15, "stringWithFormat:", v11, v12, v21);
  __int16 v19 = };

LABEL_10:
  id v13 = [v4 stringByAppendingString:v19];

LABEL_11:

  return v13;
}

- (NSString)serviceIdentifier
{
  BOOL v2 = [(AKAppleIDAuthenticationContext *)self serviceIdentifiers];
  unint64_t v3 = [v2 firstObject];

  return (NSString *)v3;
}

- (void)setServiceIdentifier:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v7 = a3;
    id v4 = (void *)MEMORY[0x1E4F1C978];
    id v5 = a3;
    int v6 = [v4 arrayWithObjects:&v7 count:1];

    -[AKAppleIDAuthenticationContext setServiceIdentifiers:](self, "setServiceIdentifiers:", v6, v7, v8);
  }
}

- (AKDevice)proxiedDevice
{
  return self->_proxiedDevice;
}

- (void)setProxiedDevice:(id)a3
{
}

- (AKDevice)companionDevice
{
  return self->_companionDevice;
}

- (void)setCompanionDevice:(id)a3
{
}

- (void)presentBasicLoginUIWithCompletion:(id)a3
{
  v59[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_username && !self->_isUsernameEditable)
  {
    id v5 = _AKLogSystem();
    int v55 = 0;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_193494000, v5, OS_LOG_TYPE_DEFAULT, "Will prompt for password...", buf, 2u);
      int v55 = 0;
    }
  }
  else
  {
    id v5 = _AKLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_193494000, v5, OS_LOG_TYPE_DEFAULT, "Will prompt for username and password...", buf, 2u);
    }
    int v55 = 1;
  }

  int v6 = self->_passwordPromptTitle;
  if (!v6)
  {
    AKSignInStringFromServiceType(self->_serviceType);
    int v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v8 = self->_defaultButtonString;
  if (!v8)
  {
    BOOL v9 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AuthKit"];
    uint64_t v8 = [v9 localizedStringForKey:@"INLINE_PASSWORD_ALERT_OK_BUTTON" value:&stru_1EE40D360 table:@"Localizable"];
  }
  uint64_t v10 = +[AKAlertHandler sharedInstance];
  unsigned int v11 = [(AKAppleIDAuthenticationContext *)self _interpolatedReasonWithBlame];
  char v12 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AuthKit"];
  id v13 = [v12 localizedStringForKey:@"INLINE_PASSWORD_ALERT_CANCEL_BUTTON" value:&stru_1EE40D360 table:@"Localizable"];
  v54 = v8;
  int64_t v14 = [v10 notificationDictionaryWithTitle:v6 message:v11 defaultButton:v8 alternateButton:v13];

  __int16 v15 = [(AKAppleIDAuthenticationContext *)self username];

  if (v15)
  {
    BOOL v16 = +[AKDevice currentDevice];
    int v17 = [v16 isMultiUserMode];

    BOOL v18 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AuthKit"];
    __int16 v19 = v18;
    if (v17)
    {
      BOOL v20 = [v18 localizedStringForKey:@"PASSCODE_ALERT_TITLE_LOCKSCREEN" value:&stru_1EE40D360 table:@"Localizable"];

      uint64_t v21 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AuthKit"];
      BOOL v22 = [v21 localizedStringForKey:@"PASSCODE_ALERT_MESSAGE_LOCKSCREEN_GENERIC" value:&stru_1EE40D360 table:@"Localizable"];
    }
    else
    {
      __int16 v23 = @"PASSWORD_ALERT_TITLE_LOCKSCREEN";
      char v24 = [@"PASSWORD_ALERT_TITLE_LOCKSCREEN" containsString:@"REBRAND"];
      id v52 = v4;
      if (v24)
      {
        int v25 = 0;
      }
      else
      {
        BOOL v16 = +[AKFeatureManager sharedManager];
        if ([v16 isAABrandingEnabled])
        {
          __int16 v23 = [@"PASSWORD_ALERT_TITLE_LOCKSCREEN" stringByAppendingString:@"_REBRAND"];
          int v25 = 1;
        }
        else
        {
          int v25 = 0;
        }
      }
      BOOL v20 = [v19 localizedStringForKey:v23 value:&stru_1EE40D360 table:@"Localizable"];
      if (v25) {

      }
      uint64_t v51 = v6;
      if ((v24 & 1) == 0) {

      }
      uint64_t v21 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AuthKit"];
      uint64_t v26 = @"PASSWORD_ALERT_MESSAGE_LOCKSCREEN_GENERIC";
      char v27 = [@"PASSWORD_ALERT_MESSAGE_LOCKSCREEN_GENERIC" containsString:@"REBRAND"];
      if (v27)
      {
        int v28 = 0;
      }
      else
      {
        BOOL v16 = +[AKFeatureManager sharedManager];
        if ([v16 isAABrandingEnabled])
        {
          uint64_t v26 = [@"PASSWORD_ALERT_MESSAGE_LOCKSCREEN_GENERIC" stringByAppendingString:@"_REBRAND"];
          int v28 = 1;
        }
        else
        {
          int v28 = 0;
        }
      }
      BOOL v22 = [v21 localizedStringForKey:v26 value:&stru_1EE40D360 table:@"Localizable"];
      if (v28) {

      }
      if ((v27 & 1) == 0) {
      int v6 = v51;
      }
      id v4 = v52;
    }

    [v14 setObject:v20 forKeyedSubscript:*MEMORY[0x1E4FA73A8]];
    [v14 setObject:v22 forKeyedSubscript:*MEMORY[0x1E4FA73B8]];
  }
  uint64_t v29 = +[AKDevice currentDevice];
  int v30 = [v29 isMultiUserMode];
  uint64_t v31 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AuthKit"];
  v32 = v31;
  if (v30) {
    uint64_t v33 = @"INLINE_PASSWORD_ALERT_PASSCODE_PLACEHOLDER";
  }
  else {
    uint64_t v33 = @"INLINE_PASSWORD_ALERT_PASSWORD_PLACEHOLDER";
  }
  v34 = [v31 localizedStringForKey:v33 value:&stru_1EE40D360 table:@"Localizable"];

  if (v55)
  {
    uint64_t v35 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AuthKit"];
    v36 = @"INLINE_PASSWORD_ALERT_USERNAME_PLACEHOLDER";
    char v37 = [@"INLINE_PASSWORD_ALERT_USERNAME_PLACEHOLDER" containsString:@"REBRAND"];
    id v53 = v4;
    if (v37)
    {
      int v38 = 0;
    }
    else
    {
      v50 = +[AKFeatureManager sharedManager];
      if ([v50 isAABrandingEnabled])
      {
        v36 = [@"INLINE_PASSWORD_ALERT_USERNAME_PLACEHOLDER" stringByAppendingString:@"_REBRAND"];
        int v38 = 1;
      }
      else
      {
        int v38 = 0;
      }
    }
    v42 = [v35 localizedStringForKey:v36 value:&stru_1EE40D360 table:@"Localizable"];
    v59[0] = v42;
    v59[1] = v34;
    uint64_t v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:v59 count:2];

    if (v38) {
    if ((v37 & 1) == 0)
    }

    id v4 = v53;
    if (self->_username)
    {
      username = self->_username;
      uint64_t v43 = [MEMORY[0x1E4F1C978] arrayWithObjects:&username count:1];
    }
    else
    {
      uint64_t v43 = 0;
    }
    [v14 setObject:v39 forKeyedSubscript:*MEMORY[0x1E4F1DA20]];
    if (v43)
    {
      [v14 setObject:v43 forKeyedSubscript:*MEMORY[0x1E4F1DA28]];
    }
    uint64_t v41 = &unk_1EE43EB00;
    CFIndex v40 = 1;
  }
  else
  {
    uint64_t v57 = v34;
    uint64_t v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v57 count:1];
    [v14 setObject:v39 forKeyedSubscript:*MEMORY[0x1E4F1DA20]];
    CFIndex v40 = 0;
    uint64_t v41 = &unk_1EE43EB18;
  }
  [v14 setObject:v41 forKeyedSubscript:*MEMORY[0x1E4F1D9F0]];
  v44 = AKUserNotificationCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0.0, 0x10000 << v40, 0, (CFDictionaryRef)v14);
  if (v44)
  {
    uint64_t v45 = v44;
    *(void *)buf = 0;
    CFUserNotificationReceiveResponse(v44, 0.0, (CFOptionFlags *)buf);
    if (AKUserNotificationResponseAction(buf[0]))
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "ak_errorWithCode:", -7003);
      v46 = (NSString *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void, void, void, NSString *))v4 + 2))(v4, 0, 0, 0, v46);
    }
    else
    {
      if (v55)
      {
        CFStringRef v48 = (const __CFString *)*MEMORY[0x1E4F1DA28];
        CFUserNotificationGetResponseValue(v45, (CFStringRef)*MEMORY[0x1E4F1DA28], 0);
        v46 = (NSString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v46 = self->_username;
        CFStringRef v48 = (const __CFString *)*MEMORY[0x1E4F1DA28];
      }
      uint64_t v49 = CFUserNotificationGetResponseValue(v45, v48, v40);
      (*((void (**)(id, NSString *, void *, void, void))v4 + 2))(v4, v46, v49, 0, 0);
    }
    CFRelease(v45);
  }
  else
  {
    uint64_t v47 = objc_msgSend(MEMORY[0x1E4F28C58], "ak_errorWithCode:", -7013);
    (*((void (**)(id, void, void, void, void *))v4 + 2))(v4, 0, 0, 0, v47);
  }
}

- (BOOL)_requiresPasswordInput
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(AKAppleIDAuthenticationContext *)self username];

  if (!v3) {
    return 0;
  }
  id v4 = [(AKAppleIDAuthenticationContext *)self authKitAccount:0];
  if (!v4
    || (+[AKAccountManager sharedInstance],
        id v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = [v5 authenticationModeForAccount:v4],
        v5,
        v6 == 2))
  {

    return 0;
  }
  uint64_t v8 = _AKLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v9 = [(AKAppleIDAuthenticationContext *)self username];
    int v10 = 138412290;
    unsigned int v11 = v9;
    _os_log_impl(&dword_193494000, v8, OS_LOG_TYPE_DEFAULT, "Determined that we should show password field for username: %@", (uint8_t *)&v10, 0xCu);
  }
  return 1;
}

- (void)dismissBasicLoginUIWithCompletion:(id)a3
{
}

- (void)presentLoginAlertWithError:(id)a3 title:(id)a4 message:(id)a5 completion:(id)a6
{
  id v22 = a6;
  id v8 = a5;
  id v9 = a4;
  int v10 = _AKLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[AKAppleIDAuthenticationContext presentLoginAlertWithError:title:message:completion:]();
  }

  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v12 = +[AKAlertHandler sharedInstance];
  id v13 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AuthKit"];
  int64_t v14 = [v13 localizedStringForKey:@"WRONG_PASSWORD_ALERT_TRY_AGAIN_BUTTON" value:&stru_1EE40D360 table:@"Localizable"];
  __int16 v15 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AuthKit"];
  BOOL v16 = [v15 localizedStringForKey:@"WRONG_PASSWORD_ALERT_CANCEL_BUTTON" value:&stru_1EE40D360 table:@"Localizable"];
  int v17 = [v12 notificationDictionaryWithTitle:v9 message:v8 defaultButton:v14 alternateButton:v16];

  BOOL v18 = +[AKAlertHandler sharedInstance];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __86__AKAppleIDAuthenticationContext_presentLoginAlertWithError_title_message_completion___block_invoke;
  v26[3] = &unk_1E57608A0;
  v26[4] = self;
  id v27 = v22;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __86__AKAppleIDAuthenticationContext_presentLoginAlertWithError_title_message_completion___block_invoke_2;
  v24[3] = &unk_1E5760FC8;
  id v19 = v27;
  id v25 = v19;
  char v20 = [v18 showAlert:v17 primaryAction:v26 altAction:v24];

  if ((v20 & 1) == 0)
  {
    uint64_t v21 = objc_msgSend(MEMORY[0x1E4F28C58], "ak_errorWithCode:", -7013);
    (*((void (**)(id, void, void, void, void *))v19 + 2))(v19, 0, 0, 0, v21);
  }
}

uint64_t __86__AKAppleIDAuthenticationContext_presentLoginAlertWithError_title_message_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) presentBasicLoginUIWithCompletion:*(void *)(a1 + 40)];
}

void __86__AKAppleIDAuthenticationContext_presentLoginAlertWithError_title_message_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E4F28C58], "ak_errorWithCode:", -7003);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void, void, void, id))(v1 + 16))(v1, 0, 0, 0, v2);
}

- (void)presentSecondFactorUIWithCompletion:(id)a3
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v6 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AuthKit"];
  id v7 = [v6 localizedStringForKey:@"ENTER_VERITIFCATION_CODE_CANCEL_BUTTON" value:&stru_1EE40D360 table:@"Localizable"];
  [v5 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F1D9E0]];

  id v8 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AuthKit"];
  id v9 = [v8 localizedStringForKey:@"ENTER_VERITIFCATION_CODE_FAILED_BUTTON" value:&stru_1EE40D360 table:@"Localizable"];
  [v5 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F1D9D0]];

  uint64_t v10 = MEMORY[0x1E4F1CC38];
  [v5 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F1D9B8]];
  id v11 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v12 = [v11 resourceURL];
  [v5 setObject:v12 forKeyedSubscript:*MEMORY[0x1E4F1DA00]];

  id v13 = [MEMORY[0x1E4F28C80] extensionItemWithAppleIDAuthenticationContext:self];
  int64_t v14 = (void *)MEMORY[0x1E4F28DB0];
  v23[0] = v13;
  __int16 v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
  BOOL v16 = [v14 archivedDataWithRootObject:v15 requiringSecureCoding:1 error:0];

  [v5 setObject:@"com.apple.AuthKitUI.AKSecondFactorEntryAlert" forKeyedSubscript:*MEMORY[0x1E4FA7348]];
  [v5 setObject:v16 forKeyedSubscript:*MEMORY[0x1E4FA7350]];
  [v5 setObject:v10 forKeyedSubscript:*MEMORY[0x1E4FA7328]];
  int v17 = [(AKAppleIDAuthenticationContext *)self _secondFactorQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__AKAppleIDAuthenticationContext_presentSecondFactorUIWithCompletion___block_invoke;
  block[3] = &unk_1E5761C08;
  id v21 = v5;
  id v22 = v4;
  block[4] = self;
  id v18 = v5;
  id v19 = v4;
  dispatch_async(v17, block);
}

void __70__AKAppleIDAuthenticationContext_presentSecondFactorUIWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x1996FE880](*(void *)(a1 + 48));
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 72);
  *(void *)(v3 + 72) = v2;

  [*(id *)(a1 + 32) _startListeningForSecondFactorCodeEntryNotification];
  *(void *)(*(void *)(a1 + 32) + 64) = AKUserNotificationCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0.0, 0, 0, *(CFDictionaryRef *)(a1 + 40));
  uint64_t v5 = *(void *)(a1 + 32);
  if (*(void *)(v5 + 64))
  {
    uint64_t v6 = dispatch_get_global_queue(25, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __70__AKAppleIDAuthenticationContext_presentSecondFactorUIWithCompletion___block_invoke_2;
    block[3] = &unk_1E575EA70;
    block[4] = v5;
    dispatch_async(v6, block);
  }
  else
  {
    uint64_t v7 = *(void *)(v5 + 72);
    id v8 = objc_msgSend(MEMORY[0x1E4F28C58], "ak_errorWithCode:", -7013);
    (*(void (**)(uint64_t, void, void *))(v7 + 16))(v7, 0, v8);

    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = *(void **)(v9 + 72);
    *(void *)(v9 + 72) = 0;
  }
}

void __70__AKAppleIDAuthenticationContext_presentSecondFactorUIWithCompletion___block_invoke_2(uint64_t a1)
{
  CFOptionFlags responseFlags = 0;
  CFUserNotificationReceiveResponse(*(CFUserNotificationRef *)(*(void *)(a1 + 32) + 64), 0.0, &responseFlags);
  uint64_t v2 = AKUserNotificationResponseAction(responseFlags);
  uint64_t v3 = [*(id *)(a1 + 32) _secondFactorQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__AKAppleIDAuthenticationContext_presentSecondFactorUIWithCompletion___block_invoke_3;
  block[3] = &unk_1E5762528;
  block[4] = *(void *)(a1 + 32);
  void block[5] = v2;
  dispatch_async(v3, block);
}

void __70__AKAppleIDAuthenticationContext_presentSecondFactorUIWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = v2[9];
  if (v3)
  {
    unint64_t v4 = *(void *)(a1 + 40);
    if (v4 > 3) {
      uint64_t v5 = -7013;
    }
    else {
      uint64_t v5 = qword_19356DBB8[v4];
    }
    uint64_t v6 = objc_msgSend(MEMORY[0x1E4F28C58], "ak_errorWithCode:", v5);
    (*(void (**)(uint64_t, void, void *))(v3 + 16))(v3, 0, v6);

    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = *(void **)(v7 + 72);
    *(void *)(v7 + 72) = 0;

    uint64_t v2 = *(void **)(a1 + 32);
  }
  [v2 _stopListeningForSecondFactorCodeEntryNotification];
  CFRelease(*(CFTypeRef *)(*(void *)(a1 + 32) + 64));
  *(void *)(*(void *)(a1 + 32) + 64) = 0;
}

- (void)dismissSecondFactorUIWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(AKAppleIDAuthenticationContext *)self _secondFactorQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __70__AKAppleIDAuthenticationContext_dismissSecondFactorUIWithCompletion___block_invoke;
  v7[3] = &unk_1E57608A0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __70__AKAppleIDAuthenticationContext_dismissSecondFactorUIWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 64);
  uint64_t v3 = _AKLogSystem();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_193494000, v3, OS_LOG_TYPE_DEFAULT, "Canceling second-factor entry prompt.", buf, 2u);
    }

    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(v5 + 72);
    *(void *)(v5 + 72) = 0;

    CFUserNotificationCancel(*(CFUserNotificationRef *)(*(void *)(a1 + 32) + 64));
  }
  else
  {
    if (v4)
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_193494000, v3, OS_LOG_TYPE_DEFAULT, "Nothing to dismiss right now.", v8, 2u);
    }
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)presentSecondFactorAlertWithError:(id)a3 title:(id)a4 message:(id)a5 completion:(id)a6
{
  id v21 = a6;
  id v8 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v9 = a5;
  id v10 = a4;
  id v11 = objc_alloc_init(v8);
  uint64_t v12 = +[AKAlertHandler sharedInstance];
  id v13 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AuthKit"];
  int64_t v14 = [v13 localizedStringForKey:@"WRONG_LOGIN_CODE_TRY_AGAIN_BUTTON" value:&stru_1EE40D360 table:@"Localizable"];
  __int16 v15 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AuthKit"];
  BOOL v16 = [v15 localizedStringForKey:@"WRONG_LOGIN_CODE_ALERT_CANCEL_BUTTON" value:&stru_1EE40D360 table:@"Localizable"];
  int v17 = [(id)v12 notificationDictionaryWithTitle:v10 message:v9 defaultButton:v14 alternateButton:v16];

  id v18 = +[AKAlertHandler sharedInstance];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __93__AKAppleIDAuthenticationContext_presentSecondFactorAlertWithError_title_message_completion___block_invoke;
  v25[3] = &unk_1E57608A0;
  v25[4] = self;
  id v26 = v21;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  void v23[2] = __93__AKAppleIDAuthenticationContext_presentSecondFactorAlertWithError_title_message_completion___block_invoke_2;
  v23[3] = &unk_1E5760FC8;
  id v19 = v26;
  id v24 = v19;
  LOBYTE(v12) = [v18 showAlert:v17 primaryAction:v25 altAction:v23];

  if ((v12 & 1) == 0)
  {
    char v20 = objc_msgSend(MEMORY[0x1E4F28C58], "ak_errorWithCode:", -7013);
    (*((void (**)(id, void, void *))v19 + 2))(v19, 0, v20);
  }
}

uint64_t __93__AKAppleIDAuthenticationContext_presentSecondFactorAlertWithError_title_message_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) presentSecondFactorUIWithCompletion:*(void *)(a1 + 40)];
}

void __93__AKAppleIDAuthenticationContext_presentSecondFactorAlertWithError_title_message_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E4F28C58], "ak_errorWithCode:", -7003);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

- (void)_startListeningForSecondFactorCodeEntryNotification
{
  uint64_t v3 = _AKLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_193494000, v3, OS_LOG_TYPE_DEFAULT, "Listening for code entry notification...", v5, 2u);
  }

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)__AKAppleIDLoginCodeWasEntered, @"com.apple.ak.code.entered", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

- (void)_stopListeningForSecondFactorCodeEntryNotification
{
  uint64_t v3 = _AKLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_193494000, v3, OS_LOG_TYPE_DEFAULT, "No longer listening for code entry notification.", v5, 2u);
  }

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.ak.code.entered", 0);
}

- (void)_handleSecondFactorCodeEntry
{
  uint64_t v3 = [(AKAppleIDAuthenticationContext *)self _secondFactorQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__AKAppleIDAuthenticationContext__handleSecondFactorCodeEntry__block_invoke;
  block[3] = &unk_1E575EA70;
  block[4] = self;
  dispatch_async(v3, block);
}

void __62__AKAppleIDAuthenticationContext__handleSecondFactorCodeEntry__block_invoke(uint64_t a1)
{
  CFStringRef v2 = (const __CFString *)*MEMORY[0x1E4F1D3B8];
  uint64_t v3 = (void *)CFPreferencesCopyAppValue(@"AKTemporaryValue", (CFStringRef)*MEMORY[0x1E4F1D3B8]);
  if (v3)
  {
    CFPreferencesSetAppValue(@"AKTemporaryValue", 0, v2);
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 72);
    uint64_t v5 = _AKLogSystem();
    id v6 = v5;
    if (!v4)
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        __62__AKAppleIDAuthenticationContext__handleSecondFactorCodeEntry__block_invoke_cold_2();
      }
      goto LABEL_13;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      __62__AKAppleIDAuthenticationContext__handleSecondFactorCodeEntry__block_invoke_cold_3();
    }

    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 72);
    id v8 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v3, "integerValue"));
    (*(void (**)(uint64_t, void *, void))(v7 + 16))(v7, v8, 0);
LABEL_10:

    uint64_t v11 = *(void *)(a1 + 32);
    id v6 = *(NSObject **)(v11 + 72);
    *(void *)(v11 + 72) = 0;
LABEL_13:

    goto LABEL_14;
  }
  id v9 = _AKLogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    __62__AKAppleIDAuthenticationContext__handleSecondFactorCodeEntry__block_invoke_cold_1();
  }

  uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 72);
  if (v10)
  {
    id v8 = objc_msgSend(MEMORY[0x1E4F28C58], "ak_errorWithCode:", -7001);
    (*(void (**)(uint64_t, void, void *))(v10 + 16))(v10, 0, v8);
    goto LABEL_10;
  }
LABEL_14:
  if (*(void *)(*(void *)(a1 + 32) + 64))
  {
    uint64_t v12 = _AKLogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v13 = 0;
      _os_log_impl(&dword_193494000, v12, OS_LOG_TYPE_DEFAULT, "Closing login code prompt.", v13, 2u);
    }

    CFUserNotificationCancel(*(CFUserNotificationRef *)(*(void *)(a1 + 32) + 64));
  }
}

- (id)_secondFactorQueue
{
  secondFactorQueue = self->_secondFactorQueue;
  if (!secondFactorQueue)
  {
    uint64_t v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    uint64_t v5 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.ak.twofa", v4);
    id v6 = self->_secondFactorQueue;
    self->_secondFactorQueue = v5;

    secondFactorQueue = self->_secondFactorQueue;
  }

  return secondFactorQueue;
}

- (void)presentBiometricOrPasscodeValidationForAppleID:(id)a3 completion:(id)a4
{
  uint64_t v5 = (void *)MEMORY[0x1E4F28C58];
  id v6 = a4;
  objc_msgSend(v5, "ak_errorWithCode:", -7027);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void, id))a4 + 2))(v6, 0, v7);
}

- (NSString)username
{
  return self->_username;
}

- (BOOL)_isProxyingForApp
{
  return self->_isProxyingForApp;
}

- (void)_setProxyingForApp:(BOOL)a3
{
  self->_BOOL isProxyingForApp = a3;
}

- (NSString)_proxiedAppBundleID
{
  return self->_proxiedAppBundleID;
}

- (void)_setProxiedAppBundleID:(id)a3
{
}

- (NSUUID)_identifier
{
  return self->_identifier;
}

- (NSString)_identityToken
{
  return self->_identityToken;
}

- (void)_setIdentityToken:(id)a3
{
}

- (NSString)_remoteUIIdentityToken
{
  return self->_remoteUIIdentityToken;
}

- (void)_setRemoteUIIdentityToken:(id)a3
{
}

- (BOOL)_shouldSendIdentityTokenForRemoteUI
{
  return self->_shouldSendIdentityTokenForRemoteUI;
}

- (void)set_shouldSendIdentityTokenForRemoteUI:(BOOL)a3
{
  self->_shouldSendIdentityTokenForRemoteUI = a3;
}

- (BOOL)_shouldSendGrandSlamTokensForRemoteUI
{
  return self->_shouldSendGrandSlamTokensForRemoteUI;
}

- (void)set_shouldSendGrandSlamTokensForRemoteUI:(BOOL)a3
{
  self->_shouldSendGrandSlamTokensForRemoteUI = a3;
}

- (NSString)_passwordPromptTitle
{
  return self->_passwordPromptTitle;
}

- (void)set_passwordPromptTitle:(id)a3
{
}

- (NSString)_password
{
  return self->_password;
}

- (BOOL)_isPasswordEditable
{
  return self->_isPasswordEditable;
}

- (void)set_isPasswordEditable:(BOOL)a3
{
  self->_isPasswordEditable = a3;
}

- (NSString)_shortLivedToken
{
  return self->_shortLivedToken;
}

- (void)_setShortLivedToken:(id)a3
{
}

- (NSString)_message
{
  return self->_message;
}

- (void)_setMessage:(id)a3
{
}

- (BOOL)_shouldSkipInitialReachabilityCheck
{
  return self->_shouldSkipInitialReachabilityCheck;
}

- (void)set_shouldSkipInitialReachabilityCheck:(BOOL)a3
{
  self->_shouldSkipInitialReachabilityCheck = a3;
}

- (unint64_t)_attemptIndex
{
  return self->_attemptIndex;
}

- (void)set_attemptIndex:(unint64_t)a3
{
  self->_unint64_t attemptIndex = a3;
}

- (AKAnisetteData)companionDeviceAnisetteData
{
  return self->_companionDeviceAnisetteData;
}

- (void)setCompanionDeviceAnisetteData:(id)a3
{
}

- (AKAnisetteData)proxiedDeviceAnisetteData
{
  return self->_proxiedDeviceAnisetteData;
}

- (void)setProxiedDeviceAnisetteData:(id)a3
{
}

- (NSString)_masterKey
{
  return self->_masterKey;
}

- (void)_setMasterKey:(id)a3
{
}

- (BOOL)_performUIOutOfProcess
{
  return self->_performUIOutOfProcess;
}

- (void)set_performUIOutOfProcess:(BOOL)a3
{
  self->_performUIOutOfProcess = a3;
}

- (BOOL)_keepAlive
{
  return self->_keepAlive;
}

- (void)set_keepAlive:(BOOL)a3
{
  self->_keepAlive = a3;
}

- (BOOL)_isForcedEligibleForForegroundAuthentication
{
  return self->_forceEligibleForForegroundAuthentication;
}

- (void)set_forceEligibleForForegroundAuthentication:(BOOL)a3
{
  self->_forceEligibleForForegroundAuthentication = a3;
}

- (BOOL)_shouldBroadcastForProximityAuthOnly
{
  return self->_shouldBroadcastForProximityAuthOnly;
}

- (void)set_shouldBroadcastForProximityAuthOnly:(BOOL)a3
{
  self->_shouldBroadcastForProximityAuthOnly = a3;
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (void)setAltDSID:(id)a3
{
}

- (int64_t)serviceType
{
  return self->_serviceType;
}

- (void)setServiceType:(int64_t)a3
{
  self->_int64_t serviceType = a3;
}

- (unint64_t)authenticationType
{
  return self->_authenticationType;
}

- (void)setAuthenticationType:(unint64_t)a3
{
  self->_authenticationType = a3;
}

- (unint64_t)authenticationMode
{
  return self->_authenticationMode;
}

- (void)setAuthenticationMode:(unint64_t)a3
{
  self->_authenticationMode = a3;
}

- (BOOL)isMDMInformationRequired
{
  return self->_isMDMInformationRequired;
}

- (void)setIsMDMInformationRequired:(BOOL)a3
{
  self->_BOOL isMDMInformationRequired = a3;
}

- (NSString)_proxiedAppName
{
  return self->_proxiedAppName;
}

- (void)_setProxiedAppName:(id)a3
{
}

- (NSDictionary)appProvidedData
{
  return self->_appProvidedData;
}

- (void)setAppProvidedData:(id)a3
{
}

- (NSString)appProvidedContext
{
  return self->_appProvidedContext;
}

- (void)setAppProvidedContext:(id)a3
{
}

- (BOOL)cliMode
{
  return self->_cliMode;
}

- (void)setCliMode:(BOOL)a3
{
  self->_cliMode = a3;
}

- (NSString)passwordlessToken
{
  return self->_passwordlessToken;
}

- (void)setPasswordlessToken:(id)a3
{
}

- (NSString)idmsDataToken
{
  return self->_idmsDataToken;
}

- (void)setIdmsDataToken:(id)a3
{
}

- (BOOL)isNativeTakeover
{
  return self->_isNativeTakeover;
}

- (void)setIsNativeTakeover:(BOOL)a3
{
  self->_isNativeTakeover = a3;
}

- (BOOL)ignorePasswordCache
{
  return self->_ignorePasswordCache;
}

- (void)setIgnorePasswordCache:(BOOL)a3
{
  self->_ignorePasswordCache = a3;
}

- (BOOL)_ignoreShouldContinueProxy
{
  return self->_ignoreShouldContinueProxy;
}

- (void)set_ignoreShouldContinueProxy:(BOOL)a3
{
  self->_ignoreShouldContinueProxy = a3;
}

- (BOOL)isRequestedFromOOPViewService
{
  return self->_isRequestedFromOOPViewService;
}

- (void)setIsRequestedFromOOPViewService:(BOOL)a3
{
  self->_isRequestedFromOOPViewService = a3;
}

- (NSString)telemetryDeviceSessionID
{
  return self->_telemetryDeviceSessionID;
}

- (void)setTelemetryDeviceSessionID:(id)a3
{
}

- (NSString)telemetryFlowID
{
  return self->_telemetryFlowID;
}

- (void)setTelemetryFlowID:(id)a3
{
}

- (AKCompanionKeyEnvelope)companionKeyEnvelope
{
  return self->_companionKeyEnvelope;
}

- (void)setCompanionKeyEnvelope:(id)a3
{
}

- (BOOL)piggybackingForTrustedDevice
{
  return self->_piggybackingForTrustedDevice;
}

- (void)setPiggybackingForTrustedDevice:(BOOL)a3
{
  self->_piggybackingForTrustedDevice = a3;
}

- (BOOL)isUsernameEditable
{
  return self->_isUsernameEditable;
}

- (void)setIsUsernameEditable:(BOOL)a3
{
  self->_BOOL isUsernameEditable = a3;
}

- (BOOL)shouldAllowAppleIDCreation
{
  return self->_shouldAllowAppleIDCreation;
}

- (void)setShouldAllowAppleIDCreation:(BOOL)a3
{
  self->_shouldAllowAppleIDCreation = a3;
}

- (BOOL)needsCredentialRecovery
{
  return self->_needsCredentialRecovery;
}

- (void)setNeedsCredentialRecovery:(BOOL)a3
{
  self->_needsCredentialRecovery = a3;
}

- (BOOL)needsNewAppleID
{
  return self->_needsNewAppleID;
}

- (void)setNeedsNewAppleID:(BOOL)a3
{
  self->_needsNewAppleID = a3;
}

- (BOOL)needsPasswordChange
{
  return self->_needsPasswordChange;
}

- (void)setNeedsPasswordChange:(BOOL)a3
{
  self->_needsPasswordChange = a3;
}

- (BOOL)isTriggeredByNotification
{
  return self->_isTriggeredByNotification;
}

- (void)setTriggeredByNotification:(BOOL)a3
{
  self->_BOOL isTriggeredByNotification = a3;
}

- (NSString)reason
{
  return self->_reason;
}

- (NSString)defaultButtonString
{
  return self->_defaultButtonString;
}

- (void)setDefaultButtonString:(id)a3
{
}

- (int64_t)maximumLoginAttempts
{
  return self->_maximumLoginAttempts;
}

- (void)setMaximumLoginAttempts:(int64_t)a3
{
  self->_maximumLoginAttempts = a3;
}

- (NSArray)serviceIdentifiers
{
  return self->_serviceIdentifiers;
}

- (void)setServiceIdentifiers:(id)a3
{
}

- (BOOL)isEphemeral
{
  return self->_isEphemeral;
}

- (void)setIsEphemeral:(BOOL)a3
{
  self->_BOOL isEphemeral = a3;
}

- (NSString)DSID
{
  return self->_DSID;
}

- (void)setDSID:(id)a3
{
}

- (NSDictionary)httpHeadersForRemoteUI
{
  return self->_httpHeadersForRemoteUI;
}

- (void)setHttpHeadersForRemoteUI:(id)a3
{
}

- (id)clientInfo
{
  return self->_clientInfo;
}

- (void)setClientInfo:(id)a3
{
}

- (BOOL)shouldOfferSecurityUpgrade
{
  return self->_shouldOfferSecurityUpgrade;
}

- (void)setShouldOfferSecurityUpgrade:(BOOL)a3
{
  self->_BOOL shouldOfferSecurityUpgrade = a3;
}

- (BOOL)needsRepair
{
  return self->_needsRepair;
}

- (void)setNeedsRepair:(BOOL)a3
{
  self->_needsRepair = a3;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)helpAnchor
{
  return self->_helpAnchor;
}

- (void)setHelpAnchor:(id)a3
{
}

- (NSString)helpBook
{
  return self->_helpBook;
}

- (void)setHelpBook:(id)a3
{
}

- (int64_t)authenticationPromptStyle
{
  return self->_authenticationPromptStyle;
}

- (void)setAuthenticationPromptStyle:(int64_t)a3
{
  self->_authenticationPromptStyle = a3;
}

- (NSString)cancelButtonString
{
  return self->_cancelButtonString;
}

- (void)setCancelButtonString:(id)a3
{
}

- (NSString)alternativeButtonString
{
  return self->_alternativeButtonString;
}

- (void)setAlternativeButtonString:(id)a3
{
}

- (BOOL)hideAlternativeButton
{
  return self->_hideAlternativeButton;
}

- (void)setHideAlternativeButton:(BOOL)a3
{
  self->_hideAlternativeButton = a3;
}

- (BOOL)hideCancelButton
{
  return self->_hideCancelButton;
}

- (void)setHideCancelButton:(BOOL)a3
{
  self->_hideCancelButton = a3;
}

- (BOOL)hideReasonString
{
  return self->_hideReasonString;
}

- (void)setHideReasonString:(BOOL)a3
{
  self->_hideReasonString = a3;
}

- (BOOL)clientShouldHandleAlternativeButtonAction
{
  return self->_clientShouldHandleAlternativeButtonAction;
}

- (void)setClientShouldHandleAlternativeButtonAction:(BOOL)a3
{
  self->_clientShouldHandleAlternativeButtonAction = a3;
}

- (NSString)windowTitle
{
  return self->_windowTitle;
}

- (void)setWindowTitle:(id)a3
{
}

- (BOOL)alwaysShowUsernameField
{
  return self->_alwaysShowUsernameField;
}

- (void)setAlwaysShowUsernameField:(BOOL)a3
{
  self->_alwaysShowUsernameField = a3;
}

- (NSString)privacyBundleIdentifier
{
  return self->_privacyBundleIdentifier;
}

- (void)setPrivacyBundleIdentifier:(id)a3
{
}

- (BOOL)disableProximityAuth
{
  return self->_disableProximityAuth;
}

- (void)setDisableProximityAuth:(BOOL)a3
{
  self->_disableProximityAuth = a3;
}

- (id)proximityAIDAHandler
{
  return self->_proximityAIDAHandler;
}

- (void)setProximityAIDAHandler:(id)a3
{
  self->_proximityAIDAHandler = a3;
}

- (NSData)displayImageData
{
  return self->_displayImageData;
}

- (void)setDisplayImageData:(id)a3
{
}

- (BOOL)deviceRegionRequired
{
  return self->_deviceRegionRequired;
}

- (void)setDeviceRegionRequired:(BOOL)a3
{
  self->_deviceRegionRequired = a3;
}

- (BOOL)isPasscodeOnlyPolicy
{
  return self->_passcodeOnlyPolicy;
}

- (void)setPasscodeOnlyPolicy:(BOOL)a3
{
  self->_passcodeOnlyPolicy = a3;
}

- (unint64_t)securityCode
{
  return self->_securityCode;
}

- (void)setSecurityCode:(unint64_t)a3
{
  self->_securityCode = a3;
}

- (BOOL)shouldPromptForPasswordOnly
{
  return self->_shouldPromptForPasswordOnly;
}

- (void)setShouldPromptForPasswordOnly:(BOOL)a3
{
  self->_BOOL shouldPromptForPasswordOnly = a3;
}

- (BOOL)shouldUpdatePersistentServiceTokens
{
  return self->_shouldUpdatePersistentServiceTokens;
}

- (void)setShouldUpdatePersistentServiceTokens:(BOOL)a3
{
  self->_BOOL shouldUpdatePersistentServiceTokens = a3;
}

- (AKAnisetteServiceProtocol)anisetteDataProvider
{
  return self->_anisetteDataProvider;
}

- (void)setAnisetteDataProvider:(id)a3
{
}

- (NSNumber)isAppleIDLoginEnabled
{
  return self->_isAppleIDLoginEnabled;
}

- (void)setAppleIDLoginEnabled:(id)a3
{
}

- (NSNumber)hasEmptyPassword
{
  return self->_hasEmptyPassword;
}

- (void)setHasEmptyPassword:(id)a3
{
}

- (BOOL)shouldRequestRecoveryPET
{
  return self->_shouldRequestRecoveryPET;
}

- (void)setShouldRequestRecoveryPET:(BOOL)a3
{
  self->_shouldRequestRecoveryPET = a3;
}

- (BOOL)shouldRequestShortLivedToken
{
  return self->_shouldRequestShortLivedToken;
}

- (void)setShouldRequestShortLivedToken:(BOOL)a3
{
  self->_BOOL shouldRequestShortLivedToken = a3;
}

- (BOOL)shouldRequestConfigurationInfo
{
  return self->_shouldRequestConfigurationInfo;
}

- (void)setShouldRequestConfigurationInfo:(BOOL)a3
{
  self->_shouldRequestConfigurationInfo = a3;
}

- (BOOL)supportsPiggybacking
{
  return self->_supportsPiggybacking;
}

- (void)setSupportsPiggybacking:(BOOL)a3
{
  self->_supportsPiggybacking = a3;
}

- (BOOL)anticipateEscrowAttempt
{
  return self->_anticipateEscrowAttempt;
}

- (void)setAnticipateEscrowAttempt:(BOOL)a3
{
  self->_anticipateEscrowAttempt = a3;
}

- (NSSet)desiredInternalTokens
{
  return self->_desiredInternalTokens;
}

- (void)setDesiredInternalTokens:(id)a3
{
}

- (BOOL)isFirstTimeLogin
{
  return self->_isFirstTimeLogin;
}

- (void)setFirstTimeLogin:(BOOL)a3
{
  self->_isFirstTimeLogin = a3;
}

- (BOOL)shouldSkipSettingsLaunchAlert
{
  return self->_shouldSkipSettingsLaunchAlert;
}

- (void)setShouldSkipSettingsLaunchAlert:(BOOL)a3
{
  self->_BOOL shouldSkipSettingsLaunchAlert = a3;
}

- (NSString)securityUpgradeContext
{
  return self->_securityUpgradeContext;
}

- (void)setSecurityUpgradeContext:(id)a3
{
}

- (BOOL)needsNewChildAccount
{
  return self->_needsNewChildAccount;
}

- (void)setNeedsNewChildAccount:(BOOL)a3
{
  self->_needsNewChildAccount = a3;
}

- (BOOL)needsSecurityUpgradeUI
{
  return self->_needsSecurityUpgradeUI;
}

- (void)setNeedsSecurityUpgradeUI:(BOOL)a3
{
  self->_needsSecurityUpgradeUI = a3;
}

- (BOOL)isRKVerification
{
  return self->_isRKVerification;
}

- (void)setIsRKVerification:(BOOL)a3
{
  self->_isRKVerification = a3;
}

- (NSString)dependentAltDSID
{
  return self->_dependentAltDSID;
}

- (void)setDependentAltDSID:(id)a3
{
}

- (NSString)cellularDataAttributionAppBundleID
{
  return self->_cellularDataAttributionAppBundleID;
}

- (void)setCellularDataAttributionAppBundleID:(id)a3
{
}

- (int64_t)verifyCredentialReason
{
  return self->_verifyCredentialReason;
}

- (void)setVerifyCredentialReason:(int64_t)a3
{
  self->_verifyCredentialReason = a3;
}

- (NSString)custodianRecoveryToken
{
  return self->_custodianRecoveryToken;
}

- (void)setCustodianRecoveryToken:(id)a3
{
}

- (NSString)callerIconBundlePath
{
  return self->_callerIconBundlePath;
}

- (void)setCallerIconBundlePath:(id)a3
{
}

- (NSString)localizedCallerName
{
  return self->_localizedCallerName;
}

- (void)setLocalizedCallerName:(id)a3
{
}

- (BOOL)enablePasscodeAuth
{
  return self->_enablePasscodeAuth;
}

- (void)setEnablePasscodeAuth:(BOOL)a3
{
  self->_enablePasscodeAuth = a3;
}

- (NSString)serviceToken
{
  return self->_serviceToken;
}

- (void)setServiceToken:(id)a3
{
}

- (NSString)proxiedAppleID
{
  return self->_proxiedAppleID;
}

- (void)setProxiedAppleID:(id)a3
{
}

- (NSString)sourceAltDSID
{
  return self->_sourceAltDSID;
}

- (void)setSourceAltDSID:(id)a3
{
}

- (BOOL)allowAuthenticationBeforeFirstUnlock
{
  return self->_allowAuthenticationBeforeFirstUnlock;
}

- (void)setAllowAuthenticationBeforeFirstUnlock:(BOOL)a3
{
  self->_allowAuthenticationBeforeFirstUnlock = a3;
}

- (NSString)displayString
{
  return self->_displayString;
}

- (void)setDisplayString:(id)a3
{
}

- (NSString)displayTitle
{
  return self->_displayTitle;
}

- (void)setDisplayTitle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayTitle, 0);
  objc_storeStrong((id *)&self->_displayString, 0);
  objc_storeStrong((id *)&self->_sourceAltDSID, 0);
  objc_storeStrong((id *)&self->_proxiedAppleID, 0);
  objc_storeStrong((id *)&self->_serviceToken, 0);
  objc_storeStrong((id *)&self->_localizedCallerName, 0);
  objc_storeStrong((id *)&self->_callerIconBundlePath, 0);
  objc_storeStrong((id *)&self->_custodianRecoveryToken, 0);
  objc_storeStrong((id *)&self->_cellularDataAttributionAppBundleID, 0);
  objc_storeStrong((id *)&self->_dependentAltDSID, 0);
  objc_storeStrong((id *)&self->_securityUpgradeContext, 0);
  objc_storeStrong((id *)&self->_desiredInternalTokens, 0);
  objc_storeStrong((id *)&self->_hasEmptyPassword, 0);
  objc_storeStrong((id *)&self->_isAppleIDLoginEnabled, 0);
  objc_storeStrong((id *)&self->_anisetteDataProvider, 0);
  objc_storeStrong((id *)&self->_displayImageData, 0);
  objc_storeStrong((id *)&self->_privacyBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_windowTitle, 0);
  objc_storeStrong((id *)&self->_alternativeButtonString, 0);
  objc_storeStrong((id *)&self->_cancelButtonString, 0);
  objc_storeStrong((id *)&self->_helpBook, 0);
  objc_storeStrong((id *)&self->_helpAnchor, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong(&self->_clientInfo, 0);
  objc_storeStrong((id *)&self->_httpHeadersForRemoteUI, 0);
  objc_storeStrong((id *)&self->_DSID, 0);
  objc_storeStrong((id *)&self->_serviceIdentifiers, 0);
  objc_storeStrong((id *)&self->_defaultButtonString, 0);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_companionKeyEnvelope, 0);
  objc_storeStrong((id *)&self->_telemetryFlowID, 0);
  objc_storeStrong((id *)&self->_telemetryDeviceSessionID, 0);
  objc_storeStrong((id *)&self->_idmsDataToken, 0);
  objc_storeStrong((id *)&self->_passwordlessToken, 0);
  objc_storeStrong((id *)&self->_appProvidedContext, 0);
  objc_storeStrong((id *)&self->_appProvidedData, 0);
  objc_storeStrong((id *)&self->_proxiedAppName, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
  objc_storeStrong((id *)&self->_masterKey, 0);
  objc_storeStrong((id *)&self->_proxiedDeviceAnisetteData, 0);
  objc_storeStrong((id *)&self->_companionDeviceAnisetteData, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_shortLivedToken, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_passwordPromptTitle, 0);
  objc_storeStrong((id *)&self->_remoteUIIdentityToken, 0);
  objc_storeStrong((id *)&self->_identityToken, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_proxiedAppBundleID, 0);
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_interpolatedReason, 0);
  objc_storeStrong((id *)&self->_companionDevice, 0);
  objc_storeStrong((id *)&self->_proxiedDevice, 0);
  objc_storeStrong((id *)&self->_secondFactorQueue, 0);
  objc_storeStrong(&self->_secondFactoryEntryCompletion, 0);
  objc_storeStrong((id *)&self->_notificationDisclaimer, 0);
  objc_storeStrong((id *)&self->_deviceEnclosureColor, 0);
  objc_storeStrong((id *)&self->_deviceColor, 0);
  objc_storeStrong((id *)&self->_deviceClass, 0);
  objc_storeStrong((id *)&self->_longitude, 0);
  objc_storeStrong((id *)&self->_latitude, 0);

  objc_storeStrong((id *)&self->_generatedCode, 0);
}

- (NSString)generatedCode
{
  return self->_generatedCode;
}

- (void)setGeneratedCode:(id)a3
{
  if (self->_generatedCode != a3)
  {
    self->_generatedCode = (NSString *)[a3 copy];
    MEMORY[0x1F41817F8]();
  }
}

- (NSNumber)latitude
{
  return self->_latitude;
}

- (void)setLatitude:(id)a3
{
  if (self->_latitude != a3)
  {
    self->_latitude = (NSNumber *)[a3 copy];
    MEMORY[0x1F41817F8]();
  }
}

- (NSNumber)longitude
{
  return self->_longitude;
}

- (void)setLongitude:(id)a3
{
  if (self->_longitude != a3)
  {
    self->_longitude = (NSNumber *)[a3 copy];
    MEMORY[0x1F41817F8]();
  }
}

- (NSString)deviceClass
{
  return self->_deviceClass;
}

- (void)setDeviceClass:(id)a3
{
  self->_deviceClass = (NSString *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (NSString)deviceColor
{
  return self->_deviceColor;
}

- (void)setDeviceColor:(id)a3
{
  self->_deviceColor = (NSString *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (NSString)deviceEnclosureColor
{
  return self->_deviceEnclosureColor;
}

- (void)setDeviceEnclosureColor:(id)a3
{
  self->_deviceEnclosureColor = (NSString *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (NSString)notificationDisclaimer
{
  return self->_notificationDisclaimer;
}

- (void)setNotificationDisclaimer:(id)a3
{
  self->_notificationDisclaimer = (NSString *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (void)_sanitizedCopy
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_7(&dword_193494000, v0, v1, "Client passed auth context with email value in altDSID property - this is an error, do not do this.", v2, v3, v4, v5, v6);
}

- (void)_updateWithValuesFromContext:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_7(&dword_193494000, v0, v1, "Cannot update auth context with nil context", v2, v3, v4, v5, v6);
}

- (void)_updateWithValuesFromContext:(os_log_t)log .cold.2(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_193494000, log, OS_LOG_TYPE_DEBUG, "%@ being updated by %@", (uint8_t *)&v3, 0x16u);
}

- (void)isContextEligibleForPasscodeAuth
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_193494000, v0, v1, "Begin passcode auth eligibility check", v2, v3, v4, v5, v6);
}

- (void)isConfiguredForTokenUpgrade
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_193494000, v0, v1, "Plt upgrade enabled, checking if plt is nonnull", v2, v3, v4, v5, v6);
}

- (void)_setPassword:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_7(&dword_193494000, v0, v1, "Client set raw password to a PET - this is an error, please do not do this.", v2, v3, v4, v5, v6);
}

- (void)_interpolatedReason
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0(&dword_193494000, v0, v1, "self.username is nil", v2, v3, v4, v5, v6);
}

- (void)presentLoginAlertWithError:title:message:completion:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_193494000, v0, v1, "Showing login error...", v2, v3, v4, v5, v6);
}

void __62__AKAppleIDAuthenticationContext__handleSecondFactorCodeEntry__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0(&dword_193494000, v0, v1, "Notified that 2FA code was entered, but code is empty!", v2, v3, v4, v5, v6);
}

void __62__AKAppleIDAuthenticationContext__handleSecondFactorCodeEntry__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0(&dword_193494000, v0, v1, "Dropping 2FA code because we are currently holding a reply block.", v2, v3, v4, v5, v6);
}

void __62__AKAppleIDAuthenticationContext__handleSecondFactorCodeEntry__block_invoke_cold_3()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_193494000, v0, v1, "Passing 2FA code to akd.", v2, v3, v4, v5, v6);
}

@end
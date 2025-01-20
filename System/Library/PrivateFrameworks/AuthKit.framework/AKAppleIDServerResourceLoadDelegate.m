@interface AKAppleIDServerResourceLoadDelegate
+ (BOOL)supportsSecureCoding;
+ (id)sharedController;
+ (unint64_t)signalFromServerResponse:(id)a3;
- (AKAnisetteData)proxiedDeviceAnisetteData;
- (AKAnisetteServiceProtocol)anisetteDataProvider;
- (AKAppleIDServerResourceLoadDelegate)initWithAltDSID:(id)a3 identityToken:(id)a4;
- (AKAppleIDServerResourceLoadDelegate)initWithCoder:(id)a3;
- (AKAttestationData)proxiedDeviceAttestationData;
- (AKDevice)proxiedDevice;
- (BOOL)_isOTCliqueStatusIn;
- (BOOL)_isResponseSuccessful:(id)a3;
- (BOOL)attachEDPToken;
- (BOOL)cliMode;
- (BOOL)isAuthenticationRequired:(id)a3;
- (BOOL)isResponseActionable:(id)a3;
- (BOOL)isResponseCompleteAndConflict:(id)a3;
- (BOOL)isResponseFinal:(id)a3;
- (BOOL)isResponseFinalForHSA2ServerFlow:(id)a3;
- (BOOL)shouldOfferSecurityUpgrade;
- (BOOL)shouldSendEphemeralAuthHeader;
- (BOOL)shouldSendICSCIntentHeader;
- (BOOL)shouldSendLocalUserHasAppleIDLoginHeader;
- (BOOL)shouldSendPhoneNumber;
- (BOOL)shouldSendSigningHeaders;
- (NSArray)loggedInServices;
- (NSArray)phoneInformation;
- (NSNumber)hasEmptyPasswordOverride;
- (NSString)altDSID;
- (NSString)appProvidedContext;
- (NSString)bagUrlKey;
- (NSString)clientAppName;
- (NSString)clientBundleID;
- (NSString)continuationToken;
- (NSString)continuityIDMSData;
- (NSString)custodianRecoveryToken;
- (NSString)dataCenterIdentifier;
- (NSString)followupItems;
- (NSString)heartbeatToken;
- (NSString)identityToken;
- (NSString)initialURLRequestKey;
- (NSString)passwordResetToken;
- (NSString)phoneNumberCertificate;
- (NSString)privateEmailBundleId;
- (NSString)privateEmailDomain;
- (NSString)proxiedAltDSID;
- (NSString)proxiedIdentityToken;
- (NSString)proxyAppName;
- (NSString)securityUpgradeContext;
- (NSString)serviceToken;
- (NSString)serviceTokenIdentifier;
- (NSString)telemetryDeviceSessionID;
- (NSString)telemetryFlowID;
- (id)_accountDSID;
- (id)_fetchApplicationNameForBundleId:(id)a3;
- (id)_proxiedProvisioningController;
- (id)_retrieveContinuationHeaders;
- (id)signingController;
- (int64_t)serviceType;
- (void)_harvestContinuationHeadersFromHeaders:(id)a3;
- (void)_signRequest:(id)a3;
- (void)_signRequestWithBAAHeaders:(id)a3;
- (void)_signWithFeatureOptInHeaders:(id)a3;
- (void)_signWithProxiedDeviceHeaders:(id)a3;
- (void)decorateWithCircleRequestContext:(id)a3;
- (void)decorateWithContext:(id)a3;
- (void)decorateWithPrivateEmailContext:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)processResponse:(id)a3;
- (void)setAltDSID:(id)a3;
- (void)setAnisetteDataProvider:(id)a3;
- (void)setAppProvidedContext:(id)a3;
- (void)setAttachEDPToken:(BOOL)a3;
- (void)setBagUrlKey:(id)a3;
- (void)setCliMode:(BOOL)a3;
- (void)setClientAppName:(id)a3;
- (void)setClientBundleID:(id)a3;
- (void)setContinuationToken:(id)a3;
- (void)setContinuityIDMSData:(id)a3;
- (void)setCustodianRecoveryToken:(id)a3;
- (void)setDataCenterIdentifier:(id)a3;
- (void)setFollowupItems:(id)a3;
- (void)setHasEmptyPasswordOverride:(id)a3;
- (void)setHeartbeatToken:(id)a3;
- (void)setIdentityToken:(id)a3;
- (void)setInitialURLRequestKey:(id)a3;
- (void)setLoggedInServices:(id)a3;
- (void)setPasswordResetToken:(id)a3;
- (void)setPhoneInformation:(id)a3;
- (void)setPhoneNumberCertificate:(id)a3;
- (void)setPrivateEmailBundleId:(id)a3;
- (void)setPrivateEmailDomain:(id)a3;
- (void)setProxiedAltDSID:(id)a3;
- (void)setProxiedDevice:(id)a3;
- (void)setProxiedDeviceAnisetteData:(id)a3;
- (void)setProxiedDeviceAttestationData:(id)a3;
- (void)setProxiedIdentityToken:(id)a3;
- (void)setProxyAppName:(id)a3;
- (void)setSecurityUpgradeContext:(id)a3;
- (void)setServiceToken:(id)a3;
- (void)setServiceTokenIdentifier:(id)a3;
- (void)setServiceType:(int64_t)a3;
- (void)setShouldOfferSecurityUpgrade:(BOOL)a3;
- (void)setShouldSendEphemeralAuthHeader:(BOOL)a3;
- (void)setShouldSendICSCIntentHeader:(BOOL)a3;
- (void)setShouldSendLocalUserHasAppleIDLoginHeader:(BOOL)a3;
- (void)setShouldSendPhoneNumber:(BOOL)a3;
- (void)setShouldSendSigningHeaders:(BOOL)a3;
- (void)setTelemetryDeviceSessionID:(id)a3;
- (void)setTelemetryFlowID:(id)a3;
- (void)signRequest:(id)a3;
- (void)signRequest:(id)a3 withCompletionHandler:(id)a4;
- (void)signRequestWithBasicHeaders:(id)a3;
- (void)signRequestWithCommonHeaders:(id)a3;
- (void)updateWithAuthResults:(id)a3;
@end

@implementation AKAppleIDServerResourceLoadDelegate

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)sharedController
{
  if (sharedController_onceToken != -1) {
    dispatch_once(&sharedController_onceToken, &__block_literal_global_25);
  }
  v2 = (void *)sharedController_controller;

  return v2;
}

uint64_t __55__AKAppleIDServerResourceLoadDelegate_sharedController__block_invoke()
{
  sharedController_controller = objc_alloc_init(AKAppleIDAuthenticationController);

  return MEMORY[0x1F41817F8]();
}

- (AKAppleIDServerResourceLoadDelegate)initWithCoder:(id)a3
{
  id v4 = a3;
  v67.receiver = self;
  v67.super_class = (Class)AKAppleIDServerResourceLoadDelegate;
  v5 = [(AKAppleIDServerResourceLoadDelegate *)&v67 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_altDSID"];
    altDSID = v5->_altDSID;
    v5->_altDSID = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_identityToken"];
    identityToken = v5->_identityToken;
    v5->_identityToken = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_heartbeatToken"];
    heartbeatToken = v5->_heartbeatToken;
    v5->_heartbeatToken = (NSString *)v10;

    v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_shouldSendSigningHeaders"];
    v5->_shouldSendSigningHeaders = [v12 BOOLValue];

    v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_shouldSendEphemeralAuthHeader"];
    v5->_shouldSendEphemeralAuthHeader = [v13 BOOLValue];

    v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_serviceType"];
    v5->_serviceType = [v14 integerValue];

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_continuationToken"];
    continuationToken = v5->_continuationToken;
    v5->_continuationToken = (NSString *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_passwordResetToken"];
    passwordResetToken = v5->_passwordResetToken;
    v5->_passwordResetToken = (NSString *)v17;

    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_serviceToken"];
    serviceToken = v5->_serviceToken;
    v5->_serviceToken = (NSString *)v19;

    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_serviceTokenIdentifier"];
    serviceTokenIdentifier = v5->_serviceTokenIdentifier;
    v5->_serviceTokenIdentifier = (NSString *)v21;

    uint64_t v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_proxiedDeviceAnisetteData"];
    proxiedDeviceAnisetteData = v5->_proxiedDeviceAnisetteData;
    v5->_proxiedDeviceAnisetteData = (AKAnisetteData *)v23;

    uint64_t v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_proxiedDevice"];
    proxiedDevice = v5->_proxiedDevice;
    v5->_proxiedDevice = (AKDevice *)v25;

    uint64_t v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_proxyAppName"];
    proxyAppName = v5->_proxyAppName;
    v5->_proxyAppName = (NSString *)v27;

    uint64_t v29 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_clientAppName"];
    clientAppName = v5->_clientAppName;
    v5->_clientAppName = (NSString *)v29;

    uint64_t v31 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_clientBundleID"];
    clientBundleID = v5->_clientBundleID;
    v5->_clientBundleID = (NSString *)v31;

    v33 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_shouldSendLocalUserHasAppleIDLoginHeader"];
    v5->_shouldSendLocalUserHasAppleIDLoginHeader = [v33 BOOLValue];

    v5->_shouldSendICSCIntentHeader = [v4 decodeBoolForKey:@"_shouldSendICSCIntentHeader"];
    v34 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v35 = objc_opt_class();
    v36 = objc_msgSend(v34, "setWithObjects:", v35, objc_opt_class(), 0);
    uint64_t v37 = [v4 decodeObjectOfClasses:v36 forKey:@"_loggedInServices"];
    loggedInServices = v5->_loggedInServices;
    v5->_loggedInServices = (NSArray *)v37;

    uint64_t v39 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_hasEmptyPasswordOverride"];
    hasEmptyPasswordOverride = v5->_hasEmptyPasswordOverride;
    v5->_hasEmptyPasswordOverride = (NSNumber *)v39;

    uint64_t v41 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_securityUpgradeContext"];
    securityUpgradeContext = v5->_securityUpgradeContext;
    v5->_securityUpgradeContext = (NSString *)v41;

    v5->_shouldOfferSecurityUpgrade = [v4 decodeBoolForKey:@"_shouldOfferSecurityUpgrade"];
    v5->_shouldSendPhoneNumber = [v4 decodeBoolForKey:@"_shouldSendPhoneNumber"];
    uint64_t v43 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_phoneNumberCertificate"];
    phoneNumberCertificate = v5->_phoneNumberCertificate;
    v5->_phoneNumberCertificate = (NSString *)v43;

    v45 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v46 = objc_opt_class();
    uint64_t v47 = objc_opt_class();
    uint64_t v48 = objc_opt_class();
    v49 = objc_msgSend(v45, "setWithObjects:", v46, v47, v48, objc_opt_class(), 0);
    uint64_t v50 = [v4 decodeObjectOfClasses:v49 forKey:@"_phoneInformation"];
    phoneInformation = v5->_phoneInformation;
    v5->_phoneInformation = (NSArray *)v50;

    uint64_t v52 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_followupItems"];
    followupItems = v5->_followupItems;
    v5->_followupItems = (NSString *)v52;

    uint64_t v54 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_appProvidedContext"];
    appProvidedContext = v5->_appProvidedContext;
    v5->_appProvidedContext = (NSString *)v54;

    uint64_t v56 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_proxiedAltDSID"];
    proxiedAltDSID = v5->_proxiedAltDSID;
    v5->_proxiedAltDSID = (NSString *)v56;

    uint64_t v58 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_proxiedIdentityToken"];
    proxiedIdentityToken = v5->_proxiedIdentityToken;
    v5->_proxiedIdentityToken = (NSString *)v58;

    uint64_t v60 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_custodianRecoveryToken"];
    custodianRecoveryToken = v5->_custodianRecoveryToken;
    v5->_custodianRecoveryToken = (NSString *)v60;

    uint64_t v62 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_telemetryDeviceSessionID"];
    telemetryDeviceSessionID = v5->_telemetryDeviceSessionID;
    v5->_telemetryDeviceSessionID = (NSString *)v62;

    uint64_t v64 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_telemetryFlowID"];
    telemetryFlowID = v5->_telemetryFlowID;
    v5->_telemetryFlowID = (NSString *)v64;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  altDSID = self->_altDSID;
  id v9 = a3;
  [v9 encodeObject:altDSID forKey:@"_altDSID"];
  [v9 encodeObject:self->_identityToken forKey:@"_identityToken"];
  [v9 encodeObject:self->_heartbeatToken forKey:@"_heartbeatToken"];
  v5 = [NSNumber numberWithBool:self->_shouldSendSigningHeaders];
  [v9 encodeObject:v5 forKey:@"_shouldSendSigningHeaders"];

  uint64_t v6 = [NSNumber numberWithBool:self->_shouldSendEphemeralAuthHeader];
  [v9 encodeObject:v6 forKey:@"_shouldSendEphemeralAuthHeader"];

  v7 = [NSNumber numberWithInteger:self->_serviceType];
  [v9 encodeObject:v7 forKey:@"_serviceType"];

  [v9 encodeObject:self->_passwordResetToken forKey:@"_passwordResetToken"];
  [v9 encodeObject:self->_continuationToken forKey:@"_continuationToken"];
  [v9 encodeObject:self->_serviceToken forKey:@"_serviceToken"];
  [v9 encodeObject:self->_serviceTokenIdentifier forKey:@"_serviceTokenIdentifier"];
  [v9 encodeObject:self->_proxiedDevice forKey:@"_proxiedDevice"];
  [v9 encodeObject:self->_proxiedDeviceAnisetteData forKey:@"_proxiedDeviceAnisetteData"];
  [v9 encodeObject:self->_proxyAppName forKey:@"_proxyAppName"];
  [v9 encodeObject:self->_clientAppName forKey:@"_clientAppName"];
  [v9 encodeObject:self->_clientBundleID forKey:@"_clientBundleID"];
  uint64_t v8 = [NSNumber numberWithBool:self->_shouldSendLocalUserHasAppleIDLoginHeader];
  [v9 encodeObject:v8 forKey:@"_shouldSendLocalUserHasAppleIDLoginHeader"];

  [v9 encodeBool:self->_shouldSendICSCIntentHeader forKey:@"_shouldSendICSCIntentHeader"];
  [v9 encodeObject:self->_loggedInServices forKey:@"_loggedInServices"];
  [v9 encodeObject:self->_hasEmptyPasswordOverride forKey:@"_hasEmptyPasswordOverride"];
  [v9 encodeObject:self->_securityUpgradeContext forKey:@"_securityUpgradeContext"];
  [v9 encodeBool:self->_shouldOfferSecurityUpgrade forKey:@"_shouldOfferSecurityUpgrade"];
  [v9 encodeBool:self->_shouldSendPhoneNumber forKey:@"_shouldSendPhoneNumber"];
  [v9 encodeObject:self->_phoneNumberCertificate forKey:@"_phoneNumberCertificate"];
  [v9 encodeObject:self->_phoneInformation forKey:@"_phoneInformation"];
  [v9 encodeObject:self->_followupItems forKey:@"_followupItems"];
  [v9 encodeObject:self->_appProvidedContext forKey:@"_appProvidedContext"];
  [v9 encodeObject:self->_proxiedAltDSID forKey:@"_proxiedAltDSID"];
  [v9 encodeObject:self->_proxiedIdentityToken forKey:@"_proxiedIdentityToken"];
  [v9 encodeObject:self->_custodianRecoveryToken forKey:@"_custodianRecoveryToken"];
  [v9 encodeObject:self->_telemetryDeviceSessionID forKey:@"_telemetryDeviceSessionID"];
  [v9 encodeObject:self->_telemetryFlowID forKey:@"_telemetryFlowID"];
}

- (AKAppleIDServerResourceLoadDelegate)initWithAltDSID:(id)a3 identityToken:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)AKAppleIDServerResourceLoadDelegate;
  uint64_t v8 = [(AKAppleIDServerResourceLoadDelegate *)&v16 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    altDSID = v8->_altDSID;
    v8->_altDSID = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    identityToken = v8->_identityToken;
    v8->_identityToken = (NSString *)v11;

    uint64_t v13 = [MEMORY[0x1E4F1CA60] dictionary];
    continuationHeaders = v8->_continuationHeaders;
    v8->_continuationHeaders = (NSDictionary *)v13;
  }
  return v8;
}

- (void)signRequest:(id)a3
{
  id v4 = a3;
  v5 = _AKLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[AKAppleIDServerResourceLoadDelegate signRequest:]();
  }

  dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __51__AKAppleIDServerResourceLoadDelegate_signRequest___block_invoke;
  v8[3] = &unk_1E5760F00;
  dispatch_semaphore_t v9 = v6;
  id v7 = v6;
  [(AKAppleIDServerResourceLoadDelegate *)self signRequest:v4 withCompletionHandler:v8];

  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
}

intptr_t __51__AKAppleIDServerResourceLoadDelegate_signRequest___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)signRequest:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(AKAppleIDServerResourceLoadDelegate *)self _signRequest:v6];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __73__AKAppleIDServerResourceLoadDelegate_signRequest_withCompletionHandler___block_invoke;
  v32[3] = &unk_1E5760F28;
  v32[4] = self;
  id v8 = v6;
  id v33 = v8;
  dispatch_semaphore_t v9 = (void *)MEMORY[0x1996FE880](v32);
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __73__AKAppleIDServerResourceLoadDelegate_signRequest_withCompletionHandler___block_invoke_132;
  v30[3] = &unk_1E5760F28;
  v30[4] = self;
  id v10 = v8;
  id v31 = v10;
  uint64_t v11 = (void *)MEMORY[0x1996FE880](v30);
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __73__AKAppleIDServerResourceLoadDelegate_signRequest_withCompletionHandler___block_invoke_135;
  v28[3] = &unk_1E5760F28;
  v28[4] = self;
  id v12 = v10;
  id v29 = v12;
  uint64_t v13 = (void *)MEMORY[0x1996FE880](v28);
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __73__AKAppleIDServerResourceLoadDelegate_signRequest_withCompletionHandler___block_invoke_138;
  v26[3] = &unk_1E5760F28;
  v26[4] = self;
  id v27 = v12;
  id v14 = v12;
  uint64_t v15 = (void *)MEMORY[0x1996FE880](v26);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __73__AKAppleIDServerResourceLoadDelegate_signRequest_withCompletionHandler___block_invoke_145;
  v21[3] = &unk_1E5761040;
  id v22 = v11;
  id v23 = v13;
  id v24 = v15;
  id v25 = v7;
  objc_super v16 = (void (*)(void *, void *))v9[2];
  id v17 = v7;
  id v18 = v15;
  id v19 = v13;
  id v20 = v11;
  v16(v9, v21);
}

void __73__AKAppleIDServerResourceLoadDelegate_signRequest_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (*(unsigned char *)(*(void *)(a1 + 32) + 46))
  {
    v5 = _AKLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      __73__AKAppleIDServerResourceLoadDelegate_signRequest_withCompletionHandler___block_invoke_cold_1();
    }

    id v6 = [*(id *)(a1 + 32) signingController];
    id v7 = *(void **)(a1 + 40);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __73__AKAppleIDServerResourceLoadDelegate_signRequest_withCompletionHandler___block_invoke_128;
    v8[3] = &unk_1E575F898;
    id v9 = v7;
    id v10 = v4;
    [v6 signingHeadersForRequest:v9 completion:v8];
  }
  else
  {
    (*((void (**)(id))v3 + 2))(v3);
  }
}

void __73__AKAppleIDServerResourceLoadDelegate_signRequest_withCompletionHandler___block_invoke_128(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __73__AKAppleIDServerResourceLoadDelegate_signRequest_withCompletionHandler___block_invoke_2;
    v7[3] = &unk_1E57605E8;
    id v8 = *(id *)(a1 + 32);
    [a2 enumerateKeysAndObjectsUsingBlock:v7];
    id v6 = v8;
  }
  else
  {
    id v6 = _AKLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __73__AKAppleIDServerResourceLoadDelegate_signRequest_withCompletionHandler___block_invoke_128_cold_1();
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __73__AKAppleIDServerResourceLoadDelegate_signRequest_withCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setValue:a3 forHTTPHeaderField:a2];
}

void __73__AKAppleIDServerResourceLoadDelegate_signRequest_withCompletionHandler___block_invoke_132(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(unsigned char **)(a1 + 32);
  if (v4[46]
    && ([v4 proxiedDevice], (id v5 = objc_claimAutoreleasedReturnValue()) != 0)
    && (uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 232), v5, !v6))
  {
    id v8 = _AKLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_193494000, v8, OS_LOG_TYPE_DEFAULT, "Attempting to fetch peer anisette", buf, 2u);
    }

    id v9 = [*(id *)(a1 + 32) _proxiedProvisioningController];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __73__AKAppleIDServerResourceLoadDelegate_signRequest_withCompletionHandler___block_invoke_133;
    v10[3] = &unk_1E5760F50;
    id v11 = *(id *)(a1 + 40);
    id v12 = v3;
    [v9 anisetteDataWithCompletion:v10];
  }
  else
  {
    id v7 = _AKLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_193494000, v7, OS_LOG_TYPE_DEFAULT, "Not attmepting to fetch peer anisette", buf, 2u);
    }

    v3[2](v3);
  }
}

void __73__AKAppleIDServerResourceLoadDelegate_signRequest_withCompletionHandler___block_invoke_133(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = _AKLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_193494000, v6, OS_LOG_TYPE_DEFAULT, "Peer anisette fetch complete", v8, 2u);
  }

  if (!v5 || a3)
  {
    id v7 = _AKLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __73__AKAppleIDServerResourceLoadDelegate_signRequest_withCompletionHandler___block_invoke_133_cold_1();
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "ak_addProxiedAnisetteHeaders:", v5);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __73__AKAppleIDServerResourceLoadDelegate_signRequest_withCompletionHandler___block_invoke_135(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 46);
  id v5 = _AKLogSystem();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (!v4)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_193494000, v5, OS_LOG_TYPE_DEFAULT, "Not sending signing headers for peer", buf, 2u);
    }

    goto LABEL_20;
  }
  if (v6)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_193494000, v5, OS_LOG_TYPE_DEFAULT, "Configuring peer signing headers", buf, 2u);
  }

  id v7 = *(void **)(a1 + 32);
  if (v7[30])
  {
LABEL_5:
    id v8 = [v7 proxiedDevice];

    if (v8)
    {
      if (*(void *)(*(void *)(a1 + 32) + 240))
      {
        id v9 = _AKLogSystem();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_193494000, v9, OS_LOG_TYPE_DEFAULT, "Looks like we already have attestation data, thanks!", buf, 2u);
        }

        objc_msgSend(*(id *)(a1 + 40), "ak_addProxiedAttestationHeaders:", *(void *)(*(void *)(a1 + 32) + 240));
      }
    }
    else
    {
      id v17 = _AKLogSystem();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_193494000, v17, OS_LOG_TYPE_DEFAULT, "No proxied device, no peer headers to attach.", buf, 2u);
      }
    }
LABEL_20:
    v3[2](v3);
    goto LABEL_21;
  }
  id v10 = [v7 proxiedDevice];

  if (!v10)
  {
    id v7 = *(void **)(a1 + 32);
    goto LABEL_5;
  }
  id v11 = _AKLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = *(void **)(a1 + 32);
    uint64_t v13 = [v12 proxiedDevice];
    uint64_t v14 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138412802;
    id v22 = v12;
    __int16 v23 = 2112;
    id v24 = v13;
    __int16 v25 = 2112;
    uint64_t v26 = v14;
    _os_log_impl(&dword_193494000, v11, OS_LOG_TYPE_DEFAULT, "%@: Fetching attestation data for proxied device (%@) with request (%@)", buf, 0x20u);
  }
  uint64_t v15 = [*(id *)(a1 + 32) _proxiedProvisioningController];
  objc_super v16 = *(void **)(a1 + 40);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __73__AKAppleIDServerResourceLoadDelegate_signRequest_withCompletionHandler___block_invoke_136;
  v18[3] = &unk_1E5760F78;
  id v19 = v16;
  id v20 = v3;
  [v15 fetchPeerAttestationDataForRequest:v19 completion:v18];

LABEL_21:
}

void __73__AKAppleIDServerResourceLoadDelegate_signRequest_withCompletionHandler___block_invoke_136(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = _AKLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [v5 attestationHeaders];
    id v9 = [v8 allKeys];
    int v11 = 138412290;
    id v12 = v9;
    _os_log_impl(&dword_193494000, v7, OS_LOG_TYPE_DEFAULT, "Peer attestation completed with results: %@", (uint8_t *)&v11, 0xCu);
  }
  if (v6)
  {
    id v10 = _AKLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __73__AKAppleIDServerResourceLoadDelegate_signRequest_withCompletionHandler___block_invoke_136_cold_1();
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "ak_addProxiedAttestationHeaders:", v5);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __73__AKAppleIDServerResourceLoadDelegate_signRequest_withCompletionHandler___block_invoke_138(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 47);
  id v5 = _AKLogSystem();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_193494000, v5, OS_LOG_TYPE_DEFAULT, "Signing request with EDP headers.", buf, 2u);
    }

    id v7 = +[AKCDPFactory contextForAltDSID:*(void *)(*(void *)(a1 + 32) + 8)];
    id v8 = +[AKCDPFactory stateControllerWithContext:v7];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __73__AKAppleIDServerResourceLoadDelegate_signRequest_withCompletionHandler___block_invoke_140;
    v9[3] = &unk_1E5760FA0;
    id v10 = *(id *)(a1 + 40);
    int v11 = v3;
    [v8 fetchEDPTokenWithCompletion:v9];
  }
  else
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_193494000, v5, OS_LOG_TYPE_DEFAULT, "Not sending EDP token as a header.", buf, 2u);
    }

    v3[2](v3);
  }
}

void __73__AKAppleIDServerResourceLoadDelegate_signRequest_withCompletionHandler___block_invoke_140(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = _AKLogSystem();
  id v8 = v7;
  if (!v5 || v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __73__AKAppleIDServerResourceLoadDelegate_signRequest_withCompletionHandler___block_invoke_140_cold_1();
    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl(&dword_193494000, v8, OS_LOG_TYPE_DEFAULT, "EDP token being attached as a header.", v10, 2u);
    }

    id v9 = [v5 componentsJoinedByString:@"-"];
    id v8 = objc_msgSend(v9, "aaf_toBase64EncodedString");

    [*(id *)(a1 + 32) setValue:v8 forHTTPHeaderField:@"X-Apple-I-RT"];
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __73__AKAppleIDServerResourceLoadDelegate_signRequest_withCompletionHandler___block_invoke_145(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __73__AKAppleIDServerResourceLoadDelegate_signRequest_withCompletionHandler___block_invoke_2_146;
  v3[3] = &unk_1E5761018;
  uint64_t v2 = *(void *)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);
}

void __73__AKAppleIDServerResourceLoadDelegate_signRequest_withCompletionHandler___block_invoke_2_146(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __73__AKAppleIDServerResourceLoadDelegate_signRequest_withCompletionHandler___block_invoke_3;
  v3[3] = &unk_1E5760FF0;
  uint64_t v2 = *(void *)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);
}

void __73__AKAppleIDServerResourceLoadDelegate_signRequest_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __73__AKAppleIDServerResourceLoadDelegate_signRequest_withCompletionHandler___block_invoke_4;
  v2[3] = &unk_1E5760FC8;
  uint64_t v1 = *(void *)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v2);
}

uint64_t __73__AKAppleIDServerResourceLoadDelegate_signRequest_withCompletionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_proxiedProvisioningController
{
  proxiedProvisioningController = self->_proxiedProvisioningController;
  if (!proxiedProvisioningController)
  {
    id v4 = [AKAnisetteProvisioningController alloc];
    id v5 = [(AKAppleIDServerResourceLoadDelegate *)self proxiedDevice];
    id v6 = [(AKAppleIDServerResourceLoadDelegate *)self anisetteDataProvider];
    id v7 = [(AKAnisetteProvisioningController *)v4 initForDevice:v5 provider:v6];
    id v8 = self->_proxiedProvisioningController;
    self->_proxiedProvisioningController = v7;

    proxiedProvisioningController = self->_proxiedProvisioningController;
  }

  return proxiedProvisioningController;
}

- (id)signingController
{
  uint64_t v2 = objc_alloc_init(AKAppleIDSigningController);

  return v2;
}

- (id)_fetchApplicationNameForBundleId:(id)a3
{
  id v3 = a3;
  id v9 = 0;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:v3 allowPlaceholder:0 error:&v9];
  id v5 = v9;
  if (v5)
  {
    id v6 = _AKLogHme();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[AKAppleIDServerResourceLoadDelegate _fetchApplicationNameForBundleId:]();
    }

    id v7 = 0;
  }
  else
  {
    id v7 = [v4 localizedName];
  }

  return v7;
}

- (void)_signRequest:(id)a3
{
  id v4 = a3;
  [(AKAppleIDServerResourceLoadDelegate *)self signRequestWithCommonHeaders:v4];
  securityUpgradeContext = self->_securityUpgradeContext;
  if (securityUpgradeContext) {
    [v4 setValue:securityUpgradeContext forHTTPHeaderField:@"X-Apple-Security-Upgrade-Context"];
  }
  objc_msgSend(v4, "ak_addAttestationDataHeaders");
  objc_msgSend(v4, "ak_addCountryHeader");
  if (OctagonIsSOSFeatureEnabled()) {
    objc_msgSend(v4, "ak_addCircleStatusHeader");
  }
  else {
    objc_msgSend(v4, "ak_addCircleStatusHeaderForCircleStatus:", -[AKAppleIDServerResourceLoadDelegate _isOTCliqueStatusIn](self, "_isOTCliqueStatusIn"));
  }
  privateEmailDomain = self->_privateEmailDomain;
  if (self->_privateEmailBundleId)
  {
    if (privateEmailDomain)
    {
      objc_msgSend(v4, "ak_addPrivateEmailDomainHeader:");
      objc_msgSend(v4, "ak_addPrivateEmailOriginHeader:", @"app");
      objc_msgSend(v4, "ak_addPrivateEmailAppBundleIdHeader:", self->_privateEmailBundleId);
      id v7 = [(AKAppleIDServerResourceLoadDelegate *)self _fetchApplicationNameForBundleId:self->_privateEmailBundleId];
      if (v7)
      {
        objc_msgSend(v4, "ak_addPrivateEmailAppNameHeader:", v7);
        id v8 = _AKLogHme();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
          -[AKAppleIDServerResourceLoadDelegate _signRequest:].cold.9();
        }
      }
      else
      {
        id v8 = _AKLogHme();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          -[AKAppleIDServerResourceLoadDelegate _signRequest:].cold.8((uint64_t)&self->_privateEmailBundleId, v8, v9, v10, v11, v12, v13, v14);
        }
      }
    }
  }
  else if (privateEmailDomain)
  {
    objc_msgSend(v4, "ak_addPrivateEmailOriginHeader:", @"safari");
    objc_msgSend(v4, "ak_addPrivateEmailDomainHeader:", self->_privateEmailDomain);
  }
  context = self->_context;
  if (context)
  {
    objc_super v16 = [(AKAppleIDAuthenticationContext *)context _identifier];
    id v17 = [v16 UUIDString];
    objc_msgSend(v4, "ak_addRequestUUIDHeader:", v17);
  }
  if (SetupAssistantLibraryCore())
  {
    BYLicenseAgreementClass = (void *)SetupAssistantLibraryCore();
    if (BYLicenseAgreementClass) {
      BYLicenseAgreementClass = getBYLicenseAgreementClass();
    }
    objc_msgSend(v4, "ak_addAcceptedSLAHeaderWithVersion:", objc_msgSend(BYLicenseAgreementClass, "versionOfAcceptedAgreement"));
  }
  [(AKAppleIDServerResourceLoadDelegate *)self _signWithProxiedDeviceHeaders:v4];
  objc_msgSend(v4, "ak_addLoggedInServicesHeaderForServices:", self->_loggedInServices);
  id v19 = +[AKAccountManager sharedInstance];
  id v20 = [(AKAppleIDServerResourceLoadDelegate *)self altDSID];
  uint64_t v21 = [v19 authKitAccountWithAltDSID:v20 error:0];

  continuationToken = self->_continuationToken;
  if (continuationToken)
  {
    __int16 v23 = continuationToken;
  }
  else
  {
    __int16 v23 = [v19 continuationTokenForAccount:v21];
  }
  id v24 = v23;
  passwordResetToken = self->_passwordResetToken;
  if (passwordResetToken)
  {
    uint64_t v26 = passwordResetToken;
  }
  else
  {
    uint64_t v26 = [v19 passwordResetTokenForAccount:v21];
  }
  uint64_t v27 = v26;
  if (v24) {
    objc_msgSend(v4, "ak_addContinutationKeyHeader:", v24);
  }
  if (v27) {
    objc_msgSend(v4, "ak_addPasswordResetKeyHeader:", v27);
  }
  hasEmptyPasswordOverride = self->_hasEmptyPasswordOverride;
  if (hasEmptyPasswordOverride)
  {
    if ([(NSNumber *)hasEmptyPasswordOverride BOOLValue]) {
      goto LABEL_34;
    }
  }
  else
  {
    id v29 = [(id)objc_opt_class() sharedController];
    id v43 = 0;
    int v30 = [v29 isDevicePasscodeProtected:&v43];
    id v31 = v43;

    if (v31)
    {
      v32 = _AKLogSystem();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
        -[AKAppleIDServerResourceLoadDelegate _signRequest:].cold.7();
      }
    }
    if (!v30)
    {
LABEL_34:
      if (!self->_shouldSendEphemeralAuthHeader) {
        goto LABEL_47;
      }
      goto LABEL_44;
    }
  }
  id v33 = _AKLogSystem();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
    -[AKAppleIDServerResourceLoadDelegate _signRequest:].cold.6();
  }

  objc_msgSend(v4, "ak_addPRKRequestHeader");
  if (self->_shouldSendEphemeralAuthHeader)
  {
LABEL_44:
    v34 = _AKLogSystem();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
      -[AKAppleIDServerResourceLoadDelegate _signRequest:].cold.5();
    }

    objc_msgSend(v4, "ak_addEphemeralAuthHeader");
    goto LABEL_47;
  }
  if (self->_shouldSendICSCIntentHeader)
  {
    v40 = _AKLogSystem();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG)) {
      -[AKAppleIDServerResourceLoadDelegate _signRequest:].cold.4();
    }

    objc_msgSend(v4, "ak_addICSCIntentHeader");
  }
LABEL_47:
  if (self->_shouldSendLocalUserHasAppleIDLoginHeader) {
    objc_msgSend(v4, "ak_addLocalUserHasAppleIDLoginHeader");
  }
  if (self->_shouldSendPhoneNumber)
  {
    if (self->_phoneInformation)
    {
      uint64_t v35 = _AKLogSystem();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG)) {
        -[AKAppleIDServerResourceLoadDelegate _signRequest:]();
      }

      objc_msgSend(v4, "ak_addPhoneInformationHeaderWithValue:", self->_phoneInformation);
    }
    v36 = _AKLogSystem();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG)) {
      -[AKAppleIDServerResourceLoadDelegate _signRequest:]();
    }

    objc_msgSend(v4, "ak_addPhoneNumberHeader");
    if (self->_phoneNumberCertificate)
    {
      uint64_t v37 = _AKLogSystem();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG)) {
        -[AKAppleIDServerResourceLoadDelegate _signRequest:]();
      }

      objc_msgSend(v4, "ak_addPhoneNumberCertificateHeaderWithValue:", self->_phoneNumberCertificate);
    }
  }
  objc_msgSend(v4, "ak_addCFUHeader:", self->_followupItems);
  v38 = [(AKAppleIDServerResourceLoadDelegate *)self _retrieveContinuationHeaders];
  if (v38)
  {
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __52__AKAppleIDServerResourceLoadDelegate__signRequest___block_invoke;
    v41[3] = &unk_1E57605E8;
    id v42 = v4;
    [v38 enumerateKeysAndObjectsUsingBlock:v41];
  }
  continuityIDMSData = self->_continuityIDMSData;
  if (continuityIDMSData) {
    [v4 setValue:continuityIDMSData forHTTPHeaderField:@"X-Apple-I-IdMS-Data"];
  }
}

void __52__AKAppleIDServerResourceLoadDelegate__signRequest___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = _AKLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v5;
    _os_log_impl(&dword_193494000, v7, OS_LOG_TYPE_DEFAULT, "Harvested continuation header added %@", (uint8_t *)&v8, 0xCu);
  }

  [*(id *)(a1 + 32) setValue:v6 forHTTPHeaderField:v5];
}

- (void)signRequestWithCommonHeaders:(id)a3
{
  id v4 = a3;
  [(AKAppleIDServerResourceLoadDelegate *)self signRequestWithBasicHeaders:v4];
  id v5 = _AKLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v15 = 0;
    _os_log_impl(&dword_193494000, v5, OS_LOG_TYPE_DEFAULT, "Signing request with common headers", v15, 2u);
  }

  if (self->_altDSID)
  {
    if (self->_serviceToken)
    {
      id v6 = _AKLogSystem();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
        -[AKAppleIDServerResourceLoadDelegate signRequestWithCommonHeaders:].cold.5();
      }

      objc_msgSend(v4, "ak_addAuthorizationHeaderWithServiceToken:forAltDSID:", self->_serviceToken, self->_altDSID);
    }
    else if (self->_identityToken)
    {
      id v7 = _AKLogSystem();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        -[AKAppleIDServerResourceLoadDelegate signRequestWithCommonHeaders:].cold.4();
      }

      objc_msgSend(v4, "ak_addAuthorizationHeaderWithIdentityToken:forAltDSID:", self->_identityToken, self->_altDSID);
    }
    if (self->_heartbeatToken)
    {
      int v8 = _AKLogSystem();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        -[AKAppleIDServerResourceLoadDelegate signRequestWithCommonHeaders:]();
      }

      objc_msgSend(v4, "ak_addAuthorizationHeaderWithHeartbeatToken:forAltDSID:", self->_heartbeatToken, self->_altDSID);
    }
    if (self->_initialURLRequestKey)
    {
      id v9 = _AKLogSystem();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        -[AKAppleIDServerResourceLoadDelegate signRequestWithCommonHeaders:]();
      }

      objc_msgSend(v4, "ak_addURLSwitchingHeaderWithURLKey:altDSID:", self->_initialURLRequestKey, self->_altDSID);
      initialURLRequestKey = self->_initialURLRequestKey;
      self->_initialURLRequestKey = 0;
    }
    if (self->_custodianRecoveryToken)
    {
      uint64_t v11 = +[AKToken tokenWithBase64String:](AKToken, "tokenWithBase64String:");
      uint64_t v12 = _AKLogSystem();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        -[AKAppleIDServerResourceLoadDelegate signRequestWithCommonHeaders:]();
      }

      uint64_t v13 = [v11 stringValue];
      objc_msgSend(v4, "ak_addAuthorizationHeaderWithCustodianRecoveryToken:forAltDSID:", v13, self->_altDSID);
    }
    objc_msgSend(v4, "ak_addOTStatusHeaderForAltDSID:", self->_altDSID);
    uint64_t v14 = [(AKAppleIDServerResourceLoadDelegate *)self _accountDSID];
    objc_msgSend(v4, "ak_addCDPStatusHeaderForDSID:", v14);
  }
  if (self->_appProvidedContext) {
    objc_msgSend(v4, "ak_addAppProvidedContext:");
  }
  objc_msgSend(v4, "ak_addOfferSecurityUpgrade:", self->_shouldOfferSecurityUpgrade);
  objc_msgSend(v4, "ak_addDeviceConfigurationModeHeaderForAuthContext:", self->_context);
  objc_msgSend(v4, "ak_addWalrusStatusHeader");
  [(AKAppleIDServerResourceLoadDelegate *)self _signWithFeatureOptInHeaders:v4];
}

- (void)signRequestWithBasicHeaders:(id)a3
{
  id v4 = a3;
  id v5 = _AKLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_193494000, v5, OS_LOG_TYPE_DEFAULT, "Signing request with basic headers", buf, 2u);
  }

  objc_msgSend(v4, "ak_addClientInfoHeader");
  objc_msgSend(v4, "ak_addDeviceUDIDHeader");
  objc_msgSend(v4, "ak_addDeviceSerialNumberHeader");
  objc_msgSend(v4, "ak_addInternalBuildHeader");
  objc_msgSend(v4, "ak_addSeedBuildHeader");
  objc_msgSend(v4, "ak_addFeatureMaskHeader");
  objc_msgSend(v4, "ak_addLocaleHeader");
  objc_msgSend(v4, "ak_addTimeZoneHeaders");
  objc_msgSend(v4, "ak_addDeviceMLBHeader");
  objc_msgSend(v4, "ak_addDeviceROMHeader");
  id v6 = +[AKDevice currentDevice];
  objc_msgSend(v4, "ak_addAppleIDUserModeHeaderWithValue:", objc_msgSend(v6, "isMultiUserMode"));

  objc_msgSend(v4, "ak_addDeviceModeHeader");
  if (+[AKDevice hasUniqueDeviceIdentifier]) {
    objc_msgSend(v4, "ak_addProvisioningUDIDHeader");
  }
  if ([(NSString *)self->_proxyAppName length]) {
    objc_msgSend(v4, "ak_addProxyApp:", self->_proxyAppName);
  }
  if (self->_serviceType) {
    objc_msgSend(v4, "ak_addContextHeaderForServiceType:");
  }
  if ([(NSString *)self->_clientAppName length]) {
    objc_msgSend(v4, "ak_addClientApp:", self->_clientAppName);
  }
  if ([(NSString *)self->_clientBundleID length]) {
    objc_msgSend(v4, "ak_addClientBundleIDHeader:", self->_clientBundleID);
  }
  id v7 = [(AKAppleIDAuthenticationContext *)self->_context _proxiedAppBundleID];
  uint64_t v8 = [v7 length];

  if (v8)
  {
    id v9 = [(AKAppleIDAuthenticationContext *)self->_context _proxiedAppBundleID];
    objc_msgSend(v4, "ak_addProxiedBundleIDHeader:", v9);
  }
  if (self->_dataCenterIdentifier)
  {
    uint64_t v10 = _AKLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[AKAppleIDServerResourceLoadDelegate signRequestWithBasicHeaders:].cold.5();
    }

    objc_msgSend(v4, "ak_addDataCenterHeaderWithIdentifier:", self->_dataCenterIdentifier);
  }
  if (self->_cliMode)
  {
    uint64_t v11 = _AKLogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[AKAppleIDServerResourceLoadDelegate signRequestWithBasicHeaders:].cold.4();
    }

    objc_msgSend(v4, "ak_addExecutionModeHeader:", 1);
  }
  context = self->_context;
  id v20 = 0;
  uint64_t v13 = [(AKAppleIDAuthenticationContext *)context authKitAccount:&v20];
  id v14 = v20;
  if (v14)
  {
    uint64_t v15 = _AKLogSystem();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[AKAppleIDServerResourceLoadDelegate signRequestWithBasicHeaders:]();
    }
  }
  objc_super v16 = +[AKAccountManager sharedInstance];
  int v17 = [v16 accountAccessTelemetryOptInForAccount:v13];

  if (v17)
  {
    if (self->_telemetryDeviceSessionID)
    {
      id v18 = _AKLogSystem();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
        -[AKAppleIDServerResourceLoadDelegate signRequestWithBasicHeaders:]();
      }

      objc_msgSend(v4, "ak_addTelemetryDeviceSessionID:", self->_telemetryDeviceSessionID);
    }
    if (self->_telemetryFlowID)
    {
      id v19 = _AKLogSystem();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
        -[AKAppleIDServerResourceLoadDelegate signRequestWithBasicHeaders:]();
      }

      objc_msgSend(v4, "ak_addTelemetryFlowID:", self->_telemetryFlowID);
    }
  }
  if (self->_serviceType) {
    objc_msgSend(v4, "ak_addServiceHeaderForServiceType:");
  }
  [(AKAppleIDServerResourceLoadDelegate *)self _signRequestWithBAAHeaders:v4];
}

- (void)_signWithProxiedDeviceHeaders:(id)a3
{
  id v12 = a3;
  id v4 = [(AKDevice *)self->_proxiedDevice serverFriendlyDescription];

  if (v4)
  {
    id v5 = [(AKDevice *)self->_proxiedDevice serverFriendlyDescription];
    objc_msgSend(v12, "ak_addProxiedClientInfoHeader:", v5);
  }
  id v6 = [(AKDevice *)self->_proxiedDevice uniqueDeviceIdentifier];

  if (v6)
  {
    id v7 = [(AKDevice *)self->_proxiedDevice uniqueDeviceIdentifier];
    objc_msgSend(v12, "ak_addProxiedDeviceUDIDHeader:", v7);
  }
  if (self->_proxiedDeviceAnisetteData) {
    objc_msgSend(v12, "ak_addProxiedAnisetteHeaders:");
  }
  uint64_t v8 = [(AKDevice *)self->_proxiedDevice locale];
  id v9 = [v8 objectForKey:*MEMORY[0x1E4F1C400]];

  if (v9) {
    objc_msgSend(v12, "ak_addProxiedDeviceCountryHeader:", v9);
  }
  uint64_t v10 = [(AKDevice *)self->_proxiedDevice serialNumber];

  if (v10)
  {
    uint64_t v11 = [(AKDevice *)self->_proxiedDevice serialNumber];
    objc_msgSend(v12, "ak_addProxiedDeviceSerialNumberHeader:", v11);
  }
  if (self->_proxiedDevice)
  {
    objc_msgSend(v12, "ak_addProxiedDevicePRKRequestHeader");
    objc_msgSend(v12, "ak_addProxiedDeviceICSCIntentHeader");
  }
  if (self->_proxiedAltDSID && self->_proxiedIdentityToken) {
    objc_msgSend(v12, "ak_addProxiedAuthorizationHeaderWithIdentityToken:forAltDSID:");
  }
}

- (void)_signWithFeatureOptInHeaders:(id)a3
{
  id v3 = a3;
  id v4 = +[AKConfiguration sharedConfiguration];
  uint64_t v5 = [v4 shouldAllowExperimentalMode];

  if (v5 == 1)
  {
    id v6 = _AKLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_193494000, v6, OS_LOG_TYPE_DEFAULT, "Signing request with Experimental Mode opt-in header", buf, 2u);
    }

    [v3 setValue:@"true" forHTTPHeaderField:@"X-Apple-I-Experiment-Mode"];
    [v3 setValue:@"true" forHTTPHeaderField:@"X-Apple-I-HSA1-Conversion"];
    [v3 setValue:@"true" forHTTPHeaderField:@"X-Apple-I-RecoveryKey-Show"];
  }
  objc_msgSend(v3, "ak_addFeatureMaskHeader");
  id v7 = +[AKConfiguration sharedConfiguration];
  uint64_t v8 = [v7 shouldEnableTestAccountMode];

  if (v8 == 1) {
    [v3 setValue:@"true" forHTTPHeaderField:@"X-Apple-I-Test-Account-Mode"];
  }
  id v9 = +[AKConfiguration sharedConfiguration];
  uint64_t v10 = [v9 shouldAddHSA2CreateHeader];

  if (v10 == 1) {
    [v3 setValue:@"HSA2" forHTTPHeaderField:@"X-Apple-AK-Auth-Type"];
  }
  uint64_t v11 = +[AKConfiguration sharedConfiguration];
  uint64_t v12 = [v11 shouldAllowPhoneNumberAccounts];

  if (v12 == 1) {
    [v3 setValue:@"phoneNumber" forHTTPHeaderField:@"X-Apple-I-Account-NameType"];
  }
  uint64_t v13 = +[AKConfiguration sharedConfiguration];
  uint64_t v14 = [v13 requestedCloudPartition];

  uint64_t v15 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", v14);
  [v3 setValue:v15 forHTTPHeaderField:@"X-Apple-Requested-Partition"];
}

- (void)_signRequestWithBAAHeaders:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_bagUrlKey)
  {
    uint64_t v5 = +[AKURLBag sharedBag];
    int v6 = [v5 isBaaEnabledForKey:self->_bagUrlKey];

    id v7 = _AKLogSystem();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v6)
    {
      if (v8)
      {
        bagUrlKey = self->_bagUrlKey;
        *(_DWORD *)buf = 138543362;
        int v17 = bagUrlKey;
        _os_log_impl(&dword_193494000, v7, OS_LOG_TYPE_DEFAULT, "Signing request with BAA headers for key - %{public}@", buf, 0xCu);
      }

      dispatch_semaphore_t v10 = dispatch_semaphore_create(0);
      id v7 = [(AKAppleIDServerResourceLoadDelegate *)self signingController];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __66__AKAppleIDServerResourceLoadDelegate__signRequestWithBAAHeaders___block_invoke;
      v13[3] = &unk_1E5761068;
      id v14 = v4;
      dispatch_semaphore_t v15 = v10;
      uint64_t v11 = v10;
      [v7 signWithBAAHeaders:v14 completion:v13];
      dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
    }
    else if (v8)
    {
      uint64_t v12 = self->_bagUrlKey;
      *(_DWORD *)buf = 138543362;
      int v17 = v12;
      _os_log_impl(&dword_193494000, v7, OS_LOG_TYPE_DEFAULT, "BAA is not enabled for URL key - %{public}@", buf, 0xCu);
    }
  }
  else
  {
    id v7 = _AKLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[AKAppleIDServerResourceLoadDelegate _signRequestWithBAAHeaders:]();
    }
  }
}

void __66__AKAppleIDServerResourceLoadDelegate__signRequestWithBAAHeaders___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = _AKLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v12 = v5;
    _os_log_impl(&dword_193494000, v7, OS_LOG_TYPE_DEFAULT, "Added additional BAA headers for request - %@", buf, 0xCu);
  }

  if (v5)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __66__AKAppleIDServerResourceLoadDelegate__signRequestWithBAAHeaders___block_invoke_157;
    v9[3] = &unk_1E57605E8;
    dispatch_semaphore_t v10 = *(id *)(a1 + 32);
    [v5 enumerateKeysAndObjectsUsingBlock:v9];
    BOOL v8 = v10;
  }
  else
  {
    BOOL v8 = _AKLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __73__AKAppleIDServerResourceLoadDelegate_signRequest_withCompletionHandler___block_invoke_128_cold_1();
    }
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

uint64_t __66__AKAppleIDServerResourceLoadDelegate__signRequestWithBAAHeaders___block_invoke_157(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setValue:a3 forHTTPHeaderField:a2];
}

- (void)processResponse:(id)a3
{
  if (a3)
  {
    id v4 = [a3 allHeaderFields];
    [(AKAppleIDServerResourceLoadDelegate *)self _harvestContinuationHeadersFromHeaders:v4];
  }
}

- (BOOL)isResponseFinal:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    BOOL v6 = ([(AKAppleIDServerResourceLoadDelegate *)self _isResponseSuccessful:v5]
       || [v5 statusCode] == 412)
      && [(id)objc_opt_class() signalFromServerResponse:v5] != 6
      && [(AKAppleIDServerResourceLoadDelegate *)self isResponseActionable:v5];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)isAuthenticationRequired:(id)a3
{
  return [a3 statusCode] == 401;
}

- (BOOL)isResponseActionable:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [(id)objc_opt_class() signalFromServerResponse:v3];

  return v4 != 0;
}

- (BOOL)isResponseFinalForHSA2ServerFlow:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 allHeaderFields];
  id v5 = [v4 objectForKeyedSubscript:@"X-Apple-AK-Auth-Type"];
  BOOL v6 = [v4 objectForKeyedSubscript:@"X-Apple-AK-Request-Auth-Type"];
  char v7 = [v5 isEqualToString:@"hsa2"];
  char v8 = [v6 isEqualToString:@"hsa2"];
  uint64_t v9 = [(id)objc_opt_class() signalFromServerResponse:v3];

  if (v6) {
    char v10 = 0;
  }
  else {
    char v10 = v7;
  }
  char v11 = v7 ^ 1;
  if (!v6) {
    char v11 = 1;
  }
  if (v9 != 3) {
    char v10 = 0;
  }
  char v12 = v10 | (v11 | v8) ^ 1;

  return v12;
}

- (BOOL)isResponseCompleteAndConflict:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 statusCode];
  uint64_t v5 = [(id)objc_opt_class() signalFromServerResponse:v3];

  return v4 == 409 && v5 == 3;
}

+ (unint64_t)signalFromServerResponse:(id)a3
{
  id v3 = [a3 allHeaderFields];
  uint64_t v4 = [v3 objectForKeyedSubscript:@"X-Apple-AK-Action"];
  uint64_t v5 = [v3 objectForKeyedSubscript:@"X-Apple-CDP-Action"];
  if ([v5 isEqualToString:@"continue"])
  {
    unint64_t v6 = 5;
  }
  else if ([v4 isEqualToString:@"complete"])
  {
    unint64_t v6 = 3;
  }
  else if ([v4 isEqualToString:@"continue"])
  {
    unint64_t v6 = 1;
  }
  else if ([v4 isEqualToString:@"cancel"])
  {
    unint64_t v6 = 2;
  }
  else if (([v4 isEqualToString:@"start-icsc"] & 1) != 0 {
         || ([v4 isEqualToString:@"mk-validation"] & 1) != 0)
  }
  {
    unint64_t v6 = 4;
  }
  else if ([v4 isEqualToString:@"read"])
  {
    unint64_t v6 = 6;
  }
  else if ([v4 isEqualToString:@"delete"])
  {
    unint64_t v6 = 7;
  }
  else if ([v4 isEqualToString:@"teardown"])
  {
    unint64_t v6 = 8;
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

- (void)decorateWithCircleRequestContext:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 authContext];
  context = self->_context;
  self->_context = v5;

  char v7 = [v4 payload];

  char v8 = [v7 altDSID];
  [(AKAppleIDAuthenticationContext *)self->_context setAltDSID:v8];

  self->_serviceType = [(AKAppleIDAuthenticationContext *)self->_context serviceType];
}

- (void)decorateWithPrivateEmailContext:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _AKLogHme();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[AKAppleIDServerResourceLoadDelegate decorateWithPrivateEmailContext:]();
  }

  unint64_t v6 = [v4 clientAppBundleId];
  [(AKAppleIDServerResourceLoadDelegate *)self setPrivateEmailBundleId:v6];

  char v7 = [v4 key];
  [(AKAppleIDServerResourceLoadDelegate *)self setPrivateEmailDomain:v7];
}

- (void)decorateWithContext:(id)a3
{
  id v38 = a3;
  objc_storeStrong((id *)&self->_context, a3);
  uint64_t v5 = [(AKAppleIDServerResourceLoadDelegate *)self altDSID];

  if (!v5)
  {
    unint64_t v6 = [v38 altDSID];
    [(AKAppleIDServerResourceLoadDelegate *)self setAltDSID:v6];
  }
  if ([v38 needsNewAppleID] & 1) != 0 || (objc_msgSend(v38, "needsNewChildAccount")) {
    goto LABEL_9;
  }
  uint64_t v7 = [v38 proxiedDevice];
  if (!v7)
  {
    if (([v38 needsSecurityUpgradeUI] & 1) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  char v8 = (void *)v7;
  uint64_t v9 = [v38 appProvidedContext];
  if (v9)
  {

LABEL_9:
    [(AKAppleIDServerResourceLoadDelegate *)self setShouldSendSigningHeaders:1];
    goto LABEL_10;
  }
  int v37 = [v38 needsSecurityUpgradeUI];

  if (v37) {
    goto LABEL_9;
  }
LABEL_10:
  if ([v38 isEphemeral]) {
    [(AKAppleIDServerResourceLoadDelegate *)self setShouldSendEphemeralAuthHeader:1];
  }
  char v10 = [v38 isAppleIDLoginEnabled];

  if (v10)
  {
    char v11 = [v38 isAppleIDLoginEnabled];
    int v12 = [v11 BOOLValue];

    if (v12) {
      [(AKAppleIDServerResourceLoadDelegate *)self setShouldSendLocalUserHasAppleIDLoginHeader:1];
    }
  }
  uint64_t v13 = [v38 custodianRecoveryToken];

  if (v13)
  {
    id v14 = [v38 custodianRecoveryToken];
    [(AKAppleIDServerResourceLoadDelegate *)self setCustodianRecoveryToken:v14];
  }
  dispatch_semaphore_t v15 = [v38 _remoteUIIdentityToken];
  uint64_t v16 = [v15 length];

  if (v16)
  {
    int v17 = [v38 _remoteUIIdentityToken];
    [(AKAppleIDServerResourceLoadDelegate *)self setIdentityToken:v17];
  }
  -[AKAppleIDServerResourceLoadDelegate setServiceType:](self, "setServiceType:", [v38 serviceType]);
  uint64_t v18 = [v38 appProvidedContext];
  [(AKAppleIDServerResourceLoadDelegate *)self setAppProvidedContext:v18];

  id v19 = [v38 _proxiedAppName];
  [(AKAppleIDServerResourceLoadDelegate *)self setProxyAppName:v19];

  [(AKAppleIDServerResourceLoadDelegate *)self setShouldSendPhoneNumber:1];
  id v20 = [v38 hasEmptyPassword];
  [(AKAppleIDServerResourceLoadDelegate *)self setHasEmptyPasswordOverride:v20];

  uint64_t v21 = [v38 securityUpgradeContext];
  [(AKAppleIDServerResourceLoadDelegate *)self setSecurityUpgradeContext:v21];

  -[AKAppleIDServerResourceLoadDelegate setShouldSendICSCIntentHeader:](self, "setShouldSendICSCIntentHeader:", [v38 anticipateEscrowAttempt]);
  -[AKAppleIDServerResourceLoadDelegate setShouldOfferSecurityUpgrade:](self, "setShouldOfferSecurityUpgrade:", [v38 shouldOfferSecurityUpgrade]);
  id v22 = +[AKFollowUpProviderFactory sharedAuthKitFollowupProvider];
  __int16 v23 = (void *)MEMORY[0x1E4F28F98];
  id v24 = [v22 pendingFollowUpItems:0];
  __int16 v25 = +[AKFollowUpServerPayloadFormatter pendingAuthKitFollowUpPayload:v24];
  uint64_t v26 = [v23 dataWithPropertyList:v25 format:100 options:0 error:0];

  uint64_t v27 = [v26 base64EncodedStringWithOptions:0];
  [(AKAppleIDServerResourceLoadDelegate *)self setFollowupItems:v27];

  v28 = [v38 proxiedDeviceAnisetteData];
  [(AKAppleIDServerResourceLoadDelegate *)self setProxiedDeviceAnisetteData:v28];

  id v29 = [v38 proxiedDevice];
  [(AKAppleIDServerResourceLoadDelegate *)self setProxiedDevice:v29];

  int v30 = [v38 authKitAccount:0];
  id v31 = +[AKAccountManager sharedInstance];
  int v32 = [v31 accountAccessTelemetryOptInForAccount:v30];

  if (v32)
  {
    id v33 = [v38 telemetryFlowID];
    [(AKAppleIDServerResourceLoadDelegate *)self setTelemetryFlowID:v33];

    v34 = +[AKAccountManager sharedInstance];
    uint64_t v35 = [v34 telemetryDeviceSessionIDForAccount:v30];

    if (v35 && ([@"device_session_id_missing" isEqualToString:v35] & 1) == 0) {
      [v38 setTelemetryDeviceSessionID:v35];
    }
    v36 = [v38 telemetryDeviceSessionID];
    [(AKAppleIDServerResourceLoadDelegate *)self setTelemetryDeviceSessionID:v36];
  }
}

- (void)updateWithAuthResults:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (self->_serviceTokenIdentifier)
  {
    unint64_t v6 = [v4 objectForKeyedSubscript:@"AKIDMSToken"];
    uint64_t v7 = [v6 objectForKeyedSubscript:self->_serviceTokenIdentifier];

    char v8 = _AKLogSystem();
    serviceToken = v8;
    if (v7)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        -[AKAppleIDServerResourceLoadDelegate updateWithAuthResults:].cold.5((uint64_t)&self->_serviceTokenIdentifier, serviceToken, v10, v11, v12, v13, v14, v15);
      }

      uint64_t v16 = [v6 objectForKeyedSubscript:self->_serviceTokenIdentifier];
      serviceToken = self->_serviceToken;
      self->_serviceToken = v16;
    }
    else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      -[AKAppleIDServerResourceLoadDelegate updateWithAuthResults:].cold.4((uint64_t)&self->_serviceTokenIdentifier, serviceToken, v17, v18, v19, v20, v21, v22);
    }
  }
  else
  {
    if (!self->_serviceToken) {
      goto LABEL_13;
    }
    unint64_t v6 = _AKLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[AKAppleIDServerResourceLoadDelegate updateWithAuthResults:]();
    }
  }

LABEL_13:
  __int16 v23 = [v5 objectForKeyedSubscript:@"AKIdentityToken"];

  id v24 = _AKLogSystem();
  __int16 v25 = v24;
  if (v23)
  {
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
      -[AKAppleIDServerResourceLoadDelegate updateWithAuthResults:]();
    }

    __int16 v25 = [v5 objectForKeyedSubscript:@"AKIdentityToken"];
    [(AKAppleIDServerResourceLoadDelegate *)self setIdentityToken:v25];
  }
  else if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    -[AKAppleIDServerResourceLoadDelegate updateWithAuthResults:]();
  }
}

- (void)_harvestContinuationHeadersFromHeaders:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = +[AKURLBag bagForAltDSID:0];
  unint64_t v6 = [v5 continuationHeaderPrefix];
  uint64_t v7 = [v6 lowercaseString];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __78__AKAppleIDServerResourceLoadDelegate__harvestContinuationHeadersFromHeaders___block_invoke;
  v13[3] = &unk_1E5761090;
  id v8 = v7;
  id v14 = v8;
  objc_msgSend(v4, "aaf_filter:", v13);
  uint64_t v9 = (NSDictionary *)objc_claimAutoreleasedReturnValue();

  continuationHeaders = self->_continuationHeaders;
  self->_continuationHeaders = v9;

  uint64_t v11 = _AKLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = [(NSDictionary *)self->_continuationHeaders allKeys];
    *(_DWORD *)buf = 138412290;
    uint64_t v16 = v12;
    _os_log_impl(&dword_193494000, v11, OS_LOG_TYPE_DEFAULT, "Harvested continuation headers %@", buf, 0xCu);
  }
}

uint64_t __78__AKAppleIDServerResourceLoadDelegate__harvestContinuationHeadersFromHeaders___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 lowercaseString];
  uint64_t v4 = [v3 hasPrefix:*(void *)(a1 + 32)];

  return v4;
}

- (id)_retrieveContinuationHeaders
{
  uint64_t v2 = (void *)[(NSDictionary *)self->_continuationHeaders copy];

  return v2;
}

- (BOOL)_isResponseSuccessful:(id)a3
{
  return (unint64_t)([a3 statusCode] - 200) < 0x64;
}

- (BOOL)_isOTCliqueStatusIn
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F3B438]);
  [v3 setContext:*MEMORY[0x1E4F3B458]];
  uint64_t v4 = [(AKAppleIDServerResourceLoadDelegate *)self altDSID];
  [v3 setAltDSID:v4];

  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F3B430]) initWithContextData:v3];
  id v6 = objc_alloc_init(MEMORY[0x1E4F3B448]);
  [v6 setUseCachedAccountStatus:1];
  uint64_t v9 = 0;
  BOOL v7 = [v5 fetchCliqueStatus:v6 error:&v9] == 0;

  return v7;
}

- (id)_accountDSID
{
  id v3 = +[AKAccountManager sharedInstance];
  uint64_t v4 = [v3 authKitAccountWithAltDSID:self->_altDSID error:0];
  uint64_t v5 = [v3 DSIDForAccount:v4];
  objc_opt_class();
  id v6 = v5;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_5:
    objc_opt_class();
    id v8 = v6;
    if (objc_opt_isKindOfClass()) {
      id v9 = v8;
    }
    else {
      id v9 = 0;
    }

    BOOL v7 = [v9 stringValue];

    goto LABEL_9;
  }
  BOOL v7 = v6;
  if (!v6) {
    goto LABEL_5;
  }
LABEL_9:

  return v7;
}

- (BOOL)cliMode
{
  return self->_cliMode;
}

- (void)setCliMode:(BOOL)a3
{
  self->_cliMode = a3;
}

- (NSString)serviceToken
{
  return self->_serviceToken;
}

- (void)setServiceToken:(id)a3
{
}

- (BOOL)shouldSendEphemeralAuthHeader
{
  return self->_shouldSendEphemeralAuthHeader;
}

- (void)setShouldSendEphemeralAuthHeader:(BOOL)a3
{
  self->_shouldSendEphemeralAuthHeader = a3;
}

- (BOOL)shouldSendICSCIntentHeader
{
  return self->_shouldSendICSCIntentHeader;
}

- (void)setShouldSendICSCIntentHeader:(BOOL)a3
{
  self->_shouldSendICSCIntentHeader = a3;
}

- (BOOL)shouldSendLocalUserHasAppleIDLoginHeader
{
  return self->_shouldSendLocalUserHasAppleIDLoginHeader;
}

- (void)setShouldSendLocalUserHasAppleIDLoginHeader:(BOOL)a3
{
  self->_shouldSendLocalUserHasAppleIDLoginHeader = a3;
}

- (BOOL)shouldSendPhoneNumber
{
  return self->_shouldSendPhoneNumber;
}

- (void)setShouldSendPhoneNumber:(BOOL)a3
{
  self->_shouldSendPhoneNumber = a3;
}

- (BOOL)shouldOfferSecurityUpgrade
{
  return self->_shouldOfferSecurityUpgrade;
}

- (void)setShouldOfferSecurityUpgrade:(BOOL)a3
{
  self->_shouldOfferSecurityUpgrade = a3;
}

- (NSString)phoneNumberCertificate
{
  return self->_phoneNumberCertificate;
}

- (void)setPhoneNumberCertificate:(id)a3
{
}

- (NSArray)phoneInformation
{
  return self->_phoneInformation;
}

- (void)setPhoneInformation:(id)a3
{
}

- (int64_t)serviceType
{
  return self->_serviceType;
}

- (void)setServiceType:(int64_t)a3
{
  self->_serviceType = a3;
}

- (NSArray)loggedInServices
{
  return self->_loggedInServices;
}

- (void)setLoggedInServices:(id)a3
{
}

- (NSString)passwordResetToken
{
  return self->_passwordResetToken;
}

- (void)setPasswordResetToken:(id)a3
{
}

- (NSString)continuationToken
{
  return self->_continuationToken;
}

- (void)setContinuationToken:(id)a3
{
}

- (NSString)heartbeatToken
{
  return self->_heartbeatToken;
}

- (void)setHeartbeatToken:(id)a3
{
}

- (NSString)identityToken
{
  return self->_identityToken;
}

- (void)setIdentityToken:(id)a3
{
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (void)setAltDSID:(id)a3
{
}

- (NSString)initialURLRequestKey
{
  return self->_initialURLRequestKey;
}

- (void)setInitialURLRequestKey:(id)a3
{
}

- (NSString)proxyAppName
{
  return self->_proxyAppName;
}

- (void)setProxyAppName:(id)a3
{
}

- (NSString)clientAppName
{
  return self->_clientAppName;
}

- (void)setClientAppName:(id)a3
{
}

- (NSString)clientBundleID
{
  return self->_clientBundleID;
}

- (void)setClientBundleID:(id)a3
{
}

- (NSString)appProvidedContext
{
  return self->_appProvidedContext;
}

- (void)setAppProvidedContext:(id)a3
{
}

- (NSNumber)hasEmptyPasswordOverride
{
  return self->_hasEmptyPasswordOverride;
}

- (void)setHasEmptyPasswordOverride:(id)a3
{
}

- (NSString)securityUpgradeContext
{
  return self->_securityUpgradeContext;
}

- (void)setSecurityUpgradeContext:(id)a3
{
}

- (NSString)followupItems
{
  return self->_followupItems;
}

- (void)setFollowupItems:(id)a3
{
}

- (NSString)dataCenterIdentifier
{
  return self->_dataCenterIdentifier;
}

- (void)setDataCenterIdentifier:(id)a3
{
}

- (NSString)custodianRecoveryToken
{
  return self->_custodianRecoveryToken;
}

- (void)setCustodianRecoveryToken:(id)a3
{
}

- (AKDevice)proxiedDevice
{
  return self->_proxiedDevice;
}

- (void)setProxiedDevice:(id)a3
{
}

- (NSString)proxiedAltDSID
{
  return self->_proxiedAltDSID;
}

- (void)setProxiedAltDSID:(id)a3
{
}

- (NSString)proxiedIdentityToken
{
  return self->_proxiedIdentityToken;
}

- (void)setProxiedIdentityToken:(id)a3
{
}

- (AKAnisetteServiceProtocol)anisetteDataProvider
{
  return self->_anisetteDataProvider;
}

- (void)setAnisetteDataProvider:(id)a3
{
}

- (AKAnisetteData)proxiedDeviceAnisetteData
{
  return self->_proxiedDeviceAnisetteData;
}

- (void)setProxiedDeviceAnisetteData:(id)a3
{
}

- (AKAttestationData)proxiedDeviceAttestationData
{
  return self->_proxiedDeviceAttestationData;
}

- (void)setProxiedDeviceAttestationData:(id)a3
{
}

- (NSString)privateEmailDomain
{
  return self->_privateEmailDomain;
}

- (void)setPrivateEmailDomain:(id)a3
{
}

- (NSString)privateEmailBundleId
{
  return self->_privateEmailBundleId;
}

- (void)setPrivateEmailBundleId:(id)a3
{
}

- (NSString)continuityIDMSData
{
  return self->_continuityIDMSData;
}

- (void)setContinuityIDMSData:(id)a3
{
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

- (NSString)serviceTokenIdentifier
{
  return self->_serviceTokenIdentifier;
}

- (void)setServiceTokenIdentifier:(id)a3
{
}

- (NSString)bagUrlKey
{
  return self->_bagUrlKey;
}

- (void)setBagUrlKey:(id)a3
{
}

- (BOOL)shouldSendSigningHeaders
{
  return self->_shouldSendSigningHeaders;
}

- (void)setShouldSendSigningHeaders:(BOOL)a3
{
  self->_shouldSendSigningHeaders = a3;
}

- (BOOL)attachEDPToken
{
  return self->_attachEDPToken;
}

- (void)setAttachEDPToken:(BOOL)a3
{
  self->_attachEDPToken = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bagUrlKey, 0);
  objc_storeStrong((id *)&self->_serviceTokenIdentifier, 0);
  objc_storeStrong((id *)&self->_telemetryFlowID, 0);
  objc_storeStrong((id *)&self->_telemetryDeviceSessionID, 0);
  objc_storeStrong((id *)&self->_continuityIDMSData, 0);
  objc_storeStrong((id *)&self->_privateEmailBundleId, 0);
  objc_storeStrong((id *)&self->_privateEmailDomain, 0);
  objc_storeStrong((id *)&self->_proxiedDeviceAttestationData, 0);
  objc_storeStrong((id *)&self->_proxiedDeviceAnisetteData, 0);
  objc_storeStrong((id *)&self->_anisetteDataProvider, 0);
  objc_storeStrong((id *)&self->_proxiedIdentityToken, 0);
  objc_storeStrong((id *)&self->_proxiedAltDSID, 0);
  objc_storeStrong((id *)&self->_proxiedDevice, 0);
  objc_storeStrong((id *)&self->_custodianRecoveryToken, 0);
  objc_storeStrong((id *)&self->_dataCenterIdentifier, 0);
  objc_storeStrong((id *)&self->_followupItems, 0);
  objc_storeStrong((id *)&self->_securityUpgradeContext, 0);
  objc_storeStrong((id *)&self->_hasEmptyPasswordOverride, 0);
  objc_storeStrong((id *)&self->_appProvidedContext, 0);
  objc_storeStrong((id *)&self->_clientBundleID, 0);
  objc_storeStrong((id *)&self->_clientAppName, 0);
  objc_storeStrong((id *)&self->_proxyAppName, 0);
  objc_storeStrong((id *)&self->_initialURLRequestKey, 0);
  objc_storeStrong((id *)&self->_identityToken, 0);
  objc_storeStrong((id *)&self->_heartbeatToken, 0);
  objc_storeStrong((id *)&self->_continuationToken, 0);
  objc_storeStrong((id *)&self->_passwordResetToken, 0);
  objc_storeStrong((id *)&self->_loggedInServices, 0);
  objc_storeStrong((id *)&self->_phoneInformation, 0);
  objc_storeStrong((id *)&self->_phoneNumberCertificate, 0);
  objc_storeStrong((id *)&self->_serviceToken, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_continuationHeaders, 0);
  objc_storeStrong((id *)&self->_proxiedProvisioningController, 0);

  objc_storeStrong((id *)&self->_altDSID, 0);
}

- (void)signRequest:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0(&dword_193494000, v0, v1, "Current process is requesting signing synchronously, this is an error, please do not do this!", v2, v3, v4, v5, v6);
}

void __73__AKAppleIDServerResourceLoadDelegate_signRequest_withCompletionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_193494000, v0, v1, "Grabbing signing headers from current device.", v2, v3, v4, v5, v6);
}

void __73__AKAppleIDServerResourceLoadDelegate_signRequest_withCompletionHandler___block_invoke_128_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Failed to get signing headers, error: %@", v2, v3, v4, v5, v6);
}

void __73__AKAppleIDServerResourceLoadDelegate_signRequest_withCompletionHandler___block_invoke_133_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Error while fetching proxied anisette %@", v2, v3, v4, v5, v6);
}

void __73__AKAppleIDServerResourceLoadDelegate_signRequest_withCompletionHandler___block_invoke_136_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Failed to fetch peer attestation data: %@", v2, v3, v4, v5, v6);
}

void __73__AKAppleIDServerResourceLoadDelegate_signRequest_withCompletionHandler___block_invoke_140_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Failed to fetch the EDP token due to %@, therefore it cannot be attached as a header.", v2, v3, v4, v5, v6);
}

- (void)_fetchApplicationNameForBundleId:.cold.1()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_193494000, v1, OS_LOG_TYPE_ERROR, "Cannot find application name for %@, got %@", v2, 0x16u);
}

- (void)_signRequest:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_193494000, v0, v1, "Attaching PAC header", v2, v3, v4, v5, v6);
}

- (void)_signRequest:.cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_193494000, v0, v1, "Attaching PTN header", v2, v3, v4, v5, v6);
}

- (void)_signRequest:.cold.3()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_193494000, v0, v1, "Attaching Phone Info header", v2, v3, v4, v5, v6);
}

- (void)_signRequest:.cold.4()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_193494000, v0, v1, "Attaching ICSC header", v2, v3, v4, v5, v6);
}

- (void)_signRequest:.cold.5()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_193494000, v0, v1, "Signing request as ephemeral", v2, v3, v4, v5, v6);
}

- (void)_signRequest:.cold.6()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_193494000, v0, v1, "Attaching PRK header", v2, v3, v4, v5, v6);
}

- (void)_signRequest:.cold.7()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Could not determine passcode state with error %@", v2, v3, v4, v5, v6);
}

- (void)_signRequest:(uint64_t)a3 .cold.8(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_signRequest:.cold.9()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_6(&dword_193494000, v0, v1, "Attaching app-name %@", v2, v3, v4, v5, v6);
}

- (void)signRequestWithCommonHeaders:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_193494000, v0, v1, "Signing request with CR token", v2, v3, v4, v5, v6);
}

- (void)signRequestWithCommonHeaders:.cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_193494000, v0, v1, "Signing request with URLSwitching UrlKey", v2, v3, v4, v5, v6);
}

- (void)signRequestWithCommonHeaders:.cold.3()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_193494000, v0, v1, "Signing request with HB token", v2, v3, v4, v5, v6);
}

- (void)signRequestWithCommonHeaders:.cold.4()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_193494000, v0, v1, "Signing request with ID token", v2, v3, v4, v5, v6);
}

- (void)signRequestWithCommonHeaders:.cold.5()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_193494000, v0, v1, "Signing request with service token", v2, v3, v4, v5, v6);
}

- (void)signRequestWithBasicHeaders:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_193494000, v0, v1, "Signing request with the flow identifier", v2, v3, v4, v5, v6);
}

- (void)signRequestWithBasicHeaders:.cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_193494000, v0, v1, "Signing request with the device session identifier", v2, v3, v4, v5, v6);
}

- (void)signRequestWithBasicHeaders:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Received error while getting current user's account: %{public}@", v2, v3, v4, v5, v6);
}

- (void)signRequestWithBasicHeaders:.cold.4()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_193494000, v0, v1, "Setting execution mode to CLI", v2, v3, v4, v5, v6);
}

- (void)signRequestWithBasicHeaders:.cold.5()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_193494000, v0, v1, "Signing request with data center identifier", v2, v3, v4, v5, v6);
}

- (void)_signRequestWithBAAHeaders:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_193494000, v0, v1, "Server delegate missing bagUrlKey, cannot determine if BAA attestation is needed", v2, v3, v4, v5, v6);
}

- (void)decorateWithPrivateEmailContext:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_6(&dword_193494000, v0, v1, "Decorating with: %@", v2, v3, v4, v5, v6);
}

- (void)updateWithAuthResults:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0(&dword_193494000, v0, v1, "Updating delegate identity token failed: key not found in results", v2, v3, v4, v5, v6);
}

- (void)updateWithAuthResults:.cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_193494000, v0, v1, "Updating delegate identity token succeeded.", v2, v3, v4, v5, v6);
}

- (void)updateWithAuthResults:.cold.3()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0(&dword_193494000, v0, v1, "Custom service token value is set. The results of a reauth are likely unused!", v2, v3, v4, v5, v6);
}

- (void)updateWithAuthResults:(uint64_t)a3 .cold.4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)updateWithAuthResults:(uint64_t)a3 .cold.5(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end
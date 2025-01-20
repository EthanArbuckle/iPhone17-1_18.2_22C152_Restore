@interface AKAuthenticationServerResponse
+ (id)decodedConfigurationInfo:(id)a3;
- (AKAuthenticationServerResponse)initWithSRPContext:(id)a3;
- (AKAuthenticationServerResponse)initWithServerResponse:(id)a3 forAppleID:(id)a4;
- (AKAuthenticationServerResponse)initWithServerResponse:(id)a3 responseBody:(id)a4;
- (AKMasterToken)masterToken;
- (AKToken)continuationToken;
- (AKToken)custodianSetupToken;
- (AKToken)heartbeatToken;
- (AKToken)idmsDataToken;
- (AKToken)inheritanceBeneficiarySetupToken;
- (AKToken)passwordEquivalentToken;
- (AKToken)passwordResetToken;
- (AKToken)passwordlessToken;
- (AKToken)shortLivedToken;
- (BOOL)_shouldBackgroundiCloudSignIn;
- (BOOL)allowPiggybacking;
- (BOOL)allowPiggybackingPresence;
- (BOOL)authorizationUsed;
- (BOOL)canBackgroundiCloudSignIn;
- (BOOL)isAnisetteReprovisioningRequired;
- (BOOL)isAnisetteResyncRequired;
- (BOOL)isAuditLogin;
- (BOOL)isDemoAccount;
- (BOOL)isFidoAuthRequired;
- (BOOL)isFirstPartyApp;
- (BOOL)isManagedAppleID;
- (BOOL)isMdmInfoRequired;
- (BOOL)isPasscodeResetRequired;
- (BOOL)isProximityEligible;
- (BOOL)isRetryRequired;
- (BOOL)isSecondaryActionRequired;
- (BOOL)isSecondaryActionURLGSEndpoint;
- (BOOL)isSenior;
- (BOOL)isServerUIRequired;
- (BOOL)isSiwaForChildEnabled;
- (BOOL)isURLSwitchingRequired;
- (BOOL)isUnderAgeOfMajority;
- (BOOL)isUpdateable;
- (BOOL)phoneAsAppleID;
- (BOOL)primaryEmailVetted;
- (BOOL)requireSigningHeaders;
- (BOOL)shouldProxyAnisetteAction;
- (BOOL)shouldReportTokenGenerationMetricsWithTokenGenerationInfo:(id)a3;
- (BOOL)updateWithSecondaryAuthenticationResponse:(id)a3;
- (BOOL)updateWithSecondaryAuthenticationResponse:(id)a3 shouldUpdateDSID:(BOOL)a4;
- (NSArray)aliases;
- (NSArray)beneficiaryInfo;
- (NSArray)custodianInfos;
- (NSArray)federatedAuthURLWhiteList;
- (NSArray)loginHandles;
- (NSArray)securityKeys;
- (NSArray)trustedPhoneNumbers;
- (NSData)anisetteResyncData;
- (NSData)federatedAuthRequestPayload;
- (NSDictionary)acceptedTermsInfo;
- (NSDictionary)additionalInfo;
- (NSDictionary)configurationInfo;
- (NSDictionary)federatedAuthSamlRequest;
- (NSDictionary)serverProvidedData;
- (NSDictionary)serviceTokens;
- (NSNumber)SOSNeeded;
- (NSNumber)acceptedDeviceTermsVersion;
- (NSNumber)adpCohort;
- (NSNumber)ageOfMajority;
- (NSNumber)askToBuy;
- (NSNumber)beneficiaryLastModified;
- (NSNumber)birthDay;
- (NSNumber)birthMonth;
- (NSNumber)birthYear;
- (NSNumber)canAttestAge;
- (NSNumber)canBeBeneficiary;
- (NSNumber)canBeCustodian;
- (NSNumber)canHaveBeneficiary;
- (NSNumber)canHaveCustodian;
- (NSNumber)custodianEnabled;
- (NSNumber)custodianLastModified;
- (NSNumber)dsid;
- (NSNumber)edpState;
- (NSNumber)hasMDM;
- (NSNumber)hasModernRecoveryKey;
- (NSNumber)hasSOSActiveDevice;
- (NSNumber)isNotificationEmailAvailable;
- (NSNumber)passcodeAuth;
- (NSNumber)passcodeAuthEnabled;
- (NSNumber)passkeyEligible;
- (NSNumber)passkeyPresent;
- (NSNumber)passwordVersion;
- (NSNumber)privateAttestationEnabled;
- (NSNumber)serverExperimentalFeatures;
- (NSNumber)srpIteration;
- (NSNumber)thirdPartyRegulatoryOverride;
- (NSNumber)webAccessEnabled;
- (NSString)altDSID;
- (NSString)appleID;
- (NSString)appleIDCountryCode;
- (NSString)beneficiaryIdentifier;
- (NSString)beneficiaryWrappedKey;
- (NSString)configDataVersion;
- (NSString)custodianSessionID;
- (NSString)errorMessage;
- (NSString)errorMessageTitle;
- (NSString)federatedAuthURL;
- (NSString)firstName;
- (NSString)imageURLString;
- (NSString)lastName;
- (NSString)managedOrganizationName;
- (NSString)nativeActionURLKey;
- (NSString)notificationEmail;
- (NSString)primaryEmail;
- (NSString)privateEmail;
- (NSString)secondaryActionMessage;
- (NSString)secondaryActionURLKey;
- (NSString)serverInfo;
- (NSString)signInWithAppleSharedAccountGroupID;
- (NSString)srpProtocol;
- (NSString)srpSalt;
- (NSString)transactionId;
- (NSString)urlSwitchingData;
- (id)_decodeBase64String:(id)a3;
- (id)_federatedPayloadFromInfo:(id)a3;
- (id)_numberFormatter;
- (int64_t)errorCode;
- (int64_t)subErrorCode;
- (unint64_t)appleIDSecurityLevel;
- (unint64_t)authMode;
- (unint64_t)managedOrganizationType;
- (void)_harvestCommonFieldsFromBody:(id)a3;
- (void)_harvestCommonFieldsFromResponse:(id)a3;
- (void)_harvestManagedAppleIDInfoFromDictionary:(id)a3;
- (void)_setHeartbeatToken:(id)a3;
- (void)_setIdmsDataToken:(id)a3;
- (void)_setPasswordEquivalentToken:(id)a3;
- (void)_setPasswordlessToken:(id)a3;
- (void)_updateADPCohortWithRawValue:(id)a3;
- (void)_updateAccountInformationWithResultsDictionary:(id)a3;
- (void)_updateDSIDWithRawValue:(id)a3;
- (void)_updateEDPStateWithRawValue:(id)a3;
- (void)_updatePasswordVersionWithRawValue:(id)a3;
- (void)_updateSRPIterationWithRawValue:(id)a3;
- (void)_updateSRPProtocolWithRawValue:(id)a3;
- (void)_updateSRPSaltWithRawValue:(id)a3;
- (void)reportCriticalAuthTokensTelemetryForFlow:(unint64_t)a3 withTokenGenerationInfo:(id)a4;
- (void)updateWithSecondaryAuthenticationBody:(id)a3;
@end

@implementation AKAuthenticationServerResponse

+ (id)decodedConfigurationInfo:(id)a3
{
  return objc_msgSend(a3, "aaf_map:", &stru_100226F20);
}

- (AKAuthenticationServerResponse)initWithSRPContext:(id)a3
{
  id v4 = a3;
  v212.receiver = self;
  v212.super_class = (Class)AKAuthenticationServerResponse;
  v5 = [(AKAuthenticationServerResponse *)&v212 init];

  if (v5)
  {
    v6 = [v4 serverProvidedData];
    uint64_t v7 = [v4 status];
    uint64_t v8 = [v4 serverProvidedData];
    serverProvidedData = v5->_serverProvidedData;
    v5->_serverProvidedData = (NSDictionary *)v8;

    v10 = _AKLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "ak_redactedCopy");
      id v11 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      uint64_t v215 = v7;
      __int16 v216 = 2112;
      id v217 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Creating AKAuthenticationServerResponse with status: %@ contents: %@", buf, 0x16u);
    }
    v207 = (void *)v7;

    uint64_t v12 = [v6 objectForKeyedSubscript:@"atxid"];
    transactionId = v5->_transactionId;
    v5->_transactionId = (NSString *)v12;

    v14 = [v6 objectForKeyedSubscript:@"apb"];
    v5->_allowPiggybacking = [v14 BOOLValue];

    v15 = [v6 objectForKeyedSubscript:@"pbp"];
    v5->_allowPiggybackingPresence = [v15 BOOLValue];

    v16 = [v6 objectForKeyedSubscript:@"alias"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_storeStrong((id *)&v5->_aliases, v16);
    }
    v203 = v16;
    [(AKAuthenticationServerResponse *)v5 _updateAccountInformationWithResultsDictionary:v6];
    id v204 = v4;
    uint64_t v17 = [v4 masterToken];
    masterToken = v5->_masterToken;
    v5->_masterToken = (AKMasterToken *)v17;

    v19 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    serviceTokens = v5->_serviceTokens;
    v5->_serviceTokens = v19;

    [v6 objectForKeyedSubscript:@"t"];
    long long v208 = 0u;
    long long v209 = 0u;
    long long v210 = 0u;
    long long v211 = 0u;
    id v21 = (id)objc_claimAutoreleasedReturnValue();
    id v22 = [v21 countByEnumeratingWithState:&v208 objects:v213 count:16];
    if (v22)
    {
      id v23 = v22;
      uint64_t v24 = *(void *)v209;
      do
      {
        for (i = 0; i != v23; i = (char *)i + 1)
        {
          if (*(void *)v209 != v24) {
            objc_enumerationMutation(v21);
          }
          uint64_t v26 = *(void *)(*((void *)&v208 + 1) + 8 * i);
          v27 = [v21 objectForKeyedSubscript:v26];
          v28 = +[AKToken tokenWithDictionary:v27];
          if (v28) {
            [(NSMutableDictionary *)v5->_serviceTokens setObject:v28 forKeyedSubscript:v26];
          }
        }
        id v23 = [v21 countByEnumeratingWithState:&v208 objects:v213 count:16];
      }
      while (v23);
    }

    v29 = [v6 objectForKeyedSubscript:@"mu"];
    v30 = v29;
    if (v29) {
      v5->_isManagedAppleID = [v29 BOOLValue];
    }
    v31 = [v6 objectForKeyedSubscript:@"demoAccount"];
    v32 = v31;
    if (v31) {
      v5->_isDemoAccount = [v31 BOOLValue];
    }
    v202 = v32;
    uint64_t v33 = [v207 objectForKeyedSubscript:@"fu"];
    federatedAuthURL = v5->_federatedAuthURL;
    v5->_federatedAuthURL = (NSString *)v33;

    uint64_t v35 = [v207 objectForKeyedSubscript:@"params"];
    federatedAuthSamlRequest = v5->_federatedAuthSamlRequest;
    v5->_federatedAuthSamlRequest = (NSDictionary *)v35;

    v37 = [v207 objectForKeyedSubscript:@"params"];
    uint64_t v38 = [(AKAuthenticationServerResponse *)v5 _federatedPayloadFromInfo:v37];
    federatedAuthRequestPayload = v5->_federatedAuthRequestPayload;
    v5->_federatedAuthRequestPayload = (NSData *)v38;

    uint64_t v40 = [v207 objectForKeyedSubscript:@"dm"];
    federatedAuthURLWhiteList = v5->_federatedAuthURLWhiteList;
    v5->_federatedAuthURLWhiteList = (NSArray *)v40;

    v42 = [v6 objectForKeyedSubscript:@"al"];
    v43 = v42;
    if (v42) {
      v5->_isAuditLogin = [v42 BOOLValue];
    }
    v201 = v43;
    uint64_t v44 = [v6 objectForKeyedSubscript:@"imu"];
    imageURLString = v5->_imageURLString;
    v5->_imageURLString = (NSString *)v44;

    v46 = [v207 objectForKeyedSubscript:@"hsc"];
    if (v46)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if ([v46 integerValue] == (id)409)
        {
          v5->_isSecondaryActionRequired = 1;
        }
        else if ([v46 integerValue] == (id)433)
        {
          v5->_isAnisetteReprovisioningRequired = 1;
        }
        else if ([v46 integerValue] == (id)434)
        {
          v5->_isAnisetteResyncRequired = 1;
        }
        else if ([v46 integerValue] == (id)435)
        {
          v5->_isURLSwitchingRequired = 1;
          uint64_t v190 = [v207 objectForKeyedSubscript:@"X-Apple-I-Data"];
          urlSwitchingData = v5->_urlSwitchingData;
          v5->_urlSwitchingData = (NSString *)v190;
        }
        else if ([v46 integerValue] == (id)436)
        {
          v5->_isRetryRequired = 1;
        }
      }
      else
      {
        v47 = _AKLogSystem();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
          sub_10017B26C(v47, v48, v49, v50, v51, v52, v53, v54);
        }
      }
    }
    v55 = [v207 objectForKeyedSubscript:@"au"];
    if (v55)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v56 = v55;
        secondaryActionURLKey = v5->_secondaryActionURLKey;
        v5->_secondaryActionURLKey = v56;
      }
      else
      {
        secondaryActionURLKey = _AKLogSystem();
        if (os_log_type_enabled(secondaryActionURLKey, OS_LOG_TYPE_ERROR)) {
          sub_10017B1F4(secondaryActionURLKey, v58, v59, v60, v61, v62, v63, v64);
        }
      }
    }
    v206 = [v207 objectForKeyedSubscript:@"autype"];
    if ([v206 intValue])
    {
      BOOL v65 = [v206 intValue] == 1 && v5->_isSecondaryActionRequired;
      v5->_secondaryActionURLGSEndpoint = v65;
    }
    v205 = [v6 objectForKeyedSubscript:@"fidoAuth"];
    if ([v205 BOOLValue]) {
      v5->_fidoAuthRequired = [v205 BOOLValue];
    }
    uint64_t v66 = [v207 objectForKeyedSubscript:@"naurl"];
    v198 = (void *)v66;
    if (v66)
    {
      v67 = (void *)v66;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v68 = v67;
        nativeActionURLKey = v5->_nativeActionURLKey;
        v5->_nativeActionURLKey = v68;
      }
      else
      {
        nativeActionURLKey = _AKLogSystem();
        if (os_log_type_enabled(nativeActionURLKey, OS_LOG_TYPE_ERROR)) {
          sub_10017B17C(nativeActionURLKey, v70, v71, v72, v73, v74, v75, v76);
        }
      }
    }
    v199 = v55;
    v200 = v46;
    v77 = [v6 objectForKeyedSubscript:@"sm"];
    if (v77) {
      objc_storeStrong((id *)&v5->_secondaryActionMessage, v77);
    }
    v197 = v77;
    uint64_t v78 = [v207 objectForKeyedSubscript:@"em"];
    errorMessage = v5->_errorMessage;
    v5->_errorMessage = (NSString *)v78;

    uint64_t v80 = [v207 objectForKeyedSubscript:@"tt"];
    errorMessageTitle = v5->_errorMessageTitle;
    v5->_errorMessageTitle = (NSString *)v80;

    uint64_t v82 = AKSubErrorStatusCodeKey;
    v83 = [v207 objectForKeyedSubscript:AKSubErrorStatusCodeKey];
    char v84 = objc_opt_respondsToSelector();

    if (v84)
    {
      v85 = [v207 objectForKeyedSubscript:v82];
      v5->_subErrorCode = (int64_t)[v85 integerValue];
    }
    v86 = [v207 objectForKeyedSubscript:@"ec"];
    char v87 = objc_opt_respondsToSelector();

    if (v87)
    {
      v88 = [v207 objectForKeyedSubscript:@"ec"];
      v5->_errorCode = (int64_t)[v88 integerValue];
    }
    uint64_t v89 = [v207 objectForKeyedSubscript:@"X-Apple-I-MD-DATA"];
    if (v89)
    {
      v90 = (NSData *)[objc_alloc((Class)NSData) initWithBase64EncodedString:v89 options:0];
      anisetteResyncData = v5->_anisetteResyncData;
      v5->_anisetteResyncData = v90;
    }
    v196 = (void *)v89;
    v195 = [v207 objectForKeyedSubscript:@"X-Apple-I-MD-Cmd-Target"];
    if ([v195 isEqual:@"paired"]) {
      v5->_shouldProxyAnisetteAction = 1;
    }
    objc_opt_class();
    id v92 = [v6 objectForKeyedSubscript:@"continuationKey"];
    if (objc_opt_isKindOfClass()) {
      id v93 = v92;
    }
    else {
      id v93 = 0;
    }

    v194 = v93;
    if (v93)
    {
      uint64_t v94 = +[AKToken tokenWithDictionary:v93];
      continuationToken = v5->_continuationToken;
      v5->_continuationToken = (AKToken *)v94;
    }
    else
    {
      continuationToken = [v6 objectForKeyedSubscript:@"ck"];
      uint64_t v96 = +[AKToken tokenWithValue:continuationToken lifetime:0];
      v97 = v5->_continuationToken;
      v5->_continuationToken = (AKToken *)v96;
    }
    v98 = [(AKToken *)v5->_continuationToken stringValue];

    if (v98)
    {
      v99 = _AKLogSystem();
      if (os_log_type_enabled(v99, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v99, OS_LOG_TYPE_DEFAULT, "Successfully obtained new CK from SRP", buf, 2u);
      }
    }
    objc_opt_class();
    id v100 = [v6 objectForKeyedSubscript:@"passwordResetKey"];
    if (objc_opt_isKindOfClass()) {
      id v101 = v100;
    }
    else {
      id v101 = 0;
    }

    if (v101)
    {
      uint64_t v102 = +[AKToken tokenWithDictionary:v101];
      passwordResetToken = v5->_passwordResetToken;
      v5->_passwordResetToken = (AKToken *)v102;
    }
    else
    {
      passwordResetToken = [v6 objectForKeyedSubscript:@"prk"];
      uint64_t v104 = +[AKToken tokenWithValue:passwordResetToken lifetime:0];
      v105 = v5->_passwordResetToken;
      v5->_passwordResetToken = (AKToken *)v104;
    }
    v106 = [(AKToken *)v5->_passwordResetToken stringValue];

    if (v106)
    {
      v107 = _AKLogSystem();
      if (os_log_type_enabled(v107, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v107, OS_LOG_TYPE_DEFAULT, "Successfully obtained new PRK from SRP", buf, 2u);
      }
    }
    v108 = [v6 objectForKeyedSubscript:@"appleIdSignInEnabled"];
    if ([v108 BOOLValue]) {
      v5->_authorizationUsed = [v108 BOOLValue];
    }
    v193 = v108;
    uint64_t v109 = [v6 objectForKeyedSubscript:@"privateAttestationEnabled"];
    privateAttestationEnabled = v5->_privateAttestationEnabled;
    v5->_privateAttestationEnabled = (NSNumber *)v109;

    v111 = [v6 objectForKeyedSubscript:@"phoneAsAppleId"];
    if ([v111 BOOLValue]) {
      v5->_phoneAsAppleID = [v111 BOOLValue];
    }
    v192 = v101;
    v112 = [v207 objectForKeyedSubscript:@"rsh"];
    if ([v112 BOOLValue]) {
      v5->_requireSigningHeaders = [v112 BOOLValue];
    }
    objc_opt_class();
    id v113 = [v6 objectForKeyedSubscript:AKWebAccessEnabledKey];
    if (objc_opt_isKindOfClass()) {
      v114 = (NSNumber *)v113;
    }
    else {
      v114 = 0;
    }

    webAccessEnabled = v5->_webAccessEnabled;
    v5->_webAccessEnabled = v114;

    objc_opt_class();
    id v116 = [v6 objectForKeyedSubscript:AKServerExperimentalFeaturesKey];
    if (objc_opt_isKindOfClass()) {
      v117 = (NSNumber *)v116;
    }
    else {
      v117 = 0;
    }

    serverExperimentalFeatures = v5->_serverExperimentalFeatures;
    v5->_serverExperimentalFeatures = v117;

    objc_opt_class();
    id v119 = [v6 objectForKeyedSubscript:AKPasskeyEligibleKey];
    if (objc_opt_isKindOfClass()) {
      v120 = (NSNumber *)v119;
    }
    else {
      v120 = 0;
    }

    passkeyEligible = v5->_passkeyEligible;
    v5->_passkeyEligible = v120;

    objc_opt_class();
    id v122 = [v6 objectForKeyedSubscript:AKPasskeyPresentKey];
    if (objc_opt_isKindOfClass()) {
      v123 = (NSNumber *)v122;
    }
    else {
      v123 = 0;
    }

    passkeyPresent = v5->_passkeyPresent;
    v5->_passkeyPresent = v123;

    objc_opt_class();
    id v125 = [v6 objectForKeyedSubscript:AKProximityEligibleKey];
    if (objc_opt_isKindOfClass()) {
      id v126 = v125;
    }
    else {
      id v126 = 0;
    }

    v5->_isProximityEligible = [v126 BOOLValue];
    objc_opt_class();
    id v127 = [v6 objectForKeyedSubscript:AKPasscodeAuthEnabledKey];
    if (objc_opt_isKindOfClass()) {
      v128 = (NSNumber *)v127;
    }
    else {
      v128 = 0;
    }

    passcodeAuthEnabled = v5->_passcodeAuthEnabled;
    v5->_passcodeAuthEnabled = v128;

    objc_opt_class();
    id v130 = [v6 objectForKeyedSubscript:AKPasscodeAuthKey];
    if (objc_opt_isKindOfClass()) {
      v131 = (NSNumber *)v130;
    }
    else {
      v131 = 0;
    }

    passcodeAuth = v5->_passcodeAuth;
    v5->_passcodeAuth = v131;

    objc_opt_class();
    id v133 = [v6 objectForKeyedSubscript:AKAskToBuyKey];
    if (objc_opt_isKindOfClass()) {
      v134 = (NSNumber *)v133;
    }
    else {
      v134 = 0;
    }

    askToBuy = v5->_askToBuy;
    v5->_askToBuy = v134;

    objc_opt_class();
    id v136 = [v6 objectForKeyedSubscript:AKSOSNeededKey];
    if (objc_opt_isKindOfClass()) {
      v137 = (NSNumber *)v136;
    }
    else {
      v137 = 0;
    }

    SOSNeeded = v5->_SOSNeeded;
    v5->_SOSNeeded = v137;

    uint64_t v139 = AKSOSActiveDeviceKey;
    v140 = [v6 objectForKeyedSubscript:AKSOSActiveDeviceKey];
    objc_opt_class();
    if (v140)
    {
      v141 = v6;
      uint64_t v142 = v139;
    }
    else
    {
      uint64_t v142 = AKSOSActiveDeviceLegacyKey;
      v141 = v6;
    }
    id v143 = [v141 objectForKeyedSubscript:v142];
    if (objc_opt_isKindOfClass()) {
      id v144 = v143;
    }
    else {
      id v144 = 0;
    }

    v145 = (NSNumber *)v144;
    hasSOSActiveDevice = v5->_hasSOSActiveDevice;
    v5->_hasSOSActiveDevice = v145;

    uint64_t v147 = [v207 objectForKeyedSubscript:AKConfigDataVersion];
    configDataVersion = v5->_configDataVersion;
    v5->_configDataVersion = (NSString *)v147;

    objc_opt_class();
    id v149 = [v6 objectForKeyedSubscript:AKUserBirthYearKey];
    if (objc_opt_isKindOfClass()) {
      v150 = (NSNumber *)v149;
    }
    else {
      v150 = 0;
    }

    birthYear = v5->_birthYear;
    v5->_birthYear = v150;

    objc_opt_class();
    id v152 = [v6 objectForKeyedSubscript:AKUserBirthDayKey];
    if (objc_opt_isKindOfClass()) {
      v153 = (NSNumber *)v152;
    }
    else {
      v153 = 0;
    }

    birthDay = v5->_birthDay;
    v5->_birthDay = v153;

    objc_opt_class();
    id v155 = [v6 objectForKeyedSubscript:AKUserBirthMonthKey];
    if (objc_opt_isKindOfClass()) {
      v156 = (NSNumber *)v155;
    }
    else {
      v156 = 0;
    }

    birthMonth = v5->_birthMonth;
    v5->_birthMonth = v156;

    objc_opt_class();
    id v158 = [v6 objectForKeyedSubscript:AKHasModernRKKey];
    if (objc_opt_isKindOfClass()) {
      v159 = (NSNumber *)v158;
    }
    else {
      v159 = 0;
    }

    hasModernRecoveryKey = v5->_hasModernRecoveryKey;
    v5->_hasModernRecoveryKey = v159;

    objc_opt_class();
    id v161 = [v6 objectForKeyedSubscript:AK3PRegulatoryOverrideKey];
    if (objc_opt_isKindOfClass()) {
      v162 = (NSNumber *)v161;
    }
    else {
      v162 = 0;
    }

    thirdPartyRegulatoryOverride = v5->_thirdPartyRegulatoryOverride;
    v5->_thirdPartyRegulatoryOverride = v162;

    objc_opt_class();
    id v164 = [v6 objectForKeyedSubscript:AKADPCohortKey];
    if (objc_opt_isKindOfClass()) {
      v165 = (NSNumber *)v164;
    }
    else {
      v165 = 0;
    }

    adpCohort = v5->_adpCohort;
    v5->_adpCohort = v165;

    objc_opt_class();
    id v167 = [v6 objectForKeyedSubscript:AKEDPStateKey];
    if (objc_opt_isKindOfClass()) {
      v168 = (NSNumber *)v167;
    }
    else {
      v168 = 0;
    }

    edpState = v5->_edpState;
    v5->_edpState = v168;

    objc_opt_class();
    id v170 = [v6 objectForKeyedSubscript:AKPasswordVersionKey];
    if (objc_opt_isKindOfClass()) {
      v171 = (NSNumber *)v170;
    }
    else {
      v171 = 0;
    }

    passwordVersion = v5->_passwordVersion;
    v5->_passwordVersion = v171;

    objc_opt_class();
    id v173 = [v6 objectForKeyedSubscript:AKSRPProtocolKey];
    if (objc_opt_isKindOfClass()) {
      v174 = (NSString *)v173;
    }
    else {
      v174 = 0;
    }

    srpProtocol = v5->_srpProtocol;
    v5->_srpProtocol = v174;

    objc_opt_class();
    id v176 = [v6 objectForKeyedSubscript:AKSRPSaltKey];
    if (objc_opt_isKindOfClass()) {
      v177 = (NSString *)v176;
    }
    else {
      v177 = 0;
    }

    srpSalt = v5->_srpSalt;
    v5->_srpSalt = v177;

    objc_opt_class();
    id v179 = [v6 objectForKeyedSubscript:AKSRPIterationCountKey];
    if (objc_opt_isKindOfClass()) {
      v180 = (NSNumber *)v179;
    }
    else {
      v180 = 0;
    }

    srpIteration = v5->_srpIteration;
    v5->_srpIteration = v180;

    v182 = +[AKFeatureManager sharedManager];
    unsigned int v183 = [v182 isBackgroundiCloudSignInEnabled];

    if (v183)
    {
      v184 = [v21 objectForKeyedSubscript:@"com.apple.gs.icloud.cloudkit.auth"];

      if (v184)
      {
        v185 = _AKLogSystem();
        if (os_log_type_enabled(v185, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v185, OS_LOG_TYPE_DEFAULT, "Successfully obtained new Cloudkit GS Token from SRP", buf, 2u);
        }
      }
      v186 = [v21 objectForKeyedSubscript:@"com.apple.gs.icloud.escrow.auth"];

      if (v186)
      {
        v187 = _AKLogSystem();
        if (os_log_type_enabled(v187, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v187, OS_LOG_TYPE_DEFAULT, "Successfully obtained new Escrow GS Token from SRP", buf, 2u);
        }
      }
      v5->_canBackgroundiCloudSignIn = [(AKAuthenticationServerResponse *)v5 _shouldBackgroundiCloudSignIn];
    }

    id v4 = v204;
  }
  v188 = v5;

  return v188;
}

- (id)_federatedPayloadFromInfo:(id)a3
{
  v3 = objc_msgSend(a3, "aaf_toUrlQueryString");
  id v4 = [v3 stringByReplacingOccurrencesOfString:@"+" withString:@"%2B"];

  v5 = _AKLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Encoded payload for federated auth: %@", (uint8_t *)&v8, 0xCu);
  }

  v6 = [v4 dataUsingEncoding:4];

  return v6;
}

- (AKAuthenticationServerResponse)initWithServerResponse:(id)a3 forAppleID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AKAuthenticationServerResponse;
  int v8 = [(AKAuthenticationServerResponse *)&v12 init];
  if (v8)
  {
    v9 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    serviceTokens = v8->_serviceTokens;
    v8->_serviceTokens = v9;

    objc_storeStrong((id *)&v8->_appleID, a4);
    [(AKAuthenticationServerResponse *)v8 updateWithSecondaryAuthenticationResponse:v6];
  }

  return v8;
}

- (AKAuthenticationServerResponse)initWithServerResponse:(id)a3 responseBody:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AKAuthenticationServerResponse;
  int v8 = [(AKAuthenticationServerResponse *)&v12 init];
  if (v8)
  {
    v9 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    serviceTokens = v8->_serviceTokens;
    v8->_serviceTokens = v9;

    [(AKAuthenticationServerResponse *)v8 _updateAccountInformationWithResultsDictionary:v7];
    [(AKAuthenticationServerResponse *)v8 updateWithSecondaryAuthenticationResponse:v6];
  }

  return v8;
}

- (void)_harvestCommonFieldsFromResponse:(id)a3
{
  id v4 = a3;
  v5 = [v4 allHeaderFields];
  id v6 = [v5 objectForKeyedSubscript:AKAccountNameHeaderKey];
  if (v6) {
    objc_storeStrong((id *)&self->_appleID, v6);
  }
  if (!self->_altDSID)
  {
    id v7 = [v5 objectForKeyedSubscript:AKAltDSIDHeaderKey];
    altDSID = self->_altDSID;
    self->_altDSID = v7;
  }
  if (!self->_dsid)
  {
    v9 = [v5 objectForKeyedSubscript:AKDSIDHeaderKey];
    [(AKAuthenticationServerResponse *)self _updateDSIDWithRawValue:v9];
  }
  if (!self->_altDSID)
  {
    v10 = _AKLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10017B318();
    }
  }
  if (!self->_dsid)
  {
    id v11 = _AKLogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10017B2E4();
    }
  }
  if (self->_appleID && self->_altDSID)
  {
    objc_super v12 = (AKMasterToken *)[objc_alloc((Class)AKMasterToken) initWithAppleID:self->_appleID altDSID:self->_altDSID];
    masterToken = self->_masterToken;
    self->_masterToken = v12;
  }
  objc_msgSend(v4, "ak_acceptedTermsInfo");
  v14 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  acceptedTermsInfo = self->_acceptedTermsInfo;
  self->_acceptedTermsInfo = v14;

  v16 = self->_acceptedTermsInfo;
  if (v16)
  {
    uint64_t v17 = [(NSDictionary *)v16 objectForKeyedSubscript:@"alternateDsid"];

    if (!v17)
    {
      id v18 = [(NSDictionary *)self->_acceptedTermsInfo mutableCopy];
      [v18 setObject:self->_altDSID forKeyedSubscript:@"alternateDsid"];
      v19 = (NSDictionary *)[v18 copy];
      v20 = self->_acceptedTermsInfo;
      self->_acceptedTermsInfo = v19;
    }
  }
  if (!self->_adpCohort)
  {
    id v21 = [v5 objectForKeyedSubscript:AKADPCohortHeaderKey];
    [(AKAuthenticationServerResponse *)self _updateADPCohortWithRawValue:v21];
  }
  if (!self->_edpState)
  {
    id v22 = [v5 objectForKeyedSubscript:AKEDPStateHeaderKey];
    [(AKAuthenticationServerResponse *)self _updateEDPStateWithRawValue:v22];
  }
  if (!self->_passwordVersion)
  {
    id v23 = [v5 objectForKeyedSubscript:AKPasswordVersionHeaderKey];
    [(AKAuthenticationServerResponse *)self _updatePasswordVersionWithRawValue:v23];
  }
  if (!self->_srpProtocol)
  {
    uint64_t v24 = [v5 objectForKeyedSubscript:AKSRPProtocolHeaderKey];
    [(AKAuthenticationServerResponse *)self _updateSRPProtocolWithRawValue:v24];
  }
  if (!self->_srpSalt)
  {
    v25 = [v5 objectForKeyedSubscript:AKSRPSaltHeaderKey];
    [(AKAuthenticationServerResponse *)self _updateSRPSaltWithRawValue:v25];
  }
  if (!self->_srpIteration)
  {
    uint64_t v26 = [v5 objectForKeyedSubscript:AKSRPIterationHeaderKey];
    [(AKAuthenticationServerResponse *)self _updateSRPIterationWithRawValue:v26];
  }
}

- (void)_harvestCommonFieldsFromBody:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!self->_appleID)
  {
    id v6 = [v4 objectForKeyedSubscript:@"acname"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_storeStrong((id *)&self->_appleID, v6);
    }
    else
    {
      id v7 = _AKLogSystem();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_10017B554();
      }
    }
  }
  if (!self->_lastName)
  {
    int v8 = [v5 objectForKeyedSubscript:@"ln"];
    lastName = self->_lastName;
    self->_lastName = v8;
  }
  if (!self->_firstName)
  {
    v10 = [v5 objectForKeyedSubscript:@"fn"];
    firstName = self->_firstName;
    self->_firstName = v10;
  }
  if (!self->_dsid)
  {
    objc_super v12 = [v5 objectForKeyedSubscript:@"DsPrsId"];
    dsid = self->_dsid;
    self->_dsid = v12;
  }
  if (!self->_appleIDSecurityLevel)
  {
    v14 = [v5 objectForKeyedSubscript:@"ut"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      self->_appleIDSecurityLevel = (unint64_t)[v14 unsignedIntegerValue];
    }
    else
    {
      v15 = _AKLogSystem();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_10017B4EC();
      }
    }
  }
  if (!self->_authMode)
  {
    v16 = [v5 objectForKeyedSubscript:AKAuthenticationModeKey];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      self->_authMode = (unint64_t)[v16 unsignedIntegerValue];
    }
    else
    {
      uint64_t v17 = _AKLogSystem();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_10017B484();
      }
    }
  }
  objc_opt_class();
  id v18 = [v5 objectForKeyedSubscript:AKMDMInfoRequiredKey];
  if (objc_opt_isKindOfClass()) {
    id v19 = v18;
  }
  else {
    id v19 = 0;
  }

  self->_isMdmInfoRequired = [v19 BOOLValue];
  if (!self->_altDSID)
  {
    v20 = [v5 objectForKeyedSubscript:@"adsid"];
    altDSID = self->_altDSID;
    self->_altDSID = v20;
  }
  id v22 = [v5 objectForKeyedSubscript:@"ageOfMajority"];
  if (v22)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v23 = v22;
      p_super = &self->_ageOfMajority->super.super;
      self->_ageOfMajority = v23;
    }
    else
    {
      p_super = _AKLogSystem();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR)) {
        sub_10017B41C();
      }
    }
  }
  objc_opt_class();
  id v25 = [v5 objectForKeyedSubscript:AKUserCanAttestAgeKey];
  if (objc_opt_isKindOfClass()) {
    uint64_t v26 = (NSNumber *)v25;
  }
  else {
    uint64_t v26 = 0;
  }

  canAttestAge = self->_canAttestAge;
  self->_canAttestAge = v26;

  v28 = [v5 objectForKeyedSubscript:@"underAge"];
  self->_isUnderAgeOfMajority = [v28 BOOLValue];

  objc_opt_class();
  id v29 = [v5 objectForKeyedSubscript:@"isSiwaEnabled"];
  if (objc_opt_isKindOfClass()) {
    id v30 = v29;
  }
  else {
    id v30 = 0;
  }

  self->_isSiwaForChildEnabled = [v30 BOOLValue];
  v31 = [v5 objectForKeyedSubscript:@"isSenior"];
  self->_isSenior = [v31 BOOLValue];

  v32 = [v5 objectForKeyedSubscript:@"firstPartyApp"];
  self->_isFirstPartyApp = [v32 BOOLValue];

  uint64_t v33 = [v5 objectForKeyedSubscript:@"privateEmail"];
  privateEmail = self->_privateEmail;
  self->_privateEmail = v33;

  uint64_t v35 = [v5 objectForKeyedSubscript:@"primaryEmail"];
  primaryEmail = self->_primaryEmail;
  self->_primaryEmail = v35;

  v37 = [v5 objectForKeyedSubscript:@"primaryEmailVetted"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    self->_primaryEmailVetted = [v37 BOOLValue];
  }
  else
  {
    uint64_t v38 = _AKLogSystem();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
      sub_10017B3B4();
    }
  }
  v39 = [v5 objectForKeyedSubscript:AKProximityEligibleKey];
  if (v39)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      self->_isProximityEligible = [v39 BOOLValue];
    }
    else
    {
      uint64_t v40 = _AKLogSystem();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
        sub_10017B34C();
      }
    }
  }
  objc_opt_class();
  id v41 = [v5 objectForKeyedSubscript:@"groupId"];
  if (objc_opt_isKindOfClass()) {
    v42 = (NSString *)v41;
  }
  else {
    v42 = 0;
  }

  signInWithAppleSharedAccountGroupID = self->_signInWithAppleSharedAccountGroupID;
  self->_signInWithAppleSharedAccountGroupID = v42;

  [(AKAuthenticationServerResponse *)self _harvestManagedAppleIDInfoFromDictionary:v5];
}

- (void)_harvestManagedAppleIDInfoFromDictionary:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"orgType"];
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ([v5 isEqual:@"EDU"])
      {
        unint64_t v6 = 1;
LABEL_12:
        self->_managedOrganizationType = v6;
        goto LABEL_13;
      }
      if ([v5 isEqual:@"ENT"])
      {
        unint64_t v6 = 2;
        goto LABEL_12;
      }
      id v7 = _AKLogSystem();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_10017B76C();
      }
    }
    else
    {
      id v7 = _AKLogSystem();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_10017B7D4((uint64_t)v5, v7);
      }
    }

    unint64_t v6 = 0;
    goto LABEL_12;
  }
LABEL_13:
  int v8 = [v4 objectForKeyedSubscript:@"orgName"];
  if (v8)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = v8;
      managedOrganizationName = self->_managedOrganizationName;
      self->_managedOrganizationName = v9;
    }
    else
    {
      managedOrganizationName = _AKLogSystem();
      if (os_log_type_enabled(managedOrganizationName, OS_LOG_TYPE_ERROR)) {
        sub_10017B6DC((uint64_t)v8, managedOrganizationName);
      }
    }
  }
  id v11 = [v4 objectForKeyedSubscript:@"notificationEmailAvailable"];
  if (v11)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v12 = v11;
      p_super = &self->_isNotificationEmailAvailable->super.super;
      self->_isNotificationEmailAvailable = v12;
    }
    else
    {
      p_super = _AKLogSystem();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR)) {
        sub_10017B64C((uint64_t)v11, p_super);
      }
    }
  }
  v14 = [v4 objectForKeyedSubscript:@"notificationEmail"];
  if (v14)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v15 = v14;
      notificationEmail = self->_notificationEmail;
      self->_notificationEmail = v15;
    }
    else
    {
      notificationEmail = _AKLogSystem();
      if (os_log_type_enabled(notificationEmail, OS_LOG_TYPE_ERROR)) {
        sub_10017B5BC((uint64_t)v14, notificationEmail);
      }
    }
  }
}

- (AKToken)passwordEquivalentToken
{
  return (AKToken *)[(NSMutableDictionary *)self->_serviceTokens objectForKey:@"com.apple.gs.idms.pet"];
}

- (void)_setPasswordEquivalentToken:(id)a3
{
}

- (AKToken)heartbeatToken
{
  return (AKToken *)[(NSMutableDictionary *)self->_serviceTokens objectForKey:@"com.apple.gs.idms.hb"];
}

- (AKToken)inheritanceBeneficiarySetupToken
{
  return (AKToken *)[(NSMutableDictionary *)self->_serviceTokens objectForKeyedSubscript:@"com.apple.gs.idms.beneficiary.add"];
}

- (void)_setHeartbeatToken:(id)a3
{
}

- (AKToken)passwordlessToken
{
  return (AKToken *)[(NSMutableDictionary *)self->_serviceTokens objectForKey:@"com.apple.gs.idms.plt"];
}

- (void)_setPasswordlessToken:(id)a3
{
}

- (AKToken)idmsDataToken
{
  return (AKToken *)[(NSMutableDictionary *)self->_serviceTokens objectForKey:@"com.apple.gs.idmsdata"];
}

- (void)_setIdmsDataToken:(id)a3
{
}

- (BOOL)isUpdateable
{
  return self->_masterToken != 0;
}

- (void)updateWithSecondaryAuthenticationBody:(id)a3
{
  uint64_t v4 = AKIdmsDataKey;
  id v9 = a3;
  v5 = [v9 objectForKeyedSubscript:v4];
  serverInfo = self->_serverInfo;
  self->_serverInfo = v5;

  id v7 = [v9 objectForKeyedSubscript:AKTransactionId];
  transactionId = self->_transactionId;
  self->_transactionId = v7;

  [(AKAuthenticationServerResponse *)self _updateAccountInformationWithResultsDictionary:v9];
}

- (void)_updateAccountInformationWithResultsDictionary:(id)a3
{
  id v56 = a3;
  [(AKAuthenticationServerResponse *)self _harvestCommonFieldsFromBody:v56];
  uint64_t v4 = [v56 objectForKeyedSubscript:@"uireq"];
  v5 = v4;
  if (v4) {
    self->_isServerUIRequired = [v4 BOOLValue];
  }
  v55 = v5;
  unint64_t v6 = [v56 objectForKeyedSubscript:@"fpc"];
  id v7 = v6;
  if (v6) {
    self->_isPasscodeResetRequired = [v6 BOOLValue];
  }
  uint64_t v54 = v7;
  uint64_t v8 = [v56 objectForKeyedSubscript:@"cd"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = +[AKAuthenticationServerResponse decodedConfigurationInfo:v8];
    configurationInfo = self->_configurationInfo;
    self->_configurationInfo = v9;
  }
  uint64_t v53 = (void *)v8;
  id v11 = [v56 objectForKeyedSubscript:@"additionalInfo"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_storeStrong((id *)&self->_additionalInfo, v11);
  }
  uint64_t v52 = v11;
  objc_super v12 = [v56 objectForKeyedSubscript:@"hsa2Phones"];
  objc_opt_class();
  id v13 = v12;
  if (objc_opt_isKindOfClass()) {
    v14 = (NSArray *)v13;
  }
  else {
    v14 = 0;
  }

  trustedPhoneNumbers = self->_trustedPhoneNumbers;
  self->_trustedPhoneNumbers = v14;

  v16 = [v56 objectForKeyedSubscript:@"securityKeys"];
  objc_opt_class();
  id v17 = v16;
  if (objc_opt_isKindOfClass()) {
    id v18 = (NSArray *)v17;
  }
  else {
    id v18 = 0;
  }

  securityKeys = self->_securityKeys;
  self->_securityKeys = v18;

  v20 = [v56 objectForKeyedSubscript:@"loginHandles"];
  objc_opt_class();
  id v21 = v20;
  if (objc_opt_isKindOfClass()) {
    id v22 = (NSArray *)v21;
  }
  else {
    id v22 = 0;
  }

  loginHandles = self->_loginHandles;
  self->_loginHandles = v22;

  uint64_t v24 = [v56 objectForKeyedSubscript:@"canHaveCustodian"];
  if (v24) {
    objc_storeStrong((id *)&self->_canHaveCustodian, v24);
  }
  id v25 = [v56 objectForKeyedSubscript:@"canBeCustodian"];
  if (v25) {
    objc_storeStrong((id *)&self->_canBeCustodian, v25);
  }
  uint64_t v26 = [v56 objectForKeyedSubscript:@"custodianEnabled"];
  if (v26) {
    objc_storeStrong((id *)&self->_custodianEnabled, v26);
  }
  v47 = v25;
  uint64_t v48 = v24;
  v27 = [v56 objectForKeyedSubscript:@"custodianLastUpdateDate"];
  if (v27) {
    objc_storeStrong((id *)&self->_custodianLastModified, v27);
  }
  v45 = v27;
  v28 = [v56 objectForKeyedSubscript:AKInformationCustodianInfosKey];
  objc_opt_class();
  id v29 = v28;
  uint64_t v51 = v13;
  if (objc_opt_isKindOfClass()) {
    id v30 = (NSArray *)v29;
  }
  else {
    id v30 = 0;
  }

  custodianInfos = self->_custodianInfos;
  self->_custodianInfos = v30;

  v32 = [v56 objectForKeyedSubscript:AKInformationBeneficiaryInfoKey];
  objc_opt_class();
  id v33 = v32;
  uint64_t v49 = v21;
  uint64_t v50 = v17;
  if (objc_opt_isKindOfClass()) {
    v34 = (NSArray *)v33;
  }
  else {
    v34 = 0;
  }
  uint64_t v44 = v29;

  beneficiaryInfo = self->_beneficiaryInfo;
  self->_beneficiaryInfo = v34;

  v36 = [v56 objectForKeyedSubscript:@"buuid"];
  id v37 = [objc_alloc((Class)NSUUID) initWithUUIDString:v36];
  if (v37) {
    objc_storeStrong((id *)&self->_beneficiaryIdentifier, v36);
  }
  uint64_t v38 = [v56 objectForKeyedSubscript:@"canHaveBeneficiary"];
  if (v38) {
    objc_storeStrong((id *)&self->_canHaveBeneficiary, v38);
  }
  v46 = v26;
  v39 = [v56 objectForKeyedSubscript:@"canBeBeneficiary"];
  if (v39) {
    objc_storeStrong((id *)&self->_canBeBeneficiary, v39);
  }
  uint64_t v40 = [v56 objectForKeyedSubscript:@"beneficiaryWrappedKey"];
  if ([v40 length]) {
    objc_storeStrong((id *)&self->_beneficiaryWrappedKey, v40);
  }
  id v41 = [v56 objectForKeyedSubscript:@"beneficiaryLastUpdateDate"];
  if (v41) {
    objc_storeStrong((id *)&self->_beneficiaryLastModified, v41);
  }
  v42 = [v56 objectForKeyedSubscript:@"countryCode"];
  if (v42) {
    objc_storeStrong((id *)&self->_appleIDCountryCode, v42);
  }
  v43 = [v56 objectForKeyedSubscript:@"appleManagedAccount"];
  if (v43) {
    objc_storeStrong((id *)&self->_hasMDM, v43);
  }
}

- (BOOL)updateWithSecondaryAuthenticationResponse:(id)a3
{
  return [(AKAuthenticationServerResponse *)self updateWithSecondaryAuthenticationResponse:a3 shouldUpdateDSID:0];
}

- (BOOL)updateWithSecondaryAuthenticationResponse:(id)a3 shouldUpdateDSID:(BOOL)a4
{
  BOOL v149 = a4;
  id v5 = a3;
  unint64_t v6 = _AKLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_10017BF84();
  }

  [(AKAuthenticationServerResponse *)self _harvestCommonFieldsFromResponse:v5];
  id v7 = [v5 allHeaderFields];
  masterToken = self->_masterToken;
  if (!masterToken)
  {
    id v9 = _AKLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10017BF50();
    }

    masterToken = self->_masterToken;
  }
  unsigned __int8 v10 = [(AKMasterToken *)masterToken updateWithHTTPURLResponse:v5];
  id v11 = _AKLogSystem();
  objc_super v12 = v11;
  if (v10)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Successfully obtained a new master token.", buf, 2u);
    }
  }
  else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    sub_10017BF1C();
  }

  v154 = [v7 objectForKeyedSubscript:AKPETHeaderKey];
  uint64_t v13 = +[AKToken tokenWithBase64String:](AKToken, "tokenWithBase64String:");
  v14 = _AKLogSystem();
  v15 = v14;
  if (v13)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Successfully obtained a new PET.", buf, 2u);
    }

    [(AKAuthenticationServerResponse *)self _setPasswordEquivalentToken:v13];
  }
  else
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10017BEB4();
    }

    unsigned __int8 v10 = 0;
  }
  id v152 = [v7 objectForKeyedSubscript:@"X-Apple-HB-Token"];
  uint64_t v16 = +[AKToken tokenWithBase64String:](AKToken, "tokenWithBase64String:");
  id v17 = _AKLogSystem();
  id v18 = v17;
  v156 = v5;
  BOOL v143 = v10;
  v153 = (void *)v13;
  v151 = (void *)v16;
  if (v16)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Successfully obtained a new HB token.", buf, 2u);
    }

    [(AKAuthenticationServerResponse *)self _setHeartbeatToken:v16];
  }
  else
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_10017BE3C(v18, v19, v20, v21, v22, v23, v24, v25);
    }
  }
  id v155 = v7;
  v157 = [v7 objectForKeyedSubscript:@"X-Apple-GS-Token"];
  [v157 componentsSeparatedByString:@", "];
  long long v160 = 0u;
  long long v161 = 0u;
  long long v162 = 0u;
  long long v163 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v26 = [obj countByEnumeratingWithState:&v160 objects:v166 count:16];
  if (v26)
  {
    id v27 = v26;
    uint64_t v28 = *(void *)v161;
    do
    {
      for (i = 0; i != v27; i = (char *)i + 1)
      {
        if (*(void *)v161 != v28) {
          objc_enumerationMutation(obj);
        }
        id v30 = +[AKToken tokenWithBase64String:*(void *)(*((void *)&v160 + 1) + 8 * i)];
        v31 = _AKLogSystem();
        v32 = v31;
        if (v30)
        {
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            id v33 = [v30 name];
            *(_DWORD *)buf = 138412290;
            v165 = v33;
            _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Updating token for service ID %@.", buf, 0xCu);
          }
          serviceTokens = self->_serviceTokens;
          v32 = [v30 name];
          [(NSMutableDictionary *)serviceTokens setObject:v30 forKeyedSubscript:v32];
        }
        else if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v165 = v157;
          _os_log_error_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "Invalid format for service token in header %@", buf, 0xCu);
        }
      }
      id v27 = [obj countByEnumeratingWithState:&v160 objects:v166 count:16];
    }
    while (v27);
  }

  uint64_t v35 = [v155 objectForKeyedSubscript:@"X-Apple-SL-Token"];
  v36 = _AKLogSystem();
  shortLivedToken = (AKToken *)v36;
  if (v35)
  {
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)shortLivedToken, OS_LOG_TYPE_DEFAULT, "Successfully obtained new SLT from secondary auth", buf, 2u);
    }

    uint64_t v38 = +[AKToken tokenWithBase64String:v35];
    shortLivedToken = self->_shortLivedToken;
    self->_shortLivedToken = v38;
  }
  else if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
  {
    sub_10017BDC4(shortLivedToken, v39, v40, v41, v42, v43, v44, v45);
  }

  uint64_t v46 = [v155 objectForKeyedSubscript:@"X-Apple-I-CK"];
  v47 = _AKLogSystem();
  continuationToken = (AKToken *)v47;
  if (v46)
  {
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)continuationToken, OS_LOG_TYPE_DEFAULT, "Successfully obtained new CK from secondary auth", buf, 2u);
    }

    uint64_t v49 = +[AKToken idmsTokenWithBase64String:v46];
    continuationToken = self->_continuationToken;
    self->_continuationToken = v49;
  }
  else if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
  {
    sub_10017BD4C(continuationToken, v50, v51, v52, v53, v54, v55, v56);
  }

  uint64_t v57 = [v155 objectForKeyedSubscript:@"X-Apple-I-PRK"];
  uint64_t v58 = _AKLogSystem();
  passwordResetToken = (AKToken *)v58;
  if (v57)
  {
    if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)passwordResetToken, OS_LOG_TYPE_DEFAULT, "Successfully obtained new PRK from secondary auth.", buf, 2u);
    }

    uint64_t v60 = +[AKToken idmsTokenWithBase64String:v57];
    passwordResetToken = self->_passwordResetToken;
    self->_passwordResetToken = v60;
  }
  else if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
  {
    sub_10017BCD4(passwordResetToken, v61, v62, v63, v64, v65, v66, v67);
  }

  v68 = [v155 objectForKeyedSubscript:@"X-Apple-AK-Auth-Type"];
  if ([v68 isEqual:AKSecurityHeaderTypeHSA2])
  {
    unint64_t v69 = 4;
  }
  else if ([v68 isEqual:AKSecurityHeaderTypeHSA1])
  {
    unint64_t v69 = 3;
  }
  else if ([v68 isEqual:AKSecurityHeaderTypeSA])
  {
    unint64_t v69 = 2;
  }
  else
  {
    if (![v68 isEqual:AKSecurityHeaderTypeManaged]) {
      goto LABEL_66;
    }
    unint64_t v69 = 5;
  }
  self->_appleIDSecurityLevel = v69;
LABEL_66:
  v148 = v68;
  self->_isSecondaryActionRequired = [v156 statusCode] == (id)409;
  uint64_t v70 = [v155 objectForKeyedSubscript:@"X-Apple-I-AURL"];
  if (v70)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v71 = v70;
      secondaryActionURLKey = self->_secondaryActionURLKey;
      self->_secondaryActionURLKey = v71;
    }
    else
    {
      secondaryActionURLKey = _AKLogSystem();
      if (os_log_type_enabled(secondaryActionURLKey, OS_LOG_TYPE_ERROR)) {
        sub_10017BC5C(secondaryActionURLKey, v73, v74, v75, v76, v77, v78, v79);
      }
    }
  }
  uint64_t v80 = [v155 objectForKeyedSubscript:@"X-Apple-I-AURL-Type"];
  if ([v80 intValue])
  {
    BOOL v81 = [v80 intValue] == 1 && self->_isSecondaryActionRequired;
    self->_secondaryActionURLGSEndpoint = v81;
  }
  uint64_t v82 = [v155 objectForKeyedSubscript:@"X-Apple-I-NAURL"];
  v146 = (void *)v82;
  if (v82)
  {
    v83 = (void *)v82;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char v84 = v83;
      nativeActionURLKey = self->_nativeActionURLKey;
      self->_nativeActionURLKey = v84;
    }
    else
    {
      nativeActionURLKey = _AKLogSystem();
      if (os_log_type_enabled(nativeActionURLKey, OS_LOG_TYPE_ERROR)) {
        sub_10017BBE4(nativeActionURLKey, v86, v87, v88, v89, v90, v91, v92);
      }
    }
  }
  id v93 = [v155 objectForKeyedSubscript:@"X-Apple-I-Device-Terms"];
  id v158 = (void *)v46;
  if (v93)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v93 integerValue]);
      uint64_t v94 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      acceptedDeviceTermsVersion = self->_acceptedDeviceTermsVersion;
      self->_acceptedDeviceTermsVersion = v94;

      uint64_t v96 = _AKLogSystem();
      if (os_log_type_enabled(v96, OS_LOG_TYPE_DEBUG)) {
        sub_10017BAC8((uint64_t *)&self->_acceptedDeviceTermsVersion, v96);
      }
    }
    else
    {
      uint64_t v96 = _AKLogSystem();
      if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR)) {
        sub_10017BB58((uint64_t)v93, v96);
      }
    }
  }
  else
  {
    uint64_t v96 = _AKLogSystem();
    if (os_log_type_enabled(v96, OS_LOG_TYPE_DEBUG)) {
      sub_10017BA50(v96, v97, v98, v99, v100, v101, v102, v103);
    }
  }

  if (v149)
  {
    uint64_t v104 = [v155 objectForKeyedSubscript:AKDSIDHeaderKey];
    [(AKAuthenticationServerResponse *)self _updateDSIDWithRawValue:v104];
  }
  v105 = [v155 objectForKeyedSubscript:@"X-Apple-I-Recovery-Session-Id"];
  if (v105)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v106 = v105;
      custodianSessionID = self->_custodianSessionID;
      self->_custodianSessionID = v106;
    }
    else
    {
      custodianSessionID = _AKLogSystem();
      if (os_log_type_enabled(custodianSessionID, OS_LOG_TYPE_ERROR)) {
        sub_10017B9D8(custodianSessionID, v108, v109, v110, v111, v112, v113, v114);
      }
    }
  }
  id v144 = v93;
  v145 = v80;
  uint64_t v147 = v70;
  v150 = (void *)v57;
  v115 = (void *)v35;
  id v116 = [v155 objectForKeyedSubscript:AKADPCohortHeaderKey];
  -[AKAuthenticationServerResponse _updateADPCohortWithRawValue:](self, "_updateADPCohortWithRawValue:");
  v117 = [v155 objectForKeyedSubscript:AKEDPStateHeaderKey];
  [(AKAuthenticationServerResponse *)self _updateEDPStateWithRawValue:v117];
  v118 = [v155 objectForKeyedSubscript:AKPasswordVersionHeaderKey];
  [(AKAuthenticationServerResponse *)self _updatePasswordVersionWithRawValue:v118];
  id v119 = +[AKFeatureManager sharedManager];
  unsigned int v120 = [v119 isBackgroundiCloudSignInEnabled];

  if (v120)
  {
    v121 = [(NSMutableDictionary *)self->_serviceTokens objectForKeyedSubscript:@"com.apple.gs.icloud.cloudkit.auth"];

    if (!v121)
    {
      id v122 = _AKLogSystem();
      if (os_log_type_enabled(v122, OS_LOG_TYPE_DEBUG)) {
        sub_10017B960(v122, v123, v124, v125, v126, v127, v128, v129);
      }
    }
    id v130 = [(NSMutableDictionary *)self->_serviceTokens objectForKeyedSubscript:@"com.apple.gs.icloud.escrow.auth"];

    if (!v130)
    {
      v131 = _AKLogSystem();
      if (os_log_type_enabled(v131, OS_LOG_TYPE_DEBUG)) {
        sub_10017B8E8(v131, v132, v133, v134, v135, v136, v137, v138);
      }
    }
    self->_canBackgroundiCloudSignIn = [(AKAuthenticationServerResponse *)self _shouldBackgroundiCloudSignIn];
  }
  [(AKAuthenticationServerResponse *)self reportCriticalAuthTokensTelemetryForFlow:2 withTokenGenerationInfo:0];
  objc_opt_class();
  objc_opt_class();
  id v139 = [v155 objectForKeyedSubscript:AKMDMInfoRequiredHeaderKey];
  id v140 = 0;
  if (objc_opt_isKindOfClass()) {
    id v140 = v139;
  }

  if (v140)
  {
    v141 = _AKLogSystem();
    if (os_log_type_enabled(v141, OS_LOG_TYPE_DEBUG)) {
      sub_10017B864();
    }

    self->_isMdmInfoRequired = [v140 BOOLValue];
  }

  return v143;
}

- (void)_updateDSIDWithRawValue:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_storeStrong((id *)&self->_dsid, a3);
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v6 = [(AKAuthenticationServerResponse *)self _numberFormatter];
      id v7 = [v6 numberFromString:v5];
      dsid = self->_dsid;
      self->_dsid = v7;
    }
    else
    {
      id v9 = _AKLogSystem();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_10017BFEC();
      }
    }
  }
}

- (void)_updateADPCohortWithRawValue:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  unint64_t v6 = _AKLogSystem();
  adpCohort = (NSNumber *)v6;
  if (isKindOfClass)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      sub_10017C054((uint64_t)self, &adpCohort->super.super);
    }

    uint64_t v8 = (NSNumber *)v4;
    adpCohort = self->_adpCohort;
    self->_adpCohort = v8;
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    sub_10017C0E8();
  }
}

- (void)_updateEDPStateWithRawValue:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_storeStrong((id *)&self->_edpState, a3);
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v5 integerValue]);
      unint64_t v6 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      edpState = self->_edpState;
      self->_edpState = v6;
    }
    else
    {
      uint64_t v8 = _AKLogSystem();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_10017C150();
      }
    }
  }
}

- (void)_updatePasswordVersionWithRawValue:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_storeStrong((id *)&self->_passwordVersion, a3);
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v5 integerValue]);
      unint64_t v6 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      passwordVersion = self->_passwordVersion;
      self->_passwordVersion = v6;
    }
    else
    {
      uint64_t v8 = _AKLogSystem();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_10017C1B8();
      }
    }
  }
}

- (void)_updateSRPProtocolWithRawValue:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_storeStrong((id *)&self->_srpProtocol, a3);
  }
  else
  {
    unint64_t v6 = _AKLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10017C220();
    }
  }
}

- (void)_updateSRPSaltWithRawValue:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_storeStrong((id *)&self->_srpSalt, a3);
  }
  else
  {
    unint64_t v6 = _AKLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10017C288();
    }
  }
}

- (void)_updateSRPIterationWithRawValue:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_storeStrong((id *)&self->_srpIteration, a3);
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v5 integerValue]);
      unint64_t v6 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      srpIteration = self->_srpIteration;
      self->_srpIteration = v6;
    }
    else
    {
      uint64_t v8 = _AKLogSystem();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_10017C2F0();
      }
    }
  }
}

- (id)_decodeBase64String:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)NSData) initWithBase64EncodedString:v3 options:0];

  id v5 = [objc_alloc((Class)NSString) initWithData:v4 encoding:4];

  return v5;
}

- (id)_numberFormatter
{
  if (qword_100272278 != -1) {
    dispatch_once(&qword_100272278, &stru_100226F40);
  }
  v2 = (void *)qword_100272270;

  return v2;
}

- (BOOL)_shouldBackgroundiCloudSignIn
{
  id v3 = +[AKURLBag bagForAltDSID:0];
  unsigned int v4 = [v3 isBackgroundiCloudSignInEnabled];

  if (!v4) {
    goto LABEL_7;
  }
  uint64_t v5 = [(NSMutableDictionary *)self->_serviceTokens objectForKeyedSubscript:@"com.apple.gs.icloud.cloudkit.auth"];
  if (!v5) {
    return v5;
  }
  unint64_t v6 = (void *)v5;
  id v7 = [(NSMutableDictionary *)self->_serviceTokens objectForKeyedSubscript:@"com.apple.gs.icloud.escrow.auth"];

  if (!v7)
  {
LABEL_7:
    LOBYTE(v5) = 0;
    return v5;
  }
  uint64_t v8 = _AKLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned __int8 v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Elligible for backgrounding iCloud Sign In", v10, 2u);
  }

  LOBYTE(v5) = 1;
  return v5;
}

- (void)reportCriticalAuthTokensTelemetryForFlow:(unint64_t)a3 withTokenGenerationInfo:(id)a4
{
  id v24 = a4;
  unint64_t v6 = +[AKAccountManager sharedInstance];
  id v7 = [v6 authKitAccountWithAltDSID:self->_altDSID error:0];
  if (![(AKAuthenticationServerResponse *)self shouldReportTokenGenerationMetricsWithTokenGenerationInfo:v24])goto LABEL_24; {
  uint64_t v8 = [(AKToken *)self->_passwordResetToken stringValue];
  }
  id v9 = [(AKToken *)self->_continuationToken stringValue];
  objc_opt_class();
  id v10 = [v24 objectForKeyedSubscript:@"ckgen"];
  if (objc_opt_isKindOfClass()) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  unsigned int v12 = [v11 BOOLValue];
  objc_opt_class();
  id v13 = [v24 objectForKeyedSubscript:@"prkgen"];
  if (objc_opt_isKindOfClass()) {
    id v14 = v13;
  }
  else {
    id v14 = 0;
  }

  unsigned int v15 = [v14 BOOLValue];
  if (a3 == 1)
  {
    if (v9) {
      char v16 = 0;
    }
    else {
      char v16 = v12;
    }
    if (v8) {
      unsigned int v17 = 0;
    }
    else {
      unsigned int v17 = v15;
    }
    int v18 = v17 & v12;
    if (v16)
    {
LABEL_16:
      uint64_t v19 = +[NSError ak_errorWithCode:-7116];
      [v6 _reportTokenWithTelemetryID:@"com.apple.authkit.token.ck.create" account:v7 telemetryFlowID:0 error:v19];

      if ((v18 & 1) == 0) {
        goto LABEL_21;
      }
      goto LABEL_20;
    }
  }
  else
  {
    int v18 = v8 == 0;
    if (!v9) {
      goto LABEL_16;
    }
  }
  if (v18)
  {
LABEL_20:
    uint64_t v20 = +[NSError ak_errorWithCode:-7117];
    [v6 _reportTokenWithTelemetryID:@"com.apple.authkit.token.prk.create" account:v7 telemetryFlowID:0 error:v20];
  }
LABEL_21:
  uint64_t v21 = [(AKAuthenticationServerResponse *)self heartbeatToken];
  uint64_t v22 = [v21 stringValue];

  if (!v22)
  {
    uint64_t v23 = +[NSError ak_errorWithCode:-7118];
    [v6 _reportTokenWithTelemetryID:@"com.apple.authkit.token.hb.create" account:v7 telemetryFlowID:0 error:v23];
  }
LABEL_24:
}

- (BOOL)shouldReportTokenGenerationMetricsWithTokenGenerationInfo:(id)a3
{
  id v4 = a3;
  if (!self->_errorCode)
  {
    if (self->_isSecondaryActionRequired)
    {
      uint64_t v5 = _AKLogSystem();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
        sub_10017C428();
      }
    }
    else if ((self->_appleIDSecurityLevel & 0xFFFFFFFFFFFFFFFELL) == 4)
    {
      objc_opt_class();
      id v6 = [v4 objectForKeyedSubscript:AKEphemeralAuthKey];
      if (objc_opt_isKindOfClass()) {
        id v7 = v6;
      }
      else {
        id v7 = 0;
      }

      unsigned int v8 = [v7 BOOLValue];
      if (v8)
      {
        uint64_t v5 = _AKLogSystem();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
          sub_10017C358();
        }
      }
      else
      {
        objc_opt_class();
        id v9 = [v4 objectForKeyedSubscript:AKShortLivedTokenKey];
        if (objc_opt_isKindOfClass()) {
          id v10 = v9;
        }
        else {
          id v10 = 0;
        }

        unsigned int v11 = [v10 BOOLValue];
        if (v11)
        {
          uint64_t v5 = _AKLogSystem();
          if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
            sub_10017C38C();
          }
        }
        else
        {
          unsigned int v12 = [v4 objectForKeyedSubscript:AKAppProvidedContextKey];
          unsigned int v13 = [v12 isEqualToString:@"AuthorizationServices"];

          if (!v13)
          {
            BOOL v14 = 1;
            goto LABEL_25;
          }
          uint64_t v5 = _AKLogSystem();
          if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
            sub_10017C3C0();
          }
        }
      }
    }
    else
    {
      uint64_t v5 = _AKLogSystem();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
        sub_10017C3F4();
      }
    }
  }
  BOOL v14 = 0;
LABEL_25:

  return v14;
}

- (NSDictionary)serverProvidedData
{
  return self->_serverProvidedData;
}

- (NSString)appleID
{
  return self->_appleID;
}

- (NSNumber)dsid
{
  return self->_dsid;
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (NSArray)aliases
{
  return self->_aliases;
}

- (unint64_t)appleIDSecurityLevel
{
  return self->_appleIDSecurityLevel;
}

- (unint64_t)authMode
{
  return self->_authMode;
}

- (BOOL)isMdmInfoRequired
{
  return self->_isMdmInfoRequired;
}

- (AKMasterToken)masterToken
{
  return self->_masterToken;
}

- (AKToken)continuationToken
{
  return self->_continuationToken;
}

- (AKToken)passwordResetToken
{
  return self->_passwordResetToken;
}

- (AKToken)shortLivedToken
{
  return self->_shortLivedToken;
}

- (AKToken)custodianSetupToken
{
  return self->_custodianSetupToken;
}

- (NSDictionary)serviceTokens
{
  return &self->_serviceTokens->super;
}

- (BOOL)isRetryRequired
{
  return self->_isRetryRequired;
}

- (BOOL)isSecondaryActionRequired
{
  return self->_isSecondaryActionRequired;
}

- (BOOL)canBackgroundiCloudSignIn
{
  return self->_canBackgroundiCloudSignIn;
}

- (NSString)secondaryActionURLKey
{
  return self->_secondaryActionURLKey;
}

- (BOOL)isSecondaryActionURLGSEndpoint
{
  return self->_secondaryActionURLGSEndpoint;
}

- (BOOL)isFidoAuthRequired
{
  return self->_fidoAuthRequired;
}

- (NSString)secondaryActionMessage
{
  return self->_secondaryActionMessage;
}

- (BOOL)isURLSwitchingRequired
{
  return self->_isURLSwitchingRequired;
}

- (NSString)urlSwitchingData
{
  return self->_urlSwitchingData;
}

- (BOOL)isAnisetteResyncRequired
{
  return self->_isAnisetteResyncRequired;
}

- (NSData)anisetteResyncData
{
  return self->_anisetteResyncData;
}

- (BOOL)isAnisetteReprovisioningRequired
{
  return self->_isAnisetteReprovisioningRequired;
}

- (BOOL)shouldProxyAnisetteAction
{
  return self->_shouldProxyAnisetteAction;
}

- (int64_t)errorCode
{
  return self->_errorCode;
}

- (int64_t)subErrorCode
{
  return self->_subErrorCode;
}

- (NSString)errorMessageTitle
{
  return self->_errorMessageTitle;
}

- (NSString)errorMessage
{
  return self->_errorMessage;
}

- (NSDictionary)acceptedTermsInfo
{
  return self->_acceptedTermsInfo;
}

- (BOOL)isManagedAppleID
{
  return self->_isManagedAppleID;
}

- (BOOL)isAuditLogin
{
  return self->_isAuditLogin;
}

- (BOOL)isServerUIRequired
{
  return self->_isServerUIRequired;
}

- (BOOL)isPasscodeResetRequired
{
  return self->_isPasscodeResetRequired;
}

- (BOOL)requireSigningHeaders
{
  return self->_requireSigningHeaders;
}

- (NSDictionary)configurationInfo
{
  return self->_configurationInfo;
}

- (NSNumber)acceptedDeviceTermsVersion
{
  return self->_acceptedDeviceTermsVersion;
}

- (NSString)transactionId
{
  return self->_transactionId;
}

- (NSString)serverInfo
{
  return self->_serverInfo;
}

- (BOOL)allowPiggybacking
{
  return self->_allowPiggybacking;
}

- (BOOL)allowPiggybackingPresence
{
  return self->_allowPiggybackingPresence;
}

- (BOOL)isUnderAgeOfMajority
{
  return self->_isUnderAgeOfMajority;
}

- (BOOL)isSiwaForChildEnabled
{
  return self->_isSiwaForChildEnabled;
}

- (BOOL)isSenior
{
  return self->_isSenior;
}

- (NSNumber)ageOfMajority
{
  return self->_ageOfMajority;
}

- (NSNumber)canAttestAge
{
  return self->_canAttestAge;
}

- (BOOL)isFirstPartyApp
{
  return self->_isFirstPartyApp;
}

- (NSString)privateEmail
{
  return self->_privateEmail;
}

- (NSString)primaryEmail
{
  return self->_primaryEmail;
}

- (BOOL)primaryEmailVetted
{
  return self->_primaryEmailVetted;
}

- (NSDictionary)additionalInfo
{
  return self->_additionalInfo;
}

- (NSArray)trustedPhoneNumbers
{
  return self->_trustedPhoneNumbers;
}

- (NSArray)securityKeys
{
  return self->_securityKeys;
}

- (NSArray)loginHandles
{
  return self->_loginHandles;
}

- (NSString)nativeActionURLKey
{
  return self->_nativeActionURLKey;
}

- (NSNumber)canHaveCustodian
{
  return self->_canHaveCustodian;
}

- (NSNumber)canBeCustodian
{
  return self->_canBeCustodian;
}

- (NSNumber)custodianEnabled
{
  return self->_custodianEnabled;
}

- (NSString)custodianSessionID
{
  return self->_custodianSessionID;
}

- (NSNumber)custodianLastModified
{
  return self->_custodianLastModified;
}

- (NSArray)custodianInfos
{
  return self->_custodianInfos;
}

- (NSArray)beneficiaryInfo
{
  return self->_beneficiaryInfo;
}

- (NSNumber)canHaveBeneficiary
{
  return self->_canHaveBeneficiary;
}

- (NSNumber)canBeBeneficiary
{
  return self->_canBeBeneficiary;
}

- (NSString)beneficiaryIdentifier
{
  return self->_beneficiaryIdentifier;
}

- (NSString)beneficiaryWrappedKey
{
  return self->_beneficiaryWrappedKey;
}

- (NSNumber)beneficiaryLastModified
{
  return self->_beneficiaryLastModified;
}

- (NSString)appleIDCountryCode
{
  return self->_appleIDCountryCode;
}

- (NSNumber)hasMDM
{
  return self->_hasMDM;
}

- (unint64_t)managedOrganizationType
{
  return self->_managedOrganizationType;
}

- (NSString)managedOrganizationName
{
  return self->_managedOrganizationName;
}

- (NSNumber)isNotificationEmailAvailable
{
  return self->_isNotificationEmailAvailable;
}

- (NSString)notificationEmail
{
  return self->_notificationEmail;
}

- (NSNumber)privateAttestationEnabled
{
  return self->_privateAttestationEnabled;
}

- (NSNumber)webAccessEnabled
{
  return self->_webAccessEnabled;
}

- (NSNumber)serverExperimentalFeatures
{
  return self->_serverExperimentalFeatures;
}

- (NSNumber)hasSOSActiveDevice
{
  return self->_hasSOSActiveDevice;
}

- (NSNumber)SOSNeeded
{
  return self->_SOSNeeded;
}

- (NSString)configDataVersion
{
  return self->_configDataVersion;
}

- (NSString)firstName
{
  return self->_firstName;
}

- (NSString)lastName
{
  return self->_lastName;
}

- (NSString)imageURLString
{
  return self->_imageURLString;
}

- (BOOL)isDemoAccount
{
  return self->_isDemoAccount;
}

- (NSString)federatedAuthURL
{
  return self->_federatedAuthURL;
}

- (NSData)federatedAuthRequestPayload
{
  return self->_federatedAuthRequestPayload;
}

- (NSDictionary)federatedAuthSamlRequest
{
  return self->_federatedAuthSamlRequest;
}

- (NSArray)federatedAuthURLWhiteList
{
  return self->_federatedAuthURLWhiteList;
}

- (BOOL)authorizationUsed
{
  return self->_authorizationUsed;
}

- (BOOL)phoneAsAppleID
{
  return self->_phoneAsAppleID;
}

- (NSNumber)passkeyEligible
{
  return self->_passkeyEligible;
}

- (NSNumber)passkeyPresent
{
  return self->_passkeyPresent;
}

- (BOOL)isProximityEligible
{
  return self->_isProximityEligible;
}

- (NSNumber)passcodeAuthEnabled
{
  return self->_passcodeAuthEnabled;
}

- (NSNumber)passcodeAuth
{
  return self->_passcodeAuth;
}

- (NSNumber)askToBuy
{
  return self->_askToBuy;
}

- (NSNumber)birthYear
{
  return self->_birthYear;
}

- (NSNumber)birthDay
{
  return self->_birthDay;
}

- (NSNumber)birthMonth
{
  return self->_birthMonth;
}

- (NSNumber)hasModernRecoveryKey
{
  return self->_hasModernRecoveryKey;
}

- (NSNumber)thirdPartyRegulatoryOverride
{
  return self->_thirdPartyRegulatoryOverride;
}

- (NSNumber)adpCohort
{
  return self->_adpCohort;
}

- (NSNumber)edpState
{
  return self->_edpState;
}

- (NSNumber)passwordVersion
{
  return self->_passwordVersion;
}

- (NSString)srpProtocol
{
  return self->_srpProtocol;
}

- (NSString)srpSalt
{
  return self->_srpSalt;
}

- (NSNumber)srpIteration
{
  return self->_srpIteration;
}

- (NSString)signInWithAppleSharedAccountGroupID
{
  return self->_signInWithAppleSharedAccountGroupID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signInWithAppleSharedAccountGroupID, 0);
  objc_storeStrong((id *)&self->_srpIteration, 0);
  objc_storeStrong((id *)&self->_srpSalt, 0);
  objc_storeStrong((id *)&self->_srpProtocol, 0);
  objc_storeStrong((id *)&self->_passwordVersion, 0);
  objc_storeStrong((id *)&self->_edpState, 0);
  objc_storeStrong((id *)&self->_adpCohort, 0);
  objc_storeStrong((id *)&self->_thirdPartyRegulatoryOverride, 0);
  objc_storeStrong((id *)&self->_hasModernRecoveryKey, 0);
  objc_storeStrong((id *)&self->_birthMonth, 0);
  objc_storeStrong((id *)&self->_birthDay, 0);
  objc_storeStrong((id *)&self->_birthYear, 0);
  objc_storeStrong((id *)&self->_askToBuy, 0);
  objc_storeStrong((id *)&self->_passcodeAuth, 0);
  objc_storeStrong((id *)&self->_passcodeAuthEnabled, 0);
  objc_storeStrong((id *)&self->_passkeyPresent, 0);
  objc_storeStrong((id *)&self->_passkeyEligible, 0);
  objc_storeStrong((id *)&self->_federatedAuthURLWhiteList, 0);
  objc_storeStrong((id *)&self->_federatedAuthSamlRequest, 0);
  objc_storeStrong((id *)&self->_federatedAuthRequestPayload, 0);
  objc_storeStrong((id *)&self->_federatedAuthURL, 0);
  objc_storeStrong((id *)&self->_imageURLString, 0);
  objc_storeStrong((id *)&self->_lastName, 0);
  objc_storeStrong((id *)&self->_firstName, 0);
  objc_storeStrong((id *)&self->_configDataVersion, 0);
  objc_storeStrong((id *)&self->_SOSNeeded, 0);
  objc_storeStrong((id *)&self->_hasSOSActiveDevice, 0);
  objc_storeStrong((id *)&self->_serverExperimentalFeatures, 0);
  objc_storeStrong((id *)&self->_webAccessEnabled, 0);
  objc_storeStrong((id *)&self->_privateAttestationEnabled, 0);
  objc_storeStrong((id *)&self->_notificationEmail, 0);
  objc_storeStrong((id *)&self->_isNotificationEmailAvailable, 0);
  objc_storeStrong((id *)&self->_managedOrganizationName, 0);
  objc_storeStrong((id *)&self->_hasMDM, 0);
  objc_storeStrong((id *)&self->_appleIDCountryCode, 0);
  objc_storeStrong((id *)&self->_beneficiaryLastModified, 0);
  objc_storeStrong((id *)&self->_beneficiaryWrappedKey, 0);
  objc_storeStrong((id *)&self->_beneficiaryIdentifier, 0);
  objc_storeStrong((id *)&self->_canBeBeneficiary, 0);
  objc_storeStrong((id *)&self->_canHaveBeneficiary, 0);
  objc_storeStrong((id *)&self->_beneficiaryInfo, 0);
  objc_storeStrong((id *)&self->_custodianInfos, 0);
  objc_storeStrong((id *)&self->_custodianLastModified, 0);
  objc_storeStrong((id *)&self->_custodianSessionID, 0);
  objc_storeStrong((id *)&self->_custodianEnabled, 0);
  objc_storeStrong((id *)&self->_canBeCustodian, 0);
  objc_storeStrong((id *)&self->_canHaveCustodian, 0);
  objc_storeStrong((id *)&self->_nativeActionURLKey, 0);
  objc_storeStrong((id *)&self->_loginHandles, 0);
  objc_storeStrong((id *)&self->_securityKeys, 0);
  objc_storeStrong((id *)&self->_trustedPhoneNumbers, 0);
  objc_storeStrong((id *)&self->_additionalInfo, 0);
  objc_storeStrong((id *)&self->_primaryEmail, 0);
  objc_storeStrong((id *)&self->_privateEmail, 0);
  objc_storeStrong((id *)&self->_canAttestAge, 0);
  objc_storeStrong((id *)&self->_ageOfMajority, 0);
  objc_storeStrong((id *)&self->_serverInfo, 0);
  objc_storeStrong((id *)&self->_transactionId, 0);
  objc_storeStrong((id *)&self->_acceptedDeviceTermsVersion, 0);
  objc_storeStrong((id *)&self->_configurationInfo, 0);
  objc_storeStrong((id *)&self->_acceptedTermsInfo, 0);
  objc_storeStrong((id *)&self->_errorMessage, 0);
  objc_storeStrong((id *)&self->_errorMessageTitle, 0);
  objc_storeStrong((id *)&self->_anisetteResyncData, 0);
  objc_storeStrong((id *)&self->_urlSwitchingData, 0);
  objc_storeStrong((id *)&self->_secondaryActionMessage, 0);
  objc_storeStrong((id *)&self->_secondaryActionURLKey, 0);
  objc_storeStrong((id *)&self->_custodianSetupToken, 0);
  objc_storeStrong((id *)&self->_shortLivedToken, 0);
  objc_storeStrong((id *)&self->_passwordResetToken, 0);
  objc_storeStrong((id *)&self->_continuationToken, 0);
  objc_storeStrong((id *)&self->_masterToken, 0);
  objc_storeStrong((id *)&self->_aliases, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
  objc_storeStrong((id *)&self->_dsid, 0);
  objc_storeStrong((id *)&self->_appleID, 0);
  objc_storeStrong((id *)&self->_serverProvidedData, 0);

  objc_storeStrong((id *)&self->_serviceTokens, 0);
}

@end
@interface AKSRPContextHelper
- (ACAccount)authKitAccount;
- (AKAuthenticationContext)authContext;
- (AKClient)client;
- (AKSRPContextHelper)initWithContext:(id)a3;
- (BOOL)biometricAuth;
- (BOOL)eligibleForContinuationKeyAuthentication;
- (BOOL)hasSOSActiveDevice;
- (BOOL)ignoreInternalTokens;
- (BOOL)isContextSecretValidForSRP:(id *)a3;
- (BOOL)passcodeAuth;
- (BOOL)passcodeAuthEnabled;
- (BOOL)retryAuth;
- (BOOL)walrusEnabled;
- (BOOL)walrusWebAccessEnabled;
- (NSDictionary)additionalHeaders;
- (NSString)accountRecoveryMasterKey;
- (NSString)altDSID;
- (NSString)decodedRecoveryIdentityToken;
- (NSString)decodedRecoveryPET;
- (NSString)idmsDataToken;
- (NSString)password;
- (NSString)passwordResetToken;
- (NSString)passwordlessToken;
- (NSString)username;
- (id)_anisetteHeadersFromAttestationData:(id)a3;
- (id)authKitAccount:(id *)a3;
- (id)continuationToken:(id *)a3;
- (void)_addExperimentalFeaturesInfoToClientProvidedData:(id)a3;
- (void)_clearDeviceListCacheForAltDSID:(id)a3;
- (void)authenticationParametersWithCompletion:(id)a3;
- (void)clearContinuationTokenIfSupportedWithError:(id)a3;
- (void)setAccountRecoveryMasterKey:(id)a3;
- (void)setAdditionalHeaders:(id)a3;
- (void)setAltDSID:(id)a3;
- (void)setAuthContext:(id)a3;
- (void)setAuthKitAccount:(id)a3;
- (void)setBiometricAuth:(BOOL)a3;
- (void)setClient:(id)a3;
- (void)setDecodedRecoveryIdentityToken:(id)a3;
- (void)setDecodedRecoveryPET:(id)a3;
- (void)setHasSOSActiveDevice:(BOOL)a3;
- (void)setIdmsDataToken:(id)a3;
- (void)setIgnoreInternalTokens:(BOOL)a3;
- (void)setPasscodeAuth:(BOOL)a3;
- (void)setPasscodeAuthEnabled:(BOOL)a3;
- (void)setPassword:(id)a3;
- (void)setPasswordlessToken:(id)a3;
- (void)setRetryAuth:(BOOL)a3;
- (void)setUsername:(id)a3;
- (void)setWalrusEnabled:(BOOL)a3;
- (void)setWalrusWebAccessEnabled:(BOOL)a3;
@end

@implementation AKSRPContextHelper

- (AKSRPContextHelper)initWithContext:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AKSRPContextHelper;
  v6 = [(AKSRPContextHelper *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_authContext, a3);
  }

  return v7;
}

- (BOOL)isContextSecretValidForSRP:(id *)a3
{
  if (self->_password)
  {
    v3 = _AKLogSystem();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      sub_100193D80();
    }
LABEL_10:
    BOOL v4 = 1;
    goto LABEL_11;
  }
  if (self->_accountRecoveryMasterKey)
  {
    v3 = _AKLogSystem();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      sub_100193D4C();
    }
    goto LABEL_10;
  }
  if (self->_passwordlessToken)
  {
    v3 = _AKLogSystem();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      sub_100193D18();
    }
    goto LABEL_10;
  }
  id v9 = 0;
  v7 = [(AKSRPContextHelper *)self continuationToken:&v9];
  v3 = v9;
  BOOL v4 = v7 != 0;

  if (v7)
  {
    v8 = _AKLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      sub_100193C6C();
    }
  }
  else
  {
    if (a3) {
      *a3 = v3;
    }
    v8 = _AKLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100193CA0((uint64_t)v3, v8);
    }
  }

LABEL_11:
  return v4;
}

- (void)authenticationParametersWithCompletion:(id)a3
{
  id v108 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  id v5 = objc_alloc_init((Class)NSMutableDictionary);
  id v6 = objc_alloc_init((Class)NSMutableDictionary);
  v7 = [(AKSRPContextHelper *)self username];

  if (v7)
  {
    v8 = [(AKSRPContextHelper *)self username];
    [v4 setObject:v8 forKeyedSubscript:kAppleIDAuthSupportUsername];
  }
  passwordlessToken = self->_passwordlessToken;
  if (passwordlessToken) {
    BOOL v10 = [(NSString *)passwordlessToken length] != 0;
  }
  else {
    BOOL v10 = 0;
  }
  idmsDataToken = self->_idmsDataToken;
  if (idmsDataToken) {
    BOOL v12 = [(NSString *)idmsDataToken length] != 0;
  }
  else {
    BOOL v12 = 0;
  }
  v13 = _AKLogSystem();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v14 = @"NO";
    if (v10) {
      CFStringRef v15 = @"YES";
    }
    else {
      CFStringRef v15 = @"NO";
    }
    if (v12) {
      CFStringRef v14 = @"YES";
    }
    *(_DWORD *)buf = 138412546;
    CFStringRef v116 = v15;
    __int16 v117 = 2112;
    CFStringRef v118 = v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Adding passwordlessToken: %@, and idmsDataToken: %@, to auth-params", buf, 0x16u);
  }

  if (self->_password)
  {
    v16 = v4;
    goto LABEL_18;
  }
  if (v10)
  {
    [v4 setObject:self->_passwordlessToken forKeyedSubscript:kAppleIDAuthSupportPassword];
    if (!v12) {
      goto LABEL_19;
    }
    v16 = v5;
LABEL_18:
    objc_msgSend(v16, "setObject:forKeyedSubscript:");
LABEL_19:
    uint64_t v93 = 0;
    goto LABEL_20;
  }
  v72 = [(AKSRPContextHelper *)self continuationToken:0];
  if (v72
    && [(AKSRPContextHelper *)self eligibleForContinuationKeyAuthentication])
  {
    int v73 = 0;
    int v74 = 1;
    accountRecoveryMasterKey = v72;
  }
  else
  {
    int v74 = 0;
    accountRecoveryMasterKey = self->_accountRecoveryMasterKey;
    if (!accountRecoveryMasterKey)
    {
      uint64_t v93 = 0;
      goto LABEL_128;
    }
    int v73 = 1;
  }
  HIDWORD(v93) = v74;
  [v4 setObject:accountRecoveryMasterKey forKeyedSubscript:kAppleIDAuthSupportPassword];
  LODWORD(v93) = v73;
LABEL_128:

LABEL_20:
  if (self->_biometricAuth)
  {
    v17 = _AKLogSystem();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "bio metric PET requested.", buf, 2u);
    }
    CFStringRef v18 = @"biopet";
LABEL_31:

    [v5 setObject:&__kCFBooleanTrue forKeyedSubscript:v18];
    goto LABEL_32;
  }
  if (self->_passcodeAuth)
  {
    v17 = _AKLogSystem();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "passcode PET requested.", buf, 2u);
    }
    CFStringRef v18 = @"passcodepet";
    goto LABEL_31;
  }
LABEL_32:
  uint64_t v19 = [(AKSRPContextHelper *)self altDSID];
  if (v19)
  {
    v20 = (void *)v19;
    v21 = [(AKAuthenticationContext *)self->_authContext appProvidedContext];

    if (!v21)
    {
      v22 = _AKLogSystem();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v23 = [(AKSRPContextHelper *)self altDSID];
        *(_DWORD *)buf = 138412290;
        CFStringRef v116 = v23;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "altDSID is available for auth: %@", buf, 0xCu);
      }
      v24 = [(AKSRPContextHelper *)self altDSID];
      [v4 setObject:v24 forKeyedSubscript:kAppleIDAuthSupportAlternateDSID];
    }
  }
  if ([(AKSRPContextHelper *)self retryAuth]) {
    [v5 setObject:&__kCFBooleanTrue forKeyedSubscript:@"retry"];
  }
  v25 = +[AKDevice currentDevice];
  uint64_t v26 = [v25 serverFriendlyDescription];

  if (v26) {
    [v4 setObject:v26 forKeyedSubscript:kAppleIDAuthSupportClientInfo];
  }
  v27 = [(AKAuthenticationContext *)self->_authContext companionDevice];
  uint64_t v28 = [v27 serverFriendlyDescription];

  if (v28) {
    [v4 setObject:v28 forKeyedSubscript:kAppleIDAuthSupportCompanionClientInfo];
  }
  v29 = [(AKAuthenticationContext *)self->_authContext proxiedDevice];
  uint64_t v30 = [v29 serverFriendlyDescription];

  if (v30) {
    [v4 setObject:v30 forKeyedSubscript:kAppleIDAuthSupportProxiedClientInfo];
  }
  uint64_t v31 = [(AKAuthenticationContext *)self->_authContext _proxiedAppName];
  if (v31)
  {
    [v5 setObject:v31 forKeyedSubscript:@"papp"];
    [v6 setObject:v31 forKeyedSubscript:AKProxiedAppNameHeader];
  }
  v109 = v4;
  v104 = (void *)v31;
  v106 = (void *)v28;
  v107 = (void *)v26;
  uint64_t v32 = [(AKClient *)self->_client name];
  if (v32)
  {
    [v5 setObject:v32 forKeyedSubscript:@"capp"];
    [v6 setObject:v32 forKeyedSubscript:AKClientAppNameHeader];
  }
  v103 = (void *)v32;
  v33 = [(AKSRPContextHelper *)self client];
  uint64_t v34 = [v33 bundleID];

  v35 = [(AKSRPContextHelper *)self client];
  v36 = [v35 bundleID];
  id v37 = [v36 length];

  if (v37)
  {
    v38 = _AKLogSystem();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG)) {
      sub_100193E64();
    }

    [v6 setObject:v34 forKeyedSubscript:AKClientBundleIDHeader];
    [v5 setObject:v34 forKeyedSubscript:@"cbid"];
  }
  [(AKAuthenticationContext *)self->_authContext serviceType];
  uint64_t v39 = AKStringFromServiceType();
  if (v39)
  {
    [v5 setObject:v39 forKeyedSubscript:@"svct"];
    [v6 setObject:v39 forKeyedSubscript:AKContextTypeHeader];
  }
  v101 = (void *)v39;
  v40 = +[AKDevice currentDevice];
  uint64_t v41 = [v40 uniqueDeviceIdentifier];
  if (v41)
  {
    [v5 setObject:v41 forKeyedSubscript:@"X-Mme-Device-Id"];
    [v6 setObject:v41 forKeyedSubscript:@"X-Mme-Device-Id"];
  }
  uint64_t v42 = [v40 MLBSerialNumber];
  if (v42) {
    [v5 setObject:v42 forKeyedSubscript:@"X-Apple-I-MLB"];
  }
  v105 = (void *)v30;
  uint64_t v43 = [v40 ROMAddress];
  if (v43) {
    [v5 setObject:v43 forKeyedSubscript:@"X-Apple-I-ROM"];
  }
  uint64_t v44 = [v40 serialNumber];
  if (v44) {
    [v5 setObject:v44 forKeyedSubscript:@"X-Apple-I-SRL-NO"];
  }
  v97 = (void *)v44;
  uint64_t v45 = [v40 color];
  if (v45) {
    [v5 setObject:v45 forKeyedSubscript:@"dec"];
  }
  uint64_t v46 = [v40 enclosureColor];
  if (v46) {
    [v5 setObject:v46 forKeyedSubscript:@"dc"];
  }
  v95 = (void *)v46;
  v99 = (void *)v42;
  v100 = (void *)v41;
  uint64_t v47 = [v40 modelNumber];
  if (v47) {
    [v5 setObject:v47 forKeyedSubscript:@"prtn"];
  }
  v94 = (void *)v47;
  v98 = (void *)v43;
  v102 = (void *)v34;
  v48 = [v40 locale];
  v49 = [v48 localeIdentifier];

  if (v49) {
    [v5 setObject:v49 forKeyedSubscript:@"loc"];
  }
  v50 = [v40 locale];
  v51 = [v50 objectForKey:NSLocaleCountryCode];
  v52 = [v51 uppercaseString];

  if (v52) {
    [v5 setObject:v52 forKeyedSubscript:@"cou"];
  }
  v53 = +[AKConfiguration sharedConfiguration];
  id v54 = [v53 shouldAllowExperimentalMode];

  if (v54 == (id)1 && [v40 isInternalBuild])
  {
    v55 = _AKLogSystem();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "Opting into Experimental Mode through SRP", buf, 2u);
    }

    [v5 setObject:&__kCFBooleanTrue forKeyedSubscript:AKExperimentalModeHeaderKey];
  }
  [(AKSRPContextHelper *)self _addExperimentalFeaturesInfoToClientProvidedData:v5];
  v56 = +[AKConfiguration sharedConfiguration];
  id v57 = [v56 requestedCloudPartition];

  v58 = +[NSString stringWithFormat:@"%lu", v57];
  v59 = _AKLogSystem();
  if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    CFStringRef v116 = v58;
    _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEFAULT, "Sending requested cloud partition: %@", buf, 0xCu);
  }

  [v5 setObject:v58 forKeyedSubscript:AKRequestedCloudPartitionHeaderKey];
  v60 = +[AKConfiguration sharedConfiguration];
  id v61 = [v60 shouldEnableTestAccountMode];

  if (v61 == (id)1 && [v40 isInternalBuild])
  {
    v62 = _AKLogSystem();
    if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEFAULT, "Test Account Header Attached", buf, 2u);
    }

    [v5 setObject:&__kCFBooleanTrue forKeyedSubscript:AKTestAccountHeaderKey];
  }
  if ([v40 isMultiUserMode]) {
    [v5 setObject:&__kCFBooleanTrue forKeyedSubscript:@"mu"];
  }
  v96 = (void *)v45;
  unsigned int v63 = [v40 isInternalBuild];
  v64 = +[AKConfiguration sharedConfiguration];
  id v65 = [v64 shouldHideInternalBuildHeader];

  if (v63 && v65 != (id)1) {
    [v5 setObject:&__kCFBooleanTrue forKeyedSubscript:AKInternalBuildHeaderKey];
  }
  v66 = +[NSDate date];
  v67 = objc_msgSend(v66, "ak_serverFriendlyString");

  v68 = v6;
  if (v67) {
    [v5 setObject:v67 forKeyedSubscript:@"X-Apple-I-Client-Time"];
  }
  if (self->_password)
  {
    v69 = _AKLogSystem();
    if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_DEFAULT, "Password available. Will ask for bootstrap password-based auth.", buf, 2u);
    }

    CFStringRef v70 = @"bootstrap";
LABEL_107:
    [v5 setObject:&__kCFBooleanTrue forKeyedSubscript:v70];
    goto LABEL_108;
  }
  if (self->_passwordlessToken)
  {
    v71 = _AKLogSystem();
    if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_DEFAULT, "PasswordlessToken available. Will ask for passwordlessToken-based auth.", buf, 2u);
    }

    CFStringRef v70 = @"pltauth";
    goto LABEL_107;
  }
  if (HIDWORD(v93))
  {
    v76 = _AKLogSystem();
    if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_DEFAULT, "No password, but CK is available. Will ask for ck-based auth.", buf, 2u);
    }

    CFStringRef v70 = @"ckauth";
    goto LABEL_107;
  }
  if (v93)
  {
    v88 = _AKLogSystem();
    if (os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v88, OS_LOG_TYPE_DEFAULT, "Master Key avalable.  Will ask for mk-based auth.", buf, 2u);
    }

    [v5 setObject:&__kCFBooleanTrue forKeyedSubscript:@"mrkauth"];
    v89 = [(AKSRPContextHelper *)self decodedRecoveryPET];

    if (v89)
    {
      v90 = [(AKSRPContextHelper *)self decodedRecoveryPET];
      [v5 setObject:v90 forKeyedSubscript:AKRecoveryPasswordEquivTokenHeader];
    }
    v91 = [(AKSRPContextHelper *)self decodedRecoveryIdentityToken];

    if (v91)
    {
      v92 = [(AKSRPContextHelper *)self decodedRecoveryIdentityToken];
      [v5 setObject:v92 forKeyedSubscript:AKRecoveryIdentityTokenHeader];
    }
  }
LABEL_108:
  v77 = [(AKSRPContextHelper *)self passwordResetToken];
  if (v77) {
    [v5 setObject:v77 forKeyedSubscript:@"X-Apple-I-PRK"];
  }
  v78 = [(AKSRPContextHelper *)self additionalHeaders];

  if (v78)
  {
    v79 = _AKLogSystem();
    if (os_log_type_enabled(v79, OS_LOG_TYPE_DEBUG)) {
      sub_100193DB4(self, v79);
    }

    v80 = [(AKSRPContextHelper *)self additionalHeaders];
    [v68 addEntriesFromDictionary:v80];
  }
  v81 = +[NSNumber numberWithBool:[(AKSRPContextHelper *)self walrusEnabled]];
  [v5 setObject:v81 forKeyedSubscript:@"icdrsDisabled"];

  v82 = +[NSNumber numberWithBool:[(AKSRPContextHelper *)self walrusWebAccessEnabled]];
  [v5 setObject:v82 forKeyedSubscript:@"webAccessEnabled"];

  if ([(AKSRPContextHelper *)self passcodeAuthEnabled]) {
    [v5 setObject:&__kCFBooleanTrue forKeyedSubscript:AKPasscodeAuthHeaderKey];
  }
  v83 = [[AKAnisetteProvisioningService alloc] initWithClient:self->_client authenticationContext:self->_authContext];
  v110[0] = _NSConcreteStackBlock;
  v110[1] = 3221225472;
  v110[2] = sub_1000C9ABC;
  v110[3] = &unk_10022B4C8;
  id v84 = v108;
  id v114 = v84;
  v110[4] = self;
  id v85 = v5;
  id v111 = v85;
  id v86 = v68;
  id v112 = v86;
  id v87 = v109;
  id v113 = v87;
  [(AKAnisetteProvisioningService *)v83 _attestationDataForRequestData:0 completion:v110];
}

- (id)_anisetteHeadersFromAttestationData:(id)a3
{
  id v3 = a3;
  id v4 = +[NSMutableDictionary dictionary];
  v19[0] = AKHTTPHeaderMID;
  v19[1] = AKHTTPHeaderOTP;
  v19[2] = AKHTTPHeaderRoutingInfo;
  v19[3] = AKHTTPHeaderLocalUserUUID;
  +[NSArray arrayWithObjects:v19 count:4];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        v11 = objc_msgSend(v3, "attestationHeaders", (void)v14);
        BOOL v12 = [v11 objectForKeyedSubscript:v10];

        if (v12) {
          [v4 setObject:v12 forKey:v10];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return v4;
}

- (void)_addExperimentalFeaturesInfoToClientProvidedData:(id)a3
{
  id v3 = a3;
  id v4 = +[AKDevice currentDevice];
  unsigned int v5 = [v4 isInternalBuild];

  if (v5)
  {
    id v6 = +[AKConfiguration sharedConfiguration];
    id v7 = [v6 internalFeaturesMaskValue];

    if (v7)
    {
      uint64_t v8 = _AKLogSystem();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 134217984;
        id v12 = v7;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Sending experimental features as %lu", (uint8_t *)&v11, 0xCu);
      }

      id v9 = +[NSNumber numberWithUnsignedInteger:v7];
      uint64_t v10 = [v9 stringValue];
      [v3 setObject:v10 forKeyedSubscript:AKInternalFeatureMasksHeaderKey];
    }
  }
}

- (void)clearContinuationTokenIfSupportedWithError:(id)a3
{
  id v4 = a3;
  if (!self->_password)
  {
    unsigned int v5 = [(AKSRPContextHelper *)self continuationToken:0];

    if (v5)
    {
      id v6 = [(AKSRPContextHelper *)self authKitAccount:0];
      id v7 = _AKLogSystem();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        long long v17 = self;
        __int16 v18 = 2112;
        uint64_t v19 = v6;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@: Attempting to clear continuation token for account (%@)", buf, 0x16u);
      }

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v8 = [(AKAuthenticationContext *)self->_authContext telemetryFlowID];
      }
      else
      {
        uint64_t v8 = 0;
      }
      id v9 = +[AKAccountManager sharedInstance];
      [v9 removeContinuationTokenForAccount:v6 telemetryFlowID:v8 error:v4];

      uint64_t v10 = [(AKAuthenticationContext *)self->_authContext altDSID];
      if (v10)
      {
        int v11 = (void *)v10;
        id v12 = +[AKFeatureManager sharedManager];
        unsigned int v13 = [v12 isDeviceListCacheEnableDryMode];

        if (v13)
        {
          long long v14 = dispatch_get_global_queue(9, 0);
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_1000CA5A0;
          block[3] = &unk_100226FB8;
          block[4] = self;
          dispatch_async(v14, block);
        }
      }
    }
  }
}

- (void)_clearDeviceListCacheForAltDSID:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [AKDeviceListRequester alloc];
  id v6 = +[AKDeviceListStoreManager sharedManager];
  id v7 = objc_opt_new();
  uint64_t v8 = +[AKAccountManager sharedInstance];
  id v9 = [(AKDeviceListRequester *)v5 initWithStoreManager:v6 cdpFactory:v7 accountManager:v8 client:self->_client];

  id v10 = objc_alloc_init((Class)AKDeviceListRequestContext);
  [v10 setAltDSID:v4];

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000CA738;
  v12[3] = &unk_100228018;
  id v13 = v10;
  id v11 = v10;
  [(AKDeviceListRequester *)v9 clearDeviceListCacheWithContext:v11 completionHandler:v12];
}

- (id)authKitAccount:(id *)a3
{
  if (self->_authKitAccount) {
    goto LABEL_7;
  }
  unsigned int v5 = [(AKAuthenticationContext *)self->_authContext altDSID];

  if (v5)
  {
    id v6 = +[AKAccountManager sharedInstance];
    id v7 = [(AKAuthenticationContext *)self->_authContext altDSID];
    uint64_t v8 = [v6 authKitAccountWithAltDSID:v7 error:a3];
    authKitAccount = self->_authKitAccount;
    self->_authKitAccount = v8;

LABEL_6:
LABEL_7:
    id v11 = self->_authKitAccount;
    goto LABEL_8;
  }
  if (self->_username)
  {
    id v6 = +[AKAccountManager sharedInstance];
    id v10 = [v6 authKitAccountWithAppleID:self->_username error:a3];
    id v7 = self->_authKitAccount;
    self->_authKitAccount = v10;
    goto LABEL_6;
  }
  if (a3)
  {
    *a3 = +[NSError ak_errorWithCode:-7050];
  }
  id v13 = _AKLogSystem();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    sub_100193F50();
  }

  id v11 = 0;
LABEL_8:

  return v11;
}

- (id)continuationToken:(id *)a3
{
  if (self->_ignoreInternalTokens)
  {
    if (a3)
    {
      +[NSError ak_errorWithCode:-7027];
      id v4 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  uint64_t v6 = [(AKAuthenticationContext *)self->_authContext companionKeyEnvelope];
  if (!v6
    || (id v7 = (void *)v6,
        [(AKAuthenticationContext *)self->_authContext companionDevice],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        v8,
        v7,
        !v8))
  {
    continuationToken = self->_continuationToken;
    if (!continuationToken)
    {
      id v20 = 0;
      id v13 = [(AKSRPContextHelper *)self authKitAccount:&v20];
      id v14 = v20;
      if (v14)
      {
        long long v15 = v14;
        if (a3) {
          *a3 = v14;
        }

LABEL_15:
        id v4 = 0;
        goto LABEL_16;
      }
      long long v17 = +[AKAccountManager sharedInstance];
      __int16 v18 = [v17 continuationTokenForAccount:v13 error:a3];
      uint64_t v19 = self->_continuationToken;
      self->_continuationToken = v18;

      continuationToken = self->_continuationToken;
    }
    id v4 = continuationToken;
    goto LABEL_16;
  }
  id v9 = _AKLogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = [(AKAuthenticationContext *)self->_authContext companionKeyEnvelope];
    *(_DWORD *)buf = 138412546;
    v22 = self;
    __int16 v23 = 2112;
    v24 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%@: Using continuation key provided by companion key envelope (%@)", buf, 0x16u);
  }
  id v11 = [(AKAuthenticationContext *)self->_authContext companionKeyEnvelope];
  id v4 = [v11 continuationKey];

LABEL_16:

  return v4;
}

- (NSString)passwordResetToken
{
  if (self->_ignoreInternalTokens) {
    goto LABEL_2;
  }
  uint64_t v4 = [(AKAuthenticationContext *)self->_authContext companionKeyEnvelope];
  if (v4
    && (unsigned int v5 = (void *)v4,
        [(AKAuthenticationContext *)self->_authContext companionDevice],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v5,
        v6))
  {
    id v7 = _AKLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = [(AKAuthenticationContext *)self->_authContext companionKeyEnvelope];
      *(_DWORD *)buf = 138412546;
      id v20 = self;
      __int16 v21 = 2112;
      v22 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@: Using password reset key provided by companion key envelope (%@)", buf, 0x16u);
    }
    id v9 = [(AKAuthenticationContext *)self->_authContext companionKeyEnvelope];
    v2 = [v9 passwordResetKey];
  }
  else
  {
    passwordResetToken = self->_passwordResetToken;
    if (!passwordResetToken)
    {
      id v18 = 0;
      id v12 = [(AKSRPContextHelper *)self authKitAccount:&v18];
      id v13 = v18;
      if (v13)
      {
        id v14 = v13;

LABEL_2:
        v2 = 0;
        goto LABEL_10;
      }
      long long v15 = +[AKAccountManager sharedInstance];
      long long v16 = [v15 passwordResetTokenForAccount:v12 error:0];
      long long v17 = self->_passwordResetToken;
      self->_passwordResetToken = v16;

      passwordResetToken = self->_passwordResetToken;
    }
    v2 = passwordResetToken;
  }
LABEL_10:

  return v2;
}

- (NSString)username
{
  username = self->_username;
  if (!username)
  {
    uint64_t v4 = [(AKAuthenticationContext *)self->_authContext companionKeyEnvelope];
    if (v4)
    {
      unsigned int v5 = (void *)v4;
      uint64_t v6 = [(AKAuthenticationContext *)self->_authContext companionDevice];

      if (v6)
      {
        id v7 = _AKLogSystem();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v8 = [(AKAuthenticationContext *)self->_authContext companionKeyEnvelope];
          id v9 = [v8 username];
          id v10 = [(AKAuthenticationContext *)self->_authContext companionKeyEnvelope];
          int v18 = 138412802;
          uint64_t v19 = self;
          __int16 v20 = 2112;
          __int16 v21 = v9;
          __int16 v22 = 2112;
          __int16 v23 = v10;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@: Using username (%@) from companion key envelope (%@)", (uint8_t *)&v18, 0x20u);
        }
        id v11 = [(AKAuthenticationContext *)self->_authContext companionKeyEnvelope];
        id v12 = [v11 username];
        id v13 = self->_username;
        self->_username = v12;
      }
    }
    username = self->_username;
    if (!username)
    {
      id v14 = [(AKSRPContextHelper *)self authKitAccount:0];
      long long v15 = [v14 username];
      long long v16 = self->_username;
      self->_username = v15;

      username = self->_username;
    }
  }

  return username;
}

- (NSString)altDSID
{
  altDSID = self->_altDSID;
  if (!altDSID)
  {
    uint64_t v4 = [(AKAuthenticationContext *)self->_authContext altDSID];
    unsigned int v5 = self->_altDSID;
    self->_altDSID = v4;

    altDSID = self->_altDSID;
    if (!altDSID)
    {
      uint64_t v6 = [(AKAuthenticationContext *)self->_authContext companionKeyEnvelope];
      if (v6)
      {
        id v7 = (void *)v6;
        uint64_t v8 = [(AKAuthenticationContext *)self->_authContext companionDevice];

        if (v8)
        {
          id v9 = _AKLogSystem();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            id v10 = [(AKAuthenticationContext *)self->_authContext companionKeyEnvelope];
            int v19 = 138412546;
            __int16 v20 = self;
            __int16 v21 = 2112;
            __int16 v22 = v10;
            _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%@: Using altDSID from companion key envelope (%@)", (uint8_t *)&v19, 0x16u);
          }
          id v11 = [(AKAuthenticationContext *)self->_authContext companionKeyEnvelope];
          id v12 = [v11 altDSID];
          id v13 = self->_altDSID;
          self->_altDSID = v12;
        }
      }
      altDSID = self->_altDSID;
      if (!altDSID)
      {
        id v14 = +[AKAccountManager sharedInstance];
        long long v15 = [(AKSRPContextHelper *)self authKitAccount:0];
        long long v16 = [v14 altDSIDForAccount:v15];
        long long v17 = self->_altDSID;
        self->_altDSID = v16;

        altDSID = self->_altDSID;
      }
    }
  }

  return altDSID;
}

- (BOOL)eligibleForContinuationKeyAuthentication
{
  if ([(AKAuthenticationContext *)self->_authContext authenticationType] != (id)3
    || [(AKSRPContextHelper *)self biometricAuth])
  {
    return 1;
  }

  return [(AKSRPContextHelper *)self passcodeAuth];
}

- (void)setUsername:(id)a3
{
}

- (NSString)password
{
  return self->_password;
}

- (void)setPassword:(id)a3
{
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

- (NSString)accountRecoveryMasterKey
{
  return self->_accountRecoveryMasterKey;
}

- (void)setAccountRecoveryMasterKey:(id)a3
{
}

- (void)setAltDSID:(id)a3
{
}

- (NSString)decodedRecoveryPET
{
  return self->_decodedRecoveryPET;
}

- (void)setDecodedRecoveryPET:(id)a3
{
}

- (NSString)decodedRecoveryIdentityToken
{
  return self->_decodedRecoveryIdentityToken;
}

- (void)setDecodedRecoveryIdentityToken:(id)a3
{
}

- (AKClient)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
}

- (ACAccount)authKitAccount
{
  return self->_authKitAccount;
}

- (void)setAuthKitAccount:(id)a3
{
}

- (BOOL)ignoreInternalTokens
{
  return self->_ignoreInternalTokens;
}

- (void)setIgnoreInternalTokens:(BOOL)a3
{
  self->_ignoreInternalTokens = a3;
}

- (AKAuthenticationContext)authContext
{
  return self->_authContext;
}

- (void)setAuthContext:(id)a3
{
}

- (BOOL)biometricAuth
{
  return self->_biometricAuth;
}

- (void)setBiometricAuth:(BOOL)a3
{
  self->_biometricAuth = a3;
}

- (BOOL)passcodeAuth
{
  return self->_passcodeAuth;
}

- (void)setPasscodeAuth:(BOOL)a3
{
  self->_passcodeAuth = a3;
}

- (BOOL)retryAuth
{
  return self->_retryAuth;
}

- (void)setRetryAuth:(BOOL)a3
{
  self->_retryAuth = a3;
}

- (BOOL)walrusEnabled
{
  return self->_walrusEnabled;
}

- (void)setWalrusEnabled:(BOOL)a3
{
  self->_walrusEnabled = a3;
}

- (BOOL)walrusWebAccessEnabled
{
  return self->_walrusWebAccessEnabled;
}

- (void)setWalrusWebAccessEnabled:(BOOL)a3
{
  self->_walrusWebAccessEnabled = a3;
}

- (BOOL)hasSOSActiveDevice
{
  return self->_hasSOSActiveDevice;
}

- (void)setHasSOSActiveDevice:(BOOL)a3
{
  self->_hasSOSActiveDevice = a3;
}

- (BOOL)passcodeAuthEnabled
{
  return self->_passcodeAuthEnabled;
}

- (void)setPasscodeAuthEnabled:(BOOL)a3
{
  self->_passcodeAuthEnabled = a3;
}

- (NSDictionary)additionalHeaders
{
  return self->_additionalHeaders;
}

- (void)setAdditionalHeaders:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalHeaders, 0);
  objc_storeStrong((id *)&self->_authContext, 0);
  objc_storeStrong((id *)&self->_authKitAccount, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_decodedRecoveryIdentityToken, 0);
  objc_storeStrong((id *)&self->_decodedRecoveryPET, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
  objc_storeStrong((id *)&self->_accountRecoveryMasterKey, 0);
  objc_storeStrong((id *)&self->_idmsDataToken, 0);
  objc_storeStrong((id *)&self->_passwordlessToken, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_passwordResetToken, 0);

  objc_storeStrong((id *)&self->_continuationToken, 0);
}

@end
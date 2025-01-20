@interface AKSRPAuthenticationContextHelper
- (AKAppleIDAuthenticationContext)authContext;
- (AKSRPAuthenticationContextHelper)initWithContext:(id)a3;
- (BOOL)_masterKeyAsSecondFactor;
- (BOOL)canPresentRemoteUI;
- (id)_identityAuthorizationPayload;
- (id)_passwordResetBackupToken;
- (void)_authenticationParameters:(id)a3;
- (void)_setMasterKeyAsSecondFactor:(BOOL)a3;
- (void)_updateHeadersWithCompanionAnisetteData:(id)a3 clientProvidedData:(id)a4 completion:(id)a5;
- (void)_updateHeadersWithProxiedDeviceAnisetteData:(id)a3 clientProvidedData:(id)a4 completion:(id)a5;
- (void)authenticationParametersWithCompletion:(id)a3;
- (void)clientProvidedDataHelper:(id)a3;
- (void)setAuthContext:(id)a3;
@end

@implementation AKSRPAuthenticationContextHelper

- (AKSRPAuthenticationContextHelper)initWithContext:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AKSRPAuthenticationContextHelper;
  v6 = [(AKSRPContextHelper *)&v9 initWithContext:v5];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_authContext, a3);
  }

  return v7;
}

- (void)authenticationParametersWithCompletion:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10002D504;
  v4[3] = &unk_1002277B0;
  id v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(AKSRPAuthenticationContextHelper *)v5 _authenticationParameters:v4];
}

- (void)_authenticationParameters:(id)a3
{
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x3032000000;
  v9[3] = sub_10000F880;
  v9[4] = sub_10000F790;
  id v10 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10002DA30;
  v6[3] = &unk_100227828;
  id v4 = a3;
  id v7 = v4;
  v8 = v9;
  v6[4] = self;
  v5.receiver = self;
  v5.super_class = (Class)AKSRPAuthenticationContextHelper;
  [(AKSRPContextHelper *)&v5 authenticationParametersWithCompletion:v6];

  _Block_object_dispose(v9, 8);
}

- (void)_updateHeadersWithProxiedDeviceAnisetteData:(id)a3 clientProvidedData:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, uint64_t, void))a5;
  v11 = [(AKAppleIDAuthenticationContext *)self->_authContext proxiedDeviceAnisetteData];
  if (v11)
  {
    v12 = _AKLogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Context has provided Anisette data for proxied device.", buf, 2u);
    }

    v13 = +[NSMutableURLRequest ak_proxiedAnisetteHeadersWithData:v11];
    [v9 addEntriesFromDictionary:v13];
    [v8 addEntriesFromDictionary:v13];
    v10[2](v10, 1, 0);
  }
  else
  {
    v14 = [(AKAppleIDAuthenticationContext *)self->_authContext proxiedDevice];

    if (v14)
    {
      v15 = _AKLogSystem();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Grabbing Anisette data from proxied device.", buf, 2u);
      }

      v16 = [AKAnisetteProvisioningService alloc];
      v17 = [(AKSRPContextHelper *)self client];
      v18 = [(AKAnisetteProvisioningService *)v16 initWithClient:v17 context:self->_authContext];

      v19 = [(AKAppleIDAuthenticationContext *)self->_authContext proxiedDevice];
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_10002EE10;
      v20[3] = &unk_100227850;
      id v21 = v9;
      id v22 = v8;
      v23 = self;
      v24 = v10;
      [(AKAnisetteProvisioningService *)v18 fetchAnisetteDataAndProvisionIfNecessary:1 device:v19 completion:v20];
    }
    else
    {
      v10[2](v10, 1, 0);
    }
  }
}

- (void)_updateHeadersWithCompanionAnisetteData:(id)a3 clientProvidedData:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, uint64_t, void))a5;
  v11 = [AKAnisetteProvisioningService alloc];
  v12 = [(AKSRPContextHelper *)self client];
  v13 = [(AKAnisetteProvisioningService *)v11 initWithClient:v12 context:self->_authContext];

  v14 = [(AKAppleIDAuthenticationContext *)self->_authContext companionDeviceAnisetteData];
  if (v14)
  {
    v15 = _AKLogSystem();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Context has provided Anisette data for companion device.", buf, 2u);
    }

    v16 = +[NSMutableURLRequest ak_anisetteHeadersWithCompanionData:v14];
    [v9 addEntriesFromDictionary:v16];
    [v8 addEntriesFromDictionary:v16];
    v10[2](v10, 1, 0);
  }
  else
  {
    uint64_t v17 = [(AKAppleIDAuthenticationContext *)self->_authContext companionDevice];
    if (!v17) {
      goto LABEL_10;
    }
    v18 = (void *)v17;
    v19 = [(AKAppleIDAuthenticationContext *)self->_authContext companionDevice];
    v20 = [v19 uniqueDeviceIdentifier];

    if (v20)
    {
      id v21 = _AKLogSystem();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Looking to set companion Anisette data in CPD.", buf, 2u);
      }

      id v22 = [(AKAppleIDAuthenticationContext *)self->_authContext companionDevice];
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_10002F184;
      v23[3] = &unk_100227850;
      id v24 = v9;
      id v25 = v8;
      v26 = self;
      v27 = v10;
      [(AKAnisetteProvisioningService *)v13 fetchAnisetteDataAndProvisionIfNecessary:1 device:v22 completion:v23];
    }
    else
    {
LABEL_10:
      v10[2](v10, 1, 0);
    }
  }
}

- (void)clientProvidedDataHelper:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(AKAppleIDAuthenticationContext *)self->_authContext appProvidedData];

  authContext = self->_authContext;
  if (v5)
  {
    uint64_t v7 = [(AKAppleIDAuthenticationContext *)authContext appProvidedData];
  }
  else
  {
    id v8 = [(AKAppleIDAuthenticationContext *)authContext verifyCredentialReason];
    if (v8 == (id)1)
    {
      v12 = _AKLogSystem();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Client has request a beneficiary setup token.", buf, 2u);
      }

      CFStringRef v44 = @"addBeneficiaryToken";
      CFStringRef v45 = @"true";
      id v10 = &v45;
      v11 = &v44;
    }
    else
    {
      if (v8 != (id)2) {
        goto LABEL_13;
      }
      id v9 = _AKLogSystem();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Client has request a custodian setup token.", buf, 2u);
      }

      CFStringRef v46 = @"addCustodianToken";
      CFStringRef v47 = @"true";
      id v10 = &v47;
      v11 = &v46;
    }
    uint64_t v7 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v11 count:1];
  }
  v13 = (void *)v7;
  [v4 setObject:v7 forKeyedSubscript:@"apd"];

LABEL_13:
  v14 = [(AKAppleIDAuthenticationContext *)self->_authContext appProvidedContext];

  if (v14)
  {
    v15 = [(AKAppleIDAuthenticationContext *)self->_authContext appProvidedContext];
    [v4 setObject:v15 forKeyedSubscript:@"X-Apple-I-App-Provided-Context"];
  }
  v16 = [(AKAppleIDAuthenticationContext *)self->_authContext proxiedDevice];

  if (v16)
  {
    [v4 setObject:&__kCFBooleanTrue forKeyedSubscript:@"X-Apple-I-Proxied-ICSCREC"];
    [v4 setObject:&__kCFBooleanTrue forKeyedSubscript:@"X-Apple-I-Proxied-PRK-Gen"];
    uint64_t v17 = [(AKAppleIDAuthenticationContext *)self->_authContext proxiedDevice];
    v18 = [v17 serverFriendlyDescription];
    [v4 setObject:v18 forKeyedSubscript:@"X-MMe-Proxied-Client-Info"];

    v19 = [(AKAppleIDAuthenticationContext *)self->_authContext appProvidedContext];
    id v20 = [v19 length];

    if (v20)
    {
      id v21 = [(AKSRPAuthenticationContextHelper *)self _identityAuthorizationPayload];
      [v4 setObject:v21 forKeyedSubscript:@"X-Apple-Identity-Token"];
    }
  }
  id v22 = [(AKAppleIDAuthenticationContext *)self->_authContext _masterKey];

  if (v22)
  {
    v23 = _AKLogSystem();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Context has masterKey set! Setting masterKeyIsEligible", buf, 2u);
    }

    [v4 setObject:&__kCFBooleanTrue forKeyedSubscript:@"mke"];
  }
  id v24 = [(AKSRPAuthenticationContextHelper *)self authContext];
  id v25 = [v24 _proxiedAppBundleID];

  if ([v25 length])
  {
    v26 = _AKLogSystem();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Context has a proxied bundle id set!", buf, 2u);
    }

    [v4 setObject:v25 forKeyedSubscript:@"pbid"];
  }
  if ([(AKSRPAuthenticationContextHelper *)self _masterKeyAsSecondFactor])
  {
    v27 = _AKLogSystem();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Context has set masterKeyAsSecondFactor", buf, 2u);
    }

    [v4 setObject:&__kCFBooleanTrue forKeyedSubscript:@"mk2fa"];
    v28 = [(AKAppleIDAuthenticationContext *)self->_authContext _identityToken];
    [v4 setObject:v28 forKeyedSubscript:@"X-Apple-Identity-Token"];
  }
  v29 = [(AKAppleIDAuthenticationContext *)self->_authContext dependentAltDSID];

  if (v29)
  {
    v30 = _AKLogSystem();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Context indicates that dependent tokens are being requested by parent account", buf, 2u);
    }

    v31 = [(AKAppleIDAuthenticationContext *)self->_authContext dependentAltDSID];
    [v4 setObject:v31 forKeyedSubscript:@"dependentAltDSID"];
  }
  if (+[AKFeatureManager isEnforceMDMPolicyEnabled])
  {
    v32 = objc_alloc_init(AKMDMInformationProvider);
    v33 = [(AKMDMInformationProvider *)v32 fetchMDMInformationIfNecessaryForAuthContext:self->_authContext];

    v34 = [v33 deviceManagedState];

    if (v34)
    {
      v35 = [v33 deviceManagedState];
      [v4 setObject:v35 forKeyedSubscript:@"X-Apple-I-MDM-Device-Posture"];
    }
    v36 = [v33 organizationToken];

    if (v36)
    {
      v37 = [v33 organizationToken];
      [v4 setObject:v37 forKeyedSubscript:@"X-Apple-I-MDM-Org-Token"];
    }
  }
  v38 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%lu", +[AKDevice currentDeviceAuthenticationModeForAuthContext:self->_authContext]);
  [v4 setObject:v38 forKeyedSubscript:@"X-Apple-I-Device-Configuration-Mode"];

  if ([(AKAppleIDAuthenticationContext *)self->_authContext isContextRequestingReauthForExistingService])
  {
    v39 = _AKLogSystem();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "Context indicates we are performing reauth for existing service", buf, 2u);
    }

    [v4 setObject:&__kCFBooleanTrue forKeyedSubscript:@"X-Apple-I-ReAuth"];
  }
  v40 = [(AKAppleIDAuthenticationContext *)self->_authContext proxiedAppleID];

  if (v40)
  {
    v41 = _AKLogSystem();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "Context has set proxiedAppleID", buf, 2u);
    }

    v42 = [(AKAppleIDAuthenticationContext *)self->_authContext proxiedAppleID];
    [v4 setObject:v42 forKeyedSubscript:@"proxiedAppleID"];
  }
}

- (BOOL)canPresentRemoteUI
{
  if ([(AKAppleIDAuthenticationContext *)self->_authContext _capabilityForUIDisplay] == (id)2
    || [(AKAppleIDAuthenticationContext *)self->_authContext _capabilityForUIDisplay] == (id)3)
  {
    return 1;
  }
  if ([(AKAppleIDAuthenticationContext *)self->_authContext _capabilityForUIDisplay] != (id)1) {
    return 0;
  }
  authContext = self->_authContext;

  return [(AKAppleIDAuthenticationContext *)authContext _performUIOutOfProcess];
}

- (id)_passwordResetBackupToken
{
  if ([(AKSRPContextHelper *)self ignoreInternalTokens])
  {
    id v3 = 0;
  }
  else
  {
    passwordResetBackupToken = self->_passwordResetBackupToken;
    if (!passwordResetBackupToken)
    {
      objc_super v5 = +[AKAccountManager sharedInstance];
      id v6 = [(AKAppleIDAuthenticationContext *)self->_authContext authKitAccount:0];
      uint64_t v7 = [v5 passwordResetTokenBackupForAccount:v6];
      id v8 = self->_passwordResetBackupToken;
      self->_passwordResetBackupToken = v7;

      passwordResetBackupToken = self->_passwordResetBackupToken;
    }
    id v3 = passwordResetBackupToken;
  }

  return v3;
}

- (id)_identityAuthorizationPayload
{
  v2 = +[AKAccountManager sharedInstance];
  id v3 = [v2 altDSIDforPrimaryiCloudAccount];

  id v4 = +[AKAccountManager sharedInstance];
  objc_super v5 = [v4 authKitAccountWithAltDSID:v3 error:0];

  id v6 = +[AKAccountManager sharedInstance];
  uint64_t v7 = [v6 masterTokenForAccount:v5];
  id v8 = [v7 stringValue];

  id v9 = +[NSString stringWithFormat:@"%@:%@", v3, v8];
  id v10 = [v9 dataUsingEncoding:4];
  v11 = [v10 base64EncodedStringWithOptions:0];

  return v11;
}

- (AKAppleIDAuthenticationContext)authContext
{
  return self->_authContext;
}

- (void)setAuthContext:(id)a3
{
}

- (BOOL)_masterKeyAsSecondFactor
{
  return self->__masterKeyAsSecondFactor;
}

- (void)_setMasterKeyAsSecondFactor:(BOOL)a3
{
  self->__masterKeyAsSecondFactor = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authContext, 0);

  objc_storeStrong((id *)&self->_passwordResetBackupToken, 0);
}

@end
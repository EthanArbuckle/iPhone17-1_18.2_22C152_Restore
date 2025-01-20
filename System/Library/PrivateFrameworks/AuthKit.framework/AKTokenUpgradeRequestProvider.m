@interface AKTokenUpgradeRequestProvider
- (BOOL)signRequest:(id)a3 error:(id *)a4;
- (void)buildRequestWithCompletion:(id)a3;
@end

@implementation AKTokenUpgradeRequestProvider

- (void)buildRequestWithCompletion:(id)a3
{
  v4 = (void (**)(id, void, void *))a3;
  v5 = [(AKURLRequestProviderImpl *)self concreteAuthenticationContext];
  v6 = [v5 _shortLivedToken];

  v7 = [(AKURLRequestProviderImpl *)self concreteAuthenticationContext];
  v8 = [v7 _identityToken];

  v9 = [(AKURLRequestProviderImpl *)self concreteAuthenticationContext];
  v10 = [v9 serviceToken];

  v11 = +[AKFeatureManager sharedManager];
  unsigned int v12 = [v11 isPltUpgradeEnabled];

  if (v12)
  {
    v13 = _AKLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      sub_100195070(v13);
    }

    v14 = [(AKURLRequestProviderImpl *)self concreteAuthenticationContext];
    v15 = [v14 passwordlessToken];

    BOOL v16 = v15 == 0;
    if (v6) {
      goto LABEL_13;
    }
  }
  else
  {
    BOOL v16 = 1;
    if (v6) {
      goto LABEL_13;
    }
  }
  if (v8 || !v16 || v10)
  {
LABEL_13:
    v19 = [(AKURLRequestProviderImpl *)self context];
    v18 = [v19 altDSID];

    if (v18)
    {
      v22.receiver = self;
      v22.super_class = (Class)AKTokenUpgradeRequestProvider;
      [(AKURLRequestProviderImpl *)&v22 buildRequestWithCompletion:v4];
    }
    else
    {
      v20 = _AKLogSystem();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Attempt to perform authentication without altDSID!", buf, 2u);
      }

      v21 = +[NSError ak_errorWithCode:-7025];
      v4[2](v4, 0, v21);
    }
    goto LABEL_18;
  }
  v17 = _AKLogSystem();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Attempt to perform authentication without an upgrade token!", buf, 2u);
  }

  v18 = +[NSError ak_errorWithCode:-7044];
  v4[2](v4, 0, v18);
LABEL_18:
}

- (BOOL)signRequest:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = [AKDServerUIController alloc];
  v7 = [(AKURLRequestProviderImpl *)self client];
  v8 = [(AKDServerUIController *)v6 initWithClient:v7];

  v9 = [(AKURLRequestProviderImpl *)self concreteAuthenticationContext];
  v10 = [(AKDServerUIController *)v8 resourceLoadDelegateWithContext:v9];

  v11 = [(AKURLRequestProviderImpl *)self urlBagKey];
  [v10 setBagUrlKey:v11];

  [v10 signRequestWithCommonHeaders:v5];
  unsigned int v12 = [(AKURLRequestProviderImpl *)self concreteAuthenticationContext];
  v13 = [v12 _shortLivedToken];

  v14 = [(AKURLRequestProviderImpl *)self concreteAuthenticationContext];
  v15 = v14;
  if (v13)
  {
    BOOL v16 = [v14 _shortLivedToken];
    v17 = [(AKURLRequestProviderImpl *)self context];
    v18 = [v17 altDSID];
    objc_msgSend(v5, "ak_addShortLivedTokenHeaderWithIdentityToken:forAltDSID:", v16, v18);
LABEL_8:

    goto LABEL_9;
  }
  v19 = [v14 _identityToken];

  v20 = [(AKURLRequestProviderImpl *)self concreteAuthenticationContext];
  v15 = v20;
  if (v19)
  {
    BOOL v16 = [v20 _identityToken];
    v17 = [(AKURLRequestProviderImpl *)self context];
    v18 = [v17 altDSID];
    objc_msgSend(v5, "ak_addAuthorizationHeaderWithIdentityToken:forAltDSID:", v16, v18);
    goto LABEL_8;
  }
  v21 = [v20 serviceToken];

  objc_super v22 = [(AKURLRequestProviderImpl *)self concreteAuthenticationContext];
  v15 = v22;
  if (v21)
  {
    uint64_t v23 = [v22 serviceToken];
LABEL_7:
    BOOL v16 = (void *)v23;
    v17 = [(AKURLRequestProviderImpl *)self context];
    v18 = [v17 altDSID];
    objc_msgSend(v5, "ak_addAuthorizationHeaderWithServiceToken:forAltDSID:", v16, v18);
    goto LABEL_8;
  }
  v38 = [v22 passwordlessToken];

  if (v38)
  {
    v39 = +[AKFeatureManager sharedManager];
    unsigned int v40 = [v39 isPltUpgradeEnabled];

    if (v40)
    {
      v41 = _AKLogSystem();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG)) {
        sub_1001950B4(v41);
      }

      v15 = [(AKURLRequestProviderImpl *)self concreteAuthenticationContext];
      uint64_t v23 = [v15 passwordlessToken];
      goto LABEL_7;
    }
  }
LABEL_9:
  v24 = +[AKDevice currentDevice];
  unsigned int v25 = [v24 isProtectedWithPasscode];

  if (v25) {
    objc_msgSend(v5, "ak_addPRKRequestHeader");
  }
  if (+[AKFeatureManager isEnforceMDMPolicyEnabled])
  {
    v26 = objc_alloc_init(AKMDMInformationProvider);
    v27 = [(AKURLRequestProviderImpl *)self concreteAuthenticationContext];
    v28 = [(AKMDMInformationProvider *)v26 fetchMDMInformationIfNecessaryForAuthContext:v27];

    v29 = [v28 deviceManagedState];

    if (v29)
    {
      v30 = [v28 deviceManagedState];
      objc_msgSend(v5, "ak_addHeaderForDeviceManagementState:", v30);
    }
    v31 = [v28 organizationToken];

    if (v31)
    {
      v32 = [v28 organizationToken];
      objc_msgSend(v5, "ak_addHeaderForMDMOrganizationToken:", v32);
    }
  }
  v33 = [(AKURLRequestProviderImpl *)self concreteAuthenticationContext];
  v34 = [v33 idmsDataToken];

  if (v34)
  {
    v35 = [(AKURLRequestProviderImpl *)self concreteAuthenticationContext];
    v36 = [v35 idmsDataToken];
    [v5 setValue:v36 forHTTPHeaderField:@"X-Apple-I-IdMS-Data"];
  }
  return 1;
}

@end
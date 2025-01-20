@interface AKEducationEnterpriseRequestProvider
- (BOOL)signRequest:(id)a3 error:(id *)a4;
- (id)_authKitAccount;
- (id)_continuationToken;
- (id)_passwordResetToken;
- (void)_signWithProxiedDeviceHeaders:(id)a3;
@end

@implementation AKEducationEnterpriseRequestProvider

- (BOOL)signRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v24.receiver = self;
  v24.super_class = (Class)AKEducationEnterpriseRequestProvider;
  BOOL v7 = [(AKGrandSlamRequestProvider *)&v24 signRequest:v6 error:a4];
  if (v7)
  {
    v8 = [(AKURLRequestProviderImpl *)self concreteAuthenticationContext];
    v9 = [v8 desiredInternalTokens];
    unsigned int v10 = [v9 containsObject:AKAuthenticationInternalTokenCK];

    v11 = +[AKDevice currentDevice];
    unsigned int v12 = [v11 isProtectedWithPasscode];

    if (v10)
    {
      uint64_t v13 = [(AKEducationEnterpriseRequestProvider *)self _continuationToken];
      if (!v13
        || ((v14 = (void *)v13,
             [(AKEducationEnterpriseRequestProvider *)self _passwordResetToken],
             (v15 = objc_claimAutoreleasedReturnValue()) == 0)
          ? (unsigned int v16 = v12)
          : (unsigned int v16 = 0),
            v15,
            v14,
            v16 == 1))
      {
        v17 = _AKLogSystem();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v23 = 0;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Will ask for ckgen.", v23, 2u);
        }

        objc_msgSend(v6, "ak_addCKRequestHeader");
      }
    }
    if (v12)
    {
      v18 = _AKLogSystem();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v23 = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Will ask for prkgen.", v23, 2u);
      }

      objc_msgSend(v6, "ak_addPRKRequestHeader");
    }
    v19 = [(AKURLRequestProviderImpl *)self concreteAuthenticationContext];
    v20 = [v19 proxiedDevice];

    if (v20) {
      [(AKEducationEnterpriseRequestProvider *)self _signWithProxiedDeviceHeaders:v6];
    }
    v21 = _AKLogSystem();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
      sub_100193114(v6, v21);
    }
  }
  return v7;
}

- (void)_signWithProxiedDeviceHeaders:(id)a3
{
  id v4 = a3;
  v5 = _AKLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v37 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Grabbing Anisette data from proxied device.", v37, 2u);
  }

  id v6 = [AKAnisetteProvisioningService alloc];
  BOOL v7 = [(AKURLRequestProviderImpl *)self client];
  v8 = [(AKURLRequestProviderImpl *)self concreteAuthenticationContext];
  v9 = [(AKAnisetteProvisioningService *)v6 initWithClient:v7 context:v8];

  unsigned int v10 = [(AKURLRequestProviderImpl *)self concreteAuthenticationContext];
  v11 = [v10 proxiedDevice];
  unsigned int v12 = [(AKAnisetteProvisioningService *)v9 anisetteDataForDevice:v11 provisionIfNecessary:1];

  uint64_t v13 = [(AKURLRequestProviderImpl *)self concreteAuthenticationContext];
  v14 = [v13 proxiedDevice];
  v15 = [v14 serverFriendlyDescription];

  if (v15)
  {
    unsigned int v16 = [(AKURLRequestProviderImpl *)self concreteAuthenticationContext];
    v17 = [v16 proxiedDevice];
    v18 = [v17 serverFriendlyDescription];
    objc_msgSend(v4, "ak_addProxiedClientInfoHeader:", v18);
  }
  v19 = [(AKURLRequestProviderImpl *)self concreteAuthenticationContext];
  v20 = [v19 proxiedDevice];
  v21 = [v20 uniqueDeviceIdentifier];

  if (v21)
  {
    v22 = [(AKURLRequestProviderImpl *)self concreteAuthenticationContext];
    v23 = [v22 proxiedDevice];
    objc_super v24 = [v23 uniqueDeviceIdentifier];
    objc_msgSend(v4, "ak_addProxiedDeviceUDIDHeader:", v24);
  }
  if (v12) {
    objc_msgSend(v4, "ak_addProxiedAnisetteHeaders:", v12);
  }
  v25 = [(AKURLRequestProviderImpl *)self concreteAuthenticationContext];
  v26 = [v25 proxiedDevice];
  v27 = [v26 locale];
  v28 = [v27 objectForKey:NSLocaleCountryCode];

  if (v28) {
    objc_msgSend(v4, "ak_addProxiedDeviceCountryHeader:", v28);
  }
  v29 = [(AKURLRequestProviderImpl *)self concreteAuthenticationContext];
  v30 = [v29 proxiedDevice];
  v31 = [v30 serialNumber];

  if (v31)
  {
    v32 = [(AKURLRequestProviderImpl *)self concreteAuthenticationContext];
    v33 = [v32 proxiedDevice];
    v34 = [v33 serialNumber];
    objc_msgSend(v4, "ak_addProxiedDeviceSerialNumberHeader:", v34);
  }
  v35 = [(AKURLRequestProviderImpl *)self concreteAuthenticationContext];
  v36 = [v35 proxiedDevice];

  if (v36)
  {
    objc_msgSend(v4, "ak_addProxiedDevicePRKRequestHeader");
    objc_msgSend(v4, "ak_addProxiedDeviceICSCIntentHeader");
  }
}

- (id)_authKitAccount
{
  v2 = [(AKURLRequestProviderImpl *)self concreteAuthenticationContext];
  uint64_t v5 = 0;
  v3 = [v2 authKitAccount:&v5];

  return v3;
}

- (id)_passwordResetToken
{
  v2 = [(AKEducationEnterpriseRequestProvider *)self _authKitAccount];
  if (v2)
  {
    v3 = +[AKAccountManager sharedInstance];
    id v4 = [v3 passwordResetTokenForAccount:v2];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)_continuationToken
{
  v2 = [(AKEducationEnterpriseRequestProvider *)self _authKitAccount];
  if (v2)
  {
    v3 = +[AKAccountManager sharedInstance];
    id v4 = [v3 continuationTokenForAccount:v2];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

@end
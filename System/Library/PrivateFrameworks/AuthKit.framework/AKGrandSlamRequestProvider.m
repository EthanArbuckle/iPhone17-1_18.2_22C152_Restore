@interface AKGrandSlamRequestProvider
- (AKAppleIDServerResourceLoadDelegate)loadDelegate;
- (BOOL)authenticatedRequest;
- (BOOL)shouldSendIdentityToken;
- (BOOL)signRequest:(id)a3 error:(id *)a4;
- (BOOL)validateResponseData:(id)a3 error:(id *)a4;
- (unint64_t)expectedResponseType;
- (unint64_t)requestBodyType;
- (void)setAuthenticatedRequest:(BOOL)a3;
- (void)setExpectedResponseType:(unint64_t)a3;
- (void)setRequestBodyType:(unint64_t)a3;
- (void)setShouldSendIdentityToken:(BOOL)a3;
@end

@implementation AKGrandSlamRequestProvider

- (AKAppleIDServerResourceLoadDelegate)loadDelegate
{
  BOOL v3 = [(AKGrandSlamRequestProvider *)self shouldSendIdentityToken];
  v4 = [(AKURLRequestProviderImpl *)self concreteAuthenticationContext];
  objc_msgSend(v4, "set_shouldSendIdentityTokenForRemoteUI:", v3);

  v5 = [AKDServerUIController alloc];
  v6 = [(AKURLRequestProviderImpl *)self client];
  v7 = [(AKDServerUIController *)v5 initWithClient:v6];

  v8 = [(AKURLRequestProviderImpl *)self concreteAuthenticationContext];
  v9 = [(AKDServerUIController *)v7 resourceLoadDelegateWithContext:v8];

  v10 = [(AKURLRequestProviderImpl *)self urlBagKey];
  [v9 setInitialURLRequestKey:v10];

  v11 = [(AKURLRequestProviderImpl *)self urlBagKey];
  [v9 setBagUrlKey:v11];

  v12 = [(AKURLRequestProviderImpl *)self dataCenterIdentifier];
  [v9 setDataCenterIdentifier:v12];

  v13 = [(AKURLRequestProviderImpl *)self client];
  v14 = [v13 bundleID];
  [v9 setClientBundleID:v14];

  return (AKAppleIDServerResourceLoadDelegate *)v9;
}

- (BOOL)signRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([(AKGrandSlamRequestProvider *)self authenticatedRequest])
  {
    v7 = [(AKGrandSlamRequestProvider *)self loadDelegate];
    v8 = [v7 heartbeatToken];

    if (!v8)
    {
      v18 = _AKLogSystem();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_100189FBC(self, v18);
      }

      if (a4)
      {
        +[NSError ak_errorWithCode:-7042];
        BOOL v17 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_16;
      }
LABEL_15:
      BOOL v17 = 0;
      goto LABEL_16;
    }
  }
  v9 = [(AKGrandSlamRequestProvider *)self loadDelegate];

  if (!v9) {
    goto LABEL_15;
  }
  v10 = [(AKGrandSlamRequestProvider *)self loadDelegate];
  [v10 signRequestWithCommonHeaders:v6];

  v11 = [(AKURLRequestProviderImpl *)self concreteAuthenticationContext];
  id v20 = 0;
  v12 = [v11 authKitAccount:&v20];
  id v13 = v20;

  v14 = _AKLogSystem();
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG);
  if (v13)
  {
    if (v15) {
      sub_10018A0B0((uint64_t)v13, v14);
    }
  }
  else
  {
    if (v15) {
      sub_10018A06C(v14);
    }

    v14 = +[AKAccountManager sharedInstance];
    v16 = [v14 continuationTokenForAccount:v12];
    objc_msgSend(v6, "ak_addContinutationKeyPresenceHeader:", v16);
  }
  BOOL v17 = 1;
LABEL_16:

  return v17;
}

- (BOOL)validateResponseData:(id)a3 error:(id *)a4
{
  v11.receiver = self;
  v11.super_class = (Class)AKGrandSlamRequestProvider;
  BOOL v6 = -[AKURLRequestProviderImpl validateResponseData:error:](&v11, "validateResponseData:error:", a3);
  if (a4 && *a4)
  {
    v7 = [AKGrandSlamResponseHandler alloc];
    v8 = [(AKURLRequestProviderImpl *)self context];
    v9 = [(AKGrandSlamResponseHandler *)v7 initWithContext:v8];

    [(AKGrandSlamResponseHandler *)v9 handleResponseError:*a4];
  }
  return v6;
}

- (BOOL)authenticatedRequest
{
  return self->_authenticatedRequest;
}

- (void)setAuthenticatedRequest:(BOOL)a3
{
  self->_authenticatedRequest = a3;
}

- (BOOL)shouldSendIdentityToken
{
  return self->_shouldSendIdentityToken;
}

- (void)setShouldSendIdentityToken:(BOOL)a3
{
  self->_shouldSendIdentityToken = a3;
}

- (unint64_t)expectedResponseType
{
  return self->_expectedResponseType;
}

- (void)setExpectedResponseType:(unint64_t)a3
{
  self->_expectedResponseType = a3;
}

- (unint64_t)requestBodyType
{
  return self->_requestBodyType;
}

- (void)setRequestBodyType:(unint64_t)a3
{
  self->_requestBodyType = a3;
}

@end
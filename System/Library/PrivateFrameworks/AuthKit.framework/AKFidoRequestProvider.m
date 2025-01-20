@interface AKFidoRequestProvider
- (BOOL)signRequest:(id)a3 error:(id *)a4;
- (BOOL)validateResponseData:(id)a3 error:(id *)a4;
- (NSString)recoveryToken;
- (id)loadDelegate;
- (unint64_t)expectedResponseType;
- (unint64_t)requestBodyType;
- (void)setRecoveryToken:(id)a3;
@end

@implementation AKFidoRequestProvider

- (id)loadDelegate
{
  v3 = [(AKURLRequestProviderImpl *)self concreteAuthenticationContext];
  objc_msgSend(v3, "set_shouldSendIdentityTokenForRemoteUI:", 1);

  v4 = [AKDServerUIController alloc];
  v5 = [(AKURLRequestProviderImpl *)self client];
  v6 = [(AKDServerUIController *)v4 initWithClient:v5];

  v7 = [(AKURLRequestProviderImpl *)self concreteAuthenticationContext];
  v8 = [(AKDServerUIController *)v6 resourceLoadDelegateWithContext:v7];

  v9 = [(AKURLRequestProviderImpl *)self urlBagKey];
  [v8 setInitialURLRequestKey:v9];

  v10 = [(AKURLRequestProviderImpl *)self urlBagKey];
  [v8 setBagUrlKey:v10];

  v11 = [(AKURLRequestProviderImpl *)self dataCenterIdentifier];
  [v8 setDataCenterIdentifier:v11];

  [v8 setShouldSendPhoneNumber:1];
  [v8 setShouldSendSigningHeaders:1];
  v12 = [(AKURLRequestProviderImpl *)self concreteAuthenticationContext];
  v13 = [v12 _identityToken];
  [v8 setIdentityToken:v13];

  return v8;
}

- (BOOL)signRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AKFidoRequestProvider;
  BOOL v7 = [(AKGrandSlamRequestProvider *)&v11 signRequest:v6 error:a4];
  if (v7)
  {
    v8 = [(AKFidoRequestProvider *)self recoveryToken];

    if (v8)
    {
      v9 = [(AKFidoRequestProvider *)self recoveryToken];
      objc_msgSend(v6, "ak_addFidoRecoveryTokenHeader:", v9);
    }
  }

  return v7;
}

- (unint64_t)expectedResponseType
{
  return 1;
}

- (unint64_t)requestBodyType
{
  return 1;
}

- (BOOL)validateResponseData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)AKFidoRequestProvider;
  if ([(AKGrandSlamRequestProvider *)&v17 validateResponseData:v6 error:a4])
  {
    BOOL v7 = +[AAFSerialization dictionaryFromObject:v6 ofType:@"application/json"];
    v8 = v7;
    if (v7)
    {
      uint64_t v9 = AKErrorStatusCodeKey;
      v10 = [v7 objectForKeyedSubscript:AKErrorStatusCodeKey];
      objc_super v11 = v10;
      if (v10 && [v10 integerValue])
      {
        v12 = _AKLogFido();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          sub_10017D588(v11, v12);
        }

        v18[0] = NSLocalizedDescriptionKey;
        v13 = [v8 objectForKeyedSubscript:AKErrorMessageKey];
        v18[1] = v9;
        v19[0] = v13;
        v19[1] = v11;
        v14 = +[NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:2];

        *a4 = +[NSError ak_errorWithCode:-7010 userInfo:v14];

        BOOL v15 = 0;
      }
      else
      {
        BOOL v15 = 1;
      }
    }
    else
    {
      BOOL v15 = 1;
    }
  }
  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

- (NSString)recoveryToken
{
  return self->_recoveryToken;
}

- (void)setRecoveryToken:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
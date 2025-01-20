@interface AKWalrusRequestProvider
- (AKWalrusContext)walrusContext;
- (AKWalrusRequestProvider)initWithContext:(id)a3 urlBagKey:(id)a4;
- (BOOL)_validateDataForVerifyEnableWalrusAllowedRequest:(id)a3 error:(id *)a4;
- (BOOL)_validateDataForWalrusStateUpdateToServerRequest:(id)a3 error:(id *)a4;
- (BOOL)_validateJSONResponseData:(id)a3 error:(id *)a4;
- (BOOL)signRequest:(id)a3 error:(id *)a4;
- (BOOL)validateResponseData:(id)a3 error:(id *)a4;
- (NSString)refreshUrl;
- (NSString)reqInterceptToken;
- (NSString)secondaryToken;
- (id)_AKAuthContextWithUsername:(id)a3 password:(id)a4;
- (id)parseRefreshUrl:(id)a3;
- (unint64_t)expectedResponseType;
- (unint64_t)requestBodyType;
- (void)getPETForUsername:(id)a3 password:(id)a4 completion:(id)a5;
- (void)parser:(id)a3 didStartElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6 attributes:(id)a7;
- (void)setRefreshUrl:(id)a3;
- (void)setReqInterceptToken:(id)a3;
- (void)setSecondaryToken:(id)a3;
- (void)setWalrusContext:(id)a3;
@end

@implementation AKWalrusRequestProvider

- (AKWalrusRequestProvider)initWithContext:(id)a3 urlBagKey:(id)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AKWalrusRequestProvider;
  v8 = [(AKURLRequestProviderImpl *)&v11 initWithContext:v7 urlBagKey:a4 shouldCacheResource:0];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_walrusContext, a3);
  }

  return v9;
}

- (unint64_t)expectedResponseType
{
  v3 = [(AKWalrusRequestProvider *)self reqInterceptToken];
  if (v3)
  {

    return 0;
  }
  v4 = [(AKWalrusRequestProvider *)self refreshUrl];

  return !v4;
}

- (unint64_t)requestBodyType
{
  v2 = [(AKWalrusRequestProvider *)self refreshUrl];

  return v2 == 0;
}

- (BOOL)signRequest:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = [AKDServerUIController alloc];
  id v7 = [(AKURLRequestProviderImpl *)self client];
  v8 = [(AKDServerUIController *)v6 initWithClient:v7];

  id v9 = objc_alloc((Class)AKAppleIDAuthenticationContext);
  v10 = [(AKWalrusRequestProvider *)self walrusContext];
  id v11 = [v9 initWithAuthenticatedServerRequestContext:v10];

  objc_msgSend(v11, "set_shouldSendIdentityTokenForRemoteUI:", 1);
  objc_msgSend(v11, "set_shouldSendGrandSlamTokensForRemoteUI:", 1);
  v12 = [(AKDServerUIController *)v8 resourceLoadDelegateWithContext:v11];
  [v12 setShouldSendPhoneNumber:1];
  [v12 setShouldSendSigningHeaders:1];
  v13 = [(AKURLRequestProviderImpl *)self urlBagKey];
  [v12 setInitialURLRequestKey:v13];

  v14 = [(AKURLRequestProviderImpl *)self urlBagKey];
  [v12 setBagUrlKey:v14];

  v15 = [(AKURLRequestProviderImpl *)self dataCenterIdentifier];
  [v12 setDataCenterIdentifier:v15];

  v16 = [(AKWalrusRequestProvider *)self walrusContext];
  objc_msgSend(v12, "setCliMode:", objc_msgSend(v16, "cliMode"));

  [v12 signRequest:v5];
  v17 = [(AKWalrusRequestProvider *)self secondaryToken];

  if (v17)
  {
    v18 = [(AKWalrusRequestProvider *)self secondaryToken];
    [v5 setValue:v18 forHTTPHeaderField:@"X-Apple-2SV-Authenticate"];
  }
  v19 = [(AKWalrusRequestProvider *)self reqInterceptToken];

  if (v19)
  {
    v20 = [(AKWalrusRequestProvider *)self reqInterceptToken];
    [v5 setValue:v20 forHTTPHeaderField:@"X-Apple-2SV-Req-Intercepted"];
  }
  else
  {
    [v5 setValue:@"application/json" forHTTPHeaderField:@"Accept"];
  }

  return 1;
}

- (BOOL)validateResponseData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(AKWalrusRequestProvider *)self reqInterceptToken];

  if (v7)
  {
    BOOL v8 = 1;
  }
  else
  {
    id v9 = [(AKWalrusRequestProvider *)self secondaryToken];

    if (v9
      || (v11.receiver = self,
          v11.super_class = (Class)AKWalrusRequestProvider,
          [(AKURLRequestProviderImpl *)&v11 validateResponseData:v6 error:a4]))
    {
      BOOL v8 = [(AKWalrusRequestProvider *)self _validateJSONResponseData:v6 error:a4];
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (BOOL)_validateJSONResponseData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(AKURLRequestProviderImpl *)self urlBagKey];
  if ([v7 isEqualToString:AKURLBagKeyCustodianDataRecoveryServiceDisableComplete])
  {

LABEL_4:
    unsigned __int8 v10 = [(AKWalrusRequestProvider *)self _validateDataForWalrusStateUpdateToServerRequest:v6 error:a4];
    goto LABEL_5;
  }
  BOOL v8 = [(AKURLRequestProviderImpl *)self urlBagKey];
  unsigned int v9 = [v8 isEqualToString:AKURLBagKeyCustodianDataRecoveryServiceEnableComplete];

  if (v9) {
    goto LABEL_4;
  }
  v13 = [(AKURLRequestProviderImpl *)self urlBagKey];
  unsigned int v14 = [v13 isEqualToString:AKURLBagKeyCustodianDataRecoveryServiceDisable];

  if (!v14)
  {
    BOOL v11 = 0;
    goto LABEL_6;
  }
  unsigned __int8 v10 = [(AKWalrusRequestProvider *)self _validateDataForVerifyEnableWalrusAllowedRequest:v6 error:a4];
LABEL_5:
  BOOL v11 = v10;
LABEL_6:

  return v11;
}

- (BOOL)_validateDataForVerifyEnableWalrusAllowedRequest:(id)a3 error:(id *)a4
{
  id v5 = +[AAFSerialization dictionaryFromObject:a3 ofType:@"application/json"];
  id v6 = [v5 objectForKeyedSubscript:@"eligibilityStatus"];
  unsigned __int8 v7 = [v6 isEqualToString:@"eligible"];

  if ((v7 & 1) == 0)
  {
    BOOL v8 = [v5 objectForKeyedSubscript:@"eligibilityStatus"];
    unsigned int v9 = [v8 isEqualToString:@"ineligible"];

    if (v9)
    {
      if (a4)
      {
        unsigned __int8 v10 = [v5 objectForKeyedSubscript:@"ineligibilityReason"];

        if (v10)
        {
          BOOL v11 = [v5 objectForKeyedSubscript:@"ineligibilityReason"];
          uint64_t v12 = AKWalrusErrorDomain;
          NSErrorUserInfoKey v19 = NSLocalizedDescriptionKey;
          v20 = v11;
          v13 = +[NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
          *a4 = +[NSError errorWithDomain:v12 code:-5001 userInfo:v13];
        }
        else
        {
          *a4 = +[NSError errorWithDomain:AKWalrusErrorDomain code:-5001 userInfo:0];
        }
      }
    }
    else if (a4)
    {
      uint64_t v14 = AKWalrusErrorDomain;
      NSErrorUserInfoKey v17 = NSLocalizedDescriptionKey;
      CFStringRef v18 = @"Unknown error occurred while checking if enabling walrus is allowed.";
      v15 = +[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
      *a4 = +[NSError errorWithDomain:v14 code:-5001 userInfo:v15];
    }
  }

  return v7;
}

- (BOOL)_validateDataForWalrusStateUpdateToServerRequest:(id)a3 error:(id *)a4
{
  id v5 = +[AAFSerialization dictionaryFromObject:a3 ofType:@"application/json"];
  id v6 = [v5 objectForKeyedSubscript:@"status"];
  unsigned int v7 = [v6 isEqualToString:@"failure"];

  if (a4 && v7)
  {
    BOOL v8 = [v5 objectForKeyedSubscript:@"error"];

    if (v8)
    {
      unsigned int v9 = [v5 objectForKeyedSubscript:@"error"];
      unsigned __int8 v10 = [v9 objectForKeyedSubscript:@"code"];

      BOOL v11 = [v5 objectForKeyedSubscript:@"code"];
      uint64_t v12 = [v11 objectForKeyedSubscript:@"text"];

      uint64_t v13 = AKWalrusErrorDomain;
      NSErrorUserInfoKey v16 = NSLocalizedDescriptionKey;
      NSErrorUserInfoKey v17 = v12;
      uint64_t v14 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
      *a4 = +[NSError errorWithDomain:v13 code:v10 userInfo:v14];
    }
    else
    {
      *a4 = +[NSError errorWithDomain:AKWalrusErrorDomain code:-5001 userInfo:0];
    }
  }

  return v7 ^ 1;
}

- (id)parseRefreshUrl:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)NSXMLParser) initWithData:v4];

  [v5 setDelegate:self];
  [v5 parse];
  id v6 = [(AKWalrusRequestProvider *)self refreshUrl];

  return v6;
}

- (void)parser:(id)a3 didStartElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6 attributes:(id)a7
{
  id v10 = a7;
  if ([a4 isEqualToString:@"clientInfo"])
  {
    unsigned int v9 = [v10 objectForKey:@"refreshUrl"];
    [(AKWalrusRequestProvider *)self setRefreshUrl:v9];
  }
}

- (id)_AKAuthContextWithUsername:(id)a3 password:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init((Class)AKAppleIDAuthenticationContext);
  unsigned int v9 = [(AKWalrusRequestProvider *)self walrusContext];
  id v10 = [v9 altDSID];
  [v8 setAltDSID:v10];

  [v8 setUsername:v7];
  [v8 _setPassword:v6];

  [v8 setAuthenticationType:1];

  return v8;
}

- (void)getPETForUsername:(id)a3 password:(id)a4 completion:(id)a5
{
  id v8 = a5;
  unsigned int v9 = [(AKWalrusRequestProvider *)self _AKAuthContextWithUsername:a3 password:a4];
  id v10 = objc_alloc_init((Class)AKAppleIDAuthenticationController);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000C7880;
  v12[3] = &unk_100228318;
  id v13 = v8;
  id v11 = v8;
  [v10 authenticateWithContext:v9 completion:v12];
}

- (AKWalrusContext)walrusContext
{
  return self->_walrusContext;
}

- (void)setWalrusContext:(id)a3
{
}

- (NSString)refreshUrl
{
  return self->_refreshUrl;
}

- (void)setRefreshUrl:(id)a3
{
}

- (NSString)secondaryToken
{
  return self->_secondaryToken;
}

- (void)setSecondaryToken:(id)a3
{
}

- (NSString)reqInterceptToken
{
  return self->_reqInterceptToken;
}

- (void)setReqInterceptToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reqInterceptToken, 0);
  objc_storeStrong((id *)&self->_secondaryToken, 0);
  objc_storeStrong((id *)&self->_refreshUrl, 0);

  objc_storeStrong((id *)&self->_walrusContext, 0);
}

@end
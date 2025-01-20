@interface AKInheritanceRequestProvider
- (AKInheritanceContext)inheritanceContext;
- (AKInheritanceRequestProvider)initWithContext:(id)a3 urlBagKey:(id)a4;
- (BOOL)signRequest:(id)a3 error:(id *)a4;
- (BOOL)signWithIdentityToken;
- (BOOL)validateResponseData:(id)a3 error:(id *)a4;
- (id)_bodyForBeneficiaryAliasEndpoint;
- (id)_bodyForBeneficiaryEndpoint;
- (id)authKitBody;
- (unint64_t)expectedResponseType;
- (unint64_t)requestBodyType;
- (void)setInheritanceContext:(id)a3;
- (void)setSignWithIdentityToken:(BOOL)a3;
@end

@implementation AKInheritanceRequestProvider

- (AKInheritanceRequestProvider)initWithContext:(id)a3 urlBagKey:(id)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)AKInheritanceRequestProvider;
  v7 = [(AKURLRequestProviderImpl *)&v10 initWithContext:v6 urlBagKey:a4 shouldCacheResource:0];
  v8 = v7;
  if (v7) {
    [(AKInheritanceRequestProvider *)v7 setInheritanceContext:v6];
  }

  return v8;
}

- (unint64_t)expectedResponseType
{
  return 1;
}

- (unint64_t)requestBodyType
{
  return 1;
}

- (id)authKitBody
{
  v3 = [(AKURLRequestProviderImpl *)self urlBagKey];
  if ([v3 isEqualToString:AKURLBagKeyInheritanceSetupBeneficiaryKey]) {
    goto LABEL_4;
  }
  v4 = [(AKURLRequestProviderImpl *)self urlBagKey];
  if ([v4 isEqualToString:AKURLBagKeyInheritanceUpdateBeneficiaryKey])
  {

LABEL_4:
LABEL_5:
    v5 = [(AKInheritanceRequestProvider *)self _bodyForBeneficiaryEndpoint];
    goto LABEL_6;
  }
  v7 = [(AKURLRequestProviderImpl *)self urlBagKey];
  unsigned __int8 v8 = [v7 isEqualToString:AKURLBagKeyInheritanceRemoveBeneficiaryKey];

  if (v8) {
    goto LABEL_5;
  }
  v9 = [(AKURLRequestProviderImpl *)self urlBagKey];
  unsigned int v10 = [v9 isEqualToString:AKURLBagKeyInheritanceSetupBeneficiaryAliasKey];

  if (v10)
  {
    v5 = [(AKInheritanceRequestProvider *)self _bodyForBeneficiaryAliasEndpoint];
  }
  else
  {
    v5 = 0;
  }
LABEL_6:

  return v5;
}

- (BOOL)signRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [AKDServerUIController alloc];
  unsigned __int8 v8 = [(AKURLRequestProviderImpl *)self client];
  v9 = [(AKDServerUIController *)v7 initWithClient:v8];

  id v10 = objc_alloc((Class)AKAppleIDAuthenticationContext);
  v11 = [(AKInheritanceRequestProvider *)self inheritanceContext];
  id v12 = [v10 initWithAuthenticatedServerRequestContext:v11];

  objc_msgSend(v12, "set_shouldSendIdentityTokenForRemoteUI:", -[AKInheritanceRequestProvider signWithIdentityToken](self, "signWithIdentityToken"));
  objc_msgSend(v12, "set_shouldSendGrandSlamTokensForRemoteUI:", 1);
  v13 = [(AKDServerUIController *)v9 resourceLoadDelegateWithContext:v12];
  v14 = [(AKURLRequestProviderImpl *)self urlBagKey];
  [v13 setInitialURLRequestKey:v14];

  v15 = [(AKURLRequestProviderImpl *)self urlBagKey];
  [v13 setBagUrlKey:v15];

  v16 = [(AKURLRequestProviderImpl *)self dataCenterIdentifier];
  [v13 setDataCenterIdentifier:v16];

  v17 = [(AKInheritanceRequestProvider *)self inheritanceContext];
  v18 = [v17 beneficiarySetupToken];
  [v13 setServiceToken:v18];

  v19 = [(AKURLRequestProviderImpl *)self urlBagKey];
  LODWORD(v18) = [v19 isEqualToString:AKURLBagKeyInheritanceSetupBeneficiaryAliasKey];

  if (v18) {
    [v13 setServiceToken:0];
  }
  v20 = [v13 heartbeatToken];

  if (v20)
  {
    [v13 signRequestWithCommonHeaders:v6];
  }
  else
  {
    v21 = _AKLogSystem();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_10017E8D4(self, v21);
    }

    if (a4)
    {
      *a4 = +[NSError ak_errorWithCode:-7042];
    }
  }

  return v20 != 0;
}

- (id)_bodyForBeneficiaryEndpoint
{
  v3 = +[NSMutableDictionary dictionary];
  v4 = [(AKInheritanceRequestProvider *)self inheritanceContext];
  v5 = [v4 beneficiaryIdentifier];

  if (v5)
  {
    id v6 = [(AKInheritanceRequestProvider *)self inheritanceContext];
    v7 = [v6 beneficiaryIdentifier];
    [v3 setObject:v7 forKeyedSubscript:@"beneficiaryUUID"];
  }
  unsigned __int8 v8 = [(AKInheritanceRequestProvider *)self inheritanceContext];
  v9 = [v8 accessKey];

  if (v9)
  {
    id v10 = [(AKInheritanceRequestProvider *)self inheritanceContext];
    v11 = [v10 accessKey];
    id v12 = [v11 claimTokenString];
    [v3 setObject:v12 forKeyedSubscript:@"claimId"];

    v13 = [(AKInheritanceRequestProvider *)self inheritanceContext];
    v14 = [v13 accessKey];
    v15 = [v14 wrappedKeyData];
    v16 = [v15 base64EncodedStringWithOptions:0];

    [v3 setObject:v16 forKeyedSubscript:@"beneficiaryWrappedKey"];
  }
  v17 = [(AKInheritanceRequestProvider *)self inheritanceContext];
  v18 = [v17 manifest];

  if (v18)
  {
    v19 = [(AKInheritanceRequestProvider *)self inheritanceContext];
    v20 = [v19 manifest];
    v21 = [v20 parsableRepresentation];
    [v3 setObject:v21 forKeyedSubscript:@"selections"];
  }

  return v3;
}

- (id)_bodyForBeneficiaryAliasEndpoint
{
  v3 = +[NSMutableDictionary dictionary];
  v4 = [(AKInheritanceRequestProvider *)self inheritanceContext];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v6 = [(AKInheritanceRequestProvider *)self inheritanceContext];
    v7 = [v6 accessKeyString];

    if (v7)
    {
      unsigned __int8 v8 = [v6 accessKeyString];
      v9 = [v8 uppercaseString];
      [v3 setObject:v9 forKeyedSubscript:@"accessKey"];
    }
    id v10 = [v6 beneficiaryPassword];

    if (v10)
    {
      v11 = [v6 beneficiaryPassword];
      [v3 setObject:v11 forKeyedSubscript:@"beneficiaryPassword"];
    }
    id v12 = [v6 beneficiaryFirstName];

    if (v12)
    {
      v13 = [v6 beneficiaryFirstName];
      [v3 setObject:v13 forKeyedSubscript:@"beneficiaryFirstName"];
    }
    v14 = [v6 beneficiaryLastName];

    if (v14)
    {
      v15 = [v6 beneficiaryLastName];
      [v3 setObject:v15 forKeyedSubscript:@"beneficiaryLastName"];
    }
  }

  return v3;
}

- (BOOL)validateResponseData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)AKInheritanceRequestProvider;
  if ([(AKURLRequestProviderImpl *)&v17 validateResponseData:v6 error:a4])
  {
    v7 = +[AAFSerialization dictionaryFromObject:v6 ofType:@"application/json"];
    unsigned __int8 v8 = v7;
    if (v7)
    {
      uint64_t v9 = AKErrorStatusCodeKey;
      id v10 = [v7 objectForKeyedSubscript:AKErrorStatusCodeKey];
      v11 = v10;
      if (v10 && [v10 integerValue])
      {
        id v12 = _AKLogSystem();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          sub_10017E984(v11, v12);
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

- (AKInheritanceContext)inheritanceContext
{
  return self->_context;
}

- (void)setInheritanceContext:(id)a3
{
}

- (BOOL)signWithIdentityToken
{
  return self->_signWithIdentityToken;
}

- (void)setSignWithIdentityToken:(BOOL)a3
{
  self->_signWithIdentityToken = a3;
}

- (void).cxx_destruct
{
}

@end
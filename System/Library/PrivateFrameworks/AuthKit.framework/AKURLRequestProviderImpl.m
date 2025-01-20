@interface AKURLRequestProviderImpl
- (AKAccountManager)accountManager;
- (AKAppleIDAuthenticationContext)concreteAuthenticationContext;
- (AKAuthenticatedServerRequest)context;
- (AKClient)client;
- (AKURLRequestProviderImpl)initWithContext:(id)a3;
- (AKURLRequestProviderImpl)initWithContext:(id)a3 url:(id)a4;
- (AKURLRequestProviderImpl)initWithContext:(id)a3 urlBagKey:(id)a4;
- (AKURLRequestProviderImpl)initWithContext:(id)a3 urlBagKey:(id)a4 shouldCacheResource:(BOOL)a5;
- (AKURLRequestProviderImpl)initWithContext:(id)a3 urlBagKey:(id)a4 shouldCacheResource:(BOOL)a5 accountManager:(id)a6;
- (AKURLRequestProviderImpl)initWithUrlBagKey:(id)a3;
- (BOOL)_denyVirtualInterfaces;
- (BOOL)_validateDataExists:(id)a3;
- (BOOL)_validateErrorCode:(id)a3 withKey:(id)a4;
- (BOOL)_validateJSONResponseData:(id)a3 error:(id *)a4;
- (BOOL)_validateResponseBodyFormat;
- (BOOL)shouldCacheResource;
- (BOOL)signRequest:(id)a3 error:(id *)a4;
- (BOOL)validateResponseData:(id)a3 error:(id *)a4;
- (NSData)authKitBodyData;
- (NSDictionary)authKitBody;
- (NSDictionary)serverCompatibleRequestBody;
- (NSString)dataCenterIdentifier;
- (NSString)urlBagKey;
- (NSURL)requestURLOverride;
- (id)_errorFromResponseDictionary:(id)a3;
- (id)appendRequestUrl:(id)a3 queryParameterNamed:(id)a4 value:(id)a5;
- (id)responseDictionaryWithData:(id)a3 error:(id *)a4;
- (id)serverCompatibleRequestBodyWithPayload:(id)a3;
- (unint64_t)expectedResponseType;
- (unint64_t)requestBodyType;
- (void)buildRequestWithCompletion:(id)a3;
- (void)requestURLWithCompletion:(id)a3;
- (void)setAccountManager:(id)a3;
- (void)setAuthKitBody:(id)a3;
- (void)setAuthKitBodyData:(id)a3;
- (void)setClient:(id)a3;
- (void)setConcreteAuthenticationContext:(id)a3;
- (void)setContext:(id)a3;
- (void)setDataCenterIdentifier:(id)a3;
- (void)setShouldCacheResource:(BOOL)a3;
- (void)setUrlBagKey:(id)a3;
- (void)set_denyVirtualInterfaces:(BOOL)a3;
@end

@implementation AKURLRequestProviderImpl

- (AKURLRequestProviderImpl)initWithUrlBagKey:(id)a3
{
  id v5 = a3;
  v6 = [(AKURLRequestProviderImpl *)self init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_urlBagKey, a3);
  }

  return v7;
}

- (AKURLRequestProviderImpl)initWithContext:(id)a3
{
  id v5 = a3;
  v6 = [(AKURLRequestProviderImpl *)self init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_context, a3);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v8 = (AKAppleIDAuthenticationContext *)v5;
    }
    else {
      v8 = (AKAppleIDAuthenticationContext *)[objc_alloc((Class)AKAppleIDAuthenticationContext) initWithAuthenticatedServerRequestContext:v5];
    }
    concreteAuthenticationContext = v7->_concreteAuthenticationContext;
    v7->_concreteAuthenticationContext = v8;
  }
  return v7;
}

- (AKURLRequestProviderImpl)initWithContext:(id)a3 url:(id)a4
{
  id v7 = a4;
  v8 = [(AKURLRequestProviderImpl *)self initWithContext:a3];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_requestURLOverride, a4);
  }

  return v9;
}

- (AKURLRequestProviderImpl)initWithContext:(id)a3 urlBagKey:(id)a4
{
  return [(AKURLRequestProviderImpl *)self initWithContext:a3 urlBagKey:a4 shouldCacheResource:0];
}

- (AKURLRequestProviderImpl)initWithContext:(id)a3 urlBagKey:(id)a4 shouldCacheResource:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = +[AKAccountManager sharedInstance];
  v11 = [(AKURLRequestProviderImpl *)self initWithContext:v9 urlBagKey:v8 shouldCacheResource:v5 accountManager:v10];

  return v11;
}

- (AKURLRequestProviderImpl)initWithContext:(id)a3 urlBagKey:(id)a4 shouldCacheResource:(BOOL)a5 accountManager:(id)a6
{
  id v11 = a4;
  id v12 = a6;
  v13 = [(AKURLRequestProviderImpl *)self initWithContext:a3];
  if (v13)
  {
    v14 = (NSString *)[v11 copy];
    urlBagKey = v13->_urlBagKey;
    v13->_urlBagKey = v14;

    v13->_shouldCacheResource = a5;
    objc_storeStrong((id *)&v13->_accountManager, a6);
    objc_storeStrong((id *)&v13->_urlBagKey, a4);
  }

  return v13;
}

- (void)requestURLWithCompletion:(id)a3
{
  id v9 = a3;
  v4 = [(AKURLRequestProviderImpl *)self requestURLOverride];

  if (v4)
  {
    BOOL v5 = v9;
    if (!v9) {
      goto LABEL_6;
    }
    v6 = [(AKURLRequestProviderImpl *)self requestURLOverride];
    (*((void (**)(id, void *, void))v9 + 2))(v9, v6, 0);
  }
  else
  {
    id v7 = [(AKAuthenticatedServerRequest *)self->_context altDSID];
    v6 = +[AKURLBag bagForAltDSID:v7];

    id v8 = [(AKURLRequestProviderImpl *)self urlBagKey];
    [v6 urlForKey:v8 completion:v9];
  }
  BOOL v5 = v9;
LABEL_6:
}

- (void)buildRequestWithCompletion:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100023174;
  v4[3] = &unk_100227228;
  BOOL v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(AKURLRequestProviderImpl *)v5 requestURLWithCompletion:v4];
}

- (unint64_t)expectedResponseType
{
  return 0;
}

- (unint64_t)requestBodyType
{
  return 0;
}

- (id)responseDictionaryWithData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([(AKURLRequestProviderImpl *)self _validateDataExists:v6])
  {
    unint64_t v7 = [(AKURLRequestProviderImpl *)self expectedResponseType];
    switch(v7)
    {
      case 2uLL:
        id v11 = _AKLogSystem();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
          sub_10017D408();
        }

        break;
      case 1uLL:
        CFStringRef v8 = @"application/json";
        goto LABEL_14;
      case 0uLL:
        CFStringRef v8 = @"application/x-plist";
LABEL_14:
        v10 = +[AAFSerialization dictionaryFromObject:v6 ofType:v8];
LABEL_15:
        id v12 = [(AKURLRequestProviderImpl *)self _errorFromResponseDictionary:v10];
        id v9 = v12;
        if (a4)
        {
          id v9 = v12;
          *a4 = v9;
        }
        goto LABEL_17;
    }
    v10 = 0;
    goto LABEL_15;
  }
  id v9 = _AKLogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412290;
    v15 = self;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%@: Server returned no response, treating as success", (uint8_t *)&v14, 0xCu);
  }
  v10 = &__NSDictionary0__struct;
LABEL_17:

  return v10;
}

- (id)_errorFromResponseDictionary:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)AKErrorStatusCodeKey;
  id v6 = [v4 objectForKeyedSubscript:AKErrorStatusCodeKey];
  objc_opt_class();
  id v7 = v6;
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }

  if (v7) {
    BOOL v9 = v8 == 0;
  }
  else {
    BOOL v9 = 0;
  }
  if (v9)
  {
    v13 = _AKLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v21 = 138412802;
      v22 = self;
      __int16 v23 = 2112;
      id v24 = v7;
      __int16 v25 = 2112;
      id v26 = v5;
      _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%@: Unexpected error code value (%@) for key (%@)", (uint8_t *)&v21, 0x20u);
    }

    int v14 = +[NSError ak_errorWithCode:-7010];
  }
  else if ([v8 integerValue])
  {
    id v10 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:3];
    objc_opt_class();
    id v11 = [v4 objectForKeyedSubscript:AKErrorMessageKey];
    if (objc_opt_isKindOfClass()) {
      id v12 = v11;
    }
    else {
      id v12 = 0;
    }

    v15 = _AKLogSystem();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int v21 = 138412802;
      v22 = self;
      __int16 v23 = 2112;
      id v24 = v8;
      __int16 v25 = 2112;
      id v26 = v12;
      _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%@: Server request failed with code (%@) and message (%@)", (uint8_t *)&v21, 0x20u);
    }

    [v10 setObject:v8 forKeyedSubscript:v5];
    [v10 setObject:v12 forKeyedSubscript:NSLocalizedDescriptionKey];
    objc_opt_class();
    uint64_t v16 = AKSubErrorStatusCodeKey;
    id v17 = [v4 objectForKeyedSubscript:AKSubErrorStatusCodeKey];
    if (objc_opt_isKindOfClass()) {
      id v18 = v17;
    }
    else {
      id v18 = 0;
    }

    if ([v18 integerValue]) {
      [v10 setObject:v18 forKeyedSubscript:v16];
    }
    id v19 = [v10 copy];
    int v14 = +[NSError ak_errorWithCode:-7010 userInfo:v19];
  }
  else
  {
    int v14 = 0;
  }

  return v14;
}

- (BOOL)validateResponseData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([(AKURLRequestProviderImpl *)self _validateDataExists:v6])
  {
    if ([(AKURLRequestProviderImpl *)self _validateResponseBodyFormat])
    {
      id v7 = +[AAFSerialization dictionaryFromObject:v6 ofType:@"application/x-plist"];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v24 = _AKLogSystem();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
          sub_10017D4E0();
        }

        *a4 = +[NSError ak_errorWithCode:-7010];
        int v25 = 1;
        goto LABEL_29;
      }
      uint64_t v8 = AKErrorStatusCodeKey;
      BOOL v9 = [v7 objectForKeyedSubscript:AKErrorStatusCodeKey];
      if ([(AKURLRequestProviderImpl *)self _validateErrorCode:v9 withKey:v8])
      {
        if (![v9 integerValue])
        {
          int v25 = 0;
LABEL_28:

LABEL_29:
          unsigned __int8 v22 = v25 == 0;
          goto LABEL_30;
        }
        id v10 = objc_alloc((Class)NSMutableDictionary);
        uint64_t v30 = v8;
        v31 = v9;
        id v11 = +[NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
        id v12 = [v10 initWithDictionary:v11];

        uint64_t v13 = [v7 objectForKeyedSubscript:AKErrorMessageKey];
        int v14 = _AKLogSystem();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          sub_10017D474();
        }

        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v12 setObject:v13 forKeyedSubscript:NSLocalizedDescriptionKey];
        }
        uint64_t v15 = AKSubErrorStatusCodeKey;
        uint64_t v16 = [v7 objectForKeyedSubscript:AKSubErrorStatusCodeKey];
        uint64_t v28 = v13;
        if (v16)
        {
          unsigned int v17 = -[AKURLRequestProviderImpl _validateErrorCode:withKey:](self, "_validateErrorCode:withKey:", v16, v15, v13);
          uint64_t v18 = AKAppleIDAuthenticationServerErrorDomain;
          if (v17)
          {
            id v19 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", AKAppleIDAuthenticationServerErrorDomain, [v16 integerValue], 0);
            v20 = +[NSMutableDictionary dictionary];
            [v20 setObject:v19 forKeyedSubscript:NSUnderlyingErrorKey];
            [v12 setObject:v16 forKeyedSubscript:v15];
          }
          else
          {
            v20 = 0;
          }
        }
        else
        {
          v20 = 0;
          uint64_t v18 = AKAppleIDAuthenticationServerErrorDomain;
        }
        id v26 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v18, objc_msgSend(v9, "integerValue", v28), v20);
        [v12 setObject:v26 forKeyedSubscript:NSUnderlyingErrorKey];
        *a4 = +[NSError ak_errorWithCode:-7010 userInfo:v12];
      }
      else
      {
        *a4 = +[NSError ak_errorWithCode:-7010];
      }
      int v25 = 1;
      goto LABEL_28;
    }
    __int16 v23 = _AKLogSystem();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
      sub_10017D520();
    }

    unsigned __int8 v22 = [(AKURLRequestProviderImpl *)self _validateJSONResponseData:v6 error:a4];
  }
  else
  {
    int v21 = _AKLogSystem();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
      sub_10017D554();
    }

    unsigned __int8 v22 = 1;
  }
LABEL_30:

  return v22;
}

- (BOOL)_validateJSONResponseData:(id)a3 error:(id *)a4
{
  BOOL v5 = +[AAFSerialization dictionaryFromObject:a3 ofType:@"application/json"];
  id v6 = v5;
  if (!v5) {
    goto LABEL_10;
  }
  uint64_t v7 = AKErrorStatusCodeKey;
  uint64_t v8 = [v5 objectForKeyedSubscript:AKErrorStatusCodeKey];
  BOOL v9 = v8;
  if (!v8 || ![v8 integerValue])
  {

LABEL_10:
    BOOL v14 = 1;
    goto LABEL_11;
  }
  id v10 = _AKLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    sub_10017D588(v9, v10);
  }

  id v11 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", AKAppleIDAuthenticationServerErrorDomain, [v9 integerValue], 0);
  id v12 = +[NSMutableDictionary dictionary];
  [v12 setObject:v11 forKeyedSubscript:NSUnderlyingErrorKey];
  [v12 setObject:v9 forKeyedSubscript:v7];
  uint64_t v13 = [v6 objectForKeyedSubscript:AKErrorMessageKey];
  [v12 setObject:v13 forKeyedSubscript:NSLocalizedDescriptionKey];

  if (a4)
  {
    *a4 = +[NSError ak_errorWithCode:-7010 userInfo:v12];
  }

  BOOL v14 = 0;
LABEL_11:

  return v14;
}

- (BOOL)_validateDataExists:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [objc_alloc((Class)NSString) initWithData:v4 encoding:4];

    id v6 = _AKLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      sub_10017D614();
    }
  }
  return a3 != 0;
}

- (BOOL)_validateResponseBodyFormat
{
  unint64_t v3 = [(AKURLRequestProviderImpl *)self expectedResponseType];
  if (v3)
  {
    id v4 = _AKLogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_10017D680(self, v4);
    }
  }
  return v3 == 0;
}

- (BOOL)_validateErrorCode:(id)a3 withKey:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    uint64_t v8 = _AKLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10017D700();
    }

    BOOL v7 = 0;
  }
  else
  {
    BOOL v7 = 1;
  }

  return v7;
}

- (NSDictionary)serverCompatibleRequestBody
{
  unint64_t v3 = [(AKURLRequestProviderImpl *)self authKitBody];
  id v4 = [(AKURLRequestProviderImpl *)self serverCompatibleRequestBodyWithPayload:v3];

  return (NSDictionary *)v4;
}

- (id)serverCompatibleRequestBodyWithPayload:(id)a3
{
  id v3 = a3;
  id v4 = [&__NSDictionary0__struct mutableCopy];
  [v4 setObject:&__NSDictionary0__struct forKeyedSubscript:AKRequestHeadersKey];
  id v5 = [&__NSDictionary0__struct mutableCopy];
  id v6 = v5;
  if (v3) {
    [v5 addEntriesFromDictionary:v3];
  }
  [v4 setObject:v6 forKeyedSubscript:AKRequestBodyKey];
  id v7 = [v4 copy];

  return v7;
}

- (BOOL)signRequest:(id)a3 error:(id *)a4
{
  if (a4)
  {
    *a4 = +[NSError ak_errorWithCode:-7027];
  }
  return 0;
}

- (id)appendRequestUrl:(id)a3 queryParameterNamed:(id)a4 value:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = objc_alloc((Class)NSURLComponents);
  id v11 = [v7 absoluteString];
  id v12 = [v10 initWithString:v11];

  if (v12)
  {
    uint64_t v13 = [v12 queryItems];
    id v14 = [v13 mutableCopy];

    if (!v14) {
      id v14 = objc_alloc_init((Class)NSMutableArray);
    }
    uint64_t v15 = +[NSURLQueryItem queryItemWithName:v8 value:v9];
    [v14 addObject:v15];
    [v12 setQueryItems:v14];
    id v16 = [v12 URL];
  }
  else
  {
    unsigned int v17 = _AKLogSystem();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      int v19 = 138412802;
      id v20 = v8;
      __int16 v21 = 2112;
      id v22 = v9;
      __int16 v23 = 2112;
      id v24 = v7;
      _os_log_debug_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "Failed to append %@:%@ to %@", (uint8_t *)&v19, 0x20u);
    }

    id v16 = v7;
  }

  return v16;
}

- (NSDictionary)authKitBody
{
  return self->authKitBody;
}

- (void)setAuthKitBody:(id)a3
{
}

- (AKClient)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
}

- (NSString)urlBagKey
{
  return self->_urlBagKey;
}

- (void)setUrlBagKey:(id)a3
{
}

- (NSURL)requestURLOverride
{
  return self->_requestURLOverride;
}

- (BOOL)shouldCacheResource
{
  return self->_shouldCacheResource;
}

- (void)setShouldCacheResource:(BOOL)a3
{
  self->_shouldCacheResource = a3;
}

- (AKAccountManager)accountManager
{
  return self->_accountManager;
}

- (void)setAccountManager:(id)a3
{
}

- (NSData)authKitBodyData
{
  return self->_authKitBodyData;
}

- (void)setAuthKitBodyData:(id)a3
{
}

- (NSString)dataCenterIdentifier
{
  return self->_dataCenterIdentifier;
}

- (void)setDataCenterIdentifier:(id)a3
{
}

- (BOOL)_denyVirtualInterfaces
{
  return self->__denyVirtualInterfaces;
}

- (void)set_denyVirtualInterfaces:(BOOL)a3
{
  self->__denyVirtualInterfaces = a3;
}

- (AKAppleIDAuthenticationContext)concreteAuthenticationContext
{
  return self->_concreteAuthenticationContext;
}

- (void)setConcreteAuthenticationContext:(id)a3
{
}

- (AKAuthenticatedServerRequest)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_concreteAuthenticationContext, 0);
  objc_storeStrong((id *)&self->_dataCenterIdentifier, 0);
  objc_storeStrong((id *)&self->_authKitBodyData, 0);
  objc_storeStrong((id *)&self->_accountManager, 0);
  objc_storeStrong((id *)&self->_requestURLOverride, 0);
  objc_storeStrong((id *)&self->_urlBagKey, 0);
  objc_storeStrong((id *)&self->_client, 0);

  objc_storeStrong((id *)&self->authKitBody, 0);
}

@end
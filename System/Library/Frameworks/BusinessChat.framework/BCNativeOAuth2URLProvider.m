@interface BCNativeOAuth2URLProvider
+ (BOOL)supportsSecureCoding;
+ (id)URLProviderWithDictionary:(id)a3;
- (BCNativeOAuth2URLProvider)initWithCoder:(id)a3;
- (BOOL)shouldHandleRedirectURI:(id)a3;
- (NSString)debugDescription;
- (id)_initWithAuthorizationURL:(void *)a3 accessTokenURL:(void *)a4 clientSecret:(void *)a5 clientIdentifier:(void *)a6 responseEncryptionKey:(void *)a7 scope:(void *)a8 state:(void *)a9 responseType:;
- (id)authenticationSessionURL;
- (id)responseEncryptionKey;
- (id)tokenExchangeBodyWithCode:(id)a3;
- (id)tokenExchangeURL;
- (void)encodeWithCoder:(id)a3;
@end

@implementation BCNativeOAuth2URLProvider

+ (id)URLProviderWithDictionary:(id)a3
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [v3 objectForKeyedSubscript:@"authorizationUrl"];
  v5 = [MEMORY[0x263EFF9D0] null];
  if (v4 == v5)
  {
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v6 = [v3 objectForKeyedSubscript:@"authorizationUrl"];
  }

  v7 = [v3 objectForKeyedSubscript:@"accessTokenUrl"];
  v8 = [MEMORY[0x263EFF9D0] null];
  if (v7 == v8)
  {
    v41 = 0;
  }
  else
  {
    v41 = [v3 objectForKeyedSubscript:@"accessTokenUrl"];
  }

  v9 = [v3 objectForKeyedSubscript:@"clientIdentifier"];
  v10 = [MEMORY[0x263EFF9D0] null];
  if (v9 == v10)
  {
    v11 = 0;
  }
  else
  {
    v11 = [v3 objectForKeyedSubscript:@"clientIdentifier"];
  }

  v12 = [v3 objectForKeyedSubscript:@"clientSecret"];
  v13 = [MEMORY[0x263EFF9D0] null];
  if (v12 == v13)
  {
    v40 = 0;
  }
  else
  {
    v40 = [v3 objectForKeyedSubscript:@"clientSecret"];
  }

  v14 = [v3 objectForKeyedSubscript:@"responseType"];
  v15 = [MEMORY[0x263EFF9D0] null];
  if (v14 == v15)
  {
    v16 = 0;
  }
  else
  {
    v16 = [v3 objectForKeyedSubscript:@"responseType"];
  }

  v17 = [v3 objectForKeyedSubscript:@"responseEncryptionKey"];
  v18 = [MEMORY[0x263EFF9D0] null];
  if (v17 == v18)
  {
    v19 = 0;
  }
  else
  {
    v19 = [v3 objectForKeyedSubscript:@"responseEncryptionKey"];
  }

  v20 = [v3 objectForKeyedSubscript:@"state"];
  v21 = [MEMORY[0x263EFF9D0] null];
  if (v20 == v21)
  {
    v39 = 0;
  }
  else
  {
    v39 = [v3 objectForKeyedSubscript:@"state"];
  }

  v22 = [v3 objectForKeyedSubscript:@"scope"];
  v23 = [MEMORY[0x263EFF9D0] null];
  if (v22 == v23)
  {
    v24 = 0;
  }
  else
  {
    v24 = [v3 objectForKeyedSubscript:@"scope"];
  }

  if (!v11)
  {
    v25 = (void *)v6;
    v26 = LogCategory_Daemon();
    if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      goto LABEL_54;
    }
    *(_WORD *)buf = 0;
    v35 = "BCNativeOAuth2URLProvider: Unable to create object. Missing 'client identifier' in payload";
LABEL_53:
    _os_log_error_impl(&dword_228C26000, v26, OS_LOG_TYPE_ERROR, v35, buf, 2u);
    goto LABEL_54;
  }
  if (!v19)
  {
    v25 = (void *)v6;
    v26 = LogCategory_Daemon();
    if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      goto LABEL_54;
    }
    *(_WORD *)buf = 0;
    v35 = "BCNativeOAuth2URLProvider: Unable to create. Missing 'responseEncryptionKey' in payload";
    goto LABEL_53;
  }
  if (![v16 length]
    || ([v16 isEqualToString:@"code"] & 1) == 0
    && ([v16 isEqualToString:@"token"] & 1) == 0)
  {
    v25 = (void *)v6;
    v26 = LogCategory_Daemon();
    if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      goto LABEL_54;
    }
    *(_WORD *)buf = 0;
    v35 = "BCNativeOAuth2URLProvider: Unable to create object. Invalid or missing 'responseType' in payload";
    goto LABEL_53;
  }
  if (!v6)
  {
    v25 = 0;
    v26 = LogCategory_Daemon();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v35 = "BCNativeOAuth2URLProvider: Unable to create object. Missing 'authorizationUrl' in payload";
      goto LABEL_53;
    }
LABEL_54:
    v36 = 0;
    goto LABEL_55;
  }
  v25 = (void *)v6;
  v26 = [NSURL URLWithString:v6];
  if (!v26)
  {
    v31 = LogCategory_Daemon();
    if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      goto LABEL_59;
    }
    *(_DWORD *)buf = 138412290;
    v48 = v25;
    v32 = "BCNativeOAuth2URLProvider: Unable to create object. Could not create a valid authorizationURL from string:%@";
    goto LABEL_72;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_42;
  }
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id obj = v24;
  uint64_t v27 = [obj countByEnumeratingWithState:&v42 objects:v46 count:16];
  if (!v27) {
    goto LABEL_41;
  }
  uint64_t v28 = v27;
  uint64_t v29 = *(void *)v43;
  while (2)
  {
    for (uint64_t i = 0; i != v28; ++i)
    {
      if (*(void *)v43 != v29) {
        objc_enumerationMutation(obj);
      }
      if ([*(id *)(*((void *)&v42 + 1) + 8 * i) length])
      {

        if ([v16 isEqualToString:@"code"] && !objc_msgSend(v41, "length"))
        {
          v31 = LogCategory_Daemon();
          if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
            goto LABEL_59;
          }
          *(_WORD *)buf = 0;
          v32 = "BCNativeOAuth2URLProvider: Unable to create object. missing 'accessTokenUrl' in payload when responseTyp"
                "e 'code' is specified";
LABEL_44:
          v33 = v31;
          uint32_t v34 = 2;
LABEL_73:
          _os_log_error_impl(&dword_228C26000, v33, OS_LOG_TYPE_ERROR, v32, buf, v34);
          goto LABEL_59;
        }
        if ([v16 isEqualToString:@"code"])
        {
          v31 = [NSURL URLWithString:v41];
          if (!v31)
          {
            v31 = LogCategory_Daemon();
            if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
              goto LABEL_59;
            }
            *(_DWORD *)buf = 138412290;
            v48 = v41;
            v32 = "BCNativeOAuth2URLProvider: Unable to create object. Could not create a valid accessTokenURL from string:%@";
LABEL_72:
            v33 = v31;
            uint32_t v34 = 12;
            goto LABEL_73;
          }
        }
        else
        {
          v31 = 0;
        }
        v36 = -[BCNativeOAuth2URLProvider _initWithAuthorizationURL:accessTokenURL:clientSecret:clientIdentifier:responseEncryptionKey:scope:state:responseType:]((id *)[BCNativeOAuth2URLProvider alloc], v26, v31, v40, v11, v19, obj, v39, v16);
        goto LABEL_60;
      }
    }
    uint64_t v28 = [obj countByEnumeratingWithState:&v42 objects:v46 count:16];
    if (v28) {
      continue;
    }
    break;
  }
LABEL_41:

LABEL_42:
  v31 = LogCategory_Daemon();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    v32 = "BCNativeOAuth2URLProvider: Unable to create object. Missing atleast one 'scope' in payload.";
    goto LABEL_44;
  }
LABEL_59:
  v36 = 0;
LABEL_60:

LABEL_55:

  return v36;
}

- (id)_initWithAuthorizationURL:(void *)a3 accessTokenURL:(void *)a4 clientSecret:(void *)a5 clientIdentifier:(void *)a6 responseEncryptionKey:(void *)a7 scope:(void *)a8 state:(void *)a9 responseType:
{
  id v26 = a2;
  id v25 = a3;
  id v24 = a4;
  id v23 = a5;
  id v22 = a6;
  id v21 = a7;
  id v20 = a8;
  id v17 = a9;
  if (a1)
  {
    v27.receiver = a1;
    v27.super_class = (Class)BCNativeOAuth2URLProvider;
    v18 = (id *)objc_msgSendSuper2(&v27, sel_init);
    a1 = v18;
    if (v18)
    {
      objc_storeStrong(v18 + 7, a2);
      objc_storeStrong(a1 + 8, a3);
      objc_storeStrong(a1 + 2, a4);
      objc_storeStrong(a1 + 1, a5);
      objc_storeStrong(a1 + 5, a9);
      objc_storeStrong(a1 + 6, a6);
      objc_storeStrong(a1 + 4, a8);
      objc_storeStrong(a1 + 3, a7);
    }
  }

  return a1;
}

- (void)encodeWithCoder:(id)a3
{
  accessTokenURL = self->_accessTokenURL;
  id v5 = a3;
  [v5 encodeObject:accessTokenURL forKey:@"accessTokenUrl"];
  [v5 encodeObject:self->_authorizationURL forKey:@"authorizationUrl"];
  [v5 encodeObject:self->_clientIdentifier forKey:@"clientIdentifier"];
  [v5 encodeObject:self->_clientSecret forKey:@"clientSecret"];
  [v5 encodeObject:self->_responseType forKey:@"responseType"];
  [v5 encodeObject:self->_responseEncryptionKey forKey:@"responseEncryptionKey"];
  [v5 encodeObject:self->_scope forKey:@"scope"];
  [v5 encodeObject:self->_state forKey:@"state"];
}

- (BCNativeOAuth2URLProvider)initWithCoder:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)BCNativeOAuth2URLProvider;
  id v5 = [(BCNativeOAuth2URLProvider *)&v26 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accessTokenUrl"];
    accessTokenURL = v5->_accessTokenURL;
    v5->_accessTokenURL = (NSURL *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"authorizationUrl"];
    authorizationURL = v5->_authorizationURL;
    v5->_authorizationURL = (NSURL *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"clientIdentifier"];
    clientIdentifier = v5->_clientIdentifier;
    v5->_clientIdentifier = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"clientSecret"];
    clientSecret = v5->_clientSecret;
    v5->_clientSecret = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"responseType"];
    responseType = v5->_responseType;
    v5->_responseType = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"responseEncryptionKey"];
    responseEncryptionKey = v5->_responseEncryptionKey;
    v5->_responseEncryptionKey = (NSString *)v16;

    v18 = (void *)MEMORY[0x263EFFA08];
    uint64_t v19 = objc_opt_class();
    id v20 = objc_msgSend(v18, "setWithObjects:", v19, objc_opt_class(), 0);
    uint64_t v21 = [v4 decodeObjectOfClasses:v20 forKey:@"scope"];
    scope = v5->_scope;
    v5->_scope = (NSArray *)v21;

    uint64_t v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"state"];
    state = v5->_state;
    v5->_state = (NSString *)v23;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)authenticationSessionURL
{
  v18[4] = *MEMORY[0x263EF8340];
  id v17 = (void *)[(NSURL *)self->_authorizationURL copy];
  id v3 = (void *)[objc_alloc(MEMORY[0x263F08BA0]) initWithURL:v17 resolvingAgainstBaseURL:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x263F08BD0]) initWithName:@"response_type" value:self->_responseType];
  id v5 = (void *)[objc_alloc(MEMORY[0x263F08BD0]) initWithName:@"client_id" value:self->_clientIdentifier];
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x263F08BD0]) initWithName:@"redirect_uri" value:@"https://auth.businesschat.apple.com"];
  v7 = (void *)[objc_alloc(MEMORY[0x263F08BD0]) initWithName:@"response_encryption_key" value:self->_responseEncryptionKey];
  if (self->_scope)
  {
    id v8 = objc_alloc(MEMORY[0x263F08BD0]);
    v9 = [(NSArray *)self->_scope componentsJoinedByString:@" "];
    uint64_t v10 = (void *)[v8 initWithName:@"scope" value:v9];
  }
  else
  {
    uint64_t v10 = 0;
  }
  if (self->_state) {
    v11 = (void *)[objc_alloc(MEMORY[0x263F08BD0]) initWithName:@"state" value:self->_state];
  }
  else {
    v11 = 0;
  }
  uint64_t v12 = (void *)MEMORY[0x263EFF980];
  v18[0] = v5;
  v18[1] = v6;
  v18[2] = v7;
  v18[3] = v4;
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:4];
  uint64_t v14 = [v12 arrayWithArray:v13];

  if (self->_scope) {
    [v14 addObject:v10];
  }
  if (self->_state) {
    [v14 addObject:v11];
  }
  [v3 setQueryItems:v14];
  v15 = [v3 URL];

  return v15;
}

- (BOOL)shouldHandleRedirectURI:(id)a3
{
  id v3 = [a3 absoluteString];
  id v4 = [v3 lowercaseString];

  LOBYTE(v3) = [v4 hasPrefix:@"https://auth.businesschat.apple.com"];
  return (char)v3;
}

- (id)tokenExchangeURL
{
  v2 = (void *)[(NSURL *)self->_accessTokenURL copy];

  return v2;
}

- (id)tokenExchangeBodyWithCode:(id)a3
{
  v19[4] = *MEMORY[0x263EF8340];
  id v4 = (objc_class *)MEMORY[0x263F08BA0];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  v7 = (void *)[objc_alloc(MEMORY[0x263F08BD0]) initWithName:@"client_id" value:self->_clientIdentifier];
  id v8 = (void *)[objc_alloc(MEMORY[0x263F08BD0]) initWithName:@"code" value:v5];

  v9 = (void *)[objc_alloc(MEMORY[0x263F08BD0]) initWithName:@"grant_type" value:@"authorization_code"];
  uint64_t v10 = [objc_alloc(MEMORY[0x263F08BD0]) initWithName:@"redirect_uri" value:@"https://auth.businesschat.apple.com"];
  v11 = (void *)v10;
  if (self->_clientSecret)
  {
    uint64_t v12 = (void *)[objc_alloc(MEMORY[0x263F08BD0]) initWithName:@"client_secret" value:self->_clientSecret];
    v18[0] = v7;
    v18[1] = v8;
    v18[2] = v9;
    v18[3] = v11;
    v18[4] = v12;
    v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:5];
    [v6 setQueryItems:v13];
  }
  else
  {
    v19[0] = v7;
    v19[1] = v8;
    v19[2] = v9;
    v19[3] = v10;
    uint64_t v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:4];
    [v6 setQueryItems:v12];
  }

  uint64_t v14 = [v6 query];
  v15 = [MEMORY[0x263F08708] URLQueryAllowedCharacterSet];
  uint64_t v16 = [v14 stringByAddingPercentEncodingWithAllowedCharacters:v15];

  return v16;
}

- (NSString)debugDescription
{
  id v3 = NSString;
  uint64_t v4 = objc_opt_class();
  if (self) {
    clientIdentifier = self->_clientIdentifier;
  }
  else {
    clientIdentifier = 0;
  }
  return (NSString *)[v3 stringWithFormat:@"<%@: %p> clientIdentifier: %@", v4, self, clientIdentifier];
}

- (id)responseEncryptionKey
{
  return self->_responseEncryptionKey;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessTokenURL, 0);
  objc_storeStrong((id *)&self->_authorizationURL, 0);
  objc_storeStrong((id *)&self->_responseEncryptionKey, 0);
  objc_storeStrong((id *)&self->_responseType, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_scope, 0);
  objc_storeStrong((id *)&self->_clientSecret, 0);

  objc_storeStrong((id *)&self->_clientIdentifier, 0);
}

@end
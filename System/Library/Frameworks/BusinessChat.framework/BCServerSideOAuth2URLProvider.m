@interface BCServerSideOAuth2URLProvider
+ (BOOL)supportsSecureCoding;
+ (id)URLProviderWithDictionary:(id)a3;
- (BCServerSideOAuth2URLProvider)initWithCoder:(id)a3;
- (BOOL)shouldHandleRedirectURI:(id)a3;
- (NSString)debugDescription;
- (NSURL)redirectURI;
- (id)_initWithAuthorizationURL:(void *)a3 clientIdentifier:(void *)a4 redirectURI:(void *)a5 scope:(void *)a6 state:(void *)a7 responseType:(void *)a8 additionalParameters:;
- (id)authenticationSessionURL;
- (void)encodeWithCoder:(id)a3;
- (void)setRedirectURI:(id)a3;
@end

@implementation BCServerSideOAuth2URLProvider

+ (id)URLProviderWithDictionary:(id)a3
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [v3 objectForKeyedSubscript:@"authorizationUrl"];
  v5 = [MEMORY[0x263EFF9D0] null];
  if (v4 == v5)
  {
    v6 = 0;
  }
  else
  {
    v6 = [v3 objectForKeyedSubscript:@"authorizationUrl"];
  }

  v7 = [v3 objectForKeyedSubscript:@"clientIdentifier"];
  v8 = [MEMORY[0x263EFF9D0] null];
  if (v7 == v8)
  {
    v52 = 0;
  }
  else
  {
    v52 = [v3 objectForKeyedSubscript:@"clientIdentifier"];
  }

  v9 = [v3 objectForKeyedSubscript:@"redirectURI"];
  v10 = [MEMORY[0x263EFF9D0] null];
  if (v9 == v10)
  {
    v11 = 0;
  }
  else
  {
    v11 = [v3 objectForKeyedSubscript:@"redirectURI"];
  }

  v12 = [v3 objectForKeyedSubscript:@"scope"];
  v13 = [MEMORY[0x263EFF9D0] null];
  if (v12 == v13)
  {
    v14 = 0;
  }
  else
  {
    v14 = [v3 objectForKeyedSubscript:@"scope"];
  }

  v15 = [v3 objectForKeyedSubscript:@"state"];
  v16 = [MEMORY[0x263EFF9D0] null];
  if (v15 == v16)
  {
    v17 = 0;
  }
  else
  {
    v17 = [v3 objectForKeyedSubscript:@"state"];
  }

  v18 = [v3 objectForKeyedSubscript:@"responseType"];
  v19 = [MEMORY[0x263EFF9D0] null];
  if (v18 == v19)
  {
    v20 = 0;
  }
  else
  {
    v20 = [v3 objectForKeyedSubscript:@"responseType"];
  }

  v21 = [v3 objectForKeyedSubscript:@"additionalParameters"];
  v22 = [MEMORY[0x263EFF9D0] null];
  if (v21 == v22)
  {
    v23 = 0;
  }
  else
  {
    v23 = [v3 objectForKeyedSubscript:@"additionalParameters"];
  }

  if (![v6 length])
  {
    v24 = LogCategory_Daemon();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_228C26000, v24, OS_LOG_TYPE_ERROR, "BCServerSideOAuth2URLProvider: Unable to create object. Missing 'authorizationUrl' in payload.", buf, 2u);
    }
    v28 = 0;
    goto LABEL_60;
  }
  v24 = [NSURL URLWithString:v6];
  if (!v24)
  {
    v29 = LogCategory_Daemon();
    v51 = v29;
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      goto LABEL_58;
    }
    *(_DWORD *)buf = 138412290;
    v59 = v6;
    v30 = "BCNativeOAuth2URLProvider: Unable to create object. Could not create a valid authorizationURL from string:%@";
    v31 = v29;
    uint32_t v32 = 12;
LABEL_34:
    _os_log_error_impl(&dword_228C26000, v31, OS_LOG_TYPE_ERROR, v30, buf, v32);
    goto LABEL_58;
  }
  if (![v11 length])
  {
    v33 = LogCategory_Daemon();
    v51 = v33;
    if (!os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
      goto LABEL_58;
    }
    *(_WORD *)buf = 0;
    v30 = "BCServerSideOAuth2URLProvider: Unable to create object. Missing 'redirectURI' in payload.";
    v31 = v33;
    uint32_t v32 = 2;
    goto LABEL_34;
  }
  v50 = v24;
  v25 = [NSURL URLWithString:v11];
  v26 = [v25 scheme];
  v27 = [v26 lowercaseString];
  v51 = v25;
  if ([v27 isEqualToString:@"http"])
  {
  }
  else
  {
    [v25 scheme];
    v34 = v46 = v23;
    [v34 lowercaseString];
    v35 = v48 = v20;
    char v45 = [v35 isEqualToString:@"https"];

    v23 = v46;
    if ((v45 & 1) == 0)
    {
      v41 = LogCategory_Daemon();
      v24 = v50;
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        v43 = [v51 scheme];
        *(_DWORD *)buf = 138412290;
        v59 = v43;
        _os_log_error_impl(&dword_228C26000, v41, OS_LOG_TYPE_ERROR, "BCServerSideOAuth2URLProvider: Unable to create object. Unsupported scheme '%@' for redirect URI", buf, 0xCu);

        v20 = v48;
      }
      goto LABEL_57;
    }
  }
  v24 = v50;
  if ([v52 length])
  {
    if ([v20 length]
      && (([v20 isEqualToString:@"code"] & 1) != 0
       || ([v20 isEqualToString:@"token"] & 1) != 0))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v47 = v23;
        v49 = v20;
        long long v55 = 0u;
        long long v56 = 0u;
        long long v53 = 0u;
        long long v54 = 0u;
        id v36 = v14;
        uint64_t v37 = [v36 countByEnumeratingWithState:&v53 objects:v57 count:16];
        if (v37)
        {
          uint64_t v38 = v37;
          uint64_t v39 = *(void *)v54;
LABEL_43:
          uint64_t v40 = 0;
          while (1)
          {
            if (*(void *)v54 != v39) {
              objc_enumerationMutation(v36);
            }
            if ([*(id *)(*((void *)&v53 + 1) + 8 * v40) length]) {
              break;
            }
            if (v38 == ++v40)
            {
              uint64_t v38 = [v36 countByEnumeratingWithState:&v53 objects:v57 count:16];
              if (v38) {
                goto LABEL_43;
              }
              goto LABEL_49;
            }
          }

          if ([v17 length])
          {
            v24 = v50;
            v23 = v47;
            v20 = v49;
            v28 = -[BCServerSideOAuth2URLProvider _initWithAuthorizationURL:clientIdentifier:redirectURI:scope:state:responseType:additionalParameters:]((id *)[BCServerSideOAuth2URLProvider alloc], v50, v52, v51, v36, v17, v49, v47);
            goto LABEL_59;
          }
          v41 = LogCategory_Daemon();
          v23 = v47;
          v20 = v49;
          v24 = v50;
          if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            v42 = "BCServerSideOAuth2URLProvider: Unable to create object. Missing 'scope' in payload";
            goto LABEL_68;
          }
          goto LABEL_57;
        }
LABEL_49:

        v23 = v47;
        v20 = v49;
        v24 = v50;
      }
      v41 = LogCategory_Daemon();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v42 = "BCServerSideOAuth2URLProvider: Unable to create object. Missing atleast one 'scope' in payload.";
LABEL_68:
        _os_log_error_impl(&dword_228C26000, v41, OS_LOG_TYPE_ERROR, v42, buf, 2u);
      }
    }
    else
    {
      v41 = LogCategory_Daemon();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v42 = "BCServerSideOAuth2URLProvider: Unable to create object. Invalid or nil 'responseType' in payload";
        goto LABEL_68;
      }
    }
  }
  else
  {
    v41 = LogCategory_Daemon();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v42 = "BCServerSideOAuth2URLProvider: Unable to create object. Missing 'clientIdentifier' in payload.";
      goto LABEL_68;
    }
  }
LABEL_57:

LABEL_58:
  v28 = 0;
LABEL_59:

LABEL_60:

  return v28;
}

- (id)_initWithAuthorizationURL:(void *)a3 clientIdentifier:(void *)a4 redirectURI:(void *)a5 scope:(void *)a6 state:(void *)a7 responseType:(void *)a8 additionalParameters:
{
  id v24 = a2;
  id v23 = a3;
  id v22 = a4;
  id v21 = a5;
  id v20 = a6;
  id v16 = a7;
  id v17 = a8;
  if (a1)
  {
    v25.receiver = a1;
    v25.super_class = (Class)BCServerSideOAuth2URLProvider;
    v18 = (id *)objc_msgSendSuper2(&v25, sel_init);
    a1 = v18;
    if (v18)
    {
      objc_storeStrong(v18 + 2, a2);
      objc_storeStrong(a1 + 6, a7);
      objc_storeStrong(a1 + 3, a3);
      objc_storeStrong(a1 + 5, a6);
      objc_storeStrong(a1 + 4, a5);
      objc_storeStrong(a1 + 1, a4);
      objc_storeStrong(a1 + 7, a8);
    }
  }

  return a1;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  [v5 encodeObject:self->_authorizationURL forKey:@"authorizationUrl"];
  [v5 encodeObject:self->_clientIdentifier forKey:@"clientIdentifier"];
  [v5 encodeObject:self->_responseType forKey:@"responseType"];
  [v5 encodeObject:self->_scope forKey:@"scope"];
  [v5 encodeObject:self->_state forKey:@"state"];
  [v5 encodeObject:self->_redirectURI forKey:@"redirectURI"];
  additionalParameters = self->_additionalParameters;
  if (additionalParameters) {
    [v5 encodeObject:additionalParameters forKey:@"additionalParameters"];
  }
}

- (BCServerSideOAuth2URLProvider)initWithCoder:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)BCServerSideOAuth2URLProvider;
  id v5 = [(BCServerSideOAuth2URLProvider *)&v24 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"authorizationUrl"];
    authorizationURL = v5->_authorizationURL;
    v5->_authorizationURL = (NSURL *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"clientIdentifier"];
    clientIdentifier = v5->_clientIdentifier;
    v5->_clientIdentifier = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"responseType"];
    responseType = v5->_responseType;
    v5->_responseType = (NSString *)v10;

    v12 = (void *)MEMORY[0x263EFFA08];
    uint64_t v13 = objc_opt_class();
    v14 = objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    uint64_t v15 = [v4 decodeObjectOfClasses:v14 forKey:@"scope"];
    scope = v5->_scope;
    v5->_scope = (NSArray *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"state"];
    state = v5->_state;
    v5->_state = (NSString *)v17;

    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"redirectURI"];
    redirectURI = v5->_redirectURI;
    v5->_redirectURI = (NSURL *)v19;

    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"additionalParameters"];
    additionalParameters = v5->_additionalParameters;
    v5->_additionalParameters = (NSString *)v21;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)authenticationSessionURL
{
  v29[3] = *MEMORY[0x263EF8340];
  v28 = (void *)[(NSURL *)self->_authorizationURL copy];
  id v3 = (void *)[objc_alloc(MEMORY[0x263F08BA0]) initWithURL:v28 resolvingAgainstBaseURL:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x263F08BD0]) initWithName:@"response_type" value:self->_responseType];
  id v5 = (void *)[objc_alloc(MEMORY[0x263F08BD0]) initWithName:@"client_id" value:self->_clientIdentifier];
  id v6 = objc_alloc(MEMORY[0x263F08BD0]);
  v7 = [(BCServerSideOAuth2URLProvider *)self redirectURI];
  uint64_t v8 = [v7 absoluteString];
  v9 = (void *)[v6 initWithName:@"redirect_uri" value:v8];

  scope = self->_scope;
  if (scope)
  {
    v11 = (objc_class *)MEMORY[0x263F08BD0];
    v12 = scope;
    id v13 = [v11 alloc];
    v14 = [(NSArray *)self->_scope componentsJoinedByString:@" "];
    uint64_t v15 = (void *)[v13 initWithName:@"scope" value:v14];
  }
  else
  {
    uint64_t v15 = 0;
  }
  state = self->_state;
  if (state)
  {
    uint64_t v17 = (objc_class *)MEMORY[0x263F08BD0];
    v18 = state;
    uint64_t v19 = (void *)[[v17 alloc] initWithName:@"state" value:self->_state];
  }
  else
  {
    uint64_t v19 = 0;
  }
  id v20 = (void *)MEMORY[0x263EFF980];
  v29[0] = v5;
  v29[1] = v9;
  v29[2] = v4;
  uint64_t v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v29 count:3];
  id v22 = [v20 arrayWithArray:v21];

  if (self->_scope) {
    [v22 addObject:v15];
  }
  if (self->_state) {
    [v22 addObject:v19];
  }
  if ([(NSString *)self->_additionalParameters length])
  {
    id v23 = [@"?" stringByAppendingString:self->_additionalParameters];
    objc_super v24 = (void *)[objc_alloc(MEMORY[0x263F08BA0]) initWithString:v23];
    objc_super v25 = [v24 queryItems];
    [v22 addObjectsFromArray:v25];
  }
  [v3 setQueryItems:v22];
  v26 = [v3 URL];

  return v26;
}

- (BOOL)shouldHandleRedirectURI:(id)a3
{
  id v3 = [a3 scheme];
  id v4 = [v3 lowercaseString];

  LOBYTE(v3) = [v4 isEqualToString:@"messages-auth"];
  return (char)v3;
}

- (NSString)debugDescription
{
  v2 = self;
  if (self)
  {
    id v3 = [MEMORY[0x263F29C40] builderWithObject:self];
    id v4 = [v2 authenticationSessionURL];
    id v5 = (id)[v3 appendObject:v4 withName:@"Authorization URL"];

    v2 = [v3 build];
  }

  return (NSString *)v2;
}

- (NSURL)redirectURI
{
  return self->_redirectURI;
}

- (void)setRedirectURI:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalParameters, 0);
  objc_storeStrong((id *)&self->_responseType, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_scope, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_authorizationURL, 0);

  objc_storeStrong((id *)&self->_redirectURI, 0);
}

@end
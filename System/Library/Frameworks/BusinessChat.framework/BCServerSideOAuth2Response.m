@interface BCServerSideOAuth2Response
- (BCError)error;
- (BCServerSideOAuth2Response)initWithRedirectURI:(id)a3;
- (NSDictionary)dictionaryValue;
- (id)_initWithDictionary:(id)a3;
- (int64_t)status;
- (void)setError:(id)a3;
- (void)setStatus:(int64_t)a3;
@end

@implementation BCServerSideOAuth2Response

- (BCServerSideOAuth2Response)initWithRedirectURI:(id)a3
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v47.receiver = self;
  v47.super_class = (Class)BCServerSideOAuth2Response;
  v5 = [(BCServerSideOAuth2Response *)&v47 init];
  if (!v5) {
    goto LABEL_34;
  }
  v6 = [MEMORY[0x263F08BA0] componentsWithURL:v4 resolvingAgainstBaseURL:1];
  v5->_status = 0;
  v7 = [MEMORY[0x263F08BA0] componentsWithURL:v4 resolvingAgainstBaseURL:1];
  v8 = [v7 queryItems];

  v9 = [MEMORY[0x263EFF9A0] dictionary];
  if (![v8 count])
  {

    goto LABEL_33;
  }
  id v41 = v4;
  v42 = v6;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v48 objects:v53 count:16];
  if (!v11) {
    goto LABEL_16;
  }
  uint64_t v12 = v11;
  uint64_t v13 = *(void *)v49;
LABEL_5:
  uint64_t v14 = 0;
  while (1)
  {
    if (*(void *)v49 != v13) {
      objc_enumerationMutation(v10);
    }
    v15 = *(void **)(*((void *)&v48 + 1) + 8 * v14);
    v16 = objc_msgSend(v15, "name", v41);
    if ([v16 isEqualToString:@"status"]) {
      break;
    }
    v17 = [v15 name];
    int v18 = [v17 isEqualToString:@"error_code"];

    if (v18) {
      goto LABEL_11;
    }
LABEL_14:
    if (v12 == ++v14)
    {
      uint64_t v12 = [v10 countByEnumeratingWithState:&v48 objects:v53 count:16];
      if (!v12)
      {
LABEL_16:

        long long v43 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        v24 = [v42 queryItems];
        uint64_t v25 = [v24 countByEnumeratingWithState:&v43 objects:v52 count:16];
        if (!v25) {
          goto LABEL_28;
        }
        uint64_t v26 = v25;
        uint64_t v27 = *(void *)v44;
        while (1)
        {
          for (uint64_t i = 0; i != v26; ++i)
          {
            if (*(void *)v44 != v27) {
              objc_enumerationMutation(v24);
            }
            v29 = *(void **)(*((void *)&v43 + 1) + 8 * i);
            v30 = objc_msgSend(v29, "name", v41);
            int v31 = [v30 isEqualToString:@"status"];

            if (v31)
            {
              v32 = [v29 value];
              v5->_status = ServerSideAuthStatusFromNSString(v32);
            }
            else
            {
              v33 = [v29 name];
              int v34 = [v33 isEqualToString:@"error_code"];

              if (!v34) {
                continue;
              }
              v35 = [v29 value];
              uint64_t v36 = [v35 integerValue];

              v37 = [BCError alloc];
              v32 = [NSNumber numberWithInteger:v36];
              uint64_t v38 = [(BCError *)v37 initWithCode:v32 domain:@"com.apple.messages.business.oauth2" message:@"OAuth Error"];
              error = v5->_error;
              v5->_error = (BCError *)v38;
            }
          }
          uint64_t v26 = [v24 countByEnumeratingWithState:&v43 objects:v52 count:16];
          if (!v26)
          {
LABEL_28:

            goto LABEL_32;
          }
        }
      }
      goto LABEL_5;
    }
  }

LABEL_11:
  v19 = [v15 value];
  if ([v19 length])
  {
    v20 = [v15 name];
    v21 = [v9 objectForKeyedSubscript:v20];

    if (v21) {
      goto LABEL_31;
    }
    v22 = [v15 value];
    v23 = [v15 name];
    [v9 setObject:v22 forKeyedSubscript:v23];

    goto LABEL_14;
  }

LABEL_31:
LABEL_32:
  id v4 = v41;
  v6 = v42;
LABEL_33:

LABEL_34:
  return v5;
}

- (id)_initWithDictionary:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)BCServerSideOAuth2Response;
  v5 = [(BCServerSideOAuth2Response *)&v17 init];
  if (v5)
  {
    v6 = LogCategory_Daemon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = [v4 description];
      *(_DWORD *)buf = 138412290;
      v19 = v7;
      _os_log_impl(&dword_228C26000, v6, OS_LOG_TYPE_DEFAULT, "BCAuthenticationResponse: initWithDictionary %@", buf, 0xCu);
    }
    v8 = [v4 objectForKeyedSubscript:@"status"];
    v9 = [MEMORY[0x263EFF9D0] null];
    if (v8 == v9)
    {
      v5->_status = ServerSideAuthStatusFromNSString(0);
    }
    else
    {
      id v10 = [v4 objectForKeyedSubscript:@"status"];
      v5->_status = ServerSideAuthStatusFromNSString(v10);
    }
    error = [v4 objectForKeyedSubscript:@"error_code"];
    uint64_t v12 = [MEMORY[0x263EFF9D0] null];
    if (error == (void *)v12)
    {
      uint64_t v14 = error;
      goto LABEL_11;
    }
    uint64_t v13 = (void *)v12;
    uint64_t v14 = [v4 objectForKeyedSubscript:@"error_code"];

    if (v14)
    {
      v15 = [[BCError alloc] initWithCode:v14 domain:@"com.apple.messages.business.oauth2" message:@"OAuth Error"];
      error = v5->_error;
      v5->_error = v15;
LABEL_11:
    }
  }

  return v5;
}

- (NSDictionary)dictionaryValue
{
  v3 = objc_opt_new();
  id v4 = NSStringFromServerSideAuthStatus([(BCServerSideOAuth2Response *)self status]);
  [v3 setObject:v4 forKeyedSubscript:@"status"];

  v5 = [(BCServerSideOAuth2Response *)self error];
  v6 = [v5 code];

  if (v6)
  {
    v7 = [(BCServerSideOAuth2Response *)self error];
    v8 = [v7 code];
    [v3 setObject:v8 forKeyedSubscript:@"error_code"];
  }

  return (NSDictionary *)v3;
}

- (int64_t)status
{
  return self->_status;
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

- (BCError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
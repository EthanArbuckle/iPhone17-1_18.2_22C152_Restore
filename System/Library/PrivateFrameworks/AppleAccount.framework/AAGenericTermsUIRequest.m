@interface AAGenericTermsUIRequest
+ (Class)responseClass;
- (AAGenericTermsUIRequest)initWithAccount:(id)a3 parameters:(id)a4;
- (AAGenericTermsUIRequest)initWithAccount:(id)a3 parameters:(id)a4 preferPassword:(BOOL)a5;
- (AAGenericTermsUIRequest)initWithAccount:(id)a3 termsEntries:(id)a4;
- (AAGenericTermsUIRequest)initWithParameters:(id)a3;
- (AAGenericTermsUIRequest)initWithTermsEntries:(id)a3;
- (ACAccount)account;
- (BOOL)preferPassword;
- (NSDictionary)additionalHeaders;
- (NSDictionary)requestDictionary;
- (NSString)serverInfo;
- (id)_requestParamsForTermsEntries:(id)a3;
- (id)_requestParamsForTermsEntries:(id)a3 additionalInfo:(id)a4;
- (id)urlRequest;
- (id)urlString;
- (void)setAdditionalHeaders:(id)a3;
- (void)setPreferPassword:(BOOL)a3;
- (void)setServerInfo:(id)a3;
@end

@implementation AAGenericTermsUIRequest

+ (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (id)urlString
{
  v2 = +[AAURLConfiguration urlConfiguration];
  v3 = [v2 genericTermsURL];

  return v3;
}

- (AAGenericTermsUIRequest)initWithParameters:(id)a3
{
  return [(AAGenericTermsUIRequest *)self initWithAccount:0 parameters:a3];
}

- (AAGenericTermsUIRequest)initWithAccount:(id)a3 parameters:(id)a4
{
  return [(AAGenericTermsUIRequest *)self initWithAccount:a3 parameters:a4 preferPassword:1];
}

- (AAGenericTermsUIRequest)initWithAccount:(id)a3 parameters:(id)a4 preferPassword:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v15.receiver = self;
  v15.super_class = (Class)AAGenericTermsUIRequest;
  v11 = [(AAGenericTermsUIRequest *)&v15 init];
  if (v11)
  {
    uint64_t v12 = [v10 copy];
    requestDictionary = v11->_requestDictionary;
    v11->_requestDictionary = (NSDictionary *)v12;

    objc_storeStrong((id *)&v11->_account, a3);
    v11->_preferPassword = a5;
  }

  return v11;
}

- (AAGenericTermsUIRequest)initWithTermsEntries:(id)a3
{
  return [(AAGenericTermsUIRequest *)self initWithAccount:0 termsEntries:a3];
}

- (AAGenericTermsUIRequest)initWithAccount:(id)a3 termsEntries:(id)a4
{
  id v6 = a3;
  v7 = [(AAGenericTermsUIRequest *)self _requestParamsForTermsEntries:a4];
  v8 = [(AAGenericTermsUIRequest *)self initWithAccount:v6 parameters:v7];

  return v8;
}

- (id)_requestParamsForTermsEntries:(id)a3
{
  return [(AAGenericTermsUIRequest *)self _requestParamsForTermsEntries:a3 additionalInfo:0];
}

- (id)_requestParamsForTermsEntries:(id)a3 additionalInfo:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if ([v5 count])
  {
    id v19 = v5;
    v7 = (void *)[v5 mutableCopy];
    [v7 addObject:@"iCloud"];
    if ([v7 containsObject:@"iOSWarranty"]) {
      [v7 addObject:@"iOS"];
    }
    v8 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v7, "count"));
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v9 = v7;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v26 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v21 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v20 + 1) + 8 * i);
          objc_super v15 = objc_opt_new();
          [v15 setObject:v14 forKeyedSubscript:@"name"];
          v16 = [v6 objectForKeyedSubscript:v14];
          if (v16) {
            [v15 addEntriesFromDictionary:v16];
          }
          [v8 addObject:v15];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v26 count:16];
      }
      while (v11);
    }

    v24[0] = @"terms";
    v24[1] = @"format";
    v25[0] = v8;
    v25[1] = @"plist/buddyml";
    v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:2];

    id v5 = v19;
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (id)urlRequest
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  v36.receiver = self;
  v36.super_class = (Class)AAGenericTermsUIRequest;
  v3 = [(AARequest *)&v36 urlRequest];
  v4 = (void *)[v3 mutableCopy];

  [v4 setHTTPMethod:@"POST"];
  id v5 = (void *)[(NSDictionary *)self->_requestDictionary mutableCopy];
  id v6 = v5;
  if (v5) {
    id v7 = v5;
  }
  else {
    id v7 = (id)objc_opt_new();
  }
  v8 = v7;

  serverInfo = self->_serverInfo;
  if (serverInfo) {
    [v8 setObject:serverInfo forKeyedSubscript:@"serverInfo"];
  }
  id v35 = 0;
  uint64_t v10 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v8 format:100 options:0 error:&v35];
  id v11 = v35;
  if (!v10)
  {
    uint64_t v14 = _AALogSystem();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_13;
    }
    objc_super v15 = [v11 localizedDescription];
    *(_DWORD *)buf = 138412290;
    v38 = v15;
    v16 = "No data body to set on HTTP request: %@";
    v17 = v14;
    goto LABEL_11;
  }
  [v4 setHTTPBody:v10];
  id v12 = [NSString alloc];
  id v13 = v10;
  uint64_t v14 = objc_msgSend(v12, "initWithBytes:length:encoding:", objc_msgSend(v13, "bytes"), objc_msgSend(v13, "length"), 4);
  objc_super v15 = _AALogSystem();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v38 = v14;
    v16 = "Request body:%@";
    v17 = v15;
LABEL_11:
    _os_log_impl(&dword_1A11D8000, v17, OS_LOG_TYPE_DEFAULT, v16, buf, 0xCu);
  }

LABEL_13:
  account = self->_account;
  if (account)
  {
    if (!objc_msgSend(v4, "aa_addAuthTokenOrBasicAuthHeaderWithAccount:preferUsingPassword:", account, self->_preferPassword))
    {
      id v28 = 0;
      goto LABEL_20;
    }
    id v19 = [MEMORY[0x1E4F179C8] defaultStore];
    long long v20 = [(ACAccount *)self->_account aa_altDSID];
    long long v21 = objc_msgSend(v19, "aida_accountForAltDSID:", v20);

    long long v22 = [MEMORY[0x1E4F179C8] defaultStore];
    long long v23 = [v22 credentialForAccount:v21 serviceID:@"com.apple.gs.icloud.family.auth"];

    v24 = [v23 token];
    v25 = objc_msgSend(v21, "aida_alternateDSID");
    objc_msgSend(v4, "aa_addGrandslamAuthorizationHeaderWithAltDSID:grandslamToken:", v25, v24);
  }
  v26 = [(AAGenericTermsUIRequest *)self additionalHeaders];

  if (v26)
  {
    uint64_t v27 = [(AAGenericTermsUIRequest *)self additionalHeaders];
    uint64_t v30 = MEMORY[0x1E4F143A8];
    uint64_t v31 = 3221225472;
    v32 = __37__AAGenericTermsUIRequest_urlRequest__block_invoke;
    v33 = &unk_1E5A490B8;
    id v34 = v4;
    [v27 enumerateKeysAndObjectsUsingBlock:&v30];
  }
  objc_msgSend(v4, "setValue:forHTTPHeaderField:", @"text/plist", @"Content-Type", v30, v31, v32, v33);
  id v28 = v4;
LABEL_20:

  return v28;
}

uint64_t __37__AAGenericTermsUIRequest_urlRequest__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setValue:a3 forHTTPHeaderField:a2];
}

- (NSDictionary)requestDictionary
{
  return self->_requestDictionary;
}

- (ACAccount)account
{
  return self->_account;
}

- (NSDictionary)additionalHeaders
{
  return self->_additionalHeaders;
}

- (void)setAdditionalHeaders:(id)a3
{
}

- (BOOL)preferPassword
{
  return self->_preferPassword;
}

- (void)setPreferPassword:(BOOL)a3
{
  self->_preferPassword = a3;
}

- (NSString)serverInfo
{
  return self->_serverInfo;
}

- (void)setServerInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverInfo, 0);
  objc_storeStrong((id *)&self->_additionalHeaders, 0);
  objc_storeStrong((id *)&self->_account, 0);

  objc_storeStrong((id *)&self->_requestDictionary, 0);
}

@end
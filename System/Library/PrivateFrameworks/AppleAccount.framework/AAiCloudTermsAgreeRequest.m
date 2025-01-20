@interface AAiCloudTermsAgreeRequest
+ (Class)responseClass;
- (AAiCloudTermsAgreeRequest)initWithURLString:(id)a3 account:(id)a4;
- (ACAccount)account;
- (BOOL)preferPassword;
- (NSDictionary)additionalHeaders;
- (NSNumber)slaVersion;
- (NSString)serverInfo;
- (id)urlRequest;
- (void)performRequestWithHandler:(id)a3;
- (void)setAccount:(id)a3;
- (void)setAdditionalHeaders:(id)a3;
- (void)setPreferPassword:(BOOL)a3;
- (void)setServerInfo:(id)a3;
- (void)setSlaVersion:(id)a3;
- (void)urlRequest;
@end

@implementation AAiCloudTermsAgreeRequest

+ (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (AAiCloudTermsAgreeRequest)initWithURLString:(id)a3 account:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)AAiCloudTermsAgreeRequest;
  v8 = [(AARequest *)&v11 initWithURLString:a3];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_account, a4);
    v9->_preferPassword = 1;
  }

  return v9;
}

- (id)urlRequest
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v22.receiver = self;
  v22.super_class = (Class)AAiCloudTermsAgreeRequest;
  v3 = [(AARequest *)&v22 urlRequest];
  v4 = (void *)[v3 mutableCopy];

  [v4 setHTTPMethod:@"POST"];
  [v4 addValue:@"application/xml" forHTTPHeaderField:@"Content-Type"];
  objc_msgSend(v4, "aa_addAuthTokenOrBasicAuthHeaderWithAccount:preferUsingPassword:", self->_account, self->_preferPassword);
  if (self->_account)
  {
    v5 = [MEMORY[0x1E4F179C8] defaultStore];
    v6 = [(ACAccount *)self->_account aa_altDSID];
    id v7 = objc_msgSend(v5, "aida_accountForAltDSID:", v6);

    v8 = [MEMORY[0x1E4F179C8] defaultStore];
    v9 = [v8 credentialForAccount:v7 serviceID:@"com.apple.gs.icloud.family.auth"];

    v10 = [v9 token];
    objc_super v11 = [v7 aida_alternateDSID];
    objc_msgSend(v4, "aa_addGrandslamAuthorizationHeaderWithAltDSID:grandslamToken:", v11, v10);
  }
  else
  {
    id v7 = _AALogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[AAiCloudTermsAgreeRequest urlRequest]();
    }
  }

  v12 = [(AAiCloudTermsAgreeRequest *)self additionalHeaders];

  if (v12)
  {
    v13 = [(AAiCloudTermsAgreeRequest *)self additionalHeaders];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __39__AAiCloudTermsAgreeRequest_urlRequest__block_invoke;
    v20[3] = &unk_1E5A490B8;
    id v21 = v4;
    [v13 enumerateKeysAndObjectsUsingBlock:v20];
  }
  v14 = objc_opt_new();
  v15 = v14;
  serverInfo = self->_serverInfo;
  if (serverInfo) {
    [v14 setObject:serverInfo forKeyedSubscript:@"serverInfo"];
  }
  if ([v15 count]) {
    objc_msgSend(v4, "aa_setBodyWithParameters:", v15);
  }
  v17 = _AALogSystem();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = [v4 description];
    *(_DWORD *)buf = 138412290;
    v24 = v18;
    _os_log_impl(&dword_1A11D8000, v17, OS_LOG_TYPE_DEFAULT, "Terms Agree Request is: %@", buf, 0xCu);
  }

  return v4;
}

uint64_t __39__AAiCloudTermsAgreeRequest_urlRequest__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setValue:a3 forHTTPHeaderField:a2];
}

- (void)performRequestWithHandler:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__AAiCloudTermsAgreeRequest_performRequestWithHandler___block_invoke;
  v7[3] = &unk_1E5A490E0;
  objc_copyWeak(&v9, &location);
  id v5 = v4;
  id v8 = v5;
  v6.receiver = self;
  v6.super_class = (Class)AAiCloudTermsAgreeRequest;
  [(AARequest *)&v6 performRequestWithHandler:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __55__AAiCloudTermsAgreeRequest_performRequestWithHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  v10 = [v8 acceptedTermsInfo];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v12 = [WeakRetained slaVersion];

  if (v12)
  {
    v13 = _AALogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      __55__AAiCloudTermsAgreeRequest_performRequestWithHandler___block_invoke_cold_1(v13);
    }

    v14 = (void *)[v10 mutableCopy];
    v15 = [WeakRetained slaVersion];
    [v14 setObject:v15 forKeyedSubscript:@"SLAVersion"];

    uint64_t v16 = [v14 copy];
    v10 = (void *)v16;
  }
  if ([v8 statusCode] >= 200 && objc_msgSend(v8, "statusCode") <= 299 && v10)
  {
    v17 = objc_opt_new();
    [v17 saveTermsAcceptance:v10 forAccount:WeakRetained[8]];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (ACAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
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

- (NSDictionary)additionalHeaders
{
  return self->_additionalHeaders;
}

- (void)setAdditionalHeaders:(id)a3
{
}

- (NSNumber)slaVersion
{
  return self->_slaVersion;
}

- (void)setSlaVersion:(id)a3
{
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
  objc_storeStrong((id *)&self->_slaVersion, 0);
  objc_storeStrong((id *)&self->_additionalHeaders, 0);

  objc_storeStrong((id *)&self->_account, 0);
}

- (void)urlRequest
{
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
}

void __55__AAiCloudTermsAgreeRequest_performRequestWithHandler___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1A11D8000, log, OS_LOG_TYPE_DEBUG, "SLAVersion available.", v1, 2u);
}

@end
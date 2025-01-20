@interface AAiCloudTermsDisagreeRequest
+ (Class)responseClass;
- (AAiCloudTermsDisagreeRequest)initWithURLString:(id)a3 account:(id)a4;
- (ACAccount)account;
- (BOOL)preferPassword;
- (NSDictionary)additionalHeaders;
- (NSNumber)slaVersion;
- (NSString)serverInfo;
- (id)urlRequest;
- (void)setAccount:(id)a3;
- (void)setAdditionalHeaders:(id)a3;
- (void)setPreferPassword:(BOOL)a3;
- (void)setServerInfo:(id)a3;
- (void)setSlaVersion:(id)a3;
@end

@implementation AAiCloudTermsDisagreeRequest

+ (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (AAiCloudTermsDisagreeRequest)initWithURLString:(id)a3 account:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)AAiCloudTermsDisagreeRequest;
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
  v22.super_class = (Class)AAiCloudTermsDisagreeRequest;
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

  v12 = [(AAiCloudTermsDisagreeRequest *)self additionalHeaders];

  if (v12)
  {
    v13 = [(AAiCloudTermsDisagreeRequest *)self additionalHeaders];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __42__AAiCloudTermsDisagreeRequest_urlRequest__block_invoke;
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
    _os_log_impl(&dword_1A11D8000, v17, OS_LOG_TYPE_DEFAULT, "Terms Disagree Request is: %@", buf, 0xCu);
  }

  return v4;
}

uint64_t __42__AAiCloudTermsDisagreeRequest_urlRequest__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setValue:a3 forHTTPHeaderField:a2];
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

@end
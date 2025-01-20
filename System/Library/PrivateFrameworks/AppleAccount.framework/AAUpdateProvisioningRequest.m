@interface AAUpdateProvisioningRequest
+ (Class)responseClass;
- (AAUpdateProvisioningRequest)initWithAccount:(id)a3;
- (AAUpdateProvisioningRequest)initWithAccount:(id)a3 token:(id)a4;
- (AAUpdateProvisioningRequest)initWithURLString:(id)a3 account:(id)a4;
- (ACAccount)account;
- (NSString)authToken;
- (NSString)serverInfo;
- (id)urlCredential;
- (id)urlRequest;
- (id)urlString;
- (void)setAccount:(id)a3;
- (void)setAuthToken:(id)a3;
- (void)setServerInfo:(id)a3;
@end

@implementation AAUpdateProvisioningRequest

+ (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (AAUpdateProvisioningRequest)initWithAccount:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AAUpdateProvisioningRequest;
  v5 = [(AAUpdateProvisioningRequest *)&v8 init];
  v6 = v5;
  if (v5) {
    [(AAUpdateProvisioningRequest *)v5 setAccount:v4];
  }

  return v6;
}

- (AAUpdateProvisioningRequest)initWithAccount:(id)a3 token:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)AAUpdateProvisioningRequest;
  objc_super v8 = [(AAUpdateProvisioningRequest *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(AAUpdateProvisioningRequest *)v8 setAccount:v6];
    [(AAUpdateProvisioningRequest *)v9 setAuthToken:v7];
  }

  return v9;
}

- (AAUpdateProvisioningRequest)initWithURLString:(id)a3 account:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)AAUpdateProvisioningRequest;
  id v7 = [(AARequest *)&v10 initWithURLString:a3];
  objc_super v8 = v7;
  if (v7) {
    [(AAUpdateProvisioningRequest *)v7 setAccount:v6];
  }

  return v8;
}

- (id)urlCredential
{
  v3 = (void *)MEMORY[0x1E4F18D88];
  id v4 = [(AAUpdateProvisioningRequest *)self account];
  v5 = [v4 username];
  id v6 = [(AAUpdateProvisioningRequest *)self account];
  id v7 = objc_msgSend(v6, "aa_authToken");
  objc_super v8 = [v3 credentialWithUser:v5 password:v7 persistence:0];

  return v8;
}

- (id)urlString
{
  v2 = +[AAURLConfiguration urlConfiguration];
  v3 = [v2 fetchAccountSettingsURL];

  return v3;
}

- (id)urlRequest
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v20.receiver = self;
  v20.super_class = (Class)AAUpdateProvisioningRequest;
  v3 = [(AARequest *)&v20 urlRequest];
  id v4 = (void *)[v3 mutableCopy];

  v5 = [(AARequest *)self bodyDictionary];
  id v6 = (void *)[v5 mutableCopy];

  serverInfo = self->_serverInfo;
  if (serverInfo) {
    [v6 setObject:serverInfo forKeyedSubscript:@"serverInfo"];
  }
  id v19 = 0;
  objc_super v8 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v6 format:100 options:0 error:&v19];
  id v9 = v19;
  if (v8)
  {
    [v4 setHTTPBody:v8];
  }
  else
  {
    objc_super v10 = _AALogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_super v11 = [v9 localizedDescription];
      *(_DWORD *)buf = 138412290;
      v22 = v11;
      _os_log_impl(&dword_1A11D8000, v10, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
    }
  }
  id v12 = [NSString alloc];
  id v13 = v8;
  v14 = objc_msgSend(v12, "initWithBytes:length:encoding:", objc_msgSend(v13, "bytes"), objc_msgSend(v13, "length"), 4);
  v15 = _AALogSystem();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v22 = v14;
    _os_log_impl(&dword_1A11D8000, v15, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }

  [v4 setHTTPMethod:@"POST"];
  objc_msgSend(v4, "aa_addDeviceIDHeader");
  v16 = [(AAUpdateProvisioningRequest *)self account];
  v17 = [(AAUpdateProvisioningRequest *)self authToken];
  objc_msgSend(v4, "aa_addBasicAuthorizationHeaderWithAccount:authToken:", v16, v17);

  [v4 addValue:@"application/xml" forHTTPHeaderField:@"Content-Type"];
  objc_msgSend(v4, "aa_addMultiUserDeviceHeaderIfEnabled");

  return v4;
}

- (ACAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

- (NSString)authToken
{
  return self->_authToken;
}

- (void)setAuthToken:(id)a3
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
  objc_storeStrong((id *)&self->_authToken, 0);

  objc_storeStrong((id *)&self->_account, 0);
}

@end
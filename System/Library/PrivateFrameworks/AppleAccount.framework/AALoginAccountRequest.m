@interface AALoginAccountRequest
+ (Class)responseClass;
- (AALoginAccountRequest)initWithAccount:(id)a3 delegates:(id)a4;
- (NSString)serverInfo;
- (id)urlRequest;
- (id)urlString;
- (void)setServerInfo:(id)a3;
@end

@implementation AALoginAccountRequest

+ (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (id)urlString
{
  v2 = +[AAURLConfiguration urlConfiguration];
  v3 = [v2 loginAccountURL];

  return v3;
}

- (AALoginAccountRequest)initWithAccount:(id)a3 delegates:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AALoginAccountRequest;
  v9 = [(AALoginAccountRequest *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_account, a3);
    objc_storeStrong((id *)&v10->_delegatesInfo, a4);
  }

  return v10;
}

- (id)urlRequest
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v20.receiver = self;
  v20.super_class = (Class)AALoginAccountRequest;
  v3 = [(AARequest *)&v20 urlRequest];
  v4 = (void *)[v3 mutableCopy];

  [v4 setHTTPMethod:@"POST"];
  v19.receiver = self;
  v19.super_class = (Class)AALoginAccountRequest;
  v5 = [(AARequest *)&v19 bodyDictionary];
  v6 = (void *)[v5 mutableCopy];

  [v6 setValue:self->_delegatesInfo forKey:@"delegates"];
  serverInfo = self->_serverInfo;
  if (serverInfo) {
    [v6 setObject:serverInfo forKeyedSubscript:@"serverInfo"];
  }
  id v8 = (id)objc_msgSend(v4, "aa_setXMLBodyWithParameters:", v6);
  objc_msgSend(v4, "aa_addDeviceIDHeader");
  v9 = +[AADeviceInfo udid];
  [v4 setValue:v9 forHTTPHeaderField:@"Device-UDID"];

  objc_msgSend(v4, "aa_addBasicAuthorizationHeaderWithAccount:preferUsingPassword:", self->_account, 1);
  objc_msgSend(v4, "aa_addDeviceProvisioningInfoHeadersWithAccount:", self->_account);
  objc_msgSend(v4, "aa_addMultiUserDeviceHeaderIfEnabled");
  objc_msgSend(v4, "ak_addDeviceConfigurationModeHeader");
  v10 = [(ACAccount *)self->_account _aa_appProvidedContext];

  if (v10)
  {
    v11 = [(ACAccount *)self->_account _aa_appProvidedContext];
    objc_msgSend(v4, "ak_addAppProvidedContext:", v11);

    [(ACAccount *)self->_account _aa_setAppProvidedContext:0];
  }
  objc_super v12 = _AALogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = [v4 description];
    v14 = objc_opt_class();
    v15 = [v4 allHTTPHeaderFields];
    v16 = [v14 redactedHeadersFromHTTPHeaders:v15];
    v17 = [(AARequest *)self redactedBodyStringWithPropertyList:v6];
    *(_DWORD *)buf = 138412802;
    v22 = v13;
    __int16 v23 = 2112;
    v24 = v16;
    __int16 v25 = 2112;
    v26 = v17;
    _os_log_impl(&dword_1A11D8000, v12, OS_LOG_TYPE_DEFAULT, "AALoginAccountRequest %@\nHTTP Headers: %@\nBody: \n%@", buf, 0x20u);
  }

  return v4;
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
  objc_storeStrong((id *)&self->_delegatesInfo, 0);

  objc_storeStrong((id *)&self->_account, 0);
}

@end
@interface AALoginDelegatesRequest
+ (Class)responseClass;
- (AALoginDelegatesRequest)initWithAccount:(id)a3 parameters:(id)a4;
- (id)urlRequest;
- (id)urlString;
@end

@implementation AALoginDelegatesRequest

+ (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (AALoginDelegatesRequest)initWithAccount:(id)a3 parameters:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)AALoginDelegatesRequest;
  v9 = [(AALoginDelegatesRequest *)&v13 init];
  if (v9)
  {
    uint64_t v10 = [v8 copy];
    loginParameters = v9->_loginParameters;
    v9->_loginParameters = (NSDictionary *)v10;

    objc_storeStrong((id *)&v9->_account, a3);
  }

  return v9;
}

- (id)urlString
{
  v2 = +[AAURLConfiguration urlConfiguration];
  v3 = [v2 loginDelegatesURL];

  return v3;
}

- (id)urlRequest
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)AALoginDelegatesRequest;
  v3 = [(AARequest *)&v16 urlRequest];
  v4 = (void *)[v3 mutableCopy];

  [v4 setHTTPMethod:@"POST"];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v5 setValue:self->_loginParameters forKey:@"delegates"];
  v6 = [(ACAccount *)self->_account username];
  [v5 setValue:v6 forKey:@"apple-id"];

  id v7 = [(ACAccount *)self->_account credential];
  id v8 = [v7 password];
  [v5 setValue:v8 forKey:@"password"];

  v9 = +[AADeviceInfo appleIDClientIdentifier];
  [v5 setValue:v9 forKey:@"client-id"];

  uint64_t v10 = +[AADeviceInfo udid];
  [v4 setValue:v10 forHTTPHeaderField:@"Device-UDID"];

  objc_msgSend(v4, "aa_setBodyWithParameters:", v5);
  v11 = _AALogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = [(AARequest *)self redactedBodyStringWithPropertyList:self->_loginParameters];
    *(_DWORD *)buf = 138412290;
    v18 = v12;
    _os_log_impl(&dword_1A11D8000, v11, OS_LOG_TYPE_DEFAULT, "LoginDelegates request body: \n%@", buf, 0xCu);
  }
  [v4 addValue:@"text/plist" forHTTPHeaderField:@"Content-Type"];
  objc_msgSend(v4, "aa_addAuthTokenOrBasicAuthHeaderWithAccount:preferUsingPassword:", self->_account, 1);
  objc_msgSend(v4, "aa_addAltDSIDAndRepairStateWithAccount:", self->_account);
  objc_msgSend(v4, "aa_addMultiUserDeviceHeaderIfEnabled");
  objc_msgSend(v4, "ak_addDeviceConfigurationModeHeader");
  if ([MEMORY[0x1E4F47018] isInternalBuild]) {
    [v4 setValue:@"true" forHTTPHeaderField:@"x-internal"];
  }
  objc_super v13 = _AALogSystem();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = [v4 description];
    *(_DWORD *)buf = 138412290;
    v18 = v14;
    _os_log_impl(&dword_1A11D8000, v13, OS_LOG_TYPE_DEFAULT, "request is: %@", buf, 0xCu);
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_account, 0);

  objc_storeStrong((id *)&self->_loginParameters, 0);
}

@end
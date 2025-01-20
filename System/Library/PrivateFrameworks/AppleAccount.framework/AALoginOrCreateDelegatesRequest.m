@interface AALoginOrCreateDelegatesRequest
+ (Class)responseClass;
- (AALoginOrCreateDelegatesRequest)initWithAccount:(id)a3 parameters:(id)a4 signingSession:(id)a5;
- (id)urlRequest;
- (id)urlString;
@end

@implementation AALoginOrCreateDelegatesRequest

+ (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (AALoginOrCreateDelegatesRequest)initWithAccount:(id)a3 parameters:(id)a4 signingSession:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)AALoginOrCreateDelegatesRequest;
  v12 = [(AALoginOrCreateDelegatesRequest *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_account, a3);
    uint64_t v14 = [v10 copy];
    parameters = v13->_parameters;
    v13->_parameters = (NSDictionary *)v14;

    objc_storeStrong((id *)&v13->_signingSession, a5);
  }

  return v13;
}

- (id)urlString
{
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"showSSOFlow", @"com.apple.purplebuddy", 0);
  v3 = +[AAURLConfiguration urlConfiguration];
  v4 = v3;
  if (AppBooleanValue) {
    [v3 loginOrCreateDelegatesURL];
  }
  else {
  v5 = [v3 createDelegatesURL];
  }

  return v5;
}

- (id)urlRequest
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v17.receiver = self;
  v17.super_class = (Class)AALoginOrCreateDelegatesRequest;
  v3 = [(AARequest *)&v17 urlRequest];
  v4 = (void *)[v3 mutableCopy];

  [v4 setHTTPMethod:@"POST"];
  parameters = self->_parameters;
  id v16 = 0;
  v6 = [MEMORY[0x1E4F28F98] dataWithPropertyList:parameters format:100 options:0 error:&v16];
  id v7 = v16;
  if (v6)
  {
    [v4 setHTTPBody:v6];
  }
  else
  {
    v8 = _AALogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = [v7 localizedDescription];
      *(_DWORD *)buf = 138412290;
      v19 = v9;
      _os_log_impl(&dword_1A11D8000, v8, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
    }
  }
  id v10 = _AALogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = [(AARequest *)self redactedBodyStringWithPropertyList:self->_parameters];
    *(_DWORD *)buf = 138412290;
    v19 = v11;
    _os_log_impl(&dword_1A11D8000, v10, OS_LOG_TYPE_DEFAULT, "LoginOrCreateAccount request body: \n%@", buf, 0xCu);
  }
  v12 = [(ACAccount *)self->_account aa_password];

  if (!v12) {
    objc_msgSend(v4, "aa_addAuthTokenOrBasicAuthHeaderWithAccount:preferUsingPassword:", self->_account, 0);
  }
  objc_msgSend(v4, "aa_signBodyData:withSigningSession:", v6, self->_signingSession);
  objc_msgSend(v4, "aa_addMultiUserDeviceHeaderIfEnabled");
  objc_msgSend(v4, "aa_addAltDSIDAndRepairStateWithAccount:", self->_account);
  v13 = _AALogSystem();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = [v4 description];
    *(_DWORD *)buf = 138412290;
    v19 = v14;
    _os_log_impl(&dword_1A11D8000, v13, OS_LOG_TYPE_DEFAULT, "request is: %@", buf, 0xCu);
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signingSession, 0);
  objc_storeStrong((id *)&self->_parameters, 0);

  objc_storeStrong((id *)&self->_account, 0);
}

@end
@interface AASetupAssistantSetupDelegatesRequest
+ (Class)responseClass;
- (AASetupAssistantSetupDelegatesRequest)initWithAccount:(id)a3 withSetupParameters:(id)a4 signingSession:(id)a5;
- (id)urlRequest;
- (id)urlString;
@end

@implementation AASetupAssistantSetupDelegatesRequest

+ (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (AASetupAssistantSetupDelegatesRequest)initWithAccount:(id)a3 withSetupParameters:(id)a4 signingSession:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)AASetupAssistantSetupDelegatesRequest;
  v12 = [(AASetupAssistantSetupDelegatesRequest *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_account, a3);
    uint64_t v14 = [v10 copy];
    setupParameters = v13->setupParameters;
    v13->setupParameters = (NSDictionary *)v14;

    objc_storeStrong((id *)&v13->signingSession, a5);
  }

  return v13;
}

- (id)urlString
{
  v2 = +[AASetupAssistantService urlConfiguration];
  v3 = [v2 createDelegateAccountsURL];

  return v3;
}

- (id)urlRequest
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v28.receiver = self;
  v28.super_class = (Class)AASetupAssistantSetupDelegatesRequest;
  v3 = [(AARequest *)&v28 urlRequest];
  v4 = (void *)[v3 mutableCopy];

  [v4 setHTTPMethod:@"POST"];
  setupParameters = self->setupParameters;
  id v27 = 0;
  v6 = [MEMORY[0x1E4F28F98] dataWithPropertyList:setupParameters format:100 options:0 error:&v27];
  id v7 = v27;
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
      v30 = v9;
      _os_log_impl(&dword_1A11D8000, v8, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
    }
  }
  id v10 = _AALogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = [(AARequest *)self redactedBodyStringWithPropertyList:self->setupParameters];
    *(_DWORD *)buf = 138412290;
    v30 = v11;
    _os_log_impl(&dword_1A11D8000, v10, OS_LOG_TYPE_DEFAULT, "CreateDelegateAccounts request body: \n%@", buf, 0xCu);
  }
  v12 = +[AADeviceInfo udid];
  [v4 setValue:v12 forHTTPHeaderField:@"Device-UDID"];

  v13 = [(ACAccount *)self->_account aa_password];
  if (v13) {
    goto LABEL_9;
  }
  uint64_t v17 = [(ACAccount *)self->_account aa_authToken];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [(ACAccount *)self->_account username];

    if (v19)
    {
      v20 = NSString;
      v21 = [(ACAccount *)self->_account aa_personID];
      v22 = [(ACAccount *)self->_account aa_authToken];
      v23 = [v20 stringWithFormat:@"%@:%@", v21, v22];

      v24 = [v23 dataUsingEncoding:4];
      v25 = [v24 base64EncodedStringWithOptions:0];

      v13 = [NSString stringWithFormat:@"X-MobileMe-AuthToken %@", v25];
      [v4 addValue:v13 forHTTPHeaderField:@"Authorization"];
      v26 = _AALogSystem();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A11D8000, v26, OS_LOG_TYPE_DEFAULT, "Using token auth", buf, 2u);
      }

LABEL_9:
    }
  }
  objc_msgSend(v4, "aa_signBodyData:withSigningSession:", v6, self->signingSession);
  objc_msgSend(v4, "aa_addMultiUserDeviceHeaderIfEnabled");
  uint64_t v14 = _AALogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = [v4 description];
    *(_DWORD *)buf = 138412290;
    v30 = v15;
    _os_log_impl(&dword_1A11D8000, v14, OS_LOG_TYPE_DEFAULT, "request is: %@", buf, 0xCu);
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->signingSession, 0);

  objc_storeStrong((id *)&self->setupParameters, 0);
}

@end
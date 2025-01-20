@interface AASetupAssistantCreateRequest
+ (Class)responseClass;
- (AASetupAssistantCreateRequest)initWithAccount:(id)a3 withAppleIDParameters:(id)a4 signingSession:(id)a5;
- (id)bodyDictionary;
- (id)urlRequest;
- (id)urlString;
@end

@implementation AASetupAssistantCreateRequest

+ (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (AASetupAssistantCreateRequest)initWithAccount:(id)a3 withAppleIDParameters:(id)a4 signingSession:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)AASetupAssistantCreateRequest;
  v12 = [(AASetupAssistantCreateRequest *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_account, a3);
    uint64_t v14 = [v10 copy];
    appleIDParameters = v13->appleIDParameters;
    v13->appleIDParameters = (NSDictionary *)v14;

    objc_storeStrong((id *)&v13->signingSession, a5);
  }

  return v13;
}

- (id)bodyDictionary
{
  return self->appleIDParameters;
}

- (id)urlString
{
  v2 = +[AASetupAssistantService urlConfiguration];
  v3 = [v2 createAppleIDURL];

  return v3;
}

- (id)urlRequest
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  v32.receiver = self;
  v32.super_class = (Class)AASetupAssistantCreateRequest;
  v3 = [(AARequest *)&v32 urlRequest];
  v4 = (void *)[v3 mutableCopy];

  [v4 setHTTPMethod:@"POST"];
  v5 = (void *)MEMORY[0x1E4F28F98];
  v6 = [(AASetupAssistantCreateRequest *)self bodyDictionary];
  id v31 = 0;
  v7 = [v5 dataWithPropertyList:v6 format:100 options:0 error:&v31];
  id v8 = v31;

  if (v7)
  {
    [v4 setHTTPBody:v7];
  }
  else
  {
    id v9 = _AALogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [v8 localizedDescription];
      *(_DWORD *)buf = 138412290;
      v34 = v10;
      _os_log_impl(&dword_1A11D8000, v9, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
    }
  }
  id v11 = _AALogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = [(AASetupAssistantCreateRequest *)self bodyDictionary];
    v13 = [(AARequest *)self redactedBodyStringWithPropertyList:v12];
    *(_DWORD *)buf = 138412290;
    v34 = v13;
    _os_log_impl(&dword_1A11D8000, v11, OS_LOG_TYPE_DEFAULT, "CreateAppleID request body: \n%@", buf, 0xCu);
  }
  uint64_t v14 = +[AADeviceInfo udid];
  [v4 setValue:v14 forHTTPHeaderField:@"Device-UDID"];

  uint64_t v15 = [(ACAccount *)self->_account aa_authToken];
  if (v15)
  {
    v16 = (void *)v15;
    objc_super v17 = [(ACAccount *)self->_account username];

    if (v17)
    {
      v18 = NSString;
      v19 = [(ACAccount *)self->_account aa_personID];
      v20 = [(ACAccount *)self->_account aa_authToken];
      v21 = [v18 stringWithFormat:@"%@:%@", v19, v20];

      v22 = [v21 dataUsingEncoding:4];
      v23 = [v22 base64EncodedStringWithOptions:0];

      v24 = [NSString stringWithFormat:@"Basic %@", v23];
      [v4 addValue:v24 forHTTPHeaderField:@"Authorization"];
      v25 = _AALogSystem();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A11D8000, v25, OS_LOG_TYPE_DEFAULT, "Using token auth", buf, 2u);
      }
    }
  }
  objc_msgSend(v4, "aa_signBodyData:withSigningSession:", v7, self->signingSession);
  v26 = _AALogSystem();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    v27 = [v4 description];
    *(_DWORD *)buf = 138412290;
    v34 = v27;
    _os_log_impl(&dword_1A11D8000, v26, OS_LOG_TYPE_DEFAULT, "request is: %@", buf, 0xCu);
  }
  v28 = _AALogSystem();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    v29 = [v4 description];
    *(_DWORD *)buf = 138412290;
    v34 = v29;
    _os_log_impl(&dword_1A11D8000, v28, OS_LOG_TYPE_DEFAULT, "request is: %@", buf, 0xCu);
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->signingSession, 0);

  objc_storeStrong((id *)&self->appleIDParameters, 0);
}

@end
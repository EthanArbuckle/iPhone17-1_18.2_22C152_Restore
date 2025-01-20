@interface AASetupAssistantTermsFetchRequest
+ (Class)responseClass;
- (AASetupAssistantTermsFetchRequest)initWithAccount:(id)a3;
- (id)urlRequest;
- (id)urlString;
@end

@implementation AASetupAssistantTermsFetchRequest

+ (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (AASetupAssistantTermsFetchRequest)initWithAccount:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AASetupAssistantTermsFetchRequest;
  v6 = [(AASetupAssistantTermsFetchRequest *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_account, a3);
  }

  return v7;
}

- (id)urlString
{
  v2 = +[AASetupAssistantService urlConfiguration];
  v3 = [v2 upgradeIOSTermsUI];

  return v3;
}

- (id)urlRequest
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  v29.receiver = self;
  v29.super_class = (Class)AASetupAssistantTermsFetchRequest;
  v3 = [(AARequest *)&v29 urlRequest];
  v4 = (void *)[v3 mutableCopy];

  [v4 setHTTPMethod:@"POST"];
  id v5 = [(ACAccount *)self->_account username];
  v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [(ACAccount *)self->_account username];
  }
  v8 = v7;
  objc_super v9 = [(ACAccount *)self->_account aa_password];

  v10 = NSString;
  account = self->_account;
  if (v9) {
    BOOL v12 = v8 == 0;
  }
  else {
    BOOL v12 = 1;
  }
  if (v12)
  {
    v13 = [(ACAccount *)account aa_personID];
    v14 = [(ACAccount *)self->_account aa_authToken];
    v20 = [v10 stringWithFormat:@"%@:%@", v13, v14];

    v15 = [v20 dataUsingEncoding:4];
    v22 = [v15 base64EncodedStringWithOptions:0];

    v23 = [NSString stringWithFormat:@"X-MobileMe-AuthToken %@", v22];
    [v4 addValue:v23 forHTTPHeaderField:@"Authorization"];
    v24 = _AALogSystem();
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    *(_WORD *)buf = 0;
    v16 = "Using token auth";
    v17 = v24;
    uint32_t v18 = 2;
    goto LABEL_13;
  }
  v19 = [(ACAccount *)account aa_password];
  v20 = [v10 stringWithFormat:@"%@:%@", v8, v19];

  v21 = [v20 dataUsingEncoding:4];
  v22 = [v21 base64EncodedStringWithOptions:0];

  v23 = [NSString stringWithFormat:@"Basic %@", v22];
  [v4 addValue:v23 forHTTPHeaderField:@"Authorization"];
  v24 = _AALogSystem();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v31 = v8;
    v16 = "Using password auth - username: %@";
    v17 = v24;
    uint32_t v18 = 12;
LABEL_13:
    _os_log_impl(&dword_1A11D8000, v17, OS_LOG_TYPE_DEFAULT, v16, buf, v18);
  }
LABEL_14:

  [v4 addValue:@"application/xml" forHTTPHeaderField:@"Content-Type"];
  v26 = _AALogSystem();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    v27 = [v4 description];
    *(_DWORD *)buf = 138412290;
    v31 = v27;
    _os_log_impl(&dword_1A11D8000, v26, OS_LOG_TYPE_DEFAULT, "request is: %@", buf, 0xCu);
  }

  return v4;
}

- (void).cxx_destruct
{
}

@end
@interface AASetupAssistantUpgradeStatusRequest
+ (Class)responseClass;
- (AASetupAssistantUpgradeStatusRequest)initWithAccount:(id)a3;
- (id)urlRequest;
- (id)urlString;
@end

@implementation AASetupAssistantUpgradeStatusRequest

+ (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (AASetupAssistantUpgradeStatusRequest)initWithAccount:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AASetupAssistantUpgradeStatusRequest;
  v6 = [(AASetupAssistantUpgradeStatusRequest *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_account, a3);
  }

  return v7;
}

- (id)urlString
{
  v2 = +[AASetupAssistantService urlConfiguration];
  v3 = [v2 upgradeStatusURL];

  return v3;
}

- (id)urlRequest
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)AASetupAssistantUpgradeStatusRequest;
  v3 = [(AARequest *)&v16 urlRequest];
  v4 = (void *)[v3 mutableCopy];

  [v4 setHTTPMethod:@"POST"];
  id v5 = NSString;
  v6 = [(ACAccount *)self->_account aa_personID];
  v7 = [(ACAccount *)self->_account aa_authToken];
  v8 = [v5 stringWithFormat:@"%@:%@", v6, v7];

  objc_super v9 = [v8 dataUsingEncoding:4];
  v10 = [v9 base64EncodedStringWithOptions:0];

  v11 = [NSString stringWithFormat:@"X-MobileMe-AuthToken %@", v10];
  [v4 addValue:v11 forHTTPHeaderField:@"Authorization"];
  v12 = _AALogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A11D8000, v12, OS_LOG_TYPE_DEFAULT, "Using token auth", buf, 2u);
  }

  [v4 addValue:@"application/xml" forHTTPHeaderField:@"Content-Type"];
  v13 = _AALogSystem();
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
}

@end
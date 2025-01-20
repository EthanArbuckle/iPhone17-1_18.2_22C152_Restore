@interface ATVHighSecurityAccountVerifyCode
+ (Class)responseClass;
- (ATVHighSecurityAccountVerifyCode)initWithAccount:(id)a3 device:(id)a4 hsaCode:(id)a5;
- (id)urlRequest;
- (id)urlString;
@end

@implementation ATVHighSecurityAccountVerifyCode

+ (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (ATVHighSecurityAccountVerifyCode)initWithAccount:(id)a3 device:(id)a4 hsaCode:(id)a5
{
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)ATVHighSecurityAccountVerifyCode;
  v10 = [(ATVHighSecurityAccountSendCode *)&v13 initWithAccount:a3 device:a4];
  v11 = v10;
  if (v10) {
    objc_storeStrong((id *)&v10->_hsaCode, a5);
  }

  return v11;
}

- (id)urlString
{
  v2 = +[AAURLConfiguration urlConfiguration];
  v3 = [v2 verifyCodeURL];

  return v3;
}

- (id)urlRequest
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  v32.receiver = self;
  v32.super_class = (Class)ATVHighSecurityAccountVerifyCode;
  v3 = [(ATVHighSecurityAccountSendCode *)&v32 urlRequest];
  v4 = (void *)[v3 mutableCopy];

  v5 = (void *)[(NSDictionary *)self->super._device mutableCopy];
  [v5 setValue:self->_hsaCode forKey:@"hsaCode"];
  id v31 = 0;
  v6 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v5 format:100 options:0 error:&v31];
  id v7 = v31;
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
      v34 = v9;
      _os_log_impl(&dword_1A11D8000, v8, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
    }
  }
  v30 = v7;
  id v10 = [NSString alloc];
  id v11 = v6;
  v12 = objc_msgSend(v10, "initWithBytes:length:encoding:", objc_msgSend(v11, "bytes"), objc_msgSend(v11, "length"), 4);
  objc_super v13 = _AALogSystem();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v34 = v12;
    _os_log_impl(&dword_1A11D8000, v13, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }

  [v4 setHTTPMethod:@"POST"];
  uint64_t v14 = [(ACAccount *)self->super.super._account aa_password];
  if (v14
    && (v15 = (void *)v14,
        [(ACAccount *)self->super.super._account username],
        v16 = objc_claimAutoreleasedReturnValue(),
        v16,
        v15,
        v16))
  {
    v17 = _AALogSystem();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A11D8000, v17, OS_LOG_TYPE_DEFAULT, "Using password auth", buf, 2u);
    }

    v18 = NSString;
    v19 = [(ACAccount *)self->super.super._account username];
    v20 = [(ACAccount *)self->super.super._account aa_password];
    v21 = [v18 stringWithFormat:@"%@:%@", v19, v20, v7];

    int v22 = 1;
  }
  else
  {
    v19 = _AALogSystem();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A11D8000, v19, OS_LOG_TYPE_DEFAULT, "ERROR: Missing account username or password", buf, 2u);
    }
    int v22 = 0;
    v21 = 0;
  }

  v23 = [v21 dataUsingEncoding:4];
  v24 = [v23 base64EncodedStringWithOptions:0];

  v25 = [NSString stringWithFormat:@"Basic %@", v24];
  [v4 addValue:v25 forHTTPHeaderField:@"Authorization"];
  [v4 addValue:@"application/xml" forHTTPHeaderField:@"Content-Type"];
  v26 = _AALogSystem();
  BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
  if (v22)
  {
    if (v27)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A11D8000, v26, OS_LOG_TYPE_DEFAULT, "Authorization: *redacted*", buf, 2u);
    }
  }
  else if (v27)
  {
    v28 = [v4 valueForHTTPHeaderField:@"Authorization"];
    *(_DWORD *)buf = 138412290;
    v34 = v28;
    _os_log_impl(&dword_1A11D8000, v26, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }

  return v4;
}

- (void).cxx_destruct
{
}

@end
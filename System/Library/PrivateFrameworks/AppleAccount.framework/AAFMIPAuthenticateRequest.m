@interface AAFMIPAuthenticateRequest
+ (Class)responseClass;
- (AAFMIPAuthenticateRequest)initWithAccount:(id)a3;
- (id)urlRequest;
- (id)urlString;
@end

@implementation AAFMIPAuthenticateRequest

+ (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (id)urlString
{
  v2 = +[AAURLConfiguration urlConfiguration];
  v3 = [v2 fmipAuthenticate];

  return v3;
}

- (AAFMIPAuthenticateRequest)initWithAccount:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AAFMIPAuthenticateRequest;
  v6 = [(AAFMIPAuthenticateRequest *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_account, a3);
  }

  return v7;
}

- (id)urlRequest
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v15.receiver = self;
  v15.super_class = (Class)AAFMIPAuthenticateRequest;
  v3 = [(AARequest *)&v15 urlRequest];
  v4 = (void *)[v3 mutableCopy];

  [v4 setHTTPMethod:@"GET"];
  account = self->_account;
  if (!account)
  {
    v12 = _AALogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v13 = "ERROR: FMIP authentiate does not have an account set, bailing";
      goto LABEL_11;
    }
LABEL_12:

    id v11 = 0;
    goto LABEL_13;
  }
  uint64_t v6 = [(ACAccount *)account aa_password];
  if (!v6
    || (v7 = (void *)v6,
        [(ACAccount *)self->_account username],
        v8 = objc_claimAutoreleasedReturnValue(),
        v8,
        v7,
        !v8))
  {
    v12 = _AALogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v13 = "ERROR: Account does not contain a password. Password is required for FMIP authenticate";
LABEL_11:
      _os_log_impl(&dword_1A11D8000, v12, OS_LOG_TYPE_DEFAULT, v13, buf, 2u);
      goto LABEL_12;
    }
    goto LABEL_12;
  }
  objc_super v9 = _AALogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = [(ACAccount *)self->_account username];
    *(_DWORD *)buf = 138412290;
    v17 = v10;
    _os_log_impl(&dword_1A11D8000, v9, OS_LOG_TYPE_DEFAULT, "fmipAuthenticate with password auth using username: %@", buf, 0xCu);
  }
  objc_msgSend(v4, "aa_addBasicAuthorizationHeaderWithAccount:preferUsingPassword:", self->_account, 1);
  [v4 addValue:@"text/plist" forHTTPHeaderField:@"Content-Type"];
  id v11 = v4;
LABEL_13:

  return v11;
}

- (void).cxx_destruct
{
}

@end
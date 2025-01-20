@interface AAAuthenticateRequest
+ (Class)responseClass;
- (AAAuthenticateRequest)initWithAccount:(id)a3;
- (AAAuthenticateRequest)initWithURLString:(id)a3 username:(id)a4 password:(id)a5;
- (AAAuthenticateRequest)initWithUsername:(id)a3 password:(id)a4;
- (ACAccount)account;
- (NSString)authToken;
- (NSString)password;
- (NSString)username;
- (id)urlCredential;
- (id)urlRequest;
- (id)urlString;
- (void)setAccount:(id)a3;
- (void)setAuthToken:(id)a3;
- (void)setPassword:(id)a3;
- (void)setUsername:(id)a3;
@end

@implementation AAAuthenticateRequest

+ (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (AAAuthenticateRequest)initWithAccount:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AAAuthenticateRequest;
  v5 = [(AAAuthenticateRequest *)&v8 init];
  v6 = v5;
  if (v5) {
    [(AAAuthenticateRequest *)v5 setAccount:v4];
  }

  return v6;
}

- (AAAuthenticateRequest)initWithUsername:(id)a3 password:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)AAAuthenticateRequest;
  objc_super v8 = [(AAAuthenticateRequest *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(AAAuthenticateRequest *)v8 setUsername:v6];
    [(AAAuthenticateRequest *)v9 setPassword:v7];
  }

  return v9;
}

- (AAAuthenticateRequest)initWithURLString:(id)a3 username:(id)a4 password:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)AAAuthenticateRequest;
  v10 = [(AARequest *)&v13 initWithURLString:a3];
  objc_super v11 = v10;
  if (v10)
  {
    [(AAAuthenticateRequest *)v10 setUsername:v8];
    [(AAAuthenticateRequest *)v11 setPassword:v9];
  }

  return v11;
}

- (id)urlString
{
  v9.receiver = self;
  v9.super_class = (Class)AAAuthenticateRequest;
  v2 = [(AARequest *)&v9 urlString];
  v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    v5 = +[AAURLConfiguration urlConfiguration];
    id v6 = [v5 authenticateURL];

    if (v6)
    {
      id v7 = (void *)[objc_alloc(MEMORY[0x1E4F29088]) initWithString:v6];
      id v4 = [v7 string];
    }
    else
    {
      id v4 = 0;
    }
  }

  return v4;
}

- (id)urlCredential
{
  return (id)[MEMORY[0x1E4F18D88] credentialWithUser:self->_username password:self->_password persistence:0];
}

- (id)urlRequest
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v14.receiver = self;
  v14.super_class = (Class)AAAuthenticateRequest;
  v3 = [(AARequest *)&v14 urlRequest];
  id v4 = (void *)[v3 mutableCopy];

  [v4 setHTTPMethod:@"POST"];
  if (self->_account)
  {
    v5 = [(AAAuthenticateRequest *)self account];
    objc_msgSend(v4, "aa_addAuthTokenOrBasicAuthHeaderWithAccount:preferUsingPassword:", v5, 0);
  }
  else if (self->_username && (password = self->_password) != 0)
  {
    v5 = [NSString stringWithFormat:@"%@:%@", self->_username, password];
    objc_super v11 = [v5 dataUsingEncoding:4];
    v12 = [v11 base64EncodedStringWithOptions:0];

    objc_super v13 = [NSString stringWithFormat:@"Basic %@", v12];
    [v4 setValue:v13 forHTTPHeaderField:@"Authorization"];
  }
  else
  {
    v5 = _AALogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A11D8000, v5, OS_LOG_TYPE_DEFAULT, "Error! No account or username/password for AAAuthenticateRequest!", buf, 2u);
    }
  }

  objc_msgSend(v4, "aa_addMultiUserDeviceHeaderIfEnabled");
  [v4 addValue:@"application/xml" forHTTPHeaderField:@"Content-Type"];
  id v6 = _AALogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [v4 description];
    *(_DWORD *)buf = 138412290;
    v16 = v7;
    _os_log_impl(&dword_1A11D8000, v6, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }
  id v8 = _AALogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A11D8000, v8, OS_LOG_TYPE_DEFAULT, "Authorization: *redacted*", buf, 2u);
  }

  return v4;
}

- (NSString)username
{
  return self->_username;
}

- (void)setUsername:(id)a3
{
}

- (NSString)password
{
  return self->_password;
}

- (void)setPassword:(id)a3
{
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_authToken, 0);
  objc_storeStrong((id *)&self->_password, 0);

  objc_storeStrong((id *)&self->_username, 0);
}

@end
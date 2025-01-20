@interface AAEmailVettingRequest
- (AAEmailVettingRequest)initWithAccount:(id)a3;
- (AAEmailVettingRequest)initWithURLString:(id)a3 account:(id)a4;
- (ACAccount)account;
- (id)urlRequest;
- (void)setAccount:(id)a3;
@end

@implementation AAEmailVettingRequest

- (AAEmailVettingRequest)initWithAccount:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AAEmailVettingRequest;
  v5 = [(AAEmailVettingRequest *)&v8 init];
  v6 = v5;
  if (v5) {
    [(AAEmailVettingRequest *)v5 setAccount:v4];
  }

  return v6;
}

- (AAEmailVettingRequest)initWithURLString:(id)a3 account:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_super v8 = [v6 username];
  v9 = [v7 stringByReplacingOccurrencesOfString:@"$APPLE_ID$" withString:v8];

  v13.receiver = self;
  v13.super_class = (Class)AAEmailVettingRequest;
  v10 = [(AARequest *)&v13 initWithURLString:v9];
  v11 = v10;
  if (v10) {
    [(AAEmailVettingRequest *)v10 setAccount:v6];
  }

  return v11;
}

- (id)urlRequest
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v15.receiver = self;
  v15.super_class = (Class)AAEmailVettingRequest;
  v3 = [(AARequest *)&v15 urlRequest];
  id v4 = (void *)[v3 mutableCopy];

  [v4 setHTTPMethod:@"POST"];
  v5 = [(AAEmailVettingRequest *)self account];
  objc_msgSend(v4, "aa_addBasicAuthorizationHeaderWithAccount:preferUsingPassword:", v5, 0);

  id v6 = [(AARequest *)self bodyDictionary];
  objc_msgSend(v4, "aa_setBodyWithParameters:", v6);
  id v7 = [v4 HTTPBody];
  id v8 = [NSString alloc];
  id v9 = v7;
  v10 = objc_msgSend(v8, "initWithBytes:length:encoding:", objc_msgSend(v9, "bytes"), objc_msgSend(v9, "length"), 4);
  v11 = _AALogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v17 = v10;
    _os_log_impl(&dword_1A11D8000, v11, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }

  [v4 addValue:@"application/xml" forHTTPHeaderField:@"Content-Type"];
  v12 = _AALogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v13 = [v4 valueForHTTPHeaderField:@"Authorization"];
    *(_DWORD *)buf = 138412290;
    v17 = v13;
    _os_log_impl(&dword_1A11D8000, v12, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }

  return v4;
}

- (ACAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
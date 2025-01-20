@interface AADeviceListRequest
+ (Class)responseClass;
- (AADeviceListRequest)initWithAccount:(id)a3;
- (id)urlRequest;
- (id)urlString;
@end

@implementation AADeviceListRequest

- (AADeviceListRequest)initWithAccount:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AADeviceListRequest;
  v6 = [(AADeviceListRequest *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_account, a3);
  }

  return v7;
}

+ (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (id)urlString
{
  v3 = +[AAURLConfiguration urlConfiguration];
  v4 = [v3 getDeviceListURL];

  if (v4)
  {
    id v5 = [(ACAccount *)self->_account aa_personID];

    if (v5) {
      id v5 = v4;
    }
  }
  else
  {
    v6 = _AALogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1A11D8000, v6, OS_LOG_TYPE_DEFAULT, "Error! AADeviceListRequest could not find a base URL.", v8, 2u);
    }

    id v5 = 0;
  }

  return v5;
}

- (id)urlRequest
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)AADeviceListRequest;
  v3 = [(AARequest *)&v10 urlRequest];
  v4 = (void *)[v3 mutableCopy];

  id v5 = [(AADeviceListRequest *)self urlString];
  if (v5)
  {
    v6 = [MEMORY[0x1E4F1CB10] URLWithString:v5];
    [v4 setURL:v6];

    [v4 setHTTPMethod:@"GET"];
    v7 = _AALogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = [v4 URL];
      *(_DWORD *)buf = 138412290;
      v12 = v8;
      _os_log_impl(&dword_1A11D8000, v7, OS_LOG_TYPE_DEFAULT, "Sending GET to %@", buf, 0xCu);
    }
    objc_msgSend(v4, "aa_addBasicAuthorizationHeaderWithAccount:preferUsingPassword:", self->_account, 0);
  }

  return v4;
}

- (void).cxx_destruct
{
}

@end
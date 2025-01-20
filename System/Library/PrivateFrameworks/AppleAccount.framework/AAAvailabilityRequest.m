@interface AAAvailabilityRequest
+ (Class)responseClass;
- (AAAvailabilityRequest)initWithAccount:(id)a3;
- (id)urlRequest;
- (id)urlString;
@end

@implementation AAAvailabilityRequest

- (AAAvailabilityRequest)initWithAccount:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AAAvailabilityRequest;
  v6 = [(AAAvailabilityRequest *)&v9 init];
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
  v3 = [(ACAccount *)self->_account dataclassProperties];
  v4 = [v3 objectForKey:*MEMORY[0x1E4F17A60]];
  id v5 = [v4 objectForKey:@"url"];

  if (v5)
  {
    v6 = [(ACAccount *)self->_account aa_personID];

    if (v6)
    {
      v7 = NSString;
      v8 = [(ACAccount *)self->_account aa_personID];
      objc_super v9 = [v7 stringWithFormat:@"%@/%@/sharedstreams/status?feature=photos", v5, v8];

      goto LABEL_8;
    }
  }
  else
  {
    v10 = _AALogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A11D8000, v10, OS_LOG_TYPE_DEFAULT, "Error! AAAvailabilityRequest could not find a base URL.", buf, 2u);
    }
  }
  objc_super v9 = 0;
LABEL_8:

  return v9;
}

- (id)urlRequest
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)AAAvailabilityRequest;
  v3 = [(AARequest *)&v10 urlRequest];
  v4 = (void *)[v3 mutableCopy];

  id v5 = [(AAAvailabilityRequest *)self urlString];
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
    [v4 addValue:@"dHUDegar6MCO" forHTTPHeaderField:@"x-apple-mme-sharedstreams-version"];
  }

  return v4;
}

- (void).cxx_destruct
{
}

@end
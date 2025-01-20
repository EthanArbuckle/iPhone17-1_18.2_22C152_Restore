@interface AMSAuthenticateResult
+ (BOOL)supportsSecureCoding;
- (ACAccount)account;
- (AMSAuthKitUpdateResult)authKitUpdateResult;
- (AMSAuthenticateResult)initWithAccount:(id)a3;
- (AMSAuthenticateResult)initWithCoder:(id)a3;
- (NSDictionary)authenticationResults;
- (NSDictionary)serverResponse;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setAuthKitUpdateResult:(id)a3;
@end

@implementation AMSAuthenticateResult

- (AMSAuthenticateResult)initWithAccount:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AMSAuthenticateResult;
  v6 = [(AMSAuthenticateResult *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_account, a3);
    uint64_t v8 = objc_msgSend(v5, "ams_lastAuthenticationServerResponse");
    serverResponse = v7->_serverResponse;
    v7->_serverResponse = (NSDictionary *)v8;
  }
  return v7;
}

- (NSDictionary)authenticationResults
{
  v2 = [(AMSAuthenticateResult *)self authKitUpdateResult];
  v3 = [v2 authenticationResults];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v10 = a3;
  v4 = [(AMSAuthenticateResult *)self account];

  if (v4)
  {
    id v5 = [(AMSAuthenticateResult *)self account];
    [v10 encodeObject:v5 forKey:@"kCodingKeyAccount"];
  }
  v6 = [(AMSAuthenticateResult *)self authKitUpdateResult];

  if (v6)
  {
    v7 = [(AMSAuthenticateResult *)self authKitUpdateResult];
    [v10 encodeObject:v7 forKey:@"kCodingKeyAuthKitUpdateResult"];
  }
  uint64_t v8 = [(AMSAuthenticateResult *)self serverResponse];

  if (v8)
  {
    v9 = [(AMSAuthenticateResult *)self serverResponse];
    [v10 encodeObject:v9 forKey:@"kCodingKeyServerResponse"];
  }
}

- (AMSAuthenticateResult)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSAuthenticateResult *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCodingKeyAccount"];
    account = v5->_account;
    v5->_account = (ACAccount *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCodingKeyAuthKitUpdateResult"];
    authKitUpdateResult = v5->_authKitUpdateResult;
    v5->_authKitUpdateResult = (AMSAuthKitUpdateResult *)v8;

    id v10 = objc_msgSend(MEMORY[0x1E4F1CAD0], "ams_JSONClasses");
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"kCodingKeyServerResponse"];
    serverResponse = v5->_serverResponse;
    v5->_serverResponse = (NSDictionary *)v11;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = [(AMSAuthenticateResult *)self account];
  objc_msgSend(v3, "ams_setNullableObject:forKey:", v4, @"account");

  id v5 = [(AMSAuthenticateResult *)self authKitUpdateResult];
  objc_msgSend(v3, "ams_setNullableObject:forKey:", v5, @"authKitUpdateResult");

  uint64_t v6 = [(AMSAuthenticateResult *)self serverResponse];
  objc_msgSend(v3, "ams_setNullableObject:forKey:", v6, @"serverResponse");

  v7 = [self ams_generateDescriptionWithSubObjects:v3];

  return v7;
}

- (ACAccount)account
{
  return self->_account;
}

- (NSDictionary)serverResponse
{
  return self->_serverResponse;
}

- (AMSAuthKitUpdateResult)authKitUpdateResult
{
  return self->_authKitUpdateResult;
}

- (void)setAuthKitUpdateResult:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authKitUpdateResult, 0);
  objc_storeStrong((id *)&self->_serverResponse, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
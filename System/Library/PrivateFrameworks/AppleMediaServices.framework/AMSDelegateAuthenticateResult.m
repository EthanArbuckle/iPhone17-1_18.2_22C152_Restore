@interface AMSDelegateAuthenticateResult
+ (BOOL)supportsSecureCoding;
- (AMSDelegateAuthenticateRequest)request;
- (AMSDelegateAuthenticateResult)initWithCoder:(id)a3;
- (AMSDelegateAuthenticateResult)initWithServerResponse:(id)a3;
- (NSDictionary)serverResponse;
- (NSString)token;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AMSDelegateAuthenticateResult

- (AMSDelegateAuthenticateResult)initWithServerResponse:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMSDelegateAuthenticateResult;
  v6 = [(AMSDelegateAuthenticateResult *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_serverResponse, a3);
  }

  return v7;
}

- (NSString)token
{
  v2 = [(AMSDelegateAuthenticateResult *)self serverResponse];
  v3 = [v2 objectForKeyedSubscript:@"delegateAuthToken"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return (NSString *)v4;
}

- (void)encodeWithCoder:(id)a3
{
  request = self->_request;
  id v5 = a3;
  [v5 encodeObject:request forKey:@"rq"];
  [v5 encodeObject:self->_serverResponse forKey:@"sr"];
}

- (AMSDelegateAuthenticateResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AMSDelegateAuthenticateResult;
  id v5 = [(AMSDelegateAuthenticateResult *)&v12 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"rq"];
    request = v5->_request;
    v5->_request = (AMSDelegateAuthenticateRequest *)v6;

    uint64_t v8 = objc_opt_class();
    uint64_t v9 = [v4 decodeDictionaryWithKeysOfClass:v8 objectsOfClass:objc_opt_class() forKey:@"sr"];
    serverResponse = v5->_serverResponse;
    v5->_serverResponse = (NSDictionary *)v9;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AMSDelegateAuthenticateRequest)request
{
  return self->_request;
}

- (NSDictionary)serverResponse
{
  return self->_serverResponse;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverResponse, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

@end
@interface CPSStoreAuthenticationResponse
+ (BOOL)supportsSecureCoding;
- (AMSDelegateAuthenticateResult)authenticationResult;
- (CPSStoreAuthenticationResponse)initWithAuthenticationResult:(id)a3;
- (CPSStoreAuthenticationResponse)initWithCoder:(id)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CPSStoreAuthenticationResponse

- (CPSStoreAuthenticationResponse)initWithAuthenticationResult:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CPSStoreAuthenticationResponse;
  v6 = [(CPSStoreAuthenticationResponse *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_authenticationResult, a3);
  }

  return v7;
}

- (id)description
{
  v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  id v4 = (id)[v3 appendObject:self->_authenticationResult withName:@"authenticationResult"];
  id v5 = [v3 build];

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CPSStoreAuthenticationResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CPSStoreAuthenticationResponse;
  id v5 = [(CPSStoreAuthenticationResponse *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:getAMSDelegateAuthenticateResultClass() forKey:@"authenticationResult"];
    authenticationResult = v5->_authenticationResult;
    v5->_authenticationResult = (AMSDelegateAuthenticateResult *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (AMSDelegateAuthenticateResult)authenticationResult
{
  return self->_authenticationResult;
}

- (void).cxx_destruct
{
}

@end
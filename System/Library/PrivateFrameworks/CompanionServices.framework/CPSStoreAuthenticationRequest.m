@interface CPSStoreAuthenticationRequest
+ (BOOL)supportsSecureCoding;
- (ACAccount)account;
- (AMSDelegateAuthenticateRequest)authenticationRequest;
- (CPSStoreAuthenticationRequest)initWithCoder:(id)a3;
- (CPSStoreAuthenticationRequest)initWithXPCDictionary:(id)a3;
- (NSString)description;
- (int64_t)authType;
- (void)encodeWithCoder:(id)a3;
- (void)encodeWithXPCDictionary:(id)a3;
- (void)setAccount:(id)a3;
- (void)setAuthenticationRequest:(id)a3;
@end

@implementation CPSStoreAuthenticationRequest

- (NSString)description
{
  v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  id v4 = (id)[v3 appendObject:self->_authenticationRequest withName:@"authenticationRequest"];
  id v5 = (id)[v3 appendObject:self->_account withName:@"account"];
  v6 = [v3 build];

  return (NSString *)v6;
}

- (int64_t)authType
{
  return 11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CPSStoreAuthenticationRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CPSStoreAuthenticationRequest;
  id v5 = [(CPSAuthenticationRequest *)&v12 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:getAMSDelegateAuthenticateRequestClass() forKey:@"authenticationRequest"];
    authenticationRequest = v5->_authenticationRequest;
    v5->_authenticationRequest = (AMSDelegateAuthenticateRequest *)v6;

    v8 = self;
    uint64_t v9 = [v4 decodeObjectOfClass:v8 forKey:@"account"];
    account = v5->_account;
    v5->_account = (ACAccount *)v9;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CPSStoreAuthenticationRequest;
  id v4 = a3;
  [(CPSAuthenticationRequest *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_authenticationRequest, @"authenticationRequest", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_account forKey:@"account"];
}

- (void)encodeWithXPCDictionary:(id)a3
{
  id v10 = [MEMORY[0x263F29D08] coderWithMessage:a3];
  id v4 = [(CPSAuthenticationRequest *)self identifier];
  [v10 encodeObject:v4 forKey:@"identifier"];

  objc_super v5 = [(AMSDelegateAuthenticateRequest *)self->_authenticationRequest challenge];
  [v10 encodeObject:v5 forKey:@"authenticationRequestChallenge"];

  uint64_t v6 = [(AMSDelegateAuthenticateRequest *)self->_authenticationRequest userAgent];
  [v10 encodeObject:v6 forKey:@"authenticationRequestUserAgent"];

  v7 = [(ACAccount *)self->_account ams_altDSID];
  [v10 encodeObject:v7 forKey:@"accountAltDSID"];

  v8 = [(ACAccount *)self->_account ams_DSID];
  [v10 encodeObject:v8 forKey:@"accountDSID"];

  uint64_t v9 = [(ACAccount *)self->_account username];
  [v10 encodeObject:v9 forKey:@"accountUsername"];
}

- (CPSStoreAuthenticationRequest)initWithXPCDictionary:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)CPSStoreAuthenticationRequest;
  objc_super v5 = [(CPSAuthenticationRequest *)&v22 init];
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x263F29D08] coderWithMessage:v4];
    v7 = [v6 decodeStringForKey:@"identifier"];
    [(CPSAuthenticationRequest *)v5 setIdentifier:v7];

    v8 = [v6 decodeStringForKey:@"authenticationRequestChallenge"];
    uint64_t v9 = [v6 decodeStringForKey:@"authenticationRequestUserAgent"];
    uint64_t v10 = [objc_alloc((Class)getAMSDelegateAuthenticateRequestClass()) initWithChallenge:v8 userAgent:v9];
    authenticationRequest = v5->_authenticationRequest;
    v5->_authenticationRequest = (AMSDelegateAuthenticateRequest *)v10;

    objc_super v12 = [v6 decodeStringForKey:@"accountAltDSID"];
    v13 = self;
    v14 = [v6 decodeObjectOfClass:v13 forKey:@"accountDSID"];

    v15 = [v6 decodeStringForKey:@"accountUsername"];
    id ACAccountStoreClass = getACAccountStoreClass();
    v17 = getAMSAccountMediaTypeProduction();
    v18 = objc_msgSend(ACAccountStoreClass, "ams_sharedAccountStoreForMediaType:", v17);
    uint64_t v19 = objc_msgSend(v18, "ams_iTunesAccountWithAltDSID:DSID:username:", v12, v14, v15);
    account = v5->_account;
    v5->_account = (ACAccount *)v19;
  }
  return v5;
}

- (AMSDelegateAuthenticateRequest)authenticationRequest
{
  return self->_authenticationRequest;
}

- (void)setAuthenticationRequest:(id)a3
{
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
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_authenticationRequest, 0);
}

@end
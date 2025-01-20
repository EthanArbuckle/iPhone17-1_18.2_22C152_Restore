@interface ASCAppleIDCredential
+ (BOOL)supportsSecureCoding;
- (AKAuthorization)authorization;
- (ASCAppleIDCredential)initWithAuthorization:(id)a3;
- (ASCAppleIDCredential)initWithCoder:(id)a3;
- (ASCAppleIDCredential)initWithUser:(id)a3 identityToken:(id)a4 state:(id)a5;
- (NSData)identityToken;
- (NSString)state;
- (NSString)user;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ASCAppleIDCredential

- (ASCAppleIDCredential)initWithUser:(id)a3 identityToken:(id)a4 state:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)ASCAppleIDCredential;
  v11 = [(ASCAppleIDCredential *)&v20 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    user = v11->_user;
    v11->_user = (NSString *)v12;

    uint64_t v14 = [v9 copy];
    identityToken = v11->_identityToken;
    v11->_identityToken = (NSData *)v14;

    uint64_t v16 = [v10 copy];
    state = v11->_state;
    v11->_state = (NSString *)v16;

    v18 = v11;
  }

  return v11;
}

- (ASCAppleIDCredential)initWithAuthorization:(id)a3
{
  id v5 = a3;
  v6 = [v5 credential];
  v7 = [v6 userIdentifier];
  id v8 = [v6 identityToken];
  id v9 = [v6 state];
  id v10 = [(ASCAppleIDCredential *)self initWithUser:v7 identityToken:v8 state:v9];

  if (v10)
  {
    objc_storeStrong((id *)&v10->_authorization, a3);
    v11 = v10;
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  authorization = self->_authorization;
  id v5 = [ASCAppleIDCredential alloc];
  if (authorization)
  {
    v6 = self->_authorization;
    return [(ASCAppleIDCredential *)v5 initWithAuthorization:v6];
  }
  else
  {
    user = self->_user;
    identityToken = self->_identityToken;
    state = self->_state;
    return [(ASCAppleIDCredential *)v5 initWithUser:user identityToken:identityToken state:state];
  }
}

- (void)encodeWithCoder:(id)a3
{
  authorization = self->_authorization;
  id v5 = a3;
  [v5 encodeObject:authorization forKey:@"Authorization"];
  [v5 encodeObject:self->_user forKey:@"User"];
  [v5 encodeObject:self->_identityToken forKey:@"IdentityToken"];
  [v5 encodeObject:self->_state forKey:@"State"];
}

- (ASCAppleIDCredential)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Authorization"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"User"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"IdentityToken"];
  id v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"State"];

  id v9 = [(ASCAppleIDCredential *)self initWithUser:v6 identityToken:v7 state:v8];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_authorization, v5);
    v11 = v10;
  }

  return v10;
}

- (AKAuthorization)authorization
{
  return self->_authorization;
}

- (NSString)user
{
  return self->_user;
}

- (NSData)identityToken
{
  return self->_identityToken;
}

- (NSString)state
{
  return self->_state;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_identityToken, 0);
  objc_storeStrong((id *)&self->_user, 0);

  objc_storeStrong((id *)&self->_authorization, 0);
}

@end
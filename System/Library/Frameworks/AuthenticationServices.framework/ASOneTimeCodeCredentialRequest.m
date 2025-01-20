@interface ASOneTimeCodeCredentialRequest
+ (BOOL)supportsSecureCoding;
+ (id)requestWithCredentialIdentity:(id)a3;
- (ASCredentialIdentity)credentialIdentity;
- (ASOneTimeCodeCredentialRequest)initWithCoder:(id)a3;
- (ASOneTimeCodeCredentialRequest)initWithCredentialIdentity:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)type;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ASOneTimeCodeCredentialRequest

- (ASOneTimeCodeCredentialRequest)initWithCredentialIdentity:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ASOneTimeCodeCredentialRequest;
  v5 = [(ASOneTimeCodeCredentialRequest *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    credentialIdentity = v5->_credentialIdentity;
    v5->_credentialIdentity = (ASOneTimeCodeCredentialIdentity *)v6;

    v8 = v5;
  }

  return v5;
}

+ (id)requestWithCredentialIdentity:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithCredentialIdentity:v4];

  return v5;
}

- (int64_t)type
{
  return 3;
}

- (ASCredentialIdentity)credentialIdentity
{
  return (ASCredentialIdentity *)self->_credentialIdentity;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (ASOneTimeCodeCredentialRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"credentialIdentity"];

  uint64_t v6 = [(ASOneTimeCodeCredentialRequest *)self initWithCredentialIdentity:v5];
  v7 = v6;
  if (v6) {
    v8 = v6;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[ASOneTimeCodeCredentialRequest allocWithZone:a3];
  credentialIdentity = self->_credentialIdentity;

  return [(ASOneTimeCodeCredentialRequest *)v4 initWithCredentialIdentity:credentialIdentity];
}

- (void).cxx_destruct
{
}

@end
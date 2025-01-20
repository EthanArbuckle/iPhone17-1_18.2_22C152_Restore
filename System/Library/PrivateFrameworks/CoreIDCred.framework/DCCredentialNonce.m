@interface DCCredentialNonce
+ (BOOL)supportsSecureCoding;
- (DCCredentialNonce)initWithCoder:(id)a3;
- (DCCredentialNonce)initWithCredentialNonce:(id)a3;
- (NSData)credentialNonce;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DCCredentialNonce

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (DCCredentialNonce)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DCCredentialNonce;
  v5 = [(DCCredentialNonce *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:0x26C59B580];
    credentialNonce = v5->_credentialNonce;
    v5->_credentialNonce = (NSData *)v6;
  }
  return v5;
}

- (DCCredentialNonce)initWithCredentialNonce:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DCCredentialNonce;
  v5 = [(DCCredentialNonce *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    credentialNonce = v5->_credentialNonce;
    v5->_credentialNonce = (NSData *)v6;
  }
  return v5;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"DCCredentialNonce nonce = %@", self->_credentialNonce];
}

- (NSData)credentialNonce
{
  return self->_credentialNonce;
}

- (void).cxx_destruct
{
}

@end
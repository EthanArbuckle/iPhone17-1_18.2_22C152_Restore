@interface DCCredentialAuthorizationToken
+ (BOOL)supportsSecureCoding;
- (DCCredentialAuthorizationToken)initWithCoder:(id)a3;
- (DCCredentialAuthorizationToken)initWithCredentialAuthorizationToken:(id)a3 pairingID:(id)a4;
- (NSData)credentialAuthorizationToken;
- (NSString)credentialPairingID;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DCCredentialAuthorizationToken

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  credentialAuthorizationToken = self->_credentialAuthorizationToken;
  id v5 = a3;
  [v5 encodeObject:credentialAuthorizationToken forKey:0x26C59B5A0];
  [v5 encodeObject:self->_credentialPairingID forKey:0x26C59B600];
}

- (DCCredentialAuthorizationToken)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DCCredentialAuthorizationToken;
  id v5 = [(DCCredentialAuthorizationToken *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:0x26C59B5A0];
    credentialAuthorizationToken = v5->_credentialAuthorizationToken;
    v5->_credentialAuthorizationToken = (NSData *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:0x26C59B600];
    credentialPairingID = v5->_credentialPairingID;
    v5->_credentialPairingID = (NSString *)v8;
  }
  return v5;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"DCCredentialAuthorizationToken authorizationToken = %@, pairingID = %@", self->_credentialAuthorizationToken, self->_credentialPairingID];
}

- (DCCredentialAuthorizationToken)initWithCredentialAuthorizationToken:(id)a3 pairingID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)DCCredentialAuthorizationToken;
  uint64_t v8 = [(DCCredentialAuthorizationToken *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    credentialAuthorizationToken = v8->_credentialAuthorizationToken;
    v8->_credentialAuthorizationToken = (NSData *)v9;

    uint64_t v11 = [v7 copy];
    credentialPairingID = v8->_credentialPairingID;
    v8->_credentialPairingID = (NSString *)v11;
  }
  return v8;
}

- (NSData)credentialAuthorizationToken
{
  return self->_credentialAuthorizationToken;
}

- (NSString)credentialPairingID
{
  return self->_credentialPairingID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_credentialPairingID, 0);

  objc_storeStrong((id *)&self->_credentialAuthorizationToken, 0);
}

@end
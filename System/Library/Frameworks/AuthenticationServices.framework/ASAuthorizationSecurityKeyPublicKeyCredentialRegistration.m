@interface ASAuthorizationSecurityKeyPublicKeyCredentialRegistration
+ (BOOL)supportsSecureCoding;
- (ASAuthorizationSecurityKeyPublicKeyCredentialRegistration)initWithCoder:(id)a3;
- (ASAuthorizationSecurityKeyPublicKeyCredentialRegistration)initWithCoreCredential:(id)a3;
- (NSArray)transports;
- (NSData)credentialID;
- (NSData)rawAttestationObject;
- (NSData)rawClientDataJSON;
- (id)_initWithBaseCredential:(id)a3 rawAttestationObject:(id)a4 transports:(id)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ASAuthorizationSecurityKeyPublicKeyCredentialRegistration

- (id)_initWithBaseCredential:(id)a3 rawAttestationObject:(id)a4 transports:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)ASAuthorizationSecurityKeyPublicKeyCredentialRegistration;
  v11 = [(ASAuthorizationSecurityKeyPublicKeyCredentialRegistration *)&v18 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    baseCredential = v11->_baseCredential;
    v11->_baseCredential = (ASPublicKeyCredentialBase *)v12;

    objc_storeStrong((id *)&v11->_rawAttestationObject, a4);
    uint64_t v14 = [v10 copy];
    transports = v11->_transports;
    v11->_transports = (NSArray *)v14;

    v16 = v11;
  }

  return v11;
}

- (ASAuthorizationSecurityKeyPublicKeyCredentialRegistration)initWithCoreCredential:(id)a3
{
  id v4 = a3;
  v5 = [ASPublicKeyCredentialBase alloc];
  v6 = [v4 credentialID];
  v7 = [v4 rawClientDataJSON];
  id v8 = [v4 attachment];
  id v9 = [(ASPublicKeyCredentialBase *)v5 initWithCredentialID:v6 rawClientDataJSON:v7 attachment:+[ASAuthorizationPublicKeyCredentialConstants publicAttachmentFromInternal:v8]];

  id v10 = [v4 attestationObject];
  v11 = [v4 transports];

  uint64_t v12 = [(ASAuthorizationSecurityKeyPublicKeyCredentialRegistration *)self _initWithBaseCredential:v9 rawAttestationObject:v10 transports:v11];
  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  baseCredential = self->_baseCredential;
  rawAttestationObject = self->_rawAttestationObject;
  transports = self->_transports;

  return (id)[v4 _initWithBaseCredential:baseCredential rawAttestationObject:rawAttestationObject transports:transports];
}

- (ASAuthorizationSecurityKeyPublicKeyCredentialRegistration)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"baseCredential"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"rawAttestationObject"];
  v7 = (void *)MEMORY[0x263EFFA08];
  uint64_t v8 = objc_opt_class();
  id v9 = objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  id v10 = [v4 decodeObjectOfClasses:v9 forKey:@"transports"];

  v11 = [(ASAuthorizationSecurityKeyPublicKeyCredentialRegistration *)self _initWithBaseCredential:v5 rawAttestationObject:v6 transports:v10];
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  baseCredential = self->_baseCredential;
  id v5 = a3;
  [v5 encodeObject:baseCredential forKey:@"baseCredential"];
  [v5 encodeObject:self->_rawAttestationObject forKey:@"rawAttestationObject"];
  [v5 encodeObject:self->_transports forKey:@"transports"];
}

- (NSData)rawClientDataJSON
{
  return [(ASPublicKeyCredentialBase *)self->_baseCredential rawClientDataJSON];
}

- (NSData)credentialID
{
  return [(ASPublicKeyCredentialBase *)self->_baseCredential credentialID];
}

- (NSData)rawAttestationObject
{
  return self->_rawAttestationObject;
}

- (NSArray)transports
{
  return self->_transports;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transports, 0);
  objc_storeStrong((id *)&self->_rawAttestationObject, 0);

  objc_storeStrong((id *)&self->_baseCredential, 0);
}

@end
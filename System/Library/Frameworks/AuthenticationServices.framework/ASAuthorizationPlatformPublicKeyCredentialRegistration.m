@interface ASAuthorizationPlatformPublicKeyCredentialRegistration
+ (BOOL)supportsSecureCoding;
- (ASAuthorizationPlatformPublicKeyCredentialRegistration)initWithCoder:(id)a3;
- (ASAuthorizationPlatformPublicKeyCredentialRegistration)initWithCoreCredential:(id)a3;
- (ASAuthorizationPublicKeyCredentialAttachment)attachment;
- (ASAuthorizationPublicKeyCredentialLargeBlobRegistrationOutput)__largeBlobSwift;
- (ASAuthorizationPublicKeyCredentialPRFRegistrationOutput)__prfSwift;
- (ASCPlatformPublicKeyCredentialRegistration)coreCredential;
- (NSData)credentialID;
- (NSData)rawAttestationObject;
- (NSData)rawClientDataJSON;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ASAuthorizationPlatformPublicKeyCredentialRegistration

- (ASAuthorizationPlatformPublicKeyCredentialRegistration)initWithCoreCredential:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ASAuthorizationPlatformPublicKeyCredentialRegistration;
  v6 = [(ASAuthorizationPlatformPublicKeyCredentialRegistration *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_coreCredential, a3);
    v8 = v7;
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [ASAuthorizationPlatformPublicKeyCredentialRegistration alloc];
  coreCredential = self->_coreCredential;

  return [(ASAuthorizationPlatformPublicKeyCredentialRegistration *)v4 initWithCoreCredential:coreCredential];
}

- (ASAuthorizationPlatformPublicKeyCredentialRegistration)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"coreCredential"];

  v6 = [(ASAuthorizationPlatformPublicKeyCredentialRegistration *)self initWithCoreCredential:v5];
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
}

- (NSData)rawClientDataJSON
{
  return (NSData *)[(ASCPlatformPublicKeyCredentialRegistration *)self->_coreCredential rawClientDataJSON];
}

- (NSData)credentialID
{
  return (NSData *)[(ASCPlatformPublicKeyCredentialRegistration *)self->_coreCredential credentialID];
}

- (NSData)rawAttestationObject
{
  return (NSData *)[(ASCPlatformPublicKeyCredentialRegistration *)self->_coreCredential attestationObject];
}

- (ASAuthorizationPublicKeyCredentialAttachment)attachment
{
  v2 = [(ASCPlatformPublicKeyCredentialRegistration *)self->_coreCredential attachment];
  ASAuthorizationPublicKeyCredentialAttachment v3 = +[ASAuthorizationPublicKeyCredentialConstants publicAttachmentFromInternal:v2];

  return v3;
}

- (ASCPlatformPublicKeyCredentialRegistration)coreCredential
{
  return self->_coreCredential;
}

- (void).cxx_destruct
{
}

- (ASAuthorizationPublicKeyCredentialLargeBlobRegistrationOutput)__largeBlobSwift
{
  v2 = self;
  id v3 = ASAuthorizationPlatformPublicKeyCredentialRegistration.__largeBlobSwift.getter();

  return (ASAuthorizationPublicKeyCredentialLargeBlobRegistrationOutput *)v3;
}

- (ASAuthorizationPublicKeyCredentialPRFRegistrationOutput)__prfSwift
{
  v2 = self;
  id v3 = ASAuthorizationPlatformPublicKeyCredentialRegistration.__prfSwift.getter();

  return (ASAuthorizationPublicKeyCredentialPRFRegistrationOutput *)v3;
}

@end
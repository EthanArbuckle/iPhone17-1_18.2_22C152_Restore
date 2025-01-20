@interface ASAuthorizationPlatformPublicKeyCredentialAssertion
+ (BOOL)supportsSecureCoding;
- (ASAuthorizationPlatformPublicKeyCredentialAssertion)initWithCoder:(id)a3;
- (ASAuthorizationPlatformPublicKeyCredentialAssertion)initWithCoreCredential:(id)a3;
- (ASAuthorizationPublicKeyCredentialAttachment)attachment;
- (ASAuthorizationPublicKeyCredentialLargeBlobAssertionOutput)__largeBlobSwift;
- (ASAuthorizationPublicKeyCredentialPRFAssertionOutput)__prfSwift;
- (ASCPlatformPublicKeyCredentialAssertion)coreCredential;
- (NSData)credentialID;
- (NSData)rawAuthenticatorData;
- (NSData)rawClientDataJSON;
- (NSData)signature;
- (NSData)userID;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ASAuthorizationPlatformPublicKeyCredentialAssertion

- (ASAuthorizationPlatformPublicKeyCredentialAssertion)initWithCoreCredential:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ASAuthorizationPlatformPublicKeyCredentialAssertion;
  v6 = [(ASAuthorizationPlatformPublicKeyCredentialAssertion *)&v10 init];
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
  v4 = [ASAuthorizationPlatformPublicKeyCredentialAssertion alloc];
  coreCredential = self->_coreCredential;

  return [(ASAuthorizationPlatformPublicKeyCredentialAssertion *)v4 initWithCoreCredential:coreCredential];
}

- (ASAuthorizationPlatformPublicKeyCredentialAssertion)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"coreCredential"];

  v6 = [(ASAuthorizationPlatformPublicKeyCredentialAssertion *)self initWithCoreCredential:v5];
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
}

- (NSData)rawClientDataJSON
{
  return (NSData *)[(ASCPlatformPublicKeyCredentialAssertion *)self->_coreCredential rawClientDataJSON];
}

- (NSData)credentialID
{
  return (NSData *)[(ASCPlatformPublicKeyCredentialAssertion *)self->_coreCredential credentialID];
}

- (NSData)rawAuthenticatorData
{
  return (NSData *)[(ASCPlatformPublicKeyCredentialAssertion *)self->_coreCredential authenticatorData];
}

- (NSData)userID
{
  return (NSData *)[(ASCPlatformPublicKeyCredentialAssertion *)self->_coreCredential userHandle];
}

- (NSData)signature
{
  return (NSData *)[(ASCPlatformPublicKeyCredentialAssertion *)self->_coreCredential signature];
}

- (ASAuthorizationPublicKeyCredentialAttachment)attachment
{
  v2 = [(ASCPlatformPublicKeyCredentialAssertion *)self->_coreCredential attachment];
  ASAuthorizationPublicKeyCredentialAttachment v3 = +[ASAuthorizationPublicKeyCredentialConstants publicAttachmentFromInternal:v2];

  return v3;
}

- (ASCPlatformPublicKeyCredentialAssertion)coreCredential
{
  return self->_coreCredential;
}

- (void).cxx_destruct
{
}

- (ASAuthorizationPublicKeyCredentialLargeBlobAssertionOutput)__largeBlobSwift
{
  v2 = self;
  id v3 = ASAuthorizationPlatformPublicKeyCredentialAssertion.__largeBlobSwift.getter();

  return (ASAuthorizationPublicKeyCredentialLargeBlobAssertionOutput *)v3;
}

- (ASAuthorizationPublicKeyCredentialPRFAssertionOutput)__prfSwift
{
  v2 = self;
  id v3 = ASAuthorizationPlatformPublicKeyCredentialAssertion.__prfSwift.getter();

  return (ASAuthorizationPublicKeyCredentialPRFAssertionOutput *)v3;
}

@end
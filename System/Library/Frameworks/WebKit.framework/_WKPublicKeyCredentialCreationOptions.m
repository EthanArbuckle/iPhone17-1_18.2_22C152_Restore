@interface _WKPublicKeyCredentialCreationOptions
- (NSArray)excludeCredentials;
- (NSArray)publicKeyCredentialParamaters;
- (NSData)extensionsCBOR;
- (NSNumber)timeout;
- (_WKAuthenticationExtensionsClientInputs)extensions;
- (_WKAuthenticatorSelectionCriteria)authenticatorSelection;
- (_WKPublicKeyCredentialCreationOptions)initWithRelyingParty:(id)a3 user:(id)a4 publicKeyCredentialParamaters:(id)a5;
- (_WKPublicKeyCredentialRelyingPartyEntity)relyingParty;
- (_WKPublicKeyCredentialUserEntity)user;
- (int64_t)attestation;
- (void)dealloc;
- (void)setAttestation:(int64_t)a3;
- (void)setAuthenticatorSelection:(id)a3;
- (void)setExcludeCredentials:(id)a3;
- (void)setExtensions:(id)a3;
- (void)setExtensionsCBOR:(id)a3;
- (void)setPublicKeyCredentialParamaters:(id)a3;
- (void)setRelyingParty:(id)a3;
- (void)setTimeout:(id)a3;
- (void)setUser:(id)a3;
@end

@implementation _WKPublicKeyCredentialCreationOptions

- (_WKPublicKeyCredentialCreationOptions)initWithRelyingParty:(id)a3 user:(id)a4 publicKeyCredentialParamaters:(id)a5
{
  v11.receiver = self;
  v11.super_class = (Class)_WKPublicKeyCredentialCreationOptions;
  v8 = [(_WKPublicKeyCredentialCreationOptions *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(_WKPublicKeyCredentialCreationOptions *)v8 setRelyingParty:a3];
    [(_WKPublicKeyCredentialCreationOptions *)v9 setUser:a4];
    [(_WKPublicKeyCredentialCreationOptions *)v9 setPublicKeyCredentialParamaters:a5];
  }
  return v9;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)_WKPublicKeyCredentialCreationOptions;
  [(_WKPublicKeyCredentialCreationOptions *)&v3 dealloc];
}

- (_WKPublicKeyCredentialRelyingPartyEntity)relyingParty
{
  return self->_relyingParty;
}

- (void)setRelyingParty:(id)a3
{
}

- (_WKPublicKeyCredentialUserEntity)user
{
  return self->_user;
}

- (void)setUser:(id)a3
{
}

- (NSArray)publicKeyCredentialParamaters
{
  return self->_publicKeyCredentialParamaters;
}

- (void)setPublicKeyCredentialParamaters:(id)a3
{
}

- (NSNumber)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(id)a3
{
}

- (NSArray)excludeCredentials
{
  return self->_excludeCredentials;
}

- (void)setExcludeCredentials:(id)a3
{
}

- (_WKAuthenticatorSelectionCriteria)authenticatorSelection
{
  return self->_authenticatorSelection;
}

- (void)setAuthenticatorSelection:(id)a3
{
}

- (int64_t)attestation
{
  return self->_attestation;
}

- (void)setAttestation:(int64_t)a3
{
  self->_attestation = a3;
}

- (_WKAuthenticationExtensionsClientInputs)extensions
{
  return self->_extensions;
}

- (void)setExtensions:(id)a3
{
}

- (NSData)extensionsCBOR
{
  return self->_extensionsCBOR;
}

- (void)setExtensionsCBOR:(id)a3
{
}

@end
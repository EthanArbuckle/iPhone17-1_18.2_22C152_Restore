@interface _WKPublicKeyCredentialRequestOptions
- (NSArray)allowCredentials;
- (NSData)extensionsCBOR;
- (NSNumber)timeout;
- (NSString)relyingPartyIdentifier;
- (_WKAuthenticationExtensionsClientInputs)extensions;
- (_WKPublicKeyCredentialRequestOptions)init;
- (int64_t)authenticatorAttachment;
- (int64_t)userVerification;
- (void)dealloc;
- (void)setAllowCredentials:(id)a3;
- (void)setAuthenticatorAttachment:(int64_t)a3;
- (void)setExtensions:(id)a3;
- (void)setExtensionsCBOR:(id)a3;
- (void)setRelyingPartyIdentifier:(id)a3;
- (void)setTimeout:(id)a3;
- (void)setUserVerification:(int64_t)a3;
@end

@implementation _WKPublicKeyCredentialRequestOptions

- (_WKPublicKeyCredentialRequestOptions)init
{
  v5.receiver = self;
  v5.super_class = (Class)_WKPublicKeyCredentialRequestOptions;
  v2 = [(_WKPublicKeyCredentialRequestOptions *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(_WKPublicKeyCredentialRequestOptions *)v2 setUserVerification:1];
    [(_WKPublicKeyCredentialRequestOptions *)v3 setAuthenticatorAttachment:0];
  }
  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)_WKPublicKeyCredentialRequestOptions;
  [(_WKPublicKeyCredentialRequestOptions *)&v3 dealloc];
}

- (NSNumber)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(id)a3
{
}

- (NSString)relyingPartyIdentifier
{
  return self->_relyingPartyIdentifier;
}

- (void)setRelyingPartyIdentifier:(id)a3
{
}

- (NSArray)allowCredentials
{
  return self->_allowCredentials;
}

- (void)setAllowCredentials:(id)a3
{
}

- (int64_t)userVerification
{
  return self->_userVerification;
}

- (void)setUserVerification:(int64_t)a3
{
  self->_userVerification = a3;
}

- (int64_t)authenticatorAttachment
{
  return self->_authenticatorAttachment;
}

- (void)setAuthenticatorAttachment:(int64_t)a3
{
  self->_authenticatorAttachment = a3;
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
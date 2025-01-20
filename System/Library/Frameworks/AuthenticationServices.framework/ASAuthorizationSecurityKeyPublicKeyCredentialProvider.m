@interface ASAuthorizationSecurityKeyPublicKeyCredentialProvider
- (ASAuthorizationSecurityKeyPublicKeyCredentialAssertionRequest)createCredentialAssertionRequestWithChallenge:(NSData *)challenge;
- (ASAuthorizationSecurityKeyPublicKeyCredentialProvider)initWithRelyingPartyIdentifier:(NSString *)relyingPartyIdentifier;
- (ASAuthorizationSecurityKeyPublicKeyCredentialRegistrationRequest)createCredentialRegistrationRequestWithChallenge:(NSData *)challenge displayName:(NSString *)displayName name:(NSString *)name userID:(NSData *)userID;
- (NSString)relyingPartyIdentifier;
- (id)createCredentialAssertionRequestWithClientData:(id)a3;
- (id)createCredentialRegistrationRequestWithClientData:(id)a3 displayName:(id)a4 name:(id)a5 userID:(id)a6;
@end

@implementation ASAuthorizationSecurityKeyPublicKeyCredentialProvider

- (ASAuthorizationSecurityKeyPublicKeyCredentialProvider)initWithRelyingPartyIdentifier:(NSString *)relyingPartyIdentifier
{
  v4 = relyingPartyIdentifier;
  v10.receiver = self;
  v10.super_class = (Class)ASAuthorizationSecurityKeyPublicKeyCredentialProvider;
  v5 = [(ASAuthorizationSecurityKeyPublicKeyCredentialProvider *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [(NSString *)v4 copy];
    v7 = v5->_relyingPartyIdentifier;
    v5->_relyingPartyIdentifier = (NSString *)v6;

    v8 = v5;
  }

  return v5;
}

- (ASAuthorizationSecurityKeyPublicKeyCredentialRegistrationRequest)createCredentialRegistrationRequestWithChallenge:(NSData *)challenge displayName:(NSString *)displayName name:(NSString *)name userID:(NSData *)userID
{
  objc_super v10 = userID;
  v11 = name;
  v12 = displayName;
  v13 = challenge;
  id v14 = [[ASAuthorizationSecurityKeyPublicKeyCredentialRegistrationRequest alloc] _initWithProvider:self relyingPartyIdentifier:self->_relyingPartyIdentifier challenge:v13 displayName:v12 name:v11 userID:v10 clientData:0];

  return (ASAuthorizationSecurityKeyPublicKeyCredentialRegistrationRequest *)v14;
}

- (ASAuthorizationSecurityKeyPublicKeyCredentialAssertionRequest)createCredentialAssertionRequestWithChallenge:(NSData *)challenge
{
  v4 = challenge;
  id v5 = [[ASAuthorizationSecurityKeyPublicKeyCredentialAssertionRequest alloc] _initWithProvider:self relyingPartyIdentifier:self->_relyingPartyIdentifier challenge:v4 clientData:0];

  return (ASAuthorizationSecurityKeyPublicKeyCredentialAssertionRequest *)v5;
}

- (id)createCredentialAssertionRequestWithClientData:(id)a3
{
  id v4 = a3;
  id v5 = [[ASAuthorizationSecurityKeyPublicKeyCredentialAssertionRequest alloc] _initWithProvider:self relyingPartyIdentifier:self->_relyingPartyIdentifier challenge:0 clientData:v4];

  return v5;
}

- (id)createCredentialRegistrationRequestWithClientData:(id)a3 displayName:(id)a4 name:(id)a5 userID:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [[ASAuthorizationSecurityKeyPublicKeyCredentialRegistrationRequest alloc] _initWithProvider:self relyingPartyIdentifier:self->_relyingPartyIdentifier challenge:0 displayName:v12 name:v11 userID:v10 clientData:v13];

  return v14;
}

- (NSString)relyingPartyIdentifier
{
  return self->_relyingPartyIdentifier;
}

- (void).cxx_destruct
{
}

@end
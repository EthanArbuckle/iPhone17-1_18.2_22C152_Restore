@interface ASAuthorizationSecurityKeyPublicKeyCredentialAssertionRequest
- (ASCPublicKeyCredentialAssertionOptions)coreCredentialAssertionOptions;
- (ASPublicKeyCredentialClientData)clientData;
- (BOOL)supportsStyle:(int64_t)a3;
- (NSArray)allowedCredentials;
- (NSData)challenge;
- (NSString)appID;
- (NSString)relyingPartyIdentifier;
- (NSString)userVerificationPreference;
- (id)_initWithProvider:(id)a3 relyingPartyIdentifier:(id)a4 challenge:(id)a5 clientData:(id)a6;
- (void)setAllowedCredentials:(NSArray *)allowedCredentials;
- (void)setAppID:(id)a3;
- (void)setChallenge:(id)a3;
- (void)setClientData:(id)a3;
- (void)setRelyingPartyIdentifier:(id)a3;
- (void)setUserVerificationPreference:(id)a3;
@end

@implementation ASAuthorizationSecurityKeyPublicKeyCredentialAssertionRequest

- (id)_initWithProvider:(id)a3 relyingPartyIdentifier:(id)a4 challenge:(id)a5 clientData:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v20.receiver = self;
  v20.super_class = (Class)ASAuthorizationSecurityKeyPublicKeyCredentialAssertionRequest;
  v13 = [(ASAuthorizationRequest *)&v20 initWithProvider:a3];
  if (v13)
  {
    uint64_t v14 = [v10 copy];
    relyingPartyIdentifier = v13->_relyingPartyIdentifier;
    v13->_relyingPartyIdentifier = (NSString *)v14;

    uint64_t v16 = [v11 copy];
    challenge = v13->_challenge;
    v13->_challenge = (NSData *)v16;

    objc_storeStrong((id *)&v13->_userVerificationPreference, @"preferred");
    v13->_internalLock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v13->_clientData, a6);
    v18 = v13;
  }

  return v13;
}

- (ASCPublicKeyCredentialAssertionOptions)coreCredentialAssertionOptions
{
  v3 = [(ASAuthorizationSecurityKeyPublicKeyCredentialAssertionRequest *)self allowedCredentials];
  v4 = objc_msgSend(v3, "safari_mapObjectsUsingBlock:", &__block_literal_global_17);

  v5 = [(ASAuthorizationSecurityKeyPublicKeyCredentialAssertionRequest *)self clientData];

  id v6 = objc_alloc(MEMORY[0x263F29408]);
  v7 = [(ASAuthorizationSecurityKeyPublicKeyCredentialAssertionRequest *)self relyingPartyIdentifier];
  if (v5)
  {
    v8 = [(ASAuthorizationSecurityKeyPublicKeyCredentialAssertionRequest *)self clientData];
    v9 = [v8 jsonForOperationType:1];
    id v10 = [(ASAuthorizationSecurityKeyPublicKeyCredentialAssertionRequest *)self userVerificationPreference];
    id v11 = [(ASAuthorizationSecurityKeyPublicKeyCredentialAssertionRequest *)self clientData];
    id v12 = [v11 origin];
    v13 = (void *)[v6 initWithKind:2 relyingPartyIdentifier:v7 clientDataJSON:v9 userVerificationPreference:v10 allowedCredentials:v4 origin:v12];
  }
  else
  {
    v8 = [(ASAuthorizationSecurityKeyPublicKeyCredentialAssertionRequest *)self challenge];
    v9 = [(ASAuthorizationSecurityKeyPublicKeyCredentialAssertionRequest *)self userVerificationPreference];
    v13 = (void *)[v6 initWithKind:2 relyingPartyIdentifier:v7 challenge:v8 userVerificationPreference:v9 allowedCredentials:v4];
  }

  uint64_t v14 = [(ASAuthorizationSecurityKeyPublicKeyCredentialAssertionRequest *)self appID];
  [v13 setAppIDForSecurityKeys:v14];

  return (ASCPublicKeyCredentialAssertionOptions *)v13;
}

uint64_t __95__ASAuthorizationSecurityKeyPublicKeyCredentialAssertionRequest_coreCredentialAssertionOptions__block_invoke(uint64_t a1, void *a2)
{
  return [a2 coreDescriptor];
}

- (BOOL)supportsStyle:(int64_t)a3
{
  return (a3 & 7) == 0 && (unint64_t)a3 < 3;
}

- (NSData)challenge
{
  p_internalLock = &self->_internalLock;
  os_unfair_lock_lock(&self->_internalLock);
  v4 = self->_challenge;
  os_unfair_lock_unlock(p_internalLock);

  return v4;
}

- (void)setChallenge:(id)a3
{
  v4 = (NSData *)a3;
  os_unfair_lock_lock(&self->_internalLock);
  challenge = self->_challenge;
  self->_challenge = v4;

  os_unfair_lock_unlock(&self->_internalLock);
}

- (NSString)relyingPartyIdentifier
{
  p_internalLock = &self->_internalLock;
  os_unfair_lock_lock(&self->_internalLock);
  v4 = self->_relyingPartyIdentifier;
  os_unfair_lock_unlock(p_internalLock);

  return v4;
}

- (void)setRelyingPartyIdentifier:(id)a3
{
  v4 = (NSString *)a3;
  os_unfair_lock_lock(&self->_internalLock);
  relyingPartyIdentifier = self->_relyingPartyIdentifier;
  self->_relyingPartyIdentifier = v4;

  os_unfair_lock_unlock(&self->_internalLock);
}

- (NSArray)allowedCredentials
{
  p_internalLock = &self->_internalLock;
  os_unfair_lock_lock(&self->_internalLock);
  v4 = self->_allowedCredentials;
  os_unfair_lock_unlock(p_internalLock);

  return v4;
}

- (void)setAllowedCredentials:(NSArray *)allowedCredentials
{
  v4 = allowedCredentials;
  os_unfair_lock_lock(&self->_internalLock);
  v5 = self->_allowedCredentials;
  self->_allowedCredentials = v4;

  os_unfair_lock_unlock(&self->_internalLock);
}

- (NSString)userVerificationPreference
{
  p_internalLock = &self->_internalLock;
  os_unfair_lock_lock(&self->_internalLock);
  v4 = self->_userVerificationPreference;
  os_unfair_lock_unlock(p_internalLock);

  return v4;
}

- (void)setUserVerificationPreference:(id)a3
{
  v4 = (NSString *)a3;
  os_unfair_lock_lock(&self->_internalLock);
  userVerificationPreference = self->_userVerificationPreference;
  self->_userVerificationPreference = v4;

  os_unfair_lock_unlock(&self->_internalLock);
}

- (NSString)appID
{
  p_internalLock = &self->_internalLock;
  os_unfair_lock_lock(&self->_internalLock);
  v4 = self->_appID;
  os_unfair_lock_unlock(p_internalLock);

  return v4;
}

- (void)setAppID:(id)a3
{
  v4 = (NSString *)a3;
  os_unfair_lock_lock(&self->_internalLock);
  appID = self->_appID;
  self->_appID = v4;

  os_unfair_lock_unlock(&self->_internalLock);
}

- (ASPublicKeyCredentialClientData)clientData
{
  p_internalLock = &self->_internalLock;
  os_unfair_lock_lock(&self->_internalLock);
  v4 = self->_clientData;
  os_unfair_lock_unlock(p_internalLock);

  return v4;
}

- (void)setClientData:(id)a3
{
  v4 = (ASPublicKeyCredentialClientData *)a3;
  os_unfair_lock_lock(&self->_internalLock);
  clientData = self->_clientData;
  self->_clientData = v4;

  os_unfair_lock_unlock(&self->_internalLock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientData, 0);
  objc_storeStrong((id *)&self->_appID, 0);
  objc_storeStrong((id *)&self->_challenge, 0);
  objc_storeStrong((id *)&self->_userVerificationPreference, 0);
  objc_storeStrong((id *)&self->_relyingPartyIdentifier, 0);

  objc_storeStrong((id *)&self->_allowedCredentials, 0);
}

@end
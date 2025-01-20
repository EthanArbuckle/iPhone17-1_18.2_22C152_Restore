@interface ASAuthorizationPlatformPublicKeyCredentialAssertionRequest
+ (id)emptyExtensions;
- (ASAuthorizationPublicKeyCredentialLargeBlobAssertionInput)__largeBlobSwift;
- (ASAuthorizationPublicKeyCredentialPRFAssertionInput)__prfSwift;
- (ASCPublicKeyCredentialAssertionExtensionInputs)extensions;
- (ASCPublicKeyCredentialAssertionOptions)coreCredentialAssertionOptions;
- (ASPublicKeyCredentialClientData)clientData;
- (BOOL)shouldShowHybridTransport;
- (BOOL)supportsStyle:(int64_t)a3;
- (LAContext)authenticatedContext;
- (NSArray)allowedCredentials;
- (NSData)challenge;
- (NSString)relyingPartyIdentifier;
- (NSString)userVerificationPreference;
- (id)_initWithProvider:(id)a3 relyingPartyIdentifier:(id)a4 challenge:(id)a5 clientData:(id)a6;
- (void)__setLargeBlobSwift:(id)a3;
- (void)__setPRFSwift:(id)a3;
- (void)setAllowedCredentials:(NSArray *)allowedCredentials;
- (void)setAuthenticatedContext:(id)a3;
- (void)setChallenge:(id)a3;
- (void)setClientData:(id)a3;
- (void)setRelyingPartyIdentifier:(id)a3;
- (void)setShouldShowHybridTransport:(BOOL)a3;
- (void)setUserVerificationPreference:(id)a3;
@end

@implementation ASAuthorizationPlatformPublicKeyCredentialAssertionRequest

- (id)_initWithProvider:(id)a3 relyingPartyIdentifier:(id)a4 challenge:(id)a5 clientData:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v22.receiver = self;
  v22.super_class = (Class)ASAuthorizationPlatformPublicKeyCredentialAssertionRequest;
  v13 = [(ASAuthorizationRequest *)&v22 initWithProvider:a3];
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
    v13->_shouldShowHybridTransport = 1;
    uint64_t v18 = [(id)objc_opt_class() emptyExtensions];
    extensions = v13->_extensions;
    v13->_extensions = (ASCPublicKeyCredentialAssertionExtensionInputs *)v18;

    v20 = v13;
  }

  return v13;
}

- (ASCPublicKeyCredentialAssertionOptions)coreCredentialAssertionOptions
{
  v3 = [(ASAuthorizationPlatformPublicKeyCredentialAssertionRequest *)self allowedCredentials];
  v4 = objc_msgSend(v3, "safari_mapObjectsUsingBlock:", &__block_literal_global_15);

  if (self->_challenge)
  {
    id v5 = objc_alloc(MEMORY[0x263F29408]);
    v6 = [(ASAuthorizationPlatformPublicKeyCredentialAssertionRequest *)self relyingPartyIdentifier];
    v7 = [(ASAuthorizationPlatformPublicKeyCredentialAssertionRequest *)self challenge];
    v8 = [(ASAuthorizationPlatformPublicKeyCredentialAssertionRequest *)self userVerificationPreference];
    v9 = (void *)[v5 initWithKind:1 relyingPartyIdentifier:v6 challenge:v7 userVerificationPreference:v8 allowedCredentials:v4];
  }
  else
  {
    id v10 = [(ASAuthorizationPlatformPublicKeyCredentialAssertionRequest *)self clientData];
    v6 = [v10 jsonForOperationType:1];

    id v11 = objc_alloc(MEMORY[0x263F29408]);
    v7 = [(ASAuthorizationPlatformPublicKeyCredentialAssertionRequest *)self relyingPartyIdentifier];
    v8 = [(ASAuthorizationPlatformPublicKeyCredentialAssertionRequest *)self userVerificationPreference];
    id v12 = [(ASPublicKeyCredentialClientData *)self->_clientData origin];
    v9 = (void *)[v11 initWithKind:1 relyingPartyIdentifier:v7 clientDataJSON:v6 userVerificationPreference:v8 allowedCredentials:v4 origin:v12];
  }
  [v9 setShouldHideHybrid:!self->_shouldShowHybridTransport];
  [v9 setExtensions:self->_extensions];

  return (ASCPublicKeyCredentialAssertionOptions *)v9;
}

uint64_t __92__ASAuthorizationPlatformPublicKeyCredentialAssertionRequest_coreCredentialAssertionOptions__block_invoke(uint64_t a1, void *a2)
{
  return [a2 coreDescriptor];
}

- (BOOL)supportsStyle:(int64_t)a3
{
  return (unint64_t)a3 < 3;
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
  id v5 = self->_allowedCredentials;
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

- (LAContext)authenticatedContext
{
  p_internalLock = &self->_internalLock;
  os_unfair_lock_lock(&self->_internalLock);
  v4 = self->_authenticatedContext;
  os_unfair_lock_unlock(p_internalLock);

  return v4;
}

- (void)setAuthenticatedContext:(id)a3
{
  v4 = (LAContext *)a3;
  os_unfair_lock_lock(&self->_internalLock);
  authenticatedContext = self->_authenticatedContext;
  self->_authenticatedContext = v4;

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

- (BOOL)shouldShowHybridTransport
{
  v2 = self;
  p_internalLock = &self->_internalLock;
  os_unfair_lock_lock(&self->_internalLock);
  LOBYTE(v2) = v2->_shouldShowHybridTransport;
  os_unfair_lock_unlock(p_internalLock);
  return (char)v2;
}

- (void)setShouldShowHybridTransport:(BOOL)a3
{
  p_internalLock = &self->_internalLock;
  os_unfair_lock_lock(&self->_internalLock);
  self->_shouldShowHybridTransport = a3;

  os_unfair_lock_unlock(p_internalLock);
}

- (ASCPublicKeyCredentialAssertionExtensionInputs)extensions
{
  return self->_extensions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensions, 0);
  objc_storeStrong((id *)&self->_clientData, 0);
  objc_storeStrong((id *)&self->_authenticatedContext, 0);
  objc_storeStrong((id *)&self->_userVerificationPreference, 0);
  objc_storeStrong((id *)&self->_challenge, 0);
  objc_storeStrong((id *)&self->_relyingPartyIdentifier, 0);

  objc_storeStrong((id *)&self->_allowedCredentials, 0);
}

- (ASAuthorizationPublicKeyCredentialLargeBlobAssertionInput)__largeBlobSwift
{
  v2 = self;
  id v3 = ASAuthorizationPlatformPublicKeyCredentialAssertionRequest.__largeBlobSwift.getter();

  return (ASAuthorizationPublicKeyCredentialLargeBlobAssertionInput *)v3;
}

- (void)__setLargeBlobSwift:(id)a3
{
}

- (ASAuthorizationPublicKeyCredentialPRFAssertionInput)__prfSwift
{
  v2 = self;
  id v3 = ASAuthorizationPlatformPublicKeyCredentialAssertionRequest.__prfSwift.getter();

  return (ASAuthorizationPublicKeyCredentialPRFAssertionInput *)v3;
}

- (void)__setPRFSwift:(id)a3
{
}

+ (id)emptyExtensions
{
  id v2 = objc_msgSend(objc_allocWithZone((Class)sub_21922B138()), sel_init);

  return v2;
}

@end
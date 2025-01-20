@interface ASAuthorizationSecurityKeyPublicKeyCredentialRegistrationRequest
- (ASAuthorizationPublicKeyCredentialResidentKeyPreference)residentKeyPreference;
- (ASCPublicKeyCredentialCreationOptions)coreCredentialCreationOptions;
- (ASPublicKeyCredentialClientData)clientData;
- (BOOL)supportsStyle:(int64_t)a3;
- (NSArray)credentialParameters;
- (NSArray)excludedCredentials;
- (NSData)challenge;
- (NSData)userID;
- (NSString)attestationPreference;
- (NSString)displayName;
- (NSString)name;
- (NSString)relyingPartyIdentifier;
- (NSString)userVerificationPreference;
- (id)_initWithProvider:(id)a3 relyingPartyIdentifier:(id)a4 challenge:(id)a5 displayName:(id)a6 name:(id)a7 userID:(id)a8 clientData:(id)a9;
- (void)setAttestationPreference:(id)a3;
- (void)setChallenge:(id)a3;
- (void)setClientData:(id)a3;
- (void)setCredentialParameters:(NSArray *)credentialParameters;
- (void)setDisplayName:(id)a3;
- (void)setExcludedCredentials:(NSArray *)excludedCredentials;
- (void)setName:(id)a3;
- (void)setResidentKeyPreference:(ASAuthorizationPublicKeyCredentialResidentKeyPreference)residentKeyPreference;
- (void)setUserID:(id)a3;
- (void)setUserVerificationPreference:(id)a3;
@end

@implementation ASAuthorizationSecurityKeyPublicKeyCredentialRegistrationRequest

- (id)_initWithProvider:(id)a3 relyingPartyIdentifier:(id)a4 challenge:(id)a5 displayName:(id)a6 name:(id)a7 userID:(id)a8 clientData:(id)a9
{
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  v37.receiver = self;
  v37.super_class = (Class)ASAuthorizationSecurityKeyPublicKeyCredentialRegistrationRequest;
  v21 = [(ASAuthorizationRequest *)&v37 initWithProvider:a3];
  if (v21)
  {
    uint64_t v22 = [v15 copy];
    relyingPartyIdentifier = v21->_relyingPartyIdentifier;
    v21->_relyingPartyIdentifier = (NSString *)v22;

    uint64_t v24 = [v16 copy];
    challenge = v21->_challenge;
    v21->_challenge = (NSData *)v24;

    uint64_t v26 = [v17 copy];
    displayName = v21->_displayName;
    v21->_displayName = (NSString *)v26;

    uint64_t v28 = [v18 copy];
    name = v21->_name;
    v21->_name = (NSString *)v28;

    uint64_t v30 = [v19 copy];
    userID = v21->_userID;
    v21->_userID = (NSData *)v30;

    objc_storeStrong((id *)&v21->_userVerificationPreference, @"preferred");
    objc_storeStrong((id *)&v21->_attestationPreference, @"none");
    credentialParameters = v21->_credentialParameters;
    v33 = (NSArray *)MEMORY[0x263EFFA68];
    v21->_credentialParameters = (NSArray *)MEMORY[0x263EFFA68];

    excludedCredentials = v21->_excludedCredentials;
    v21->_excludedCredentials = v33;

    objc_storeStrong((id *)&v21->_residentKeyPreference, @"preferred");
    v21->_internalLock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v21->_clientData, a9);
    v35 = v21;
  }

  return v21;
}

- (ASCPublicKeyCredentialCreationOptions)coreCredentialCreationOptions
{
  v21 = [(NSArray *)self->_credentialParameters safari_mapObjectsUsingBlock:&__block_literal_global_18];
  v3 = [(ASAuthorizationSecurityKeyPublicKeyCredentialRegistrationRequest *)self excludedCredentials];
  id v20 = objc_msgSend(v3, "safari_mapObjectsUsingBlock:", &__block_literal_global_4);

  id v16 = objc_alloc(MEMORY[0x263F29410]);
  id v19 = [(ASAuthorizationSecurityKeyPublicKeyCredentialRegistrationRequest *)self challenge];
  id v18 = [(ASAuthorizationSecurityKeyPublicKeyCredentialRegistrationRequest *)self clientData];
  v4 = [v18 jsonForOperationType:0];
  v5 = [(ASAuthorizationSecurityKeyPublicKeyCredentialRegistrationRequest *)self relyingPartyIdentifier];
  v6 = [(ASAuthorizationSecurityKeyPublicKeyCredentialRegistrationRequest *)self name];
  v7 = [(ASAuthorizationSecurityKeyPublicKeyCredentialRegistrationRequest *)self userID];
  v8 = [(ASAuthorizationSecurityKeyPublicKeyCredentialRegistrationRequest *)self displayName];
  v9 = [(ASAuthorizationSecurityKeyPublicKeyCredentialRegistrationRequest *)self attestationPreference];
  v10 = [(ASAuthorizationSecurityKeyPublicKeyCredentialRegistrationRequest *)self userVerificationPreference];
  v11 = [(ASAuthorizationSecurityKeyPublicKeyCredentialRegistrationRequest *)self clientData];
  v12 = [v11 origin];
  id v17 = (void *)[v16 initWithChallenge:v19 clientDataJSON:v4 clientDataHash:0 relyingPartyIdentifier:v5 userName:v6 userIdentifier:v7 userDisplayName:v8 supportedAlgorithmIdentifiers:v21 attestationPreference:v9 userVerificationPreference:v10 excludedCredentials:v20 extensions:0 origin:v12];

  v13 = self->_residentKeyPreference;
  if ([(NSString *)v13 isEqualToString:@"discouraged"])
  {
    uint64_t v14 = 1;
  }
  else if ([(NSString *)v13 isEqualToString:@"preferred"])
  {
    uint64_t v14 = 2;
  }
  else if ([(NSString *)v13 isEqualToString:@"required"])
  {
    uint64_t v14 = 3;
  }
  else
  {
    uint64_t v14 = 0;
  }

  [v17 setResidentKeyPreference:v14];

  return (ASCPublicKeyCredentialCreationOptions *)v17;
}

uint64_t __97__ASAuthorizationSecurityKeyPublicKeyCredentialRegistrationRequest_coreCredentialCreationOptions__block_invoke(uint64_t a1, void *a2)
{
  v2 = NSNumber;
  uint64_t v3 = [a2 algorithm];

  return [v2 numberWithInteger:v3];
}

uint64_t __97__ASAuthorizationSecurityKeyPublicKeyCredentialRegistrationRequest_coreCredentialCreationOptions__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 coreDescriptor];
}

- (BOOL)supportsStyle:(int64_t)a3
{
  return (a3 & 7) == 0 && (unint64_t)a3 < 3;
}

- (NSData)userID
{
  p_internalLock = &self->_internalLock;
  os_unfair_lock_lock(&self->_internalLock);
  v4 = self->_userID;
  os_unfair_lock_unlock(p_internalLock);

  return v4;
}

- (void)setUserID:(id)a3
{
  v4 = (NSData *)a3;
  os_unfair_lock_lock(&self->_internalLock);
  userID = self->_userID;
  self->_userID = v4;

  os_unfair_lock_unlock(&self->_internalLock);
}

- (NSString)name
{
  p_internalLock = &self->_internalLock;
  os_unfair_lock_lock(&self->_internalLock);
  v4 = self->_name;
  os_unfair_lock_unlock(p_internalLock);

  return v4;
}

- (void)setName:(id)a3
{
  v4 = (NSString *)a3;
  os_unfair_lock_lock(&self->_internalLock);
  name = self->_name;
  self->_name = v4;

  os_unfair_lock_unlock(&self->_internalLock);
}

- (NSString)displayName
{
  p_internalLock = &self->_internalLock;
  os_unfair_lock_lock(&self->_internalLock);
  v4 = self->_displayName;
  os_unfair_lock_unlock(p_internalLock);

  return v4;
}

- (void)setDisplayName:(id)a3
{
  v4 = (NSString *)a3;
  os_unfair_lock_lock(&self->_internalLock);
  displayName = self->_displayName;
  self->_displayName = v4;

  os_unfair_lock_unlock(&self->_internalLock);
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

- (NSString)attestationPreference
{
  p_internalLock = &self->_internalLock;
  os_unfair_lock_lock(&self->_internalLock);
  v4 = self->_attestationPreference;
  os_unfair_lock_unlock(p_internalLock);

  return v4;
}

- (void)setAttestationPreference:(id)a3
{
  v4 = (NSString *)a3;
  os_unfair_lock_lock(&self->_internalLock);
  attestationPreference = self->_attestationPreference;
  self->_attestationPreference = v4;

  os_unfair_lock_unlock(&self->_internalLock);
}

- (NSArray)credentialParameters
{
  p_internalLock = &self->_internalLock;
  os_unfair_lock_lock(&self->_internalLock);
  v4 = self->_credentialParameters;
  os_unfair_lock_unlock(p_internalLock);

  return v4;
}

- (void)setCredentialParameters:(NSArray *)credentialParameters
{
  v4 = credentialParameters;
  os_unfair_lock_lock(&self->_internalLock);
  v5 = self->_credentialParameters;
  self->_credentialParameters = v4;

  os_unfair_lock_unlock(&self->_internalLock);
}

- (NSArray)excludedCredentials
{
  p_internalLock = &self->_internalLock;
  os_unfair_lock_lock(&self->_internalLock);
  v4 = self->_excludedCredentials;
  os_unfair_lock_unlock(p_internalLock);

  return v4;
}

- (void)setExcludedCredentials:(NSArray *)excludedCredentials
{
  v4 = excludedCredentials;
  os_unfair_lock_lock(&self->_internalLock);
  v5 = self->_excludedCredentials;
  self->_excludedCredentials = v4;

  os_unfair_lock_unlock(&self->_internalLock);
}

- (ASAuthorizationPublicKeyCredentialResidentKeyPreference)residentKeyPreference
{
  p_internalLock = &self->_internalLock;
  os_unfair_lock_lock(&self->_internalLock);
  v4 = self->_residentKeyPreference;
  os_unfair_lock_unlock(p_internalLock);

  return v4;
}

- (void)setResidentKeyPreference:(ASAuthorizationPublicKeyCredentialResidentKeyPreference)residentKeyPreference
{
  v4 = residentKeyPreference;
  os_unfair_lock_lock(&self->_internalLock);
  v5 = self->_residentKeyPreference;
  self->_residentKeyPreference = v4;

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

- (NSString)relyingPartyIdentifier
{
  return self->_relyingPartyIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientData, 0);
  objc_storeStrong((id *)&self->_attestationPreference, 0);
  objc_storeStrong((id *)&self->_userVerificationPreference, 0);
  objc_storeStrong((id *)&self->_challenge, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_userID, 0);
  objc_storeStrong((id *)&self->_relyingPartyIdentifier, 0);
  objc_storeStrong((id *)&self->_residentKeyPreference, 0);
  objc_storeStrong((id *)&self->_excludedCredentials, 0);

  objc_storeStrong((id *)&self->_credentialParameters, 0);
}

@end
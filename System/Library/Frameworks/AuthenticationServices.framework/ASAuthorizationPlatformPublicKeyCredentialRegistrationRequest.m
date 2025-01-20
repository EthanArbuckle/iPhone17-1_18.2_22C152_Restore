@interface ASAuthorizationPlatformPublicKeyCredentialRegistrationRequest
+ (BOOL)supportsSecureCoding;
+ (id)emptyExtensions;
- (ASAuthorizationPlatformPublicKeyCredentialRegistrationRequest)initWithCoder:(id)a3;
- (ASAuthorizationPublicKeyCredentialLargeBlobRegistrationInput)__largeBlobSwift;
- (ASAuthorizationPublicKeyCredentialPRFRegistrationInput)__prfSwift;
- (ASCPublicKeyCredentialCreationOptions)coreCredentialCreationOptions;
- (ASCPublicKeyCredentialRegistrationExtensionInputs)extensions;
- (ASPublicKeyCredentialClientData)clientData;
- (BOOL)shouldShowHybridTransport;
- (BOOL)supportsStyle:(int64_t)a3;
- (NSArray)excludedCredentials;
- (NSData)challenge;
- (NSData)userID;
- (NSString)attestationPreference;
- (NSString)displayName;
- (NSString)name;
- (NSString)relyingPartyIdentifier;
- (NSString)userVerificationPreference;
- (id)_initWithProvider:(id)a3 relyingPartyIdentifier:(id)a4 challenge:(id)a5 name:(id)a6 userID:(id)a7 clientData:(id)a8 requestStyle:(int64_t)a9;
- (int64_t)requestStyle;
- (void)__setLargeBlobSwift:(id)a3;
- (void)__setPRFSwift:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAttestationPreference:(id)a3;
- (void)setChallenge:(id)a3;
- (void)setClientData:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setExcludedCredentials:(id)a3;
- (void)setName:(id)a3;
- (void)setRequestStyle:(int64_t)a3;
- (void)setShouldShowHybridTransport:(BOOL)a3;
- (void)setUserID:(id)a3;
- (void)setUserVerificationPreference:(id)a3;
@end

@implementation ASAuthorizationPlatformPublicKeyCredentialRegistrationRequest

- (id)_initWithProvider:(id)a3 relyingPartyIdentifier:(id)a4 challenge:(id)a5 name:(id)a6 userID:(id)a7 clientData:(id)a8 requestStyle:(int64_t)a9
{
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v34.receiver = self;
  v34.super_class = (Class)ASAuthorizationPlatformPublicKeyCredentialRegistrationRequest;
  v20 = [(ASAuthorizationRequest *)&v34 initWithProvider:a3];
  if (v20)
  {
    uint64_t v21 = [v15 copy];
    relyingPartyIdentifier = v20->_relyingPartyIdentifier;
    v20->_relyingPartyIdentifier = (NSString *)v21;

    uint64_t v23 = [v16 copy];
    challenge = v20->_challenge;
    v20->_challenge = (NSData *)v23;

    displayName = v20->_displayName;
    v20->_displayName = (NSString *)&stru_26CA92B70;

    uint64_t v26 = [v17 copy];
    name = v20->_name;
    v20->_name = (NSString *)v26;

    uint64_t v28 = [v18 copy];
    userID = v20->_userID;
    v20->_userID = (NSData *)v28;

    objc_storeStrong((id *)&v20->_userVerificationPreference, @"preferred");
    objc_storeStrong((id *)&v20->_attestationPreference, @"none");
    v20->_internalLock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v20->_clientData, a8);
    v20->_shouldShowHybridTransport = 1;
    uint64_t v30 = [(id)objc_opt_class() emptyExtensions];
    extensions = v20->_extensions;
    v20->_extensions = (ASCPublicKeyCredentialRegistrationExtensionInputs *)v30;

    v20->_requestStyle = a9;
    v32 = v20;
  }

  return v20;
}

- (ASCPublicKeyCredentialCreationOptions)coreCredentialCreationOptions
{
  v3 = [(ASAuthorizationPlatformPublicKeyCredentialRegistrationRequest *)self excludedCredentials];
  id v17 = objc_msgSend(v3, "safari_mapObjectsUsingBlock:", &__block_literal_global_16);

  id v14 = objc_alloc(MEMORY[0x263F29410]);
  id v16 = [(ASAuthorizationPlatformPublicKeyCredentialRegistrationRequest *)self challenge];
  id v18 = [(ASAuthorizationPlatformPublicKeyCredentialRegistrationRequest *)self clientData];
  v13 = [v18 jsonForOperationType:0];
  v4 = [(ASAuthorizationPlatformPublicKeyCredentialRegistrationRequest *)self relyingPartyIdentifier];
  v5 = [(ASAuthorizationPlatformPublicKeyCredentialRegistrationRequest *)self name];
  v6 = [(ASAuthorizationPlatformPublicKeyCredentialRegistrationRequest *)self userID];
  v7 = [(ASAuthorizationPlatformPublicKeyCredentialRegistrationRequest *)self displayName];
  v8 = [(ASAuthorizationPlatformPublicKeyCredentialRegistrationRequest *)self attestationPreference];
  v9 = [(ASAuthorizationPlatformPublicKeyCredentialRegistrationRequest *)self userVerificationPreference];
  extensions = self->_extensions;
  v11 = [(ASPublicKeyCredentialClientData *)self->_clientData origin];
  id v15 = (void *)[v14 initWithChallenge:v16 clientDataJSON:v13 clientDataHash:0 relyingPartyIdentifier:v4 userName:v5 userIdentifier:v6 userDisplayName:v7 supportedAlgorithmIdentifiers:&unk_26CAA5478 attestationPreference:v8 userVerificationPreference:v9 excludedCredentials:v17 extensions:extensions origin:v11];

  [v15 setShouldHideHybrid:!self->_shouldShowHybridTransport];

  return (ASCPublicKeyCredentialCreationOptions *)v15;
}

id __94__ASAuthorizationPlatformPublicKeyCredentialRegistrationRequest_coreCredentialCreationOptions__block_invoke(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x263F29418];
  id v3 = a2;
  id v4 = [v2 alloc];
  v5 = [v3 credentialID];

  v6 = (void *)[v4 initWithCredentialID:v5 transports:0];

  return v6;
}

- (BOOL)supportsStyle:(int64_t)a3
{
  return (a3 & 1) == 0 && (unint64_t)a3 < 3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASAuthorizationPlatformPublicKeyCredentialRegistrationRequest)initWithCoder:(id)a3
{
  id v3 = a3;
  id v4 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"relyingPartyIdentifier"];
  v5 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"userID"];
  v6 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"displayName"];
  v7 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
  v8 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"challenge"];
  v9 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"userVerificationPreference"];
  v10 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"attestationPreference"];
  uint64_t v11 = [v3 decodeIntegerForKey:@"requestStyle"];
  v12 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"clientData"];

  v13 = [[ASAuthorizationPlatformPublicKeyCredentialProvider alloc] initWithRelyingPartyIdentifier:v4];
  id v14 = [(ASAuthorizationPlatformPublicKeyCredentialRegistrationRequest *)self _initWithProvider:v13 relyingPartyIdentifier:v4 challenge:v8 name:v7 userID:v5 clientData:v12 requestStyle:v11];

  if (v14)
  {
    objc_storeStrong((id *)&v14->_displayName, v6);
    objc_storeStrong((id *)&v14->_userVerificationPreference, v9);
    objc_storeStrong((id *)&v14->_attestationPreference, v10);
    id v15 = v14;
  }

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  relyingPartyIdentifier = self->_relyingPartyIdentifier;
  id v5 = a3;
  [v5 encodeObject:relyingPartyIdentifier forKey:@"relyingPartyIdentifier"];
  [v5 encodeObject:self->_userID forKey:@"userID"];
  [v5 encodeObject:self->_displayName forKey:@"displayName"];
  [v5 encodeObject:self->_name forKey:@"name"];
  [v5 encodeObject:self->_challenge forKey:@"challenge"];
  [v5 encodeObject:self->_userVerificationPreference forKey:@"userVerificationPreference"];
  [v5 encodeObject:self->_attestationPreference forKey:@"attestationPreference"];
  [v5 encodeObject:self->_clientData forKey:@"clientData"];
  [v5 encodeInteger:self->_requestStyle forKey:@"requestStyle"];
}

- (NSData)userID
{
  p_internalLock = &self->_internalLock;
  os_unfair_lock_lock(&self->_internalLock);
  id v4 = self->_userID;
  os_unfair_lock_unlock(p_internalLock);

  return v4;
}

- (void)setUserID:(id)a3
{
  id v4 = (NSData *)a3;
  os_unfair_lock_lock(&self->_internalLock);
  userID = self->_userID;
  self->_userID = v4;

  os_unfair_lock_unlock(&self->_internalLock);
}

- (NSString)name
{
  p_internalLock = &self->_internalLock;
  os_unfair_lock_lock(&self->_internalLock);
  id v4 = self->_name;
  os_unfair_lock_unlock(p_internalLock);

  return v4;
}

- (void)setName:(id)a3
{
  id v4 = (NSString *)a3;
  os_unfair_lock_lock(&self->_internalLock);
  name = self->_name;
  self->_name = v4;

  os_unfair_lock_unlock(&self->_internalLock);
}

- (NSString)displayName
{
  p_internalLock = &self->_internalLock;
  os_unfair_lock_lock(&self->_internalLock);
  id v4 = self->_displayName;
  os_unfair_lock_unlock(p_internalLock);

  return v4;
}

- (void)setDisplayName:(id)a3
{
  id v4 = (NSString *)a3;
  os_unfair_lock_lock(&self->_internalLock);
  displayName = self->_displayName;
  self->_displayName = v4;

  os_unfair_lock_unlock(&self->_internalLock);
}

- (NSData)challenge
{
  p_internalLock = &self->_internalLock;
  os_unfair_lock_lock(&self->_internalLock);
  id v4 = self->_challenge;
  os_unfair_lock_unlock(p_internalLock);

  return v4;
}

- (void)setChallenge:(id)a3
{
  id v4 = (NSData *)a3;
  os_unfair_lock_lock(&self->_internalLock);
  challenge = self->_challenge;
  self->_challenge = v4;

  os_unfair_lock_unlock(&self->_internalLock);
}

- (NSString)userVerificationPreference
{
  p_internalLock = &self->_internalLock;
  os_unfair_lock_lock(&self->_internalLock);
  id v4 = self->_userVerificationPreference;
  os_unfair_lock_unlock(p_internalLock);

  return v4;
}

- (void)setUserVerificationPreference:(id)a3
{
  id v4 = (NSString *)a3;
  os_unfair_lock_lock(&self->_internalLock);
  userVerificationPreference = self->_userVerificationPreference;
  self->_userVerificationPreference = v4;

  os_unfair_lock_unlock(&self->_internalLock);
}

- (NSString)attestationPreference
{
  p_internalLock = &self->_internalLock;
  os_unfair_lock_lock(&self->_internalLock);
  id v4 = self->_attestationPreference;
  os_unfair_lock_unlock(p_internalLock);

  return v4;
}

- (void)setAttestationPreference:(id)a3
{
  id v4 = (NSString *)a3;
  os_unfair_lock_lock(&self->_internalLock);
  attestationPreference = self->_attestationPreference;
  self->_attestationPreference = v4;

  os_unfair_lock_unlock(&self->_internalLock);
}

- (ASPublicKeyCredentialClientData)clientData
{
  p_internalLock = &self->_internalLock;
  os_unfair_lock_lock(&self->_internalLock);
  id v4 = self->_clientData;
  os_unfair_lock_unlock(p_internalLock);

  return v4;
}

- (void)setClientData:(id)a3
{
  id v4 = (ASPublicKeyCredentialClientData *)a3;
  os_unfair_lock_lock(&self->_internalLock);
  clientData = self->_clientData;
  self->_clientData = v4;

  os_unfair_lock_unlock(&self->_internalLock);
}

- (NSArray)excludedCredentials
{
  p_internalLock = &self->_internalLock;
  os_unfair_lock_lock(&self->_internalLock);
  id v4 = self->_excludedCredentials;
  os_unfair_lock_unlock(p_internalLock);

  return v4;
}

- (void)setExcludedCredentials:(id)a3
{
  id v4 = (NSArray *)a3;
  os_unfair_lock_lock(&self->_internalLock);
  excludedCredentials = self->_excludedCredentials;
  self->_excludedCredentials = v4;

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

- (NSString)relyingPartyIdentifier
{
  return self->_relyingPartyIdentifier;
}

- (int64_t)requestStyle
{
  return self->_requestStyle;
}

- (void)setRequestStyle:(int64_t)a3
{
  self->_requestStyle = a3;
}

- (ASCPublicKeyCredentialRegistrationExtensionInputs)extensions
{
  return self->_extensions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensions, 0);
  objc_storeStrong((id *)&self->_excludedCredentials, 0);
  objc_storeStrong((id *)&self->_clientData, 0);
  objc_storeStrong((id *)&self->_attestationPreference, 0);
  objc_storeStrong((id *)&self->_userVerificationPreference, 0);
  objc_storeStrong((id *)&self->_challenge, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_userID, 0);

  objc_storeStrong((id *)&self->_relyingPartyIdentifier, 0);
}

- (ASAuthorizationPublicKeyCredentialLargeBlobRegistrationInput)__largeBlobSwift
{
  v2 = self;
  id v3 = ASAuthorizationPlatformPublicKeyCredentialRegistrationRequest.__largeBlobSwift.getter();

  return (ASAuthorizationPublicKeyCredentialLargeBlobRegistrationInput *)v3;
}

- (void)__setLargeBlobSwift:(id)a3
{
  id v5 = a3;
  v6 = self;
  ASAuthorizationPlatformPublicKeyCredentialRegistrationRequest.__largeBlobSwift.setter(a3);
}

- (ASAuthorizationPublicKeyCredentialPRFRegistrationInput)__prfSwift
{
  v2 = self;
  id v3 = ASAuthorizationPlatformPublicKeyCredentialRegistrationRequest.__prfSwift.getter();

  return (ASAuthorizationPublicKeyCredentialPRFRegistrationInput *)v3;
}

- (void)__setPRFSwift:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_267C10F30);
  MEMORY[0x270FA5388](v5 - 8);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = self;
  id v9 = a3;
  v10 = [(ASAuthorizationPlatformPublicKeyCredentialRegistrationRequest *)v8 extensions];
  if (v9)
  {
    id v11 = v9;
    sub_2191F2BAC();

    uint64_t v12 = sub_21922B248();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v7, 0, 1, v12);
  }
  else
  {
    uint64_t v13 = sub_21922B248();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v7, 1, 1, v13);
  }
  sub_21922B268();
}

+ (id)emptyExtensions
{
  id v2 = objc_msgSend(objc_allocWithZone((Class)sub_21922B2D8()), sel_init);

  return v2;
}

@end
@interface ASPasskeyCredentialRequest
+ (ASPasskeyCredentialRequest)requestWithCredentialIdentity:(ASPasskeyCredentialIdentity *)credentialIdentity clientDataHash:(NSData *)clientDataHash userVerificationPreference:(ASAuthorizationPublicKeyCredentialUserVerificationPreference)userVerificationPreference supportedAlgorithms:(NSArray *)supportedAlgorithms;
+ (BOOL)supportsSecureCoding;
- (ASAuthorizationPublicKeyCredentialUserVerificationPreference)userVerificationPreference;
- (ASCredentialIdentity)credentialIdentity;
- (ASPasskeyAssertionCredentialExtensionInput)assertionExtensionInput;
- (ASPasskeyCredentialRequest)initWithCoder:(id)a3;
- (ASPasskeyCredentialRequest)initWithCredentialIdentity:(ASPasskeyCredentialIdentity *)credentialIdentity clientDataHash:(NSData *)clientDataHash userVerificationPreference:(ASAuthorizationPublicKeyCredentialUserVerificationPreference)userVerificationPreference supportedAlgorithms:(NSArray *)supportedAlgorithms;
- (ASPasskeyCredentialRequest)initWithCredentialIdentity:(id)a3 clientDataHash:(id)a4 userVerificationPreference:(id)a5 supportedAlgorithms:(id)a6 assertionExtensionInput:(id)a7;
- (ASPasskeyCredentialRequest)initWithCredentialIdentity:(id)a3 clientDataHash:(id)a4 userVerificationPreference:(id)a5 supportedAlgorithms:(id)a6 registrationExtensionInput:(id)a7;
- (ASPasskeyCredentialRequest)initWithLoginChoice:(id)a3 assertionExtensionInput:(id)a4;
- (ASPasskeyCredentialRequest)initWithLoginChoice:(id)a3 registrationExtensionInput:(id)a4;
- (ASPasskeyRegistrationCredentialExtensionInput)registrationExtensionInput;
- (NSArray)excludedCredentials;
- (NSArray)supportedAlgorithms;
- (NSData)clientDataHash;
- (id)_initWithCredentialIdentity:(id)a3 clientDataHash:(id)a4 userVerificationPreference:(id)a5 supportedAlgorithms:(id)a6 credentialType:(int64_t)a7 excludedCredentials:(id)a8 registrationExtensionInput:(id)a9 assertionExtensionInput:(id)a10;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setUserVerificationPreference:(ASAuthorizationPublicKeyCredentialUserVerificationPreference)userVerificationPreference;
@end

@implementation ASPasskeyCredentialRequest

- (ASPasskeyCredentialRequest)initWithLoginChoice:(id)a3 registrationExtensionInput:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [v7 excludedCredentials];
  v9 = objc_msgSend(v8, "safari_mapObjectsUsingBlock:", &__block_literal_global_28);

  id v10 = [[ASPasskeyCredentialIdentity alloc] _initWithLoginChoice:v7];
  v11 = [v7 clientDataHash];
  v12 = [v7 userVerificationPreference];
  v13 = [v7 supportedAlgorithms];

  v14 = [(ASPasskeyCredentialRequest *)self _initWithCredentialIdentity:v10 clientDataHash:v11 userVerificationPreference:v12 supportedAlgorithms:v13 credentialType:2 excludedCredentials:v9 registrationExtensionInput:v6 assertionExtensionInput:0];
  return v14;
}

ASAuthorizationPlatformPublicKeyCredentialDescriptor *__77__ASPasskeyCredentialRequest_initWithLoginChoice_registrationExtensionInput___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [ASAuthorizationPlatformPublicKeyCredentialDescriptor alloc];
  v4 = [v2 credentialID];

  v5 = [(ASAuthorizationPlatformPublicKeyCredentialDescriptor *)v3 initWithCredentialID:v4];

  return v5;
}

- (ASPasskeyCredentialRequest)initWithLoginChoice:(id)a3 assertionExtensionInput:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [[ASPasskeyCredentialIdentity alloc] _initWithLoginChoice:v7];
  v9 = [v7 clientDataHash];
  id v10 = [v7 userVerificationPreference];
  v11 = [v7 supportedAlgorithms];

  v12 = [(ASPasskeyCredentialRequest *)self _initWithCredentialIdentity:v8 clientDataHash:v9 userVerificationPreference:v10 supportedAlgorithms:v11 credentialType:1 excludedCredentials:0 registrationExtensionInput:0 assertionExtensionInput:v6];
  return v12;
}

- (ASPasskeyCredentialRequest)initWithCredentialIdentity:(ASPasskeyCredentialIdentity *)credentialIdentity clientDataHash:(NSData *)clientDataHash userVerificationPreference:(ASAuthorizationPublicKeyCredentialUserVerificationPreference)userVerificationPreference supportedAlgorithms:(NSArray *)supportedAlgorithms
{
  return (ASPasskeyCredentialRequest *)[(ASPasskeyCredentialRequest *)self _initWithCredentialIdentity:credentialIdentity clientDataHash:clientDataHash userVerificationPreference:userVerificationPreference supportedAlgorithms:supportedAlgorithms credentialType:1 excludedCredentials:0 registrationExtensionInput:0 assertionExtensionInput:0];
}

- (ASPasskeyCredentialRequest)initWithCredentialIdentity:(id)a3 clientDataHash:(id)a4 userVerificationPreference:(id)a5 supportedAlgorithms:(id)a6 assertionExtensionInput:(id)a7
{
  return (ASPasskeyCredentialRequest *)[(ASPasskeyCredentialRequest *)self _initWithCredentialIdentity:a3 clientDataHash:a4 userVerificationPreference:a5 supportedAlgorithms:a6 credentialType:1 excludedCredentials:0 registrationExtensionInput:0 assertionExtensionInput:a7];
}

- (ASPasskeyCredentialRequest)initWithCredentialIdentity:(id)a3 clientDataHash:(id)a4 userVerificationPreference:(id)a5 supportedAlgorithms:(id)a6 registrationExtensionInput:(id)a7
{
  return (ASPasskeyCredentialRequest *)[(ASPasskeyCredentialRequest *)self _initWithCredentialIdentity:a3 clientDataHash:a4 userVerificationPreference:a5 supportedAlgorithms:a6 credentialType:2 excludedCredentials:0 registrationExtensionInput:a7 assertionExtensionInput:0];
}

- (id)_initWithCredentialIdentity:(id)a3 clientDataHash:(id)a4 userVerificationPreference:(id)a5 supportedAlgorithms:(id)a6 credentialType:(int64_t)a7 excludedCredentials:(id)a8 registrationExtensionInput:(id)a9 assertionExtensionInput:(id)a10
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a8;
  id v20 = a9;
  id v21 = a10;
  v36.receiver = self;
  v36.super_class = (Class)ASPasskeyCredentialRequest;
  v22 = [(ASPasskeyCredentialRequest *)&v36 init];
  if (v22)
  {
    uint64_t v23 = [v15 copy];
    credentialIdentity = v22->_credentialIdentity;
    v22->_credentialIdentity = (ASCredentialIdentity *)v23;

    uint64_t v25 = [v16 copy];
    clientDataHash = v22->_clientDataHash;
    v22->_clientDataHash = (NSData *)v25;

    uint64_t v27 = [v17 copy];
    userVerificationPreference = v22->_userVerificationPreference;
    v22->_userVerificationPreference = (NSString *)v27;

    uint64_t v29 = [v18 copy];
    supportedAlgorithms = v22->_supportedAlgorithms;
    v22->_supportedAlgorithms = (NSArray *)v29;

    v22->_credentialType = a7;
    uint64_t v31 = [v19 copy];
    excludedCredentials = v22->_excludedCredentials;
    v22->_excludedCredentials = (NSArray *)v31;

    objc_storeStrong((id *)&v22->_registrationExtensionInput, a9);
    objc_storeStrong((id *)&v22->_assertionExtensionInput, a10);
    v33 = v22;
  }

  return v22;
}

+ (ASPasskeyCredentialRequest)requestWithCredentialIdentity:(ASPasskeyCredentialIdentity *)credentialIdentity clientDataHash:(NSData *)clientDataHash userVerificationPreference:(ASAuthorizationPublicKeyCredentialUserVerificationPreference)userVerificationPreference supportedAlgorithms:(NSArray *)supportedAlgorithms
{
  id v10 = supportedAlgorithms;
  v11 = userVerificationPreference;
  v12 = clientDataHash;
  v13 = credentialIdentity;
  v14 = (void *)[objc_alloc((Class)a1) initWithCredentialIdentity:v13 clientDataHash:v12 userVerificationPreference:v11 supportedAlgorithms:v10];

  return (ASPasskeyCredentialRequest *)v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  credentialIdentity = self->_credentialIdentity;
  id v5 = a3;
  [v5 encodeObject:credentialIdentity forKey:@"credentialIdentity"];
  [v5 encodeObject:self->_clientDataHash forKey:@"clientDataHash"];
  [v5 encodeObject:self->_userVerificationPreference forKey:@"userVerificationPreference"];
  [v5 encodeObject:self->_supportedAlgorithms forKey:@"supportedAlgorithms"];
  [v5 encodeInteger:self->_credentialType forKey:@"credentialType"];
  [v5 encodeObject:self->_excludedCredentials forKey:@"excludedCredentials"];
  [v5 encodeObject:self->_registrationExtensionInput forKey:@"registrationExtensionInput"];
  [v5 encodeObject:self->_assertionExtensionInput forKey:@"assertionExtensionInput"];
}

- (ASPasskeyCredentialRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"credentialIdentity"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"clientDataHash"];
  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"userVerificationPreference"];
  id v8 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"supportedAlgorithms"];
  uint64_t v9 = [v4 decodeIntegerForKey:@"credentialType"];
  id v10 = (void *)MEMORY[0x263EFFA08];
  uint64_t v11 = objc_opt_class();
  v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
  v13 = [v4 decodeObjectOfClasses:v12 forKey:@"excludedCredentials"];

  v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"registrationExtensionInput"];
  id v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"assertionExtensionInput"];

  id v16 = [(ASPasskeyCredentialRequest *)self _initWithCredentialIdentity:v5 clientDataHash:v6 userVerificationPreference:v7 supportedAlgorithms:v8 credentialType:v9 excludedCredentials:v13 registrationExtensionInput:v14 assertionExtensionInput:v15];
  return v16;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return [+[ASPasskeyCredentialRequest allocWithZone:a3] _initWithCredentialIdentity:self->_credentialIdentity clientDataHash:self->_clientDataHash userVerificationPreference:self->_userVerificationPreference supportedAlgorithms:self->_supportedAlgorithms credentialType:self->_credentialType excludedCredentials:self->_excludedCredentials registrationExtensionInput:self->_registrationExtensionInput assertionExtensionInput:self->_assertionExtensionInput];
}

- (ASCredentialIdentity)credentialIdentity
{
  return self->_credentialIdentity;
}

- (int64_t)type
{
  return self->_credentialType;
}

- (NSData)clientDataHash
{
  return self->_clientDataHash;
}

- (ASAuthorizationPublicKeyCredentialUserVerificationPreference)userVerificationPreference
{
  return self->_userVerificationPreference;
}

- (void)setUserVerificationPreference:(ASAuthorizationPublicKeyCredentialUserVerificationPreference)userVerificationPreference
{
}

- (NSArray)supportedAlgorithms
{
  return self->_supportedAlgorithms;
}

- (NSArray)excludedCredentials
{
  return self->_excludedCredentials;
}

- (ASPasskeyAssertionCredentialExtensionInput)assertionExtensionInput
{
  return self->_assertionExtensionInput;
}

- (ASPasskeyRegistrationCredentialExtensionInput)registrationExtensionInput
{
  return self->_registrationExtensionInput;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registrationExtensionInput, 0);
  objc_storeStrong((id *)&self->_assertionExtensionInput, 0);
  objc_storeStrong((id *)&self->_excludedCredentials, 0);
  objc_storeStrong((id *)&self->_supportedAlgorithms, 0);
  objc_storeStrong((id *)&self->_userVerificationPreference, 0);
  objc_storeStrong((id *)&self->_clientDataHash, 0);

  objc_storeStrong((id *)&self->_credentialIdentity, 0);
}

@end
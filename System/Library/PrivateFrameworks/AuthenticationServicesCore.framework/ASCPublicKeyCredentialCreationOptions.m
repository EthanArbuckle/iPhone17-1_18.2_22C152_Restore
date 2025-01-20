@interface ASCPublicKeyCredentialCreationOptions
+ (BOOL)supportsSecureCoding;
- (ASCPublicKeyCredentialCreationOptions)initWithChallenge:(id)a3 clientDataJSON:(id)a4 clientDataHash:(id)a5 relyingPartyIdentifier:(id)a6 userName:(id)a7 userIdentifier:(id)a8 userDisplayName:(id)a9 supportedAlgorithmIdentifiers:(id)a10 attestationPreference:(id)a11 userVerificationPreference:(id)a12 excludedCredentials:(id)a13 extensions:(id)a14 origin:(id)a15;
- (ASCPublicKeyCredentialCreationOptions)initWithCoder:(id)a3;
- (BOOL)shouldHideHybrid;
- (BOOL)shouldRequireResidentKey;
- (NSArray)excludedCredentials;
- (NSArray)supportedAlgorithmIdentifiers;
- (NSData)challenge;
- (NSData)clientDataHash;
- (NSData)clientDataJSON;
- (NSData)extensionsCBORForWebKit;
- (NSData)userIdentifier;
- (NSNumber)timeout;
- (NSString)attestationPreference;
- (NSString)origin;
- (NSString)relyingPartyIdentifier;
- (NSString)userDisplayName;
- (NSString)userName;
- (NSString)userVerificationPreference;
- (_TtC26AuthenticationServicesCore49ASCPublicKeyCredentialRegistrationExtensionInputs)extensions;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)residentKeyPreference;
- (void)encodeWithCoder:(id)a3;
- (void)logRequest;
- (void)setAttestationPreference:(id)a3;
- (void)setChallenge:(id)a3;
- (void)setClientDataHash:(id)a3;
- (void)setClientDataJSON:(id)a3;
- (void)setExcludedCredentials:(id)a3;
- (void)setExtensions:(id)a3;
- (void)setOrigin:(id)a3;
- (void)setRelyingPartyIdentifier:(id)a3;
- (void)setResidentKeyPreference:(int64_t)a3;
- (void)setShouldHideHybrid:(BOOL)a3;
- (void)setShouldRequireResidentKey:(BOOL)a3;
- (void)setSupportedAlgorithmIdentifiers:(id)a3;
- (void)setTimeout:(id)a3;
- (void)setUserDisplayName:(id)a3;
- (void)setUserIdentifier:(id)a3;
- (void)setUserName:(id)a3;
- (void)setUserVerificationPreference:(id)a3;
@end

@implementation ASCPublicKeyCredentialCreationOptions

- (ASCPublicKeyCredentialCreationOptions)initWithChallenge:(id)a3 clientDataJSON:(id)a4 clientDataHash:(id)a5 relyingPartyIdentifier:(id)a6 userName:(id)a7 userIdentifier:(id)a8 userDisplayName:(id)a9 supportedAlgorithmIdentifiers:(id)a10 attestationPreference:(id)a11 userVerificationPreference:(id)a12 excludedCredentials:(id)a13 extensions:(id)a14 origin:(id)a15
{
  id v65 = a3;
  id v20 = a4;
  id v64 = a5;
  id v63 = a6;
  id v21 = a7;
  id v22 = a8;
  id v23 = a9;
  id v24 = a10;
  id v62 = a11;
  id v25 = a12;
  id v26 = a13;
  id v27 = a14;
  id v28 = a15;
  v66.receiver = self;
  v66.super_class = (Class)ASCPublicKeyCredentialCreationOptions;
  v29 = [(ASCPublicKeyCredentialCreationOptions *)&v66 init];
  if (v29)
  {
    uint64_t v30 = [v65 copy];
    challenge = v29->_challenge;
    v29->_challenge = (NSData *)v30;

    id v61 = v20;
    uint64_t v32 = [v20 copy];
    clientDataJSON = v29->_clientDataJSON;
    v29->_clientDataJSON = (NSData *)v32;

    uint64_t v34 = [v64 copy];
    clientDataHash = v29->_clientDataHash;
    v29->_clientDataHash = (NSData *)v34;

    uint64_t v36 = [v63 copy];
    relyingPartyIdentifier = v29->_relyingPartyIdentifier;
    v29->_relyingPartyIdentifier = (NSString *)v36;

    uint64_t v38 = [v21 copy];
    userName = v29->_userName;
    v29->_userName = (NSString *)v38;

    uint64_t v40 = [v22 copy];
    userIdentifier = v29->_userIdentifier;
    v29->_userIdentifier = (NSData *)v40;

    uint64_t v42 = [v23 copy];
    userDisplayName = v29->_userDisplayName;
    v29->_userDisplayName = (NSString *)v42;

    uint64_t v44 = [v24 copy];
    supportedAlgorithmIdentifiers = v29->_supportedAlgorithmIdentifiers;
    v29->_supportedAlgorithmIdentifiers = (NSArray *)v44;

    uint64_t v46 = [v62 copy];
    attestationPreference = v29->_attestationPreference;
    v29->_attestationPreference = (NSString *)v46;

    uint64_t v48 = [v25 copy];
    userVerificationPreference = v29->_userVerificationPreference;
    v29->_userVerificationPreference = (NSString *)v48;

    uint64_t v50 = [v26 copy];
    excludedCredentials = v29->_excludedCredentials;
    v29->_excludedCredentials = (NSArray *)v50;

    v52 = (void *)[v27 copy];
    v53 = v52;
    if (v52) {
      v54 = v52;
    }
    else {
      v54 = objc_alloc_init(_TtC26AuthenticationServicesCore49ASCPublicKeyCredentialRegistrationExtensionInputs);
    }
    extensions = v29->_extensions;
    v29->_extensions = v54;

    uint64_t v56 = [v28 copy];
    origin = v29->_origin;
    v29->_origin = (NSString *)v56;

    v58 = v29;
    id v20 = v61;
  }

  return v29;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  challenge = self->_challenge;
  id v5 = a3;
  [v5 encodeObject:challenge forKey:@"challenge"];
  [v5 encodeObject:self->_clientDataHash forKey:@"clientDataHash"];
  [v5 encodeObject:self->_clientDataJSON forKey:@"clientDataJSON"];
  [v5 encodeObject:self->_relyingPartyIdentifier forKey:@"relyingPartyIdentifier"];
  [v5 encodeObject:self->_userName forKey:@"userName"];
  [v5 encodeObject:self->_userIdentifier forKey:@"userIdentifier"];
  [v5 encodeObject:self->_userDisplayName forKey:@"userDisplayName"];
  [v5 encodeObject:self->_supportedAlgorithmIdentifiers forKey:@"supportedAlgorithmIdentifiers"];
  [v5 encodeObject:self->_userVerificationPreference forKey:@"userVerificationPreference"];
  [v5 encodeObject:self->_attestationPreference forKey:@"attestationPreference"];
  [v5 encodeObject:self->_timeout forKey:@"timeout"];
  [v5 encodeInteger:self->_residentKeyPreference forKey:@"residentKeyPreference"];
  [v5 encodeObject:self->_excludedCredentials forKey:@"excludedCredentials"];
  [v5 encodeObject:self->_extensions forKey:@"extensions"];
  [v5 encodeBool:self->_shouldHideHybrid forKey:@"shouldHideHybrid"];
  [v5 encodeObject:self->_origin forKey:@"origin"];
}

- (ASCPublicKeyCredentialCreationOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"challenge"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"clientDataHash"];
  uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"clientDataJSON"];
  v8 = (void *)v7;
  if (v5) {
    BOOL v9 = 0;
  }
  else {
    BOOL v9 = v6 == 0;
  }
  if (v9 && v7 == 0)
  {
    v35 = WBS_LOG_CHANNEL_PREFIXAuthorization();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
      -[ASCPublicKeyCredentialCreationOptions initWithCoder:](v35);
    }
    v12 = 0;
    goto LABEL_16;
  }
  v44.receiver = self;
  v44.super_class = (Class)ASCPublicKeyCredentialCreationOptions;
  v11 = [(ASCPublicKeyCredentialCreationOptions *)&v44 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_challenge, v5);
    objc_storeStrong((id *)&v12->_clientDataHash, v6);
    objc_storeStrong((id *)&v12->_clientDataJSON, v8);
    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"relyingPartyIdentifier"];
    relyingPartyIdentifier = v12->_relyingPartyIdentifier;
    v12->_relyingPartyIdentifier = (NSString *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"userName"];
    userName = v12->_userName;
    v12->_userName = (NSString *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"userIdentifier"];
    userIdentifier = v12->_userIdentifier;
    v12->_userIdentifier = (NSData *)v17;

    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"userDisplayName"];
    userDisplayName = v12->_userDisplayName;
    v12->_userDisplayName = (NSString *)v19;

    id v21 = (void *)MEMORY[0x263EFFA08];
    uint64_t v22 = objc_opt_class();
    id v23 = objc_msgSend(v21, "setWithObjects:", v22, objc_opt_class(), 0);
    uint64_t v24 = [v4 decodeObjectOfClasses:v23 forKey:@"supportedAlgorithmIdentifiers"];
    supportedAlgorithmIdentifiers = v12->_supportedAlgorithmIdentifiers;
    v12->_supportedAlgorithmIdentifiers = (NSArray *)v24;

    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"userVerificationPreference"];
    userVerificationPreference = v12->_userVerificationPreference;
    v12->_userVerificationPreference = (NSString *)v26;

    uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"attestationPreference"];
    attestationPreference = v12->_attestationPreference;
    v12->_attestationPreference = (NSString *)v28;

    uint64_t v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"timeout"];
    timeout = v12->_timeout;
    v12->_timeout = (NSNumber *)v30;

    uint64_t v32 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"extensions"];
    v33 = v32;
    if (v32) {
      uint64_t v34 = v32;
    }
    else {
      uint64_t v34 = objc_alloc_init(_TtC26AuthenticationServicesCore49ASCPublicKeyCredentialRegistrationExtensionInputs);
    }
    extensions = v12->_extensions;
    v12->_extensions = v34;

    v12->_residentKeyPreference = [v4 decodeIntegerForKey:@"residentKeyPreference"];
    v37 = (void *)MEMORY[0x263EFFA08];
    uint64_t v38 = objc_opt_class();
    v39 = objc_msgSend(v37, "setWithObjects:", v38, objc_opt_class(), 0);
    uint64_t v40 = [v4 decodeObjectOfClasses:v39 forKey:@"excludedCredentials"];
    excludedCredentials = v12->_excludedCredentials;
    v12->_excludedCredentials = (NSArray *)v40;

    v12->_shouldHideHybrid = [v4 decodeBoolForKey:@"shouldHideHybrid"];
    uint64_t v42 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"origin"];
    self = (ASCPublicKeyCredentialCreationOptions *)v12->_origin;
    v12->_origin = (NSString *)v42;
LABEL_16:
  }
  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[ASCPublicKeyCredentialCreationOptions allocWithZone:a3] init];
  if (v4)
  {
    uint64_t v5 = [(NSData *)self->_challenge copy];
    challenge = v4->_challenge;
    v4->_challenge = (NSData *)v5;

    uint64_t v7 = [(NSData *)self->_clientDataHash copy];
    clientDataHash = v4->_clientDataHash;
    v4->_clientDataHash = (NSData *)v7;

    uint64_t v9 = [(NSData *)self->_clientDataJSON copy];
    clientDataJSON = v4->_clientDataJSON;
    v4->_clientDataJSON = (NSData *)v9;

    uint64_t v11 = [(NSString *)self->_relyingPartyIdentifier copy];
    relyingPartyIdentifier = v4->_relyingPartyIdentifier;
    v4->_relyingPartyIdentifier = (NSString *)v11;

    uint64_t v13 = [(NSString *)self->_userName copy];
    userName = v4->_userName;
    v4->_userName = (NSString *)v13;

    uint64_t v15 = [(NSData *)self->_userIdentifier copy];
    userIdentifier = v4->_userIdentifier;
    v4->_userIdentifier = (NSData *)v15;

    uint64_t v17 = [(NSString *)self->_userDisplayName copy];
    userDisplayName = v4->_userDisplayName;
    v4->_userDisplayName = (NSString *)v17;

    uint64_t v19 = [(NSArray *)self->_supportedAlgorithmIdentifiers copy];
    supportedAlgorithmIdentifiers = v4->_supportedAlgorithmIdentifiers;
    v4->_supportedAlgorithmIdentifiers = (NSArray *)v19;

    uint64_t v21 = [(NSString *)self->_userVerificationPreference copy];
    userVerificationPreference = v4->_userVerificationPreference;
    v4->_userVerificationPreference = (NSString *)v21;

    uint64_t v23 = [(NSString *)self->_attestationPreference copy];
    attestationPreference = v4->_attestationPreference;
    v4->_attestationPreference = (NSString *)v23;

    uint64_t v25 = [(NSNumber *)self->_timeout copy];
    timeout = v4->_timeout;
    v4->_timeout = (NSNumber *)v25;

    uint64_t v27 = [(ASCPublicKeyCredentialRegistrationExtensionInputs *)self->_extensions copy];
    extensions = v4->_extensions;
    v4->_extensions = (_TtC26AuthenticationServicesCore49ASCPublicKeyCredentialRegistrationExtensionInputs *)v27;

    v4->_residentKeyPreference = self->_residentKeyPreference;
    uint64_t v29 = [(NSArray *)self->_excludedCredentials copy];
    excludedCredentials = v4->_excludedCredentials;
    v4->_excludedCredentials = (NSArray *)v29;

    v4->_shouldHideHybrid = self->_shouldHideHybrid;
    objc_storeStrong((id *)&v4->_origin, self->_origin);
    v31 = v4;
  }

  return v4;
}

- (BOOL)shouldRequireResidentKey
{
  return self->_residentKeyPreference == 3;
}

- (void)setShouldRequireResidentKey:(BOOL)a3
{
  int64_t v3 = 3;
  if (!a3) {
    int64_t v3 = 1;
  }
  self->_residentKeyPreference = v3;
}

- (void)logRequest
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  int64_t v3 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    relyingPartyIdentifier = self->_relyingPartyIdentifier;
    userName = self->_userName;
    userIdentifier = self->_userIdentifier;
    userDisplayName = self->_userDisplayName;
    supportedAlgorithmIdentifiers = self->_supportedAlgorithmIdentifiers;
    userVerificationPreference = self->_userVerificationPreference;
    attestationPreference = self->_attestationPreference;
    unint64_t residentKeyPreference = self->_residentKeyPreference;
    if (residentKeyPreference > 3) {
      uint64_t v11 = @"unknown";
    }
    else {
      uint64_t v11 = off_26439F440[residentKeyPreference];
    }
    excludedCredentials = self->_excludedCredentials;
    uint64_t v13 = v3;
    uint64_t v14 = [(NSArray *)excludedCredentials count];
    extensions = self->_extensions;
    *(_DWORD *)buf = 141561091;
    uint64_t v18 = 1752392040;
    __int16 v19 = 2113;
    id v20 = relyingPartyIdentifier;
    __int16 v21 = 2160;
    uint64_t v22 = 1752392040;
    __int16 v23 = 2113;
    uint64_t v24 = userName;
    __int16 v25 = 2114;
    uint64_t v26 = userIdentifier;
    __int16 v27 = 2160;
    uint64_t v28 = 1752392040;
    __int16 v29 = 2113;
    uint64_t v30 = userDisplayName;
    __int16 v31 = 2114;
    uint64_t v32 = supportedAlgorithmIdentifiers;
    __int16 v33 = 2114;
    uint64_t v34 = userVerificationPreference;
    __int16 v35 = 2114;
    uint64_t v36 = attestationPreference;
    __int16 v37 = 2114;
    uint64_t v38 = v11;
    __int16 v39 = 2050;
    uint64_t v40 = v14;
    __int16 v41 = 2114;
    uint64_t v42 = extensions;
    _os_log_impl(&dword_219326000, v13, OS_LOG_TYPE_INFO, "\tRP: %{private, mask.hash}@\n\tname: %{private, mask.hash}@\n\tuserHandle: %{public}@\n\tdisplayName: %{private, mask.hash}@\n\talgorithms: %{public}@\n\tuv: %{public}@\n\tattestation: %{public}@\n\trk: %{public}@\n\texcludeCredentialsCount: %{public}lu\n\textensions: %{public}@\n", buf, 0x84u);
  }
}

- (NSData)extensionsCBORForWebKit
{
  return (NSData *)[(ASCPublicKeyCredentialRegistrationExtensionInputs *)self->_extensions cborForWebKit];
}

- (NSData)challenge
{
  return self->_challenge;
}

- (void)setChallenge:(id)a3
{
}

- (NSData)clientDataHash
{
  return self->_clientDataHash;
}

- (void)setClientDataHash:(id)a3
{
}

- (NSData)clientDataJSON
{
  return self->_clientDataJSON;
}

- (void)setClientDataJSON:(id)a3
{
}

- (NSString)relyingPartyIdentifier
{
  return self->_relyingPartyIdentifier;
}

- (void)setRelyingPartyIdentifier:(id)a3
{
}

- (NSString)userName
{
  return self->_userName;
}

- (void)setUserName:(id)a3
{
}

- (NSData)userIdentifier
{
  return self->_userIdentifier;
}

- (void)setUserIdentifier:(id)a3
{
}

- (NSString)userDisplayName
{
  return self->_userDisplayName;
}

- (void)setUserDisplayName:(id)a3
{
}

- (NSArray)supportedAlgorithmIdentifiers
{
  return self->_supportedAlgorithmIdentifiers;
}

- (void)setSupportedAlgorithmIdentifiers:(id)a3
{
}

- (NSString)userVerificationPreference
{
  return self->_userVerificationPreference;
}

- (void)setUserVerificationPreference:(id)a3
{
}

- (NSString)attestationPreference
{
  return self->_attestationPreference;
}

- (void)setAttestationPreference:(id)a3
{
}

- (NSNumber)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(id)a3
{
}

- (_TtC26AuthenticationServicesCore49ASCPublicKeyCredentialRegistrationExtensionInputs)extensions
{
  return self->_extensions;
}

- (void)setExtensions:(id)a3
{
}

- (NSArray)excludedCredentials
{
  return self->_excludedCredentials;
}

- (void)setExcludedCredentials:(id)a3
{
}

- (int64_t)residentKeyPreference
{
  return self->_residentKeyPreference;
}

- (void)setResidentKeyPreference:(int64_t)a3
{
  self->_unint64_t residentKeyPreference = a3;
}

- (BOOL)shouldHideHybrid
{
  return self->_shouldHideHybrid;
}

- (void)setShouldHideHybrid:(BOOL)a3
{
  self->_shouldHideHybrid = a3;
}

- (NSString)origin
{
  return self->_origin;
}

- (void)setOrigin:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_origin, 0);
  objc_storeStrong((id *)&self->_excludedCredentials, 0);
  objc_storeStrong((id *)&self->_extensions, 0);
  objc_storeStrong((id *)&self->_timeout, 0);
  objc_storeStrong((id *)&self->_attestationPreference, 0);
  objc_storeStrong((id *)&self->_userVerificationPreference, 0);
  objc_storeStrong((id *)&self->_supportedAlgorithmIdentifiers, 0);
  objc_storeStrong((id *)&self->_userDisplayName, 0);
  objc_storeStrong((id *)&self->_userIdentifier, 0);
  objc_storeStrong((id *)&self->_userName, 0);
  objc_storeStrong((id *)&self->_relyingPartyIdentifier, 0);
  objc_storeStrong((id *)&self->_clientDataJSON, 0);
  objc_storeStrong((id *)&self->_clientDataHash, 0);

  objc_storeStrong((id *)&self->_challenge, 0);
}

- (void)initWithCoder:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_219326000, log, OS_LOG_TYPE_ERROR, "At least one of clientDataHash, challenge, or clientDataJSON must be non-nil", v1, 2u);
}

@end
@interface ASCPublicKeyCredentialAssertionOptions
+ (BOOL)supportsSecureCoding;
- (ASCPublicKeyCredentialAssertionOptions)initWithCoder:(id)a3;
- (ASCPublicKeyCredentialAssertionOptions)initWithKind:(unint64_t)a3 relyingPartyIdentifier:(id)a4 challenge:(id)a5 userVerificationPreference:(id)a6 allowedCredentials:(id)a7;
- (ASCPublicKeyCredentialAssertionOptions)initWithKind:(unint64_t)a3 relyingPartyIdentifier:(id)a4 clientDataHash:(id)a5 userVerificationPreference:(id)a6 allowedCredentials:(id)a7;
- (ASCPublicKeyCredentialAssertionOptions)initWithKind:(unint64_t)a3 relyingPartyIdentifier:(id)a4 clientDataJSON:(id)a5 userVerificationPreference:(id)a6 allowedCredentials:(id)a7 origin:(id)a8;
- (BOOL)shouldHideHybrid;
- (NSArray)allowedCredentials;
- (NSData)challenge;
- (NSData)clientDataHash;
- (NSData)clientDataJSON;
- (NSData)extensionsCBORForWebKit;
- (NSNumber)timeout;
- (NSString)appIDForSecurityKeys;
- (NSString)destinationSiteForCrossSiteAssertion;
- (NSString)origin;
- (NSString)relyingPartyIdentifier;
- (NSString)userVerificationPreference;
- (_TtC26AuthenticationServicesCore46ASCPublicKeyCredentialAssertionExtensionInputs)extensions;
- (id)_initWithKind:(unint64_t)a3 relyingPartyIdentifier:(id)a4 challenge:(id)a5 clientDataHash:(id)a6 clientDataJSON:(id)a7 userVerificationPreference:(id)a8 allowedCredentials:(id)a9 shouldHideHybrid:(BOOL)a10 extensions:(id)a11 origin:(id)a12 appIDForSecurityKeys:(id)a13;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)credentialKind;
- (void)encodeWithCoder:(id)a3;
- (void)logRequest;
- (void)setAllowedCredentials:(id)a3;
- (void)setAppIDForSecurityKeys:(id)a3;
- (void)setClientDataHash:(id)a3;
- (void)setClientDataJSON:(id)a3;
- (void)setDestinationSiteForCrossSiteAssertion:(id)a3;
- (void)setExtensions:(id)a3;
- (void)setOrigin:(id)a3;
- (void)setShouldHideHybrid:(BOOL)a3;
- (void)setTimeout:(id)a3;
- (void)setUserVerificationPreference:(id)a3;
@end

@implementation ASCPublicKeyCredentialAssertionOptions

- (id)_initWithKind:(unint64_t)a3 relyingPartyIdentifier:(id)a4 challenge:(id)a5 clientDataHash:(id)a6 clientDataJSON:(id)a7 userVerificationPreference:(id)a8 allowedCredentials:(id)a9 shouldHideHybrid:(BOOL)a10 extensions:(id)a11 origin:(id)a12 appIDForSecurityKeys:(id)a13
{
  id v18 = a4;
  id v19 = a5;
  id v47 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  id v23 = a11;
  id v24 = a12;
  id v25 = a13;
  v48.receiver = self;
  v48.super_class = (Class)ASCPublicKeyCredentialAssertionOptions;
  v26 = [(ASCPublicKeyCredentialAssertionOptions *)&v48 init];
  v27 = v26;
  if (v26)
  {
    v26->_credentialKind = a3;
    uint64_t v28 = [v18 copy];
    relyingPartyIdentifier = v27->_relyingPartyIdentifier;
    v27->_relyingPartyIdentifier = (NSString *)v28;

    uint64_t v30 = [v19 copy];
    challenge = v27->_challenge;
    v27->_challenge = (NSData *)v30;

    uint64_t v32 = [v21 copy];
    userVerificationPreference = v27->_userVerificationPreference;
    v27->_userVerificationPreference = (NSString *)v32;

    uint64_t v34 = [v22 copy];
    allowedCredentials = v27->_allowedCredentials;
    v27->_allowedCredentials = (NSArray *)v34;

    uint64_t v36 = [v47 copy];
    clientDataHash = v27->_clientDataHash;
    v27->_clientDataHash = (NSData *)v36;

    uint64_t v38 = [v20 copy];
    clientDataJSON = v27->_clientDataJSON;
    v27->_clientDataJSON = (NSData *)v38;

    v27->_shouldHideHybrid = a10;
    objc_storeStrong((id *)&v27->_extensions, a11);
    uint64_t v40 = [v24 copy];
    origin = v27->_origin;
    v27->_origin = (NSString *)v40;

    uint64_t v42 = [v25 copy];
    appIDForSecurityKeys = v27->_appIDForSecurityKeys;
    v27->_appIDForSecurityKeys = (NSString *)v42;

    v44 = v27;
  }

  return v27;
}

- (ASCPublicKeyCredentialAssertionOptions)initWithKind:(unint64_t)a3 relyingPartyIdentifier:(id)a4 challenge:(id)a5 userVerificationPreference:(id)a6 allowedCredentials:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  v16 = objc_alloc_init(_TtC26AuthenticationServicesCore46ASCPublicKeyCredentialAssertionExtensionInputs);
  LOBYTE(v19) = 0;
  v17 = [(ASCPublicKeyCredentialAssertionOptions *)self _initWithKind:a3 relyingPartyIdentifier:v15 challenge:v14 clientDataHash:0 clientDataJSON:0 userVerificationPreference:v13 allowedCredentials:v12 shouldHideHybrid:v19 extensions:v16 origin:0 appIDForSecurityKeys:0];

  return v17;
}

- (ASCPublicKeyCredentialAssertionOptions)initWithKind:(unint64_t)a3 relyingPartyIdentifier:(id)a4 clientDataHash:(id)a5 userVerificationPreference:(id)a6 allowedCredentials:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  v16 = objc_alloc_init(_TtC26AuthenticationServicesCore46ASCPublicKeyCredentialAssertionExtensionInputs);
  LOBYTE(v19) = 0;
  v17 = [(ASCPublicKeyCredentialAssertionOptions *)self _initWithKind:a3 relyingPartyIdentifier:v15 challenge:0 clientDataHash:v14 clientDataJSON:0 userVerificationPreference:v13 allowedCredentials:v12 shouldHideHybrid:v19 extensions:v16 origin:0 appIDForSecurityKeys:0];

  return v17;
}

- (ASCPublicKeyCredentialAssertionOptions)initWithKind:(unint64_t)a3 relyingPartyIdentifier:(id)a4 clientDataJSON:(id)a5 userVerificationPreference:(id)a6 allowedCredentials:(id)a7 origin:(id)a8
{
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  uint64_t v19 = objc_alloc_init(_TtC26AuthenticationServicesCore46ASCPublicKeyCredentialAssertionExtensionInputs);
  LOBYTE(v22) = 0;
  id v20 = [(ASCPublicKeyCredentialAssertionOptions *)self _initWithKind:a3 relyingPartyIdentifier:v18 challenge:0 clientDataHash:0 clientDataJSON:v17 userVerificationPreference:v16 allowedCredentials:v15 shouldHideHybrid:v22 extensions:v19 origin:v14 appIDForSecurityKeys:0];

  return v20;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASCPublicKeyCredentialAssertionOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"credentialKind"];
  if ((unint64_t)(v5 - 3) > 0xFFFFFFFFFFFFFFFDLL)
  {
    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"challenge"];
    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"clientDataHash"];
    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"clientDataJSON"];
    v35.receiver = self;
    v35.super_class = (Class)ASCPublicKeyCredentialAssertionOptions;
    v11 = [(ASCPublicKeyCredentialAssertionOptions *)&v35 init];
    self = v11;
    if (v11)
    {
      v11->_credentialKind = v5;
      id v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"relyingPartyIdentifier"];
      relyingPartyIdentifier = self->_relyingPartyIdentifier;
      self->_relyingPartyIdentifier = v12;

      objc_storeStrong((id *)&self->_challenge, v8);
      objc_storeStrong((id *)&self->_clientDataHash, v9);
      objc_storeStrong((id *)&self->_clientDataJSON, v10);
      id v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"userVerificationPreference"];
      userVerificationPreference = self->_userVerificationPreference;
      self->_userVerificationPreference = v14;

      id v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"timeout"];
      timeout = self->_timeout;
      self->_timeout = v16;

      id v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"extensions"];
      uint64_t v19 = v18;
      if (v18) {
        id v20 = v18;
      }
      else {
        id v20 = objc_alloc_init(_TtC26AuthenticationServicesCore46ASCPublicKeyCredentialAssertionExtensionInputs);
      }
      extensions = self->_extensions;
      self->_extensions = v20;

      uint64_t v22 = (void *)MEMORY[0x263EFFA08];
      uint64_t v23 = objc_opt_class();
      id v24 = objc_msgSend(v22, "setWithObjects:", v23, objc_opt_class(), 0);
      id v25 = [v4 decodeObjectOfClasses:v24 forKey:@"allowedCredentials"];
      allowedCredentials = self->_allowedCredentials;
      self->_allowedCredentials = v25;

      v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"destinationSiteForCrossSiteAssertion"];
      destinationSiteForCrossSiteAssertion = self->_destinationSiteForCrossSiteAssertion;
      self->_destinationSiteForCrossSiteAssertion = v27;

      self->_shouldHideHybrid = [v4 decodeBoolForKey:@"shouldHideHybrid"];
      v29 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"origin"];
      origin = self->_origin;
      self->_origin = v29;

      v31 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"appIDForSecurityKeys"];
      appIDForSecurityKeys = self->_appIDForSecurityKeys;
      self->_appIDForSecurityKeys = v31;

      v33 = self;
    }

    v7 = self;
  }
  else
  {
    v6 = WBS_LOG_CHANNEL_PREFIXAuthorization();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[ASCPublicKeyCredentialAssertionOptions initWithCoder:](v5, v6);
    }
    v7 = 0;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t credentialKind = self->_credentialKind;
  id v5 = a3;
  [v5 encodeInteger:credentialKind forKey:@"credentialKind"];
  [v5 encodeObject:self->_relyingPartyIdentifier forKey:@"relyingPartyIdentifier"];
  [v5 encodeObject:self->_challenge forKey:@"challenge"];
  [v5 encodeObject:self->_clientDataHash forKey:@"clientDataHash"];
  [v5 encodeObject:self->_clientDataJSON forKey:@"clientDataJSON"];
  [v5 encodeObject:self->_userVerificationPreference forKey:@"userVerificationPreference"];
  [v5 encodeObject:self->_timeout forKey:@"timeout"];
  [v5 encodeObject:self->_extensions forKey:@"extensions"];
  [v5 encodeObject:self->_allowedCredentials forKey:@"allowedCredentials"];
  [v5 encodeObject:self->_destinationSiteForCrossSiteAssertion forKey:@"destinationSiteForCrossSiteAssertion"];
  [v5 encodeBool:self->_shouldHideHybrid forKey:@"shouldHideHybrid"];
  [v5 encodeObject:self->_origin forKey:@"origin"];
  [v5 encodeObject:self->_appIDForSecurityKeys forKey:@"appIDForSecurityKeys"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  if (self->_clientDataHash)
  {
    id v4 = +[ASCPublicKeyCredentialAssertionOptions allocWithZone:a3];
    unint64_t credentialKind = self->_credentialKind;
    relyingPartyIdentifier = self->_relyingPartyIdentifier;
    clientDataHash = self->_clientDataHash;
    userVerificationPreference = self->_userVerificationPreference;
    origin = self->_origin;
    appIDForSecurityKeys = self->_appIDForSecurityKeys;
    extensions = self->_extensions;
    LOBYTE(v13) = self->_shouldHideHybrid;
    allowedCredentials = self->_allowedCredentials;
    challenge = 0;
  }
  else
  {
    if (self->_clientDataJSON)
    {
      id v4 = self;
      unint64_t credentialKind = v4->_credentialKind;
      relyingPartyIdentifier = v4->_relyingPartyIdentifier;
      clientDataJSON = self->_clientDataJSON;
      userVerificationPreference = v4->_userVerificationPreference;
      origin = v4->_origin;
      appIDForSecurityKeys = v4->_appIDForSecurityKeys;
      extensions = v4->_extensions;
      LOBYTE(v13) = v4->_shouldHideHybrid;
      allowedCredentials = v4->_allowedCredentials;
      challenge = 0;
      clientDataHash = 0;
      return [(ASCPublicKeyCredentialAssertionOptions *)v4 _initWithKind:credentialKind relyingPartyIdentifier:relyingPartyIdentifier challenge:challenge clientDataHash:clientDataHash clientDataJSON:clientDataJSON userVerificationPreference:userVerificationPreference allowedCredentials:allowedCredentials shouldHideHybrid:v13 extensions:extensions origin:origin appIDForSecurityKeys:appIDForSecurityKeys];
    }
    id v4 = +[ASCPublicKeyCredentialAssertionOptions allocWithZone:a3];
    unint64_t credentialKind = self->_credentialKind;
    relyingPartyIdentifier = self->_relyingPartyIdentifier;
    challenge = self->_challenge;
    userVerificationPreference = self->_userVerificationPreference;
    origin = self->_origin;
    appIDForSecurityKeys = self->_appIDForSecurityKeys;
    extensions = self->_extensions;
    LOBYTE(v13) = self->_shouldHideHybrid;
    allowedCredentials = self->_allowedCredentials;
    clientDataHash = 0;
  }
  clientDataJSON = 0;
  return [(ASCPublicKeyCredentialAssertionOptions *)v4 _initWithKind:credentialKind relyingPartyIdentifier:relyingPartyIdentifier challenge:challenge clientDataHash:clientDataHash clientDataJSON:clientDataJSON userVerificationPreference:userVerificationPreference allowedCredentials:allowedCredentials shouldHideHybrid:v13 extensions:extensions origin:origin appIDForSecurityKeys:appIDForSecurityKeys];
}

- (void)logRequest
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  if ([(NSArray *)self->_allowedCredentials count])
  {
    v3 = [(NSArray *)self->_allowedCredentials safari_mapAndFilterObjectsUsingBlock:&__block_literal_global_9];
  }
  else
  {
    v3 = 0;
  }
  id v4 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    relyingPartyIdentifier = self->_relyingPartyIdentifier;
    userVerificationPreference = self->_userVerificationPreference;
    allowedCredentials = self->_allowedCredentials;
    v8 = v4;
    uint64_t v9 = [(NSArray *)allowedCredentials count];
    extensions = self->_extensions;
    appIDForSecurityKeys = self->_appIDForSecurityKeys;
    int v12 = 141559555;
    uint64_t v13 = 1752392040;
    __int16 v14 = 2113;
    id v15 = relyingPartyIdentifier;
    __int16 v16 = 2114;
    id v17 = userVerificationPreference;
    __int16 v18 = 2050;
    uint64_t v19 = v9;
    __int16 v20 = 2114;
    id v21 = v3;
    __int16 v22 = 2114;
    uint64_t v23 = extensions;
    __int16 v24 = 2114;
    id v25 = appIDForSecurityKeys;
    _os_log_impl(&dword_219326000, v8, OS_LOG_TYPE_INFO, "\tRP: %{private, mask.hash}@\n\tuv: %{public}@\n\tallowedCredentialsCount: %{public}lu\n\ttransports: %{public}@\n\textensions: %{public}@\n\tappID: %{public}@\n", (uint8_t *)&v12, 0x48u);
  }
}

uint64_t __52__ASCPublicKeyCredentialAssertionOptions_logRequest__block_invoke(uint64_t a1, void *a2)
{
  return [a2 transports];
}

- (NSData)extensionsCBORForWebKit
{
  return (NSData *)[(ASCPublicKeyCredentialAssertionExtensionInputs *)self->_extensions cborForWebKit];
}

- (unint64_t)credentialKind
{
  return self->_credentialKind;
}

- (NSString)relyingPartyIdentifier
{
  return self->_relyingPartyIdentifier;
}

- (NSData)challenge
{
  return self->_challenge;
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

- (NSString)userVerificationPreference
{
  return self->_userVerificationPreference;
}

- (void)setUserVerificationPreference:(id)a3
{
}

- (NSNumber)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(id)a3
{
}

- (_TtC26AuthenticationServicesCore46ASCPublicKeyCredentialAssertionExtensionInputs)extensions
{
  return self->_extensions;
}

- (void)setExtensions:(id)a3
{
}

- (NSArray)allowedCredentials
{
  return self->_allowedCredentials;
}

- (void)setAllowedCredentials:(id)a3
{
}

- (NSString)destinationSiteForCrossSiteAssertion
{
  return self->_destinationSiteForCrossSiteAssertion;
}

- (void)setDestinationSiteForCrossSiteAssertion:(id)a3
{
}

- (BOOL)shouldHideHybrid
{
  return self->_shouldHideHybrid;
}

- (void)setShouldHideHybrid:(BOOL)a3
{
  self->_shouldHideHybrid = a3;
}

- (NSString)appIDForSecurityKeys
{
  return self->_appIDForSecurityKeys;
}

- (void)setAppIDForSecurityKeys:(id)a3
{
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
  objc_storeStrong((id *)&self->_appIDForSecurityKeys, 0);
  objc_storeStrong((id *)&self->_destinationSiteForCrossSiteAssertion, 0);
  objc_storeStrong((id *)&self->_allowedCredentials, 0);
  objc_storeStrong((id *)&self->_extensions, 0);
  objc_storeStrong((id *)&self->_timeout, 0);
  objc_storeStrong((id *)&self->_userVerificationPreference, 0);
  objc_storeStrong((id *)&self->_clientDataJSON, 0);
  objc_storeStrong((id *)&self->_clientDataHash, 0);
  objc_storeStrong((id *)&self->_challenge, 0);

  objc_storeStrong((id *)&self->_relyingPartyIdentifier, 0);
}

- (void)initWithCoder:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_219326000, a2, OS_LOG_TYPE_ERROR, "Found unexpected value for credential kind: %ld", (uint8_t *)&v2, 0xCu);
}

@end
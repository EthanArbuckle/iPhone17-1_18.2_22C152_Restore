@interface MediaService
+ (BOOL)supportsSecureCoding;
- (BOOL)authFatalError;
- (BOOL)isServiceRemovable;
- (BOOL)updateListeningHistoryEnabled;
- (CMSAuthenticationConfiguration)authConfiguration;
- (CMSAuthenticationCredential)authCredential;
- (MediaService)initWithCoder:(id)a3;
- (MediaService)initWithMediaServiceIdentifier:(id)a3;
- (MediaService)initWithServiceAccount:(id)a3 bundleIdentifier:(id)a4 error:(id *)a5;
- (NSArray)alternateBundleIdentifiers;
- (NSData)configAsset;
- (NSString)accountName;
- (NSString)bundleIdentifier;
- (NSString)configETag;
- (NSString)configPublicKey;
- (NSString)serviceName;
- (NSString)serviceType;
- (NSURL)configURL;
- (NSURL)iconImageURL;
- (NSURL)remoteIconURL;
- (NSUUID)serviceID;
- (id)_failWithError:(unint64_t)a3 errorString:(id)a4;
- (id)basicPropertiesDictionary;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)jsonDictionary;
- (void)encodeWithCoder:(id)a3;
- (void)setAccountName:(id)a3;
- (void)setAlternateBundleIdentifiers:(id)a3;
- (void)setAuthConfiguration:(id)a3;
- (void)setAuthCredential:(id)a3;
- (void)setAuthFatalError:(BOOL)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setConfigAsset:(id)a3;
- (void)setConfigETag:(id)a3;
- (void)setConfigPublicKey:(id)a3;
- (void)setConfigURL:(id)a3;
- (void)setIconImageURL:(id)a3;
- (void)setRemoteIconURL:(id)a3;
- (void)setServiceID:(id)a3;
- (void)setServiceName:(id)a3;
- (void)setServiceRemovable:(BOOL)a3;
- (void)setServiceType:(id)a3;
- (void)setUpdateListeningHistoryEnabled:(BOOL)a3;
@end

@implementation MediaService

- (MediaService)initWithServiceAccount:(id)a3 bundleIdentifier:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v38.receiver = self;
  v38.super_class = (Class)MediaService;
  v10 = [(MediaService *)&v38 init];
  v11 = v10;
  if (!v10)
  {
LABEL_37:
    v32 = v11;
    goto LABEL_38;
  }
  if (!v8)
  {
    if (a5)
    {
      v30 = @"setupContext";
      uint64_t v31 = 6;
      goto LABEL_30;
    }
LABEL_31:
    v32 = 0;
    goto LABEL_38;
  }
  objc_storeStrong((id *)&v10->_bundleIdentifier, a4);
  if (!v9)
  {
    if (a5)
    {
      v30 = @"bundleIdentifier";
      v10 = v11;
      uint64_t v31 = 8;
      goto LABEL_30;
    }
    goto LABEL_31;
  }
  uint64_t v12 = [v8 serviceName];
  serviceName = v11->_serviceName;
  v11->_serviceName = (NSString *)v12;

  if (!v12)
  {
    if (a5)
    {
      v30 = @"serviceName";
      v10 = v11;
      uint64_t v31 = 0;
      goto LABEL_30;
    }
    goto LABEL_31;
  }
  v14 = [v8 clientID];

  if (!v14)
  {
    if (a5)
    {
      v30 = @"clientID";
      v10 = v11;
      uint64_t v31 = 2;
      goto LABEL_30;
    }
    goto LABEL_31;
  }
  v15 = [v8 clientSecret];

  if (!v15)
  {
    if (a5)
    {
      v30 = @"clientSecret";
      v10 = v11;
      uint64_t v31 = 3;
      goto LABEL_30;
    }
    goto LABEL_31;
  }
  uint64_t v16 = [v8 accountName];
  accountName = v11->_accountName;
  v11->_accountName = (NSString *)v16;

  if (!v16)
  {
    if (a5)
    {
      v30 = @"accountName";
      v10 = v11;
      uint64_t v31 = 1;
      goto LABEL_30;
    }
    goto LABEL_31;
  }
  uint64_t v18 = [v8 configurationURL];
  configURL = v11->_configURL;
  v11->_configURL = (NSURL *)v18;

  if (!v18)
  {
    if (a5)
    {
      v30 = @"configURL";
      v10 = v11;
      uint64_t v31 = 5;
      goto LABEL_30;
    }
    goto LABEL_31;
  }
  v20 = [v8 authorizationTokenURL];

  if (!v20)
  {
    if (a5)
    {
      v30 = @"authorizationTokenURL";
      v10 = v11;
      uint64_t v31 = 7;
      goto LABEL_30;
    }
    goto LABEL_31;
  }
  [v8 authorizationScope];

  v21 = [v8 clientID];
  v22 = [v8 clientSecret];
  v23 = [v8 authorizationTokenURL];
  v24 = [v8 authorizationScope];
  uint64_t v25 = +[CMSAuthenticationConfiguration authConfigurationWithClientID:v21 clientSecret:v22 authorizationURL:v23 scope:v24];
  authConfiguration = v11->_authConfiguration;
  v11->_authConfiguration = (CMSAuthenticationConfiguration *)v25;

  v27 = [v8 serviceID];

  if (!v27)
  {
    NSLog(&cfstr_UsingRandomUui.isa);
    uint64_t v33 = [MEMORY[0x263F08C38] UUID];
    serviceID = v11->_serviceID;
    v11->_serviceID = (NSUUID *)v33;

    goto LABEL_33;
  }
  uint64_t v28 = [v8 serviceID];
  v29 = v11->_serviceID;
  v11->_serviceID = (NSUUID *)v28;

  if (v11->_serviceID)
  {
LABEL_33:
    BOOL v35 = +[MSAssistantPreferences isMultiUserEnabledForSiri];
    BOOL v36 = v35;
    if (v35) {
      NSLog(&cfstr_DeviceSiriLang.isa);
    }
    else {
      NSLog(&cfstr_DeviceSiriLang_0.isa);
    }
    v11->_updateListeningHistoryEnabled = v36;
    goto LABEL_37;
  }
  if (!a5) {
    goto LABEL_31;
  }
  NSLog(&cfstr_MalformedServi.isa);
  v30 = @"serviceIdentifier";
  v10 = v11;
  uint64_t v31 = 9;
LABEL_30:
  [(MediaService *)v10 _failWithError:v31 errorString:v30];
  v32 = 0;
  *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_38:

  return v32;
}

- (id)_failWithError:(unint64_t)a3 errorString:(id)a4
{
  v11[1] = *MEMORY[0x263EF8340];
  v5 = [NSString stringWithFormat:@"Failed to initialize MediaService object, Nil %@", a4];
  NSLog(&stru_26D97A818.isa, v5);
  v6 = (void *)MEMORY[0x263F087E8];
  v10 = @"MSUserInfoErrorStringKey";
  v11[0] = v5;
  v7 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];
  id v8 = [v6 errorWithDomain:@"com.apple.mediasetup.serviceonboarding.errorDomain" code:a3 userInfo:v7];

  return v8;
}

- (BOOL)isServiceRemovable
{
  return ![(NSString *)self->_bundleIdentifier isEqualToString:@"com.apple.Music"];
}

- (id)description
{
  v3 = [(MediaService *)self basicPropertiesDictionary];
  v4 = [MEMORY[0x263F089D8] stringWithFormat:@"<MediaService = %@", v3];
  v5 = v4;
  if (self->_authCredential) {
    [v4 appendFormat:@" AuthCredential = %@", self->_authCredential];
  }
  if (self->_authConfiguration) {
    [v5 appendFormat:@" AuthConfiguration = %@", self->_authConfiguration];
  }
  if (self->_alternateBundleIdentifiers) {
    [v5 appendFormat:@" AlternateBundleIdentifiers = %@>", self->_alternateBundleIdentifiers];
  }

  return v5;
}

- (id)jsonDictionary
{
  v3 = [(MediaService *)self basicPropertiesDictionary];
  v4 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithDictionary:v3];
  v5 = [(NSUUID *)self->_serviceID UUIDString];
  objc_msgSend(v4, "na_safeSetObject:forKey:", v5, @"serviceIdentifier");

  v6 = [(NSURL *)self->_configURL absoluteString];
  objc_msgSend(v4, "na_safeSetObject:forKey:", v6, @"configURL");

  v7 = [(NSURL *)self->_iconImageURL absoluteString];
  objc_msgSend(v4, "na_safeSetObject:forKey:", v7, @"iconImageURL");

  id v8 = [(NSURL *)self->_remoteIconURL absoluteString];
  objc_msgSend(v4, "na_safeSetObject:forKey:", v8, @"remoteIconImageURL");

  authCredential = self->_authCredential;
  if (authCredential)
  {
    v10 = [(CMSAuthenticationCredential *)authCredential jsonDictionary];
    objc_msgSend(v4, "na_safeSetObject:forKey:", v10, @"authCredential");
  }
  authConfiguration = self->_authConfiguration;
  if (authConfiguration)
  {
    uint64_t v12 = [(CMSAuthenticationConfiguration *)authConfiguration jsonDictionary];
    objc_msgSend(v4, "na_safeSetObject:forKey:", v12, @"authConfiguration");
  }
  alternateBundleIdentifiers = self->_alternateBundleIdentifiers;
  if (alternateBundleIdentifiers) {
    objc_msgSend(v4, "na_safeSetObject:forKey:", alternateBundleIdentifiers, @"alternateBundleIdentifiers");
  }

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MediaService)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MSServiceIdentifierEncodedKey"];
  serviceID = self->_serviceID;
  self->_serviceID = v5;

  v7 = [(NSUUID *)self->_serviceID UUIDString];
  id v8 = [(MediaService *)self initWithMediaServiceIdentifier:v7];

  if (v8)
  {
    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MSServiceNameEncodedKey"];
    serviceName = v8->_serviceName;
    v8->_serviceName = (NSString *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MSBundleIdentifierEncodedKey"];
    bundleIdentifier = v8->_bundleIdentifier;
    v8->_bundleIdentifier = (NSString *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MSAccountNameEncodedKey"];
    accountName = v8->_accountName;
    v8->_accountName = (NSString *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ServiceType"];
    serviceType = v8->_serviceType;
    v8->_serviceType = (NSString *)v15;

    v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MSServiceRemovableEncodedKey"];
    v8->_serviceRemovable = [v17 BOOLValue];

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MSUpdateListeningHistoryEncodedKey"];
    v8->_updateListeningHistoryEnabled = [v18 BOOLValue];

    v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MSAuthCredentialEncodedKey"];
    if (v19)
    {
      uint64_t v20 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v19 error:0];
      authCredential = v8->_authCredential;
      v8->_authCredential = (CMSAuthenticationCredential *)v20;
    }
    v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MSAuthConfigurationEncodedKey"];
    if (v22)
    {
      uint64_t v23 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v22 error:0];
      authConfiguration = v8->_authConfiguration;
      v8->_authConfiguration = (CMSAuthenticationConfiguration *)v23;
    }
    if (!v8->_authCredential)
    {
      uint64_t v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MSAuthCredentialObjectEncodedKey"];
      uint64_t v26 = [v25 credential];
      v27 = v8->_authCredential;
      v8->_authCredential = (CMSAuthenticationCredential *)v26;
    }
    if (!v8->_authConfiguration)
    {
      uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MSAuthConfigurationObjectEncodedKey"];
      uint64_t v29 = [v28 configuration];
      v30 = v8->_authConfiguration;
      v8->_authConfiguration = (CMSAuthenticationConfiguration *)v29;
    }
    uint64_t v31 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MSAuthFatalErrorEncodedKey"];
    v8->_authFatalError = [v31 BOOLValue];

    uint64_t v32 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MSConfigPublicKeyEncodedKey"];
    configPublicKey = v8->_configPublicKey;
    v8->_configPublicKey = (NSString *)v32;

    uint64_t v34 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MSConfigETagEncodedKey"];
    configETag = v8->_configETag;
    v8->_configETag = (NSString *)v34;

    uint64_t v36 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MSconfigURLEncodedKey"];
    configURL = v8->_configURL;
    v8->_configURL = (NSURL *)v36;

    uint64_t v38 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MSConfigAssetEncodedKey"];
    configAsset = v8->_configAsset;
    v8->_configAsset = (NSData *)v38;

    uint64_t v40 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MSiconImageURLEncodedKey"];
    iconImageURL = v8->_iconImageURL;
    v8->_iconImageURL = (NSURL *)v40;

    uint64_t v42 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MSRemoteIconURLEncodedKey"];
    remoteIconURL = v8->_remoteIconURL;
    v8->_remoteIconURL = (NSURL *)v42;

    v44 = (void *)MEMORY[0x263EFFA08];
    uint64_t v45 = objc_opt_class();
    v46 = objc_msgSend(v44, "setWithObjects:", v45, objc_opt_class(), 0);
    uint64_t v47 = [v4 decodeObjectOfClasses:v46 forKey:@"MSAlternateBundleIdentifiersEncodedKey"];
    alternateBundleIdentifiers = v8->_alternateBundleIdentifiers;
    v8->_alternateBundleIdentifiers = (NSArray *)v47;
  }
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  serviceName = self->_serviceName;
  id v5 = a3;
  [v5 encodeObject:serviceName forKey:@"MSServiceNameEncodedKey"];
  [v5 encodeObject:self->_bundleIdentifier forKey:@"MSBundleIdentifierEncodedKey"];
  [v5 encodeObject:self->_accountName forKey:@"MSAccountNameEncodedKey"];
  [v5 encodeObject:self->_serviceID forKey:@"MSServiceIdentifierEncodedKey"];
  [v5 encodeObject:self->_serviceType forKey:@"ServiceType"];
  v6 = [NSNumber numberWithBool:self->_serviceRemovable];
  [v5 encodeObject:v6 forKey:@"MSServiceRemovableEncodedKey"];

  v7 = [NSNumber numberWithBool:self->_updateListeningHistoryEnabled];
  [v5 encodeObject:v7 forKey:@"MSUpdateListeningHistoryEncodedKey"];

  id v10 = [MEMORY[0x263F08910] archivedDataWithRootObject:self->_authCredential requiringSecureCoding:1 error:0];
  [v5 encodeObject:v10 forKey:@"MSAuthCredentialEncodedKey"];
  id v8 = [MEMORY[0x263F08910] archivedDataWithRootObject:self->_authConfiguration requiringSecureCoding:1 error:0];
  [v5 encodeObject:v8 forKey:@"MSAuthConfigurationEncodedKey"];
  uint64_t v9 = [NSNumber numberWithBool:self->_authFatalError];
  [v5 encodeObject:v9 forKey:@"MSAuthFatalErrorEncodedKey"];

  [v5 encodeObject:self->_iconImageURL forKey:@"MSiconImageURLEncodedKey"];
  [v5 encodeObject:self->_remoteIconURL forKey:@"MSRemoteIconURLEncodedKey"];
  [v5 encodeObject:self->_configPublicKey forKey:@"MSConfigPublicKeyEncodedKey"];
  [v5 encodeObject:self->_configURL forKey:@"MSconfigURLEncodedKey"];
  [v5 encodeObject:self->_configETag forKey:@"MSConfigETagEncodedKey"];
  [v5 encodeObject:self->_configAsset forKey:@"MSConfigAssetEncodedKey"];
  [v5 encodeObject:self->_alternateBundleIdentifiers forKey:@"MSAlternateBundleIdentifiersEncodedKey"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)[(NSUUID *)self->_serviceID copyWithZone:a3];
  [v5 setServiceID:v6];

  v7 = (void *)[(NSString *)self->_accountName copyWithZone:a3];
  [v5 setAccountName:v7];

  id v8 = (void *)[(NSString *)self->_serviceName copyWithZone:a3];
  [v5 setServiceName:v8];

  uint64_t v9 = (void *)[(NSString *)self->_bundleIdentifier copyWithZone:a3];
  [v5 setBundleIdentifier:v9];

  id v10 = (void *)[(NSString *)self->_serviceType copyWithZone:a3];
  [v5 setServiceType:v10];

  id v11 = [(CMSAuthenticationCredential *)self->_authCredential copyWithZone:a3];
  [v5 setAuthCredential:v11];

  id v12 = [(CMSAuthenticationConfiguration *)self->_authConfiguration copyWithZone:a3];
  [v5 setAuthConfiguration:v12];

  objc_msgSend(v5, "setAuthFatalError:", -[MediaService authFatalError](self, "authFatalError"));
  objc_msgSend(v5, "setUpdateListeningHistoryEnabled:", -[MediaService updateListeningHistoryEnabled](self, "updateListeningHistoryEnabled"));
  objc_msgSend(v5, "setServiceRemovable:", -[MediaService isServiceRemovable](self, "isServiceRemovable"));
  uint64_t v13 = (void *)[(NSURL *)self->_remoteIconURL copyWithZone:a3];
  [v5 setRemoteIconURL:v13];

  v14 = (void *)[(NSURL *)self->_iconImageURL copyWithZone:a3];
  [v5 setIconImageURL:v14];

  uint64_t v15 = (void *)[(NSData *)self->_configAsset copyWithZone:a3];
  [v5 setConfigAsset:v15];

  uint64_t v16 = (void *)[(NSString *)self->_configPublicKey copyWithZone:a3];
  [v5 setConfigPublicKey:v16];

  v17 = (void *)[(NSString *)self->_configETag copyWithZone:a3];
  [v5 setConfigETag:v17];

  uint64_t v18 = (void *)[(NSURL *)self->_configURL copyWithZone:a3];
  [v5 setConfigURL:v18];

  v19 = (void *)[(NSArray *)self->_alternateBundleIdentifiers copyWithZone:a3];
  [v5 setAlternateBundleIdentifiers:v19];

  return v5;
}

- (MediaService)initWithMediaServiceIdentifier:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MediaService;
  id v5 = [(MediaService *)&v10 init];
  if (v5)
  {
    if (!v4)
    {
      NSLog(&cfstr_FailedToInitia_0.isa);
      id v8 = 0;
      goto LABEL_6;
    }
    uint64_t v6 = [objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v4];
    serviceID = v5->_serviceID;
    v5->_serviceID = (NSUUID *)v6;
  }
  id v8 = v5;
LABEL_6:

  return v8;
}

- (id)basicPropertiesDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  objc_msgSend(v3, "na_safeSetObject:forKey:", self->_serviceName, @"serviceName");
  objc_msgSend(v3, "na_safeSetObject:forKey:", self->_serviceID, @"serviceIdentifier");
  objc_msgSend(v3, "na_safeSetObject:forKey:", self->_accountName, @"accountName");
  objc_msgSend(v3, "na_safeSetObject:forKey:", self->_bundleIdentifier, @"bundleIdentifier");
  id v4 = [NSNumber numberWithBool:self->_updateListeningHistoryEnabled];
  objc_msgSend(v3, "na_safeSetObject:forKey:", v4, @"updateListeningHistoryEnabled");

  id v5 = objc_msgSend(NSNumber, "numberWithBool:", -[MediaService isServiceRemovable](self, "isServiceRemovable"));
  objc_msgSend(v3, "na_safeSetObject:forKey:", v5, @"serviceRemovable");

  uint64_t v6 = [NSNumber numberWithBool:self->_authFatalError];
  objc_msgSend(v3, "na_safeSetObject:forKey:", v6, @"authFatalError");

  objc_msgSend(v3, "na_safeSetObject:forKey:", self->_configURL, @"configURL");
  objc_msgSend(v3, "na_safeSetObject:forKey:", self->_iconImageURL, @"iconImageURL");
  objc_msgSend(v3, "na_safeSetObject:forKey:", self->_configPublicKey, @"configPublicKey");
  objc_msgSend(v3, "na_safeSetObject:forKey:", self->_remoteIconURL, @"remoteIconImageURL");
  objc_msgSend(v3, "na_safeSetObject:forKey:", self->_configETag, @"configETag");
  objc_msgSend(v3, "na_safeSetObject:forKey:", self->_serviceType, @"serviceType");

  return v3;
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void)setServiceName:(id)a3
{
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (NSString)accountName
{
  return self->_accountName;
}

- (void)setAccountName:(id)a3
{
}

- (void)setServiceRemovable:(BOOL)a3
{
  self->_serviceRemovable = a3;
}

- (BOOL)updateListeningHistoryEnabled
{
  return self->_updateListeningHistoryEnabled;
}

- (void)setUpdateListeningHistoryEnabled:(BOOL)a3
{
  self->_updateListeningHistoryEnabled = a3;
}

- (NSURL)iconImageURL
{
  return self->_iconImageURL;
}

- (void)setIconImageURL:(id)a3
{
}

- (BOOL)authFatalError
{
  return self->_authFatalError;
}

- (void)setAuthFatalError:(BOOL)a3
{
  self->_authFatalError = a3;
}

- (NSUUID)serviceID
{
  return self->_serviceID;
}

- (void)setServiceID:(id)a3
{
}

- (NSString)serviceType
{
  return self->_serviceType;
}

- (void)setServiceType:(id)a3
{
}

- (CMSAuthenticationConfiguration)authConfiguration
{
  return self->_authConfiguration;
}

- (void)setAuthConfiguration:(id)a3
{
}

- (CMSAuthenticationCredential)authCredential
{
  return self->_authCredential;
}

- (void)setAuthCredential:(id)a3
{
}

- (NSURL)configURL
{
  return self->_configURL;
}

- (void)setConfigURL:(id)a3
{
}

- (NSString)configPublicKey
{
  return self->_configPublicKey;
}

- (void)setConfigPublicKey:(id)a3
{
}

- (NSString)configETag
{
  return self->_configETag;
}

- (void)setConfigETag:(id)a3
{
}

- (NSData)configAsset
{
  return self->_configAsset;
}

- (void)setConfigAsset:(id)a3
{
}

- (NSURL)remoteIconURL
{
  return self->_remoteIconURL;
}

- (void)setRemoteIconURL:(id)a3
{
}

- (NSArray)alternateBundleIdentifiers
{
  return self->_alternateBundleIdentifiers;
}

- (void)setAlternateBundleIdentifiers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alternateBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_remoteIconURL, 0);
  objc_storeStrong((id *)&self->_configAsset, 0);
  objc_storeStrong((id *)&self->_configETag, 0);
  objc_storeStrong((id *)&self->_configPublicKey, 0);
  objc_storeStrong((id *)&self->_configURL, 0);
  objc_storeStrong((id *)&self->_authCredential, 0);
  objc_storeStrong((id *)&self->_authConfiguration, 0);
  objc_storeStrong((id *)&self->_serviceType, 0);
  objc_storeStrong((id *)&self->_serviceID, 0);
  objc_storeStrong((id *)&self->_iconImageURL, 0);
  objc_storeStrong((id *)&self->_accountName, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);

  objc_storeStrong((id *)&self->_serviceName, 0);
}

@end
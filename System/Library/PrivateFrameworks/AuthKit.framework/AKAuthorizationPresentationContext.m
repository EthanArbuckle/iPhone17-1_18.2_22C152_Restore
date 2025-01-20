@interface AKAuthorizationPresentationContext
+ (BOOL)supportsSecureCoding;
+ (id)presentationContextForCreateAppleIDFlow:(id)a3;
+ (id)presentationContextForRequestContext:(id)a3 client:(id)a4;
- (AKAuthorizationPresentationContext)initWithCoder:(id)a3;
- (AKAuthorizationPresentationContext)initWithContext:(id)a3 bundleID:(id)a4;
- (AKAuthorizationPresentationContext)initWithContext:(id)a3 client:(id)a4;
- (AKAuthorizationPresentationContext)initWithUsername:(id)a3;
- (AKCredentialRequestContext)credentialRequestContext;
- (AKUserInformation)userInformation;
- (BOOL)hasCreateAccountLoginChoice;
- (BOOL)hasSharedAccountLoginChoices;
- (BOOL)hasShownFirstTimeAlready;
- (BOOL)isSignInFlow;
- (BOOL)signInAllowsPCSKeyAccess;
- (NSArray)loginChoices;
- (NSData)clientAuditTokenData;
- (NSData)iconData;
- (NSNumber)cachedHasCreateAccountLoginChoice;
- (NSNumber)cachedHasSharedAccountLoginChoice;
- (NSNumber)iconScale;
- (NSString)bundleID;
- (NSString)iconName;
- (NSString)localizedAppName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)_addPresentationParametersForContext:(id)a3;
- (void)_addPresenterParameters;
- (void)encodeWithCoder:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setCachedHasCreateAccountLoginChoice:(id)a3;
- (void)setCachedHasSharedAccountLoginChoice:(id)a3;
- (void)setClientAuditTokenData:(id)a3;
- (void)setCredentialRequestContext:(id)a3;
- (void)setHasShownFirstTimeAlready:(BOOL)a3;
- (void)setLocalizedAppName:(id)a3;
- (void)setLoginChoices:(id)a3;
- (void)setSignInAllowsPCSKeyAccess:(BOOL)a3;
- (void)setUserInformation:(id)a3;
@end

@implementation AKAuthorizationPresentationContext

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AKAuthorizationPresentationContext)initWithContext:(id)a3 bundleID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AKAuthorizationPresentationContext;
  v9 = [(AKAuthorizationPresentationContext *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_bundleID, a4);
    objc_storeStrong((id *)&v10->_credentialRequestContext, a3);
    [(AKAuthorizationPresentationContext *)v10 _addPresenterParameters];
  }

  return v10;
}

- (AKAuthorizationPresentationContext)initWithContext:(id)a3 client:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 _upgradeContext];
  v9 = [v8 bundleID];

  if (v9)
  {
    v10 = [v7 _upgradeContext];
    uint64_t v11 = [v10 bundleID];
    objc_super v12 = [(AKAuthorizationPresentationContext *)self initWithContext:v7 bundleID:v11];

    id v7 = (id)v11;
  }
  else
  {
    v10 = [v6 bundleID];
    objc_super v12 = [(AKAuthorizationPresentationContext *)self initWithContext:v7 bundleID:v10];
  }

  uint64_t v13 = [v6 auditTokenData];

  clientAuditTokenData = v12->_clientAuditTokenData;
  v12->_clientAuditTokenData = (NSData *)v13;

  return v12;
}

- (AKAuthorizationPresentationContext)initWithUsername:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AKAuthorizationPresentationContext;
  v5 = [(AKAuthorizationPresentationContext *)&v9 init];
  if (v5)
  {
    id v6 = objc_alloc_init(AKUserInformation);
    userInformation = v5->_userInformation;
    v5->_userInformation = v6;

    [(AKUserInformation *)v5->_userInformation setAccountName:v4];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  bundleID = self->_bundleID;
  id v5 = a3;
  [v5 encodeObject:bundleID forKey:@"_bundleID"];
  [v5 encodeObject:self->_localizedAppName forKey:@"_localizedAppName"];
  [v5 encodeObject:self->_iconName forKey:@"_iconName"];
  [v5 encodeObject:self->_iconData forKey:@"_iconData"];
  [v5 encodeObject:self->_iconScale forKey:@"_iconScale"];
  [v5 encodeObject:self->_credentialRequestContext forKey:@"_credentialRequestContext"];
  [v5 encodeObject:self->_userInformation forKey:@"_userInformation"];
  [v5 encodeObject:self->_loginChoices forKey:@"_loginChoices"];
  [v5 encodeObject:self->_clientAuditTokenData forKey:@"_clientAuditTokenData"];
  [v5 encodeBool:self->_signInAllowsPCSKeyAccess forKey:@"_signInAllowsPCSKeyAccess"];
  [v5 encodeBool:self->_hasShownFirstTimeAlready forKey:@"_hasShownFirstTimeAlready"];
}

- (AKAuthorizationPresentationContext)initWithCoder:(id)a3
{
  v30[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)AKAuthorizationPresentationContext;
  id v5 = [(AKAuthorizationPresentationContext *)&v29 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_bundleID"];
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_localizedAppName"];
    localizedAppName = v5->_localizedAppName;
    v5->_localizedAppName = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_iconName"];
    iconName = v5->_iconName;
    v5->_iconName = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_iconData"];
    iconData = v5->_iconData;
    v5->_iconData = (NSData *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_iconScale"];
    iconScale = v5->_iconScale;
    v5->_iconScale = (NSNumber *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_credentialRequestContext"];
    credentialRequestContext = v5->_credentialRequestContext;
    v5->_credentialRequestContext = (AKCredentialRequestContext *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_userInformation"];
    userInformation = v5->_userInformation;
    v5->_userInformation = (AKUserInformation *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_clientAuditTokenData"];
    clientAuditTokenData = v5->_clientAuditTokenData;
    v5->_clientAuditTokenData = (NSData *)v20;

    v22 = (void *)MEMORY[0x1E4F1CA80];
    uint64_t v23 = objc_opt_class();
    v24 = objc_msgSend(v22, "setWithObjects:", v23, objc_opt_class(), 0);
    v30[0] = objc_opt_class();
    v30[1] = objc_opt_class();
    v30[2] = objc_opt_class();
    v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:3];
    [v24 addObjectsFromArray:v25];

    uint64_t v26 = [v4 decodeObjectOfClasses:v24 forKey:@"_loginChoices"];
    loginChoices = v5->_loginChoices;
    v5->_loginChoices = (NSArray *)v26;

    v5->_signInAllowsPCSKeyAccess = [v4 decodeBoolForKey:@"_signInAllowsPCSKeyAccess"];
    v5->_hasShownFirstTimeAlready = [v4 decodeBoolForKey:@"_hasShownFirstTimeAlready"];
  }
  return v5;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  uint64_t v6 = (void *)v5;
  if (self->_signInAllowsPCSKeyAccess) {
    id v7 = @"YES";
  }
  else {
    id v7 = @"NO";
  }
  uint64_t v8 = [v3 stringWithFormat:@"<%@: %p> - bundleID: %@, localizedAppName: %@, credentialRequestContext: %@, userInformation: %@, loginChoices: %@, signInAllowsPCSKeyAccess: %@", v5, self, *(_OWORD *)&self->_bundleID, *(_OWORD *)&self->_credentialRequestContext, self->_loginChoices, v7];

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(NSString *)self->_bundleID copy];
  uint64_t v6 = *(void **)(v4 + 16);
  *(void *)(v4 + 16) = v5;

  uint64_t v7 = [(NSString *)self->_localizedAppName copy];
  uint64_t v8 = *(void **)(v4 + 24);
  *(void *)(v4 + 24) = v7;

  uint64_t v9 = [(NSString *)self->_iconName copy];
  uint64_t v10 = *(void **)(v4 + 32);
  *(void *)(v4 + 32) = v9;

  uint64_t v11 = [(NSData *)self->_iconData copy];
  uint64_t v12 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v11;

  uint64_t v13 = [(NSNumber *)self->_iconScale copy];
  uint64_t v14 = *(void **)(v4 + 48);
  *(void *)(v4 + 48) = v13;

  uint64_t v15 = [(AKCredentialRequestContext *)self->_credentialRequestContext copy];
  uint64_t v16 = *(void **)(v4 + 56);
  *(void *)(v4 + 56) = v15;

  uint64_t v17 = [(AKUserInformation *)self->_userInformation copy];
  uint64_t v18 = *(void **)(v4 + 64);
  *(void *)(v4 + 64) = v17;

  uint64_t v19 = [(NSArray *)self->_loginChoices copy];
  uint64_t v20 = *(void **)(v4 + 72);
  *(void *)(v4 + 72) = v19;

  uint64_t v21 = [(NSData *)self->_clientAuditTokenData copy];
  v22 = *(void **)(v4 + 96);
  *(void *)(v4 + 96) = v21;

  *(unsigned char *)(v4 + 8) = self->_signInAllowsPCSKeyAccess;
  *(unsigned char *)(v4 + 9) = self->_hasShownFirstTimeAlready;
  return (id)v4;
}

+ (id)presentationContextForRequestContext:(id)a3 client:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = [v6 _upgradeContext];
  uint64_t v8 = [v7 bundleID];

  uint64_t v9 = [AKAuthorizationPresentationContext alloc];
  if (v8)
  {
    uint64_t v10 = [v6 _upgradeContext];
    uint64_t v11 = [v10 bundleID];
    uint64_t v12 = [(AKAuthorizationPresentationContext *)v9 initWithContext:v6 bundleID:v11];

    id v6 = (id)v11;
  }
  else
  {
    uint64_t v10 = [v5 bundleID];
    uint64_t v12 = [(AKAuthorizationPresentationContext *)v9 initWithContext:v6 bundleID:v10];
  }

  uint64_t v13 = [v5 auditTokenData];

  [(AKAuthorizationPresentationContext *)v12 setClientAuditTokenData:v13];

  return v12;
}

+ (id)presentationContextForCreateAppleIDFlow:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)[v3 copy];
  int v5 = [v3 hasSharedAccountLoginChoices];

  if (v5) {
    [v4 setLoginChoices:0];
  }
  id v6 = [v4 credentialRequestContext];
  [v6 setPasswordRequest:0];

  return v4;
}

- (BOOL)hasSharedAccountLoginChoices
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = +[AKFeatureManager sharedManager];
  int v4 = [v3 isSiwaCredentialSharingEnabled];

  if (!v4) {
    return 0;
  }
  if (!self->_cachedHasSharedAccountLoginChoice)
  {
    self->_cachedHasSharedAccountLoginChoice = (NSNumber *)MEMORY[0x1E4F1CC28];

    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    int v5 = self->_loginChoices;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            cachedHasSharedAccountLoginChoice = self->_cachedHasSharedAccountLoginChoice;
            self->_cachedHasSharedAccountLoginChoice = (NSNumber *)MEMORY[0x1E4F1CC38];

            goto LABEL_14;
          }
        }
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
LABEL_14:
  }
  return [(NSNumber *)self->_cachedHasSharedAccountLoginChoice BOOLValue];
}

- (BOOL)hasCreateAccountLoginChoice
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (!self->_cachedHasCreateAccountLoginChoice)
  {
    self->_cachedHasCreateAccountLoginChoice = (NSNumber *)MEMORY[0x1E4F1CC28];

    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v3 = self->_loginChoices;
    uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v11;
      while (2)
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v11 != v6) {
            objc_enumerationMutation(v3);
          }
          if (objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "shouldCreateAppleID", (void)v10))
          {
            cachedHasCreateAccountLoginChoice = self->_cachedHasCreateAccountLoginChoice;
            self->_cachedHasCreateAccountLoginChoice = (NSNumber *)MEMORY[0x1E4F1CC38];

            goto LABEL_12;
          }
        }
        uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  return [(NSNumber *)self->_cachedHasCreateAccountLoginChoice BOOLValue];
}

- (BOOL)isSignInFlow
{
  return [(AKCredentialRequestContext *)self->_credentialRequestContext _isFirstPartyLogin]
      || [(NSArray *)self->_loginChoices count] != 0;
}

- (void)_addPresenterParameters
{
  id v3 = [(AKCredentialRequestContext *)self->_credentialRequestContext _proxiedClientAppName];
  uint64_t v4 = [v3 length];

  if (v4)
  {
    credentialRequestContext = self->_credentialRequestContext;
    [(AKAuthorizationPresentationContext *)self _addPresentationParametersForContext:credentialRequestContext];
  }
  else
  {
    uint64_t v6 = +[AKConfiguration sharedConfiguration];
    uint64_t v7 = [v6 shouldAutocycleAppsInTiburon];

    if (v7 == 1)
    {
      if (_NextTestBundleIdentifier_onceToken != -1) {
        dispatch_once(&_NextTestBundleIdentifier_onceToken, &__block_literal_global_42);
      }
      unint64_t v8 = _NextTestBundleIdentifier_index++;
      objc_msgSend((id)_NextTestBundleIdentifier_testBundleIdentifiers, "objectAtIndexedSubscript:", v8 % objc_msgSend((id)_NextTestBundleIdentifier_testBundleIdentifiers, "count"));
      uint64_t v9 = (NSString *)objc_claimAutoreleasedReturnValue();
      bundleID = self->_bundleID;
      self->_bundleID = v9;
    }
    id v13 = [MEMORY[0x1E4F223B8] applicationProxyForIdentifier:self->_bundleID];
    if ([(NSString *)self->_bundleID isEqualToString:@"com.apple.aktool"])
    {
      localizedAppName = self->_localizedAppName;
      self->_localizedAppName = (NSString *)@"aktool";
    }
    else
    {
      long long v12 = [v13 localizedName];
      localizedAppName = self->_localizedAppName;
      self->_localizedAppName = v12;
    }
  }
}

- (void)_addPresentationParametersForContext:(id)a3
{
  uint64_t v4 = [a3 _iconName];
  iconName = self->_iconName;
  self->_iconName = v4;

  uint64_t v6 = [(AKCredentialRequestContext *)self->_credentialRequestContext _iconData];
  iconData = self->_iconData;
  self->_iconData = v6;

  unint64_t v8 = [(AKCredentialRequestContext *)self->_credentialRequestContext _iconScale];
  iconScale = self->_iconScale;
  self->_iconScale = v8;

  long long v10 = [(AKCredentialRequestContext *)self->_credentialRequestContext _proxiedClientAppName];
  uint64_t v11 = [v10 length];

  if (v11)
  {
    long long v12 = [(AKCredentialRequestContext *)self->_credentialRequestContext _proxiedClientAppName];
    localizedAppName = self->_localizedAppName;
    self->_localizedAppName = v12;
  }
  long long v14 = [(AKCredentialRequestContext *)self->_credentialRequestContext _proxiedClientBundleID];

  if (v14)
  {
    self->_bundleID = [(AKCredentialRequestContext *)self->_credentialRequestContext _proxiedClientBundleID];
    MEMORY[0x1F41817F8]();
  }
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (NSString)localizedAppName
{
  return self->_localizedAppName;
}

- (void)setLocalizedAppName:(id)a3
{
}

- (NSString)iconName
{
  return self->_iconName;
}

- (NSData)iconData
{
  return self->_iconData;
}

- (NSNumber)iconScale
{
  return self->_iconScale;
}

- (BOOL)signInAllowsPCSKeyAccess
{
  return self->_signInAllowsPCSKeyAccess;
}

- (void)setSignInAllowsPCSKeyAccess:(BOOL)a3
{
  self->_signInAllowsPCSKeyAccess = a3;
}

- (AKCredentialRequestContext)credentialRequestContext
{
  return self->_credentialRequestContext;
}

- (void)setCredentialRequestContext:(id)a3
{
}

- (AKUserInformation)userInformation
{
  return self->_userInformation;
}

- (void)setUserInformation:(id)a3
{
}

- (NSArray)loginChoices
{
  return self->_loginChoices;
}

- (void)setLoginChoices:(id)a3
{
}

- (BOOL)hasShownFirstTimeAlready
{
  return self->_hasShownFirstTimeAlready;
}

- (void)setHasShownFirstTimeAlready:(BOOL)a3
{
  self->_hasShownFirstTimeAlready = a3;
}

- (NSNumber)cachedHasSharedAccountLoginChoice
{
  return self->_cachedHasSharedAccountLoginChoice;
}

- (void)setCachedHasSharedAccountLoginChoice:(id)a3
{
}

- (NSNumber)cachedHasCreateAccountLoginChoice
{
  return self->_cachedHasCreateAccountLoginChoice;
}

- (void)setCachedHasCreateAccountLoginChoice:(id)a3
{
}

- (NSData)clientAuditTokenData
{
  return self->_clientAuditTokenData;
}

- (void)setClientAuditTokenData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientAuditTokenData, 0);
  objc_storeStrong((id *)&self->_cachedHasCreateAccountLoginChoice, 0);
  objc_storeStrong((id *)&self->_cachedHasSharedAccountLoginChoice, 0);
  objc_storeStrong((id *)&self->_loginChoices, 0);
  objc_storeStrong((id *)&self->_userInformation, 0);
  objc_storeStrong((id *)&self->_credentialRequestContext, 0);
  objc_storeStrong((id *)&self->_iconScale, 0);
  objc_storeStrong((id *)&self->_iconData, 0);
  objc_storeStrong((id *)&self->_iconName, 0);
  objc_storeStrong((id *)&self->_localizedAppName, 0);

  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end
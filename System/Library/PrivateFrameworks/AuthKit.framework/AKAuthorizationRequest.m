@interface AKAuthorizationRequest
+ (BOOL)supportsSecureCoding;
- (ACAccount)authkitAccount;
- (ACAccount)internalAuthKitAccount;
- (AKAuthorizationRequest)init;
- (AKAuthorizationRequest)initWithAltDSID:(id)a3;
- (AKAuthorizationRequest)initWithCoder:(id)a3;
- (AKSignInWithAppleAccount)_sharedAccount;
- (BOOL)_clientAuthenticatedExternallyWithPassword;
- (BOOL)_hasSharedAccounts;
- (BOOL)_isAuthorizingUsingSharedAccount;
- (BOOL)_isSilentAppTransfer;
- (BOOL)isEligibleForUpgradeFromPassword;
- (BOOL)shouldHideCreateOption;
- (NSArray)requestedScopes;
- (NSDictionary)appProvidedData;
- (NSString)_externalAuthToken;
- (NSString)clientID;
- (NSString)nonce;
- (NSString)state;
- (NSString)teamID;
- (id)_sanitizedCopy;
- (id)altDSID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)existingStatus;
- (void)encodeWithCoder:(id)a3;
- (void)setAppProvidedData:(id)a3;
- (void)setAuthkitAccount:(id)a3;
- (void)setClientID:(id)a3;
- (void)setExistingStatus:(int64_t)a3;
- (void)setIsEligibleForUpgradeFromPassword:(BOOL)a3;
- (void)setNonce:(id)a3;
- (void)setRequestedScopes:(id)a3;
- (void)setShouldHideCreateOption:(BOOL)a3;
- (void)setState:(id)a3;
- (void)setTeamID:(id)a3;
- (void)set_clientAuthenticatedExternallyWithPassword:(BOOL)a3;
- (void)set_externalAuthToken:(id)a3;
- (void)set_hasSharedAccounts:(BOOL)a3;
- (void)set_isAuthorizingUsingSharedAccount:(BOOL)a3;
- (void)set_isSilentAppTransfer:(BOOL)a3;
- (void)set_sharedAccount:(id)a3;
@end

@implementation AKAuthorizationRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AKAuthorizationRequest)init
{
  v6.receiver = self;
  v6.super_class = (Class)AKAuthorizationRequest;
  v2 = [(AKCredentialRequest *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    requestedScopes = v2->_requestedScopes;
    v2->_requestedScopes = (NSArray *)v3;
  }
  return v2;
}

- (AKAuthorizationRequest)initWithAltDSID:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AKAuthorizationRequest;
  objc_super v6 = [(AKCredentialRequest *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_altDSID, a3);
    uint64_t v8 = objc_opt_new();
    requestedScopes = v7->_requestedScopes;
    v7->_requestedScopes = (NSArray *)v8;
  }
  return v7;
}

- (AKAuthorizationRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)AKAuthorizationRequest;
  id v5 = [(AKCredentialRequest *)&v34 initWithCoder:v4];
  if (v5)
  {
    objc_super v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"AKRequestedScopes"];
    requestedScopes = v5->_requestedScopes;
    v5->_requestedScopes = (NSArray *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AKApplicationState"];
    state = v5->_state;
    v5->_state = (NSString *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AKApplicationNonce"];
    nonce = v5->_nonce;
    v5->_nonce = (NSString *)v13;

    v15 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v16 = objc_opt_class();
    uint64_t v17 = objc_opt_class();
    uint64_t v18 = objc_opt_class();
    uint64_t v19 = objc_opt_class();
    v20 = objc_msgSend(v15, "setWithObjects:", v16, v17, v18, v19, objc_opt_class(), 0);
    uint64_t v21 = [v4 decodeObjectOfClasses:v20 forKey:@"AKAppProvidedData"];
    appProvidedData = v5->_appProvidedData;
    v5->_appProvidedData = (NSDictionary *)v21;

    uint64_t v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AKClientID"];
    clientID = v5->_clientID;
    v5->_clientID = (NSString *)v23;

    uint64_t v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AKTeamID"];
    teamID = v5->_teamID;
    v5->_teamID = (NSString *)v25;

    v5->_existingStatus = [v4 decodeIntegerForKey:@"AKAuthorizationStatus"];
    uint64_t v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AKAuthorizationAccount"];
    authkitAccount = v5->_authkitAccount;
    v5->_authkitAccount = (ACAccount *)v27;

    v5->_isSilentAppTransfer = [v4 decodeBoolForKey:@"AKAuthorizationIsSilentAppTransfer"];
    v5->_isEligibleForUpgradeFromPassword = [v4 decodeBoolForKey:@"AKAuthorizationIsEligibleForUpgradeFromPassword"];
    v5->_clientAuthenticatedExternallyWithPassword = [v4 decodeBoolForKey:@"AKClientAuthenticatedExternallyWithPassword"];
    uint64_t v29 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AKExternalAuthToken"];
    externalAuthToken = v5->_externalAuthToken;
    v5->_externalAuthToken = (NSString *)v29;

    v5->_shouldHideCreateOption = [v4 decodeBoolForKey:@"AKAuthorizationShouldHideCreateOption"];
    v5->_hasSharedAccounts = [v4 decodeBoolForKey:@"AKHasSharedAccountsKey"];
    v5->_isAuthorizingUsingSharedAccount = [v4 decodeBoolForKey:@"AKSimulateAuthorizationForSharedAccountKey"];
    uint64_t v31 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AKSharedAccountKey"];
    sharedAccount = v5->_sharedAccount;
    v5->_sharedAccount = (AKSignInWithAppleAccount *)v31;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v21.receiver = self;
  v21.super_class = (Class)AKAuthorizationRequest;
  id v4 = [(AKCredentialRequest *)&v21 copyWithZone:a3];
  uint64_t v5 = [(ACAccount *)self->_authkitAccount copy];
  objc_super v6 = (void *)*((void *)v4 + 7);
  *((void *)v4 + 7) = v5;

  uint64_t v7 = [(NSArray *)self->_requestedScopes copy];
  uint64_t v8 = (void *)*((void *)v4 + 10);
  *((void *)v4 + 10) = v7;

  uint64_t v9 = [(NSString *)self->_state copy];
  v10 = (void *)*((void *)v4 + 12);
  *((void *)v4 + 12) = v9;

  uint64_t v11 = [(NSString *)self->_nonce copy];
  v12 = (void *)*((void *)v4 + 13);
  *((void *)v4 + 13) = v11;

  uint64_t v13 = [(NSDictionary *)self->_appProvidedData copy];
  v14 = (void *)*((void *)v4 + 11);
  *((void *)v4 + 11) = v13;

  uint64_t v15 = [(NSString *)self->_clientID copy];
  uint64_t v16 = (void *)*((void *)v4 + 14);
  *((void *)v4 + 14) = v15;

  uint64_t v17 = [(NSString *)self->_teamID copy];
  uint64_t v18 = (void *)*((void *)v4 + 15);
  *((void *)v4 + 15) = v17;

  *((void *)v4 + 16) = self->_existingStatus;
  *((unsigned char *)v4 + 40) = self->_isSilentAppTransfer;
  *((unsigned char *)v4 + 44) = self->_isEligibleForUpgradeFromPassword;
  *((unsigned char *)v4 + 41) = self->_clientAuthenticatedExternallyWithPassword;
  objc_storeStrong((id *)v4 + 8, self->_externalAuthToken);
  *((unsigned char *)v4 + 45) = self->_shouldHideCreateOption;
  *((unsigned char *)v4 + 42) = self->_hasSharedAccounts;
  objc_msgSend(v4, "set_isAuthorizingUsingSharedAccount:", self->_isAuthorizingUsingSharedAccount);
  uint64_t v19 = (void *)[(AKSignInWithAppleAccount *)self->_sharedAccount copy];
  objc_msgSend(v4, "set_sharedAccount:", v19);

  return v4;
}

- (id)_sanitizedCopy
{
  uint64_t v3 = objc_alloc_init(AKAuthorizationRequest);
  id v4 = [(AKCredentialRequest *)self userIdentifier];
  [(AKCredentialRequest *)v3 setUserIdentifier:v4];

  uint64_t v5 = [(AKCredentialRequest *)self requestIdentifier];
  [(AKCredentialRequest *)v3 setRequestIdentifier:v5];

  [(AKAuthorizationRequest *)v3 setRequestedScopes:self->_requestedScopes];
  [(AKAuthorizationRequest *)v3 setState:self->_state];
  [(AKAuthorizationRequest *)v3 setNonce:self->_nonce];
  [(AKAuthorizationRequest *)v3 set_clientAuthenticatedExternallyWithPassword:self->_clientAuthenticatedExternallyWithPassword];
  [(AKAuthorizationRequest *)v3 set_externalAuthToken:self->_externalAuthToken];
  [(AKAuthorizationRequest *)v3 set_hasSharedAccounts:self->_hasSharedAccounts];
  [(AKAuthorizationRequest *)v3 set_isAuthorizingUsingSharedAccount:self->_isAuthorizingUsingSharedAccount];
  [(AKAuthorizationRequest *)v3 set_sharedAccount:self->_sharedAccount];

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AKAuthorizationRequest;
  id v4 = a3;
  [(AKCredentialRequest *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_requestedScopes, @"AKRequestedScopes", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_state forKey:@"AKApplicationState"];
  [v4 encodeObject:self->_nonce forKey:@"AKApplicationNonce"];
  [v4 encodeObject:self->_appProvidedData forKey:@"AKAppProvidedData"];
  [v4 encodeObject:self->_clientID forKey:@"AKClientID"];
  [v4 encodeObject:self->_teamID forKey:@"AKTeamID"];
  [v4 encodeObject:self->_authkitAccount forKey:@"AKAuthorizationAccount"];
  [v4 encodeInteger:self->_existingStatus forKey:@"AKAuthorizationStatus"];
  [v4 encodeBool:self->_isSilentAppTransfer forKey:@"AKAuthorizationIsSilentAppTransfer"];
  [v4 encodeBool:self->_isEligibleForUpgradeFromPassword forKey:@"AKAuthorizationIsEligibleForUpgradeFromPassword"];
  [v4 encodeBool:self->_clientAuthenticatedExternallyWithPassword forKey:@"AKClientAuthenticatedExternallyWithPassword"];
  [v4 encodeObject:self->_externalAuthToken forKey:@"AKExternalAuthToken"];
  [v4 encodeBool:self->_shouldHideCreateOption forKey:@"AKAuthorizationShouldHideCreateOption"];
  [v4 encodeBool:self->_hasSharedAccounts forKey:@"AKHasSharedAccountsKey"];
  [v4 encodeBool:self->_isAuthorizingUsingSharedAccount forKey:@"AKSimulateAuthorizationForSharedAccountKey"];
  [v4 encodeObject:self->_sharedAccount forKey:@"AKSharedAccountKey"];
}

- (ACAccount)authkitAccount
{
  authkitAccount = self->_authkitAccount;
  if (!authkitAccount)
  {
    if (self->_altDSID)
    {
      id v4 = +[AKAccountManager sharedInstance];
      objc_super v5 = [v4 authKitAccountWithAltDSID:self->_altDSID error:0];
      objc_super v6 = self->_authkitAccount;
      self->_authkitAccount = v5;

      authkitAccount = self->_authkitAccount;
    }
    else
    {
      authkitAccount = 0;
    }
  }

  return authkitAccount;
}

- (ACAccount)internalAuthKitAccount
{
  return self->_authkitAccount;
}

- (id)altDSID
{
  altDSID = self->_altDSID;
  if (!altDSID)
  {
    if (self->_authkitAccount)
    {
      id v4 = +[AKAccountManager sharedInstance];
      objc_super v5 = [v4 altDSIDForAccount:self->_authkitAccount];
      objc_super v6 = self->_altDSID;
      self->_altDSID = v5;

      altDSID = self->_altDSID;
    }
    else
    {
      altDSID = 0;
    }
  }

  return altDSID;
}

- (id)description
{
  uint64_t v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  objc_super v5 = NSStringFromClass(v4);
  objc_super v6 = [(AKCredentialRequest *)self requestIdentifier];
  uint64_t v7 = [(AKCredentialRequest *)self transactionID];
  clientID = self->_clientID;
  teamID = self->_teamID;
  v10 = [(AKCredentialRequest *)self userIdentifier];
  uint64_t v11 = [(AKAuthorizationRequest *)self altDSID];
  v12 = @"YES";
  if (self->_shouldHideCreateOption) {
    uint64_t v13 = @"YES";
  }
  else {
    uint64_t v13 = @"NO";
  }
  if (self->_hasSharedAccounts) {
    v14 = @"YES";
  }
  else {
    v14 = @"NO";
  }
  if (!self->_isAuthorizingUsingSharedAccount) {
    v12 = @"NO";
  }
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p {\n\trequestIdentifier: %@,\n\ttransactionID: %@, \n\tclientID: %@,\n\tteamID: %@,\n\tuserIdentifier: %@,\n\taltDSID: %@,\n\tstate: %@,\n\tnonce: %@,\n\trequestedScopes: %@,\n\tappProvidedData: %@,\n\tisSilentAppTransfer: %d,\n\tisEligibleForUpgradeFromPassword: %d,\n\tshouldHideCreationOption: %@,\n\thasSharedAccounts: %@,\n\tsimulateAuthorizationForSharedAccount: %@,\n}>", v5, self, v6, v7, clientID, teamID, v10, v11, self->_state, self->_nonce, self->_requestedScopes, self->_appProvidedData, self->_isSilentAppTransfer, self->_isEligibleForUpgradeFromPassword, v13, v14,
  uint64_t v15 = v12);

  return v15;
}

- (void)setState:(id)a3
{
  id v4 = a3;
  if ((unint64_t)[v4 length] >= 0x101)
  {
    uint64_t v5 = [v4 substringToIndex:256];

    id v4 = (id)v5;
  }
  state = self->_state;
  self->_state = (NSString *)v4;
}

- (void)setNonce:(id)a3
{
  id v4 = a3;
  if ((unint64_t)[v4 length] >= 0x101)
  {
    uint64_t v5 = [v4 substringToIndex:256];

    id v4 = (id)v5;
  }
  nonce = self->_nonce;
  self->_nonce = (NSString *)v4;
}

- (void)setAuthkitAccount:(id)a3
{
}

- (BOOL)_isSilentAppTransfer
{
  return self->_isSilentAppTransfer;
}

- (void)set_isSilentAppTransfer:(BOOL)a3
{
  self->_isSilentAppTransfer = a3;
}

- (BOOL)_clientAuthenticatedExternallyWithPassword
{
  return self->_clientAuthenticatedExternallyWithPassword;
}

- (void)set_clientAuthenticatedExternallyWithPassword:(BOOL)a3
{
  self->_clientAuthenticatedExternallyWithPassword = a3;
}

- (NSString)_externalAuthToken
{
  return self->_externalAuthToken;
}

- (void)set_externalAuthToken:(id)a3
{
}

- (BOOL)_hasSharedAccounts
{
  return self->_hasSharedAccounts;
}

- (void)set_hasSharedAccounts:(BOOL)a3
{
  self->_hasSharedAccounts = a3;
}

- (BOOL)_isAuthorizingUsingSharedAccount
{
  return self->_isAuthorizingUsingSharedAccount;
}

- (void)set_isAuthorizingUsingSharedAccount:(BOOL)a3
{
  self->_isAuthorizingUsingSharedAccount = a3;
}

- (AKSignInWithAppleAccount)_sharedAccount
{
  return self->_sharedAccount;
}

- (void)set_sharedAccount:(id)a3
{
}

- (NSArray)requestedScopes
{
  return self->_requestedScopes;
}

- (void)setRequestedScopes:(id)a3
{
}

- (NSDictionary)appProvidedData
{
  return self->_appProvidedData;
}

- (void)setAppProvidedData:(id)a3
{
}

- (BOOL)isEligibleForUpgradeFromPassword
{
  return self->_isEligibleForUpgradeFromPassword;
}

- (void)setIsEligibleForUpgradeFromPassword:(BOOL)a3
{
  self->_isEligibleForUpgradeFromPassword = a3;
}

- (BOOL)shouldHideCreateOption
{
  return self->_shouldHideCreateOption;
}

- (void)setShouldHideCreateOption:(BOOL)a3
{
  self->_shouldHideCreateOption = a3;
}

- (NSString)state
{
  return self->_state;
}

- (NSString)nonce
{
  return self->_nonce;
}

- (NSString)clientID
{
  return self->_clientID;
}

- (void)setClientID:(id)a3
{
}

- (NSString)teamID
{
  return self->_teamID;
}

- (void)setTeamID:(id)a3
{
}

- (int64_t)existingStatus
{
  return self->_existingStatus;
}

- (void)setExistingStatus:(int64_t)a3
{
  self->_existingStatus = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_teamID, 0);
  objc_storeStrong((id *)&self->_clientID, 0);
  objc_storeStrong((id *)&self->_nonce, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_appProvidedData, 0);
  objc_storeStrong((id *)&self->_requestedScopes, 0);
  objc_storeStrong((id *)&self->_sharedAccount, 0);
  objc_storeStrong((id *)&self->_externalAuthToken, 0);
  objc_storeStrong((id *)&self->_authkitAccount, 0);

  objc_storeStrong((id *)&self->_altDSID, 0);
}

@end
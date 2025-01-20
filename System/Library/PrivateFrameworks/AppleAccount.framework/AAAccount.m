@interface AAAccount
+ (id)accountTypeString;
- (AAAccount)init;
- (AAAccount)initWithAccount:(id)a3;
- (AAAccount)initWithAccountIdentifier:(id)a3;
- (BOOL)isEnabledForDataclass:(id)a3;
- (BOOL)isProvisionedForDataclass:(id)a3;
- (BOOL)needsEmailConfiguration;
- (BOOL)needsRegistration;
- (BOOL)needsToVerifyTerms;
- (BOOL)presentQuotaDepletionAlertForDataclassIfNecessary:(id)a3;
- (BOOL)presentQuotaDepletionAlertForDataclassIfNecessary:(id)a3 withHandler:(id)a4;
- (BOOL)primaryAccount;
- (BOOL)primaryEmailVerified;
- (BOOL)serviceUnavailable;
- (BOOL)useCellularForDataclass:(id)a3;
- (NSArray)appleIDAliases;
- (NSArray)supportedDataclasses;
- (NSDictionary)accountFirstDisplayAlert;
- (NSDictionary)accountFooterButton;
- (NSDictionary)dataclassProperties;
- (NSDictionary)serviceUnavailableInfo;
- (NSSet)enabledDataclasses;
- (NSSet)provisionedDataclasses;
- (NSString)accountDescription;
- (NSString)accountFooterText;
- (NSString)authToken;
- (NSString)displayName;
- (NSString)firstName;
- (NSString)fmipToken;
- (NSString)identifier;
- (NSString)lastName;
- (NSString)password;
- (NSString)personID;
- (NSString)primaryEmail;
- (NSString)protocolVersion;
- (NSString)syncStoreIdentifier;
- (NSString)username;
- (id)_childAccounts;
- (id)_mailChildAccount;
- (id)account;
- (id)accountPropertyForKey:(id)a3;
- (id)propertiesForDataclass:(id)a3;
- (int)accountServiceType;
- (int)mobileMeAccountStatus;
- (void)authenticateWithHandler:(id)a3;
- (void)notifyUserOfQuotaDepletion;
- (void)presentQuotaDepletionAlertForDataclass:(id)a3;
- (void)presentQuotaDepletionAlertForDataclass:(id)a3 withHandler:(id)a4;
- (void)renewCredentialsForAppleIDWithHandler:(id)a3;
- (void)setAccountDescription:(id)a3;
- (void)setAccountProperty:(id)a3 forKey:(id)a4;
- (void)setAuthToken:(id)a3;
- (void)setEnabled:(BOOL)a3 forDataclass:(id)a4;
- (void)setFmipToken:(id)a3;
- (void)setNeedsToVerifyTerms:(BOOL)a3;
- (void)setPassword:(id)a3;
- (void)setPrimaryAccount:(BOOL)a3;
- (void)setUseCellular:(BOOL)a3 forDataclass:(id)a4;
- (void)setUsername:(id)a3;
- (void)updateAccountPropertiesWithHandler:(id)a3;
- (void)updateAccountWithProvisioningResponse:(id)a3;
@end

@implementation AAAccount

- (AAAccount)init
{
  v8.receiver = self;
  v8.super_class = (Class)AAAccount;
  v2 = [(AAAccount *)&v8 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F179C8] defaultStore];
    v4 = [v3 accountTypeWithAccountTypeIdentifier:*MEMORY[0x1E4F17750]];
    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F179B0]) initWithAccountType:v4];
    account = v2->_account;
    v2->_account = (ACAccount *)v5;
  }
  return v2;
}

- (AAAccount)initWithAccountIdentifier:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F179C8];
  id v5 = a3;
  v6 = [v4 defaultStore];
  v7 = [v6 accountWithIdentifier:v5];

  if (v7)
  {
    v11.receiver = self;
    v11.super_class = (Class)AAAccount;
    objc_super v8 = [(AAAccount *)&v11 init];
    v9 = v8;
    if (v8) {
      objc_storeStrong((id *)&v8->_account, v7);
    }
  }
  else
  {

    v9 = 0;
  }

  return v9;
}

- (AAAccount)initWithAccount:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AAAccount;
  v6 = [(AAAccount *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_account, a3);
  }

  return v7;
}

- (NSString)identifier
{
  return [(ACAccount *)self->_account identifier];
}

- (void)setUsername:(id)a3
{
}

- (id)account
{
  return self->_account;
}

+ (id)accountTypeString
{
  v2 = [MEMORY[0x1E4F179C8] defaultStore];
  v3 = [v2 accountTypeWithAccountTypeIdentifier:*MEMORY[0x1E4F17750]];
  v4 = [v3 accountTypeDescription];

  return v4;
}

- (NSString)displayName
{
  return [(ACAccount *)self->_account accountDescription];
}

- (NSString)username
{
  return [(ACAccount *)self->_account username];
}

- (NSString)accountDescription
{
  return [(ACAccount *)self->_account accountDescription];
}

- (void)setAccountDescription:(id)a3
{
}

- (int)accountServiceType
{
  return 2;
}

- (NSString)firstName
{
  return (NSString *)[(ACAccount *)self->_account accountPropertyForKey:@"firstName"];
}

- (NSString)lastName
{
  return (NSString *)[(ACAccount *)self->_account accountPropertyForKey:@"lastName"];
}

- (NSString)personID
{
  return (NSString *)[(ACAccount *)self->_account accountPropertyForKey:@"personID"];
}

- (NSString)primaryEmail
{
  return (NSString *)[(ACAccount *)self->_account accountPropertyForKey:@"primaryEmail"];
}

- (BOOL)primaryAccount
{
  v2 = [(ACAccount *)self->_account accountPropertyForKey:@"primaryAccount"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setPrimaryAccount:(BOOL)a3
{
  account = self->_account;
  id v4 = [NSNumber numberWithBool:a3];
  [(ACAccount *)account setAccountProperty:v4 forKey:@"primaryAccount"];
}

- (BOOL)primaryEmailVerified
{
  v2 = [(ACAccount *)self->_account accountPropertyForKey:@"primaryEmailVerified"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (NSDictionary)dataclassProperties
{
  return (NSDictionary *)[(ACAccount *)self->_account dataclassProperties];
}

- (NSSet)provisionedDataclasses
{
  return (NSSet *)[(ACAccount *)self->_account provisionedDataclasses];
}

- (NSSet)enabledDataclasses
{
  return (NSSet *)[(ACAccount *)self->_account enabledDataclasses];
}

- (void)setEnabled:(BOOL)a3 forDataclass:(id)a4
{
}

- (BOOL)isEnabledForDataclass:(id)a3
{
  return [(ACAccount *)self->_account isEnabledForDataclass:a3];
}

- (NSString)authToken
{
  v2 = [(ACAccount *)self->_account credential];
  char v3 = [v2 token];

  return (NSString *)v3;
}

- (void)setAuthToken:(id)a3
{
  id v9 = a3;
  id v4 = [(ACAccount *)self->_account credential];
  id v5 = [v4 token];
  char v6 = [v9 isEqualToString:v5];

  if ((v6 & 1) == 0)
  {
    v7 = [(ACAccount *)self->_account credential];

    if (v7)
    {
      id v8 = [(ACAccount *)self->_account credential];
      [v8 setToken:v9];
    }
    else
    {
      id v8 = objc_alloc_init(MEMORY[0x1E4F179C0]);
      [v8 setToken:v9];
      [(ACAccount *)self->_account setCredential:v8];
    }

    [(ACAccount *)self->_account setAuthenticated:1];
  }
}

- (NSString)password
{
  v2 = [(ACAccount *)self->_account credential];
  char v3 = [v2 password];

  return (NSString *)v3;
}

- (void)setPassword:(id)a3
{
  id v9 = a3;
  id v4 = [(ACAccount *)self->_account credential];
  id v5 = [v4 password];
  char v6 = [v9 isEqualToString:v5];

  if ((v6 & 1) == 0)
  {
    v7 = [(ACAccount *)self->_account credential];

    if (v7)
    {
      id v8 = [(ACAccount *)self->_account credential];
      [v8 setPassword:v9];
    }
    else
    {
      id v8 = (void *)[objc_alloc(MEMORY[0x1E4F179C0]) initWithPassword:v9];
      [(ACAccount *)self->_account setCredential:v8];
    }

    [(ACAccount *)self->_account setAuthenticated:1];
  }
}

- (NSString)accountFooterText
{
  v2 = [(AAAccount *)self propertiesForDataclass:@"com.apple.Dataclass.Account"];
  char v3 = v2;
  if (v2)
  {
    id v4 = [v2 objectForKey:@"accountFooterText"];
  }
  else
  {
    id v4 = 0;
  }

  return (NSString *)v4;
}

- (NSDictionary)accountFooterButton
{
  v2 = [(AAAccount *)self propertiesForDataclass:@"com.apple.Dataclass.Account"];
  char v3 = v2;
  if (v2)
  {
    id v4 = [v2 objectForKey:@"accountFooterButton"];
  }
  else
  {
    id v4 = 0;
  }

  return (NSDictionary *)v4;
}

- (NSDictionary)accountFirstDisplayAlert
{
  v2 = [(AAAccount *)self propertiesForDataclass:@"com.apple.Dataclass.Account"];
  char v3 = v2;
  if (v2)
  {
    id v4 = [v2 objectForKey:@"firstDisplayAlert"];
  }
  else
  {
    id v4 = 0;
  }

  return (NSDictionary *)v4;
}

- (BOOL)isProvisionedForDataclass:(id)a3
{
  account = self->_account;
  id v4 = a3;
  id v5 = [(ACAccount *)account provisionedDataclasses];
  char v6 = [v5 containsObject:v4];

  return v6;
}

- (id)propertiesForDataclass:(id)a3
{
  account = self->_account;
  id v4 = a3;
  id v5 = [(ACAccount *)account dataclassProperties];
  char v6 = [v5 objectForKey:v4];

  return v6;
}

- (void)updateAccountWithProvisioningResponse:(id)a3
{
  id v4 = a3;
  id v5 = [(AAAccount *)self account];
  objc_msgSend(v5, "aa_updateWithProvisioningResponse:", v4);
}

- (id)accountPropertyForKey:(id)a3
{
  return (id)[(ACAccount *)self->_account accountPropertyForKey:a3];
}

- (void)setAccountProperty:(id)a3 forKey:(id)a4
{
}

- (BOOL)serviceUnavailable
{
  v2 = [(AAAccount *)self propertiesForDataclass:@"com.apple.Dataclass.Account"];
  char v3 = v2;
  if (v2)
  {
    id v4 = [v2 objectForKey:@"notAvailable"];
    BOOL v5 = v4 != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (NSDictionary)serviceUnavailableInfo
{
  v2 = [(AAAccount *)self propertiesForDataclass:@"com.apple.Dataclass.Account"];
  char v3 = v2;
  if (v2)
  {
    id v4 = [v2 objectForKey:@"notAvailable"];
  }
  else
  {
    id v4 = 0;
  }

  return (NSDictionary *)v4;
}

- (BOOL)needsRegistration
{
  char v3 = [(AAAccount *)self dataclassProperties];
  if (v3)
  {
    id v4 = [(AAAccount *)self personID];
    BOOL v5 = v4 == 0;
  }
  else
  {
    BOOL v5 = 1;
  }

  return v5;
}

- (BOOL)useCellularForDataclass:(id)a3
{
  account = self->_account;
  id v4 = a3;
  BOOL v5 = [(ACAccount *)account accountPropertyForKey:@"dataclassesDisabledForCellular"];
  char v6 = [v5 containsObject:v4];

  return v6 ^ 1;
}

- (void)setUseCellular:(BOOL)a3 forDataclass:(id)a4
{
  id v8 = a4;
  char v6 = [(ACAccount *)self->_account accountPropertyForKey:@"dataclassesDisabledForCellular"];
  id v7 = (id)[v6 mutableCopy];

  if (!v7) {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  if (a3) {
    [v7 removeObject:v8];
  }
  else {
    [v7 addObject:v8];
  }
  [(AAAccount *)self setAccountProperty:v7 forKey:@"dataclassesDisabledForCellular"];
}

- (id)_mailChildAccount
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if ([(AAAccount *)self isProvisionedForDataclass:*MEMORY[0x1E4F17AD8]])
  {
    [(ACAccount *)self->_account childAccounts];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v15;
      uint64_t v7 = *MEMORY[0x1E4F177F0];
      while (2)
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v15 != v6) {
            objc_enumerationMutation(v3);
          }
          id v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          v10 = objc_msgSend(v9, "accountType", (void)v14);
          objc_super v11 = [v10 identifier];

          if ([v11 isEqualToString:v7])
          {
            id v12 = v9;

            goto LABEL_13;
          }
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }
    id v12 = 0;
LABEL_13:
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (BOOL)needsEmailConfiguration
{
  uint64_t v3 = *MEMORY[0x1E4F17AD8];
  if (![(AAAccount *)self isProvisionedForDataclass:*MEMORY[0x1E4F17AD8]]) {
    return 0;
  }
  uint64_t v4 = [(AAAccount *)self _mailChildAccount];

  if (v4) {
    return 0;
  }
  uint64_t v7 = [(AAAccount *)self propertiesForDataclass:v3];
  id v8 = v7;
  if (v7)
  {
    id v9 = [v7 allKeys];
    BOOL v5 = [v9 count] == 0;
  }
  else
  {
    BOOL v5 = 1;
  }

  return v5;
}

- (int)mobileMeAccountStatus
{
  return 2;
}

- (NSString)syncStoreIdentifier
{
  return 0;
}

- (id)_childAccounts
{
  return (id)[(ACAccount *)self->_account childAccounts];
}

- (NSArray)supportedDataclasses
{
  v2 = [(AAAccount *)self account];
  uint64_t v3 = [v2 accountType];
  uint64_t v4 = [v3 supportedDataclasses];
  BOOL v5 = [v4 allObjects];

  return (NSArray *)v5;
}

- (void)notifyUserOfQuotaDepletion
{
  v2 = objc_alloc_init(AAQuotaDepletionAlert);
  [(AAQuotaDepletionAlert *)v2 showWithHandler:0];
}

- (void)presentQuotaDepletionAlertForDataclass:(id)a3 withHandler:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[AAQuotaDepletionAlert alloc] initForDataclass:v6];

  [v7 showWithHandler:v5];
}

- (void)presentQuotaDepletionAlertForDataclass:(id)a3
{
}

- (BOOL)presentQuotaDepletionAlertForDataclassIfNecessary:(id)a3 withHandler:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[AAQuotaDepletionAlert alloc] initForDataclass:v6];

  LOBYTE(v6) = [v7 showIfNecessaryWithHandler:v5];
  return (char)v6;
}

- (BOOL)presentQuotaDepletionAlertForDataclassIfNecessary:(id)a3
{
  return [(AAAccount *)self presentQuotaDepletionAlertForDataclassIfNecessary:a3 withHandler:0];
}

- (void)updateAccountPropertiesWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__AAAccount_updateAccountPropertiesWithHandler___block_invoke;
  v7[3] = &unk_1E5A48470;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __48__AAAccount_updateAccountPropertiesWithHandler___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) account];
  v2 = [v4 accountStore];
  uint64_t v3 = [*(id *)(a1 + 32) account];
  objc_msgSend(v2, "aa_updatePropertiesForAppleAccount:completion:", v3, *(void *)(a1 + 40));
}

- (void)authenticateWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(AAAccount *)self account];
  id v6 = [v5 accountStore];
  id v7 = [(AAAccount *)self account];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __37__AAAccount_authenticateWithHandler___block_invoke;
  v9[3] = &unk_1E5A4AA70;
  id v10 = v4;
  id v8 = v4;
  [v6 verifyCredentialsForAccount:v7 saveWhenAuthorized:0 withHandler:v9];
}

uint64_t __37__AAAccount_authenticateWithHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)renewCredentialsForAppleIDWithHandler:(id)a3
{
  id v4 = a3;
  id v7 = [(AAAccount *)self account];
  id v5 = [v7 accountStore];
  id v6 = [(AAAccount *)self account];
  [v5 renewCredentialsForAccount:v6 force:0 reason:0 completion:v4];
}

- (BOOL)needsToVerifyTerms
{
  v2 = [(AAAccount *)self accountPropertyForKey:@"needsToVerifyTerms"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setNeedsToVerifyTerms:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AAAccount *)self setAccountProperty:v4 forKey:@"needsToVerifyTerms"];
}

- (NSString)fmipToken
{
  return self->_fmipToken;
}

- (void)setFmipToken:(id)a3
{
}

- (NSArray)appleIDAliases
{
  return self->_appleIDAliases;
}

- (NSString)protocolVersion
{
  return self->_protocolVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_protocolVersion, 0);
  objc_storeStrong((id *)&self->_appleIDAliases, 0);
  objc_storeStrong((id *)&self->_fmipToken, 0);

  objc_storeStrong((id *)&self->_account, 0);
}

@end
@interface MFLegacyAccount
+ (BOOL)_isActiveWithLegacyProperties:(id)a3;
+ (id)_copyLegacyAccountsWithAccountSettings:(id)a3 allowedLegacyAccountTypes:(id)a4;
+ (id)legacyAccountsWithAccountSettings:(id)a3;
- (BOOL)_isActive;
- (BOOL)_isMailAccountClass:(id)a3;
- (BOOL)isValidDefaultSendingAccount;
- (BOOL)parentAccountIsActive;
- (MFLegacyAccount)initWithLegacyProperties:(id)a3;
- (MFLegacyAccount)initWithLegacyProperties:(id)a3 allowedLegacyAccountTypes:(id)a4;
- (NSDictionary)legacyProperties;
- (NSString)parentAccountIdentifier;
- (id)_accountTypeIdentifier;
- (id)description;
- (id)performMigrationWithAccountStore:(id)a3;
- (void)_configurePersistentAccount:(id)a3 withParentAccount:(id)a4;
- (void)_setActiveForAccount:(id)a3;
- (void)setParentAccountIdentifier:(id)a3;
- (void)setParentAccountIsActive:(BOOL)a3;
@end

@implementation MFLegacyAccount

- (MFLegacyAccount)initWithLegacyProperties:(id)a3
{
  return [(MFLegacyAccount *)self initWithLegacyProperties:a3 allowedLegacyAccountTypes:0];
}

- (MFLegacyAccount)initWithLegacyProperties:(id)a3 allowedLegacyAccountTypes:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v8 = [v6 objectForKeyedSubscript:kASSAccountType];
    if ([v7 count] && v8 && (objc_msgSend(v7, "containsObject:", v8) & 1) == 0)
    {
      v9 = 0;
    }
    else
    {
      v13.receiver = self;
      v13.super_class = (Class)MFLegacyAccount;
      v9 = [(MFLegacyAccount *)&v13 init];
      if (v9)
      {
        v10 = (NSDictionary *)[v6 copy];
        legacyProperties = v9->_legacyProperties;
        v9->_legacyProperties = v10;

        self = v9;
        v9 = self;
      }
      else
      {
        self = 0;
      }
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)performMigrationWithAccountStore:(id)a3
{
  id v4 = a3;
  v5 = v4;
  p_migratedAccount = &self->_migratedAccount;
  migratedAccount = self->_migratedAccount;
  if (migratedAccount)
  {
    v8 = migratedAccount;
    goto LABEL_26;
  }
  if (!self->_parentAccountIdentifier)
  {
    v9 = 0;
    goto LABEL_9;
  }
  v9 = objc_msgSend(v4, "accountWithIdentifier:");
  if (v9)
  {
LABEL_9:
    v10 = self->_legacyProperties;
    uint64_t v11 = [(MFLegacyAccount *)self _accountTypeIdentifier];
    uint64_t v21 = v11;
    if (v11)
    {
      v12 = objc_msgSend(v5, "accountTypeWithAccountTypeIdentifier:", v11, v11);
    }
    else
    {
      v12 = 0;
    }
    objc_super v13 = -[NSDictionary objectForKeyedSubscript:](v10, "objectForKeyedSubscript:", kASSAccountIdentifier, v21);
    v23 = [(NSDictionary *)v10 objectForKeyedSubscript:kASSAccountType];
    if (v12)
    {
      v14 = [(NSDictionary *)v10 mutableCopy];
      [v14 removeObjectForKey:kASSAccountSyncIdentifier];
      [v14 removeObjectForKey:kASSAccountTypeString];
      [v14 removeObjectForKey:kASSAccountShortTypeString];
      [v14 removeObjectForKey:@"IsActive"];
      v15 = [v5 accountWithIdentifier:v13];
      if (v15
        || (createACAccountWithASAccountPropertiesAndACAccountType(),
            (v15 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        v16 = [v15 parentAccount];

        if (!v16) {
          [(MFLegacyAccount *)self _setActiveForAccount:v15];
        }
        [(MFLegacyAccount *)self _configurePersistentAccount:v15 withParentAccount:v9];
        dispatch_semaphore_t v17 = dispatch_semaphore_create(0);
        *(void *)buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x2020000000;
        char v29 = 1;
        v24[0] = _NSConcreteStackBlock;
        v24[1] = 3221225472;
        v24[2] = sub_562C;
        v24[3] = &unk_82B8;
        id v18 = v15;
        id v25 = v18;
        v27 = buf;
        v19 = v17;
        v26 = v19;
        [v5 saveVerifiedAccount:v18 withCompletionHandler:v24];
        dispatch_semaphore_wait(v19, 0xFFFFFFFFFFFFFFFFLL);
        if (*(unsigned char *)(*(void *)&buf[8] + 24)) {
          objc_storeStrong((id *)p_migratedAccount, v15);
        }

        _Block_object_dispose(buf, 8);
      }
      else
      {
        id v18 = 0;
      }
      v8 = *p_migratedAccount;
    }
    else
    {
      v14 = MFLogGeneral();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)&buf[4] = v13;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v23;
        _os_log_impl(&dword_0, v14, OS_LOG_TYPE_INFO, "No account type for account %@ with type %@, skipping migration", buf, 0x16u);
      }
      v8 = 0;
    }

    goto LABEL_25;
  }
  v9 = MFLogGeneral();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    sub_65F4((uint64_t *)&self->_parentAccountIdentifier, v9);
  }
  v8 = 0;
LABEL_25:

LABEL_26:

  return v8;
}

- (id)_accountTypeIdentifier
{
  uint64_t v3 = kASSMailAccountType;
  v10[0] = kASSSMTPAccountType;
  v10[1] = kASSMailAccountType;
  v10[2] = kASSGmailAccountType;
  v10[3] = kASSYahooAccountType;
  v10[4] = kASSCastleIMAPAccountType;
  id v4 = +[NSArray arrayWithObjects:v10 count:5];
  v5 = [(NSDictionary *)self->_legacyProperties objectForKeyedSubscript:kASSAccountType];
  if (([v4 containsObject:v5] & 1) == 0) {
    goto LABEL_7;
  }
  if ([v5 isEqualToString:v3])
  {
    if ([(MFLegacyAccount *)self _isMailAccountClass:@"POPAccount"])
    {
      id v6 = (id *)&ACAccountTypeIdentifierPOP;
LABEL_9:
      id v7 = *v6;
      goto LABEL_10;
    }
    if (![(MFLegacyAccount *)self _isMailAccountClass:@"LocalAccount"])
    {
      id v6 = (id *)&ACAccountTypeIdentifierIMAP;
      goto LABEL_9;
    }
LABEL_7:
    v8 = 0;
    goto LABEL_11;
  }
  ACAccountTypeIdentifierForASSAccountType();
  id v7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_10:
  v8 = v7;
LABEL_11:

  return v8;
}

- (void)_setActiveForAccount:(id)a3
{
  id v8 = a3;
  BOOL v4 = [(MFLegacyAccount *)self _isActive];
  v5 = [v8 accountType];
  id v6 = [v5 identifier];

  if ([ACAccountTypeIdentifierSMTP isEqualToString:v6])
  {
    [v8 setActive:v4];
  }
  else
  {
    uint64_t v7 = kAccountDataclassMail;
    if (v4 != [v8 isEnabledForDataclass:kAccountDataclassMail]) {
      [v8 setEnabled:v4 forDataclass:v7];
    }
  }
}

- (void)_configurePersistentAccount:(id)a3 withParentAccount:(id)a4
{
  id v9 = a3;
  id v5 = a4;
  if (v5)
  {
    [v9 setParentAccount:v5];
    id v6 = [v5 accountType];
    uint64_t v7 = [v6 identifier];
    unsigned int v8 = [ACAccountTypeIdentifierAppleAccount isEqualToString:v7];

    if (v8) {
      [v9 setAuthenticationType:kAccountAuthenticationTypeParent];
    }
  }
}

+ (id)legacyAccountsWithAccountSettings:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableArray);
  v12[0] = kASSSMTPAccountType;
  v12[1] = kASSMailAccountType;
  v12[2] = kASSGmailAccountType;
  v12[3] = kASSYahooAccountType;
  v12[4] = kASSCastleIMAPAccountType;
  id v6 = +[NSArray arrayWithObjects:v12 count:5];
  id v7 = [a1 _copyLegacyAccountsWithAccountSettings:v4 allowedLegacyAccountTypes:v6];
  if ([v7 count]) {
    [v5 addObjectsFromArray:v7];
  }
  uint64_t v11 = kASSExchangeAccountType;
  unsigned int v8 = +[NSArray arrayWithObjects:&v11 count:1];
  id v9 = [a1 _copyLegacyAccountsWithAccountSettings:v4 allowedLegacyAccountTypes:v8];
  if ([v9 count]) {
    [v5 addObjectsFromArray:v9];
  }
  if (![v5 count])
  {

    id v5 = 0;
  }

  return v5;
}

+ (id)_copyLegacyAccountsWithAccountSettings:(id)a3 allowedLegacyAccountTypes:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v19 = v5;
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = objc_alloc_init((Class)NSMutableArray);
      [v19 objectForKeyedSubscript:kASSPlistAccountsKey];
      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      id obj = (id)objc_claimAutoreleasedReturnValue();
      id v24 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
      if (v24)
      {
        uint64_t v23 = *(void *)v33;
        uint64_t v22 = kASSAccountIdentifier;
        uint64_t v21 = kASSAccountChildAccounts;
        do
        {
          v27 = 0;
          do
          {
            if (*(void *)v33 != v23) {
              objc_enumerationMutation(obj);
            }
            id v7 = *(void **)(*((void *)&v32 + 1) + 8 * (void)v27);
            unsigned int v8 = [[MFLegacyAccount alloc] initWithLegacyProperties:v7 allowedLegacyAccountTypes:v6];
            v26 = v8;
            if (v8) {
              [v5 addObject:v8];
            }
            id v9 = objc_msgSend(v7, "objectForKeyedSubscript:", v22, v19);
            id v10 = [(id)objc_opt_class() _isActiveWithLegacyProperties:v7];
            if (v9)
            {
              id v11 = v10;
              id v25 = [v7 objectForKeyedSubscript:v21];
              if (v25)
              {
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  long long v30 = 0u;
                  long long v31 = 0u;
                  long long v28 = 0u;
                  long long v29 = 0u;
                  id v12 = v25;
                  id v13 = [v12 countByEnumeratingWithState:&v28 objects:v36 count:16];
                  if (v13)
                  {
                    uint64_t v14 = *(void *)v29;
                    do
                    {
                      v15 = 0;
                      do
                      {
                        if (*(void *)v29 != v14) {
                          objc_enumerationMutation(v12);
                        }
                        v16 = [[MFLegacyAccount alloc] initWithLegacyProperties:*(void *)(*((void *)&v28 + 1) + 8 * (void)v15) allowedLegacyAccountTypes:v6];
                        dispatch_semaphore_t v17 = v16;
                        if (v16)
                        {
                          [(MFLegacyAccount *)v16 setParentAccountIdentifier:v9];
                          [(MFLegacyAccount *)v17 setParentAccountIsActive:v11];
                          [v5 addObject:v17];
                        }

                        v15 = (char *)v15 + 1;
                      }
                      while (v13 != v15);
                      id v13 = [v12 countByEnumeratingWithState:&v28 objects:v36 count:16];
                    }
                    while (v13);
                  }
                }
              }
            }
            v27 = (char *)v27 + 1;
          }
          while (v27 != v24);
          id v24 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
        }
        while (v24);
      }
    }
    else
    {
      id v5 = 0;
    }
  }

  return v5;
}

- (BOOL)isValidDefaultSendingAccount
{
  v10[0] = kASSMailAccountType;
  v10[1] = kASSGmailAccountType;
  v10[2] = kASSYahooAccountType;
  v10[3] = kASSCastleIMAPAccountType;
  v10[4] = kASSExchangeAccountType;
  uint64_t v3 = +[NSArray arrayWithObjects:v10 count:5];
  id v4 = [(NSDictionary *)self->_legacyProperties objectForKeyedSubscript:kASSAccountType];
  if (self->_parentAccountIdentifier) {
    BOOL parentAccountIsActive = self->_parentAccountIsActive;
  }
  else {
    BOOL parentAccountIsActive = [(MFLegacyAccount *)self _isActive];
  }
  if ([v3 containsObject:v4]
    && ![(MFLegacyAccount *)self _isMailAccountClass:@"LocalAccount"]
    && parentAccountIsActive)
  {
    id v7 = [(NSDictionary *)self->_legacyProperties objectForKeyedSubscript:MFMailAccountRestrictSendingFromExternalProcesses];
    unsigned int v8 = v7;
    if (v7) {
      unsigned int v6 = [v7 BOOLValue] ^ 1;
    }
    else {
      LOBYTE(v6) = 1;
    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (BOOL)_isMailAccountClass:(id)a3
{
  id v4 = a3;
  id v5 = [(NSDictionary *)self->_legacyProperties objectForKeyedSubscript:kASSAccountType];
  unsigned int v6 = [(NSDictionary *)self->_legacyProperties objectForKeyedSubscript:kASSAccountClass];
  if ([v5 isEqualToString:kASSMailAccountType]) {
    unsigned __int8 v7 = [v6 isEqualToString:v4];
  }
  else {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (BOOL)_isActive
{
  uint64_t v3 = objc_opt_class();
  legacyProperties = self->_legacyProperties;

  return [v3 _isActiveWithLegacyProperties:legacyProperties];
}

+ (BOOL)_isActiveWithLegacyProperties:(id)a3
{
  id v3 = a3;
  id v4 = [v3 objectForKeyedSubscript:@"IsActive"];
  if (v4 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    unsigned __int8 v5 = [v4 BOOLValue];
  }
  else
  {
    unsigned int v6 = [v3 objectForKeyedSubscript:kASSAccountType];
    if ([kASSSMTPAccountType isEqualToString:v6])
    {
      unsigned __int8 v5 = 1;
    }
    else
    {
      unsigned __int8 v7 = [v3 objectForKeyedSubscript:kASSAccountEnabledDataclasses];
      unsigned __int8 v5 = [v7 containsObject:kAccountDataclassMail];
    }
  }

  return v5;
}

- (id)description
{
  id v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  unsigned __int8 v5 = [(NSDictionary *)self->_legacyProperties objectForKeyedSubscript:kASSAccountIdentifier];
  unsigned int v6 = [(NSDictionary *)self->_legacyProperties objectForKeyedSubscript:kASSAccountDisplayName];
  unsigned __int8 v7 = [(NSDictionary *)self->_legacyProperties objectForKeyedSubscript:kASSAccountType];
  unsigned int v8 = +[NSString stringWithFormat:@"<%@:%p identifier:%@ description:\"%@\" type:\"%@\">", v4, self, v5, v6, v7];

  return v8;
}

- (NSDictionary)legacyProperties
{
  return self->_legacyProperties;
}

- (NSString)parentAccountIdentifier
{
  return self->_parentAccountIdentifier;
}

- (void)setParentAccountIdentifier:(id)a3
{
}

- (BOOL)parentAccountIsActive
{
  return self->_parentAccountIsActive;
}

- (void)setParentAccountIsActive:(BOOL)a3
{
  self->_BOOL parentAccountIsActive = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentAccountIdentifier, 0);
  objc_storeStrong((id *)&self->_legacyProperties, 0);

  objc_storeStrong((id *)&self->_migratedAccount, 0);
}

@end
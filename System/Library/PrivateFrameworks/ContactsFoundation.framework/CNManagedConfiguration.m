@interface CNManagedConfiguration
+ (id)os_log;
- (BOOL)accountIsManaged:(id)a3;
- (BOOL)accountIsManagedForIdentifier:(id)a3;
- (BOOL)canAccessProviderContainerWithIdentifier:(id)a3;
- (BOOL)canReadFromAccountWithIdentifier:(id)a3;
- (BOOL)canReadFromLocalAccount;
- (BOOL)canWriteToAccountWithIdentifier:(id)a3;
- (BOOL)canWriteToAccountWithIdentifier:(id)a3 fromSourceAccountIdentifier:(id)a4;
- (BOOL)canWriteToLocalAccount;
- (BOOL)deviceHasManagementRestrictions;
- (BOOL)hasContactProviderRestrictions;
- (CNManagedConfiguration)init;
- (CNManagedConfiguration)initWithAuditToken:(id *)a3 managedProfileConnection:(id)a4;
- (CNManagedConfiguration)initWithBundleIdentifier:(id)a3 managedProfileConnection:(id)a4;
- (CNManagedProfileConnection)profileConnection;
- (NSString)bundleIdentifier;
- (NSString)clientBundleIdentifier;
- (NSString)providerContainerIdentifier;
- (id)accountForIdentifier:(id)a3;
- (id)initForContactProvider;
- (id)readableAccountIdentifiersFromIdentifiers:(id)a3;
- (id)readableAccountsFromAccounts:(id)a3;
- (id)writableAccountIdentifiersFromIdentifiers:(id)a3;
- (id)writableAccountsFromAccounts:(id)a3;
- (id)writableAccountsFromAccounts:(id)a3 sourceAccountManagement:(int)a4;
- (int)accountManagementForIdentifier:(id)a3;
- (void)setProviderContainerIdentifier:(id)a3;
@end

@implementation CNManagedConfiguration

- (CNManagedConfiguration)initWithAuditToken:(id *)a3 managedProfileConnection:(id)a4
{
  long long v5 = *(_OWORD *)&a3->var0[4];
  long long v11 = *(_OWORD *)a3->var0;
  long long v12 = v5;
  id v6 = a4;
  v7 = +[CNAuditToken auditToken:&v11];
  v8 = +[CNAuditTokenUtilities bundleIdentifierForAuditToken:](CNAuditTokenUtilities, "bundleIdentifierForAuditToken:", v7, v11, v12);
  v9 = [(CNManagedConfiguration *)self initWithBundleIdentifier:v8 managedProfileConnection:v6];

  return v9;
}

- (CNManagedConfiguration)initWithBundleIdentifier:(id)a3 managedProfileConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CNManagedConfiguration;
  v8 = [(CNManagedConfiguration *)&v13 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    bundleIdentifier = v8->_bundleIdentifier;
    v8->_bundleIdentifier = (NSString *)v9;

    objc_storeStrong((id *)&v8->_profileConnection, a4);
    long long v11 = v8;
  }

  return v8;
}

- (id)initForContactProvider
{
  return [(CNManagedConfiguration *)self initWithBundleIdentifier:0 managedProfileConnection:0];
}

- (BOOL)deviceHasManagementRestrictions
{
  v2 = [(CNManagedConfiguration *)self profileConnection];
  char v3 = [v2 isOpenInRestrictionInEffect];

  return v3;
}

- (CNManagedProfileConnection)profileConnection
{
  return self->_profileConnection;
}

- (BOOL)hasContactProviderRestrictions
{
  char v3 = [(CNManagedConfiguration *)self providerContainerIdentifier];
  if (v3)
  {
    v4 = [(CNManagedConfiguration *)self providerContainerIdentifier];
    BOOL v5 = [v4 length] != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (NSString)providerContainerIdentifier
{
  return self->_providerContainerIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_providerContainerIdentifier, 0);
  objc_storeStrong((id *)&self->_profileConnection, 0);

  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

+ (id)os_log
{
  if (os_log_cn_once_token_3_0 != -1) {
    dispatch_once(&os_log_cn_once_token_3_0, &__block_literal_global_13);
  }
  v2 = (void *)os_log_cn_once_object_3_0;

  return v2;
}

uint64_t __32__CNManagedConfiguration_os_log__block_invoke()
{
  os_log_cn_once_object_3_0 = (uint64_t)os_log_create("com.apple.contacts.managedConfiguration", "general");

  return MEMORY[0x1F41817F8]();
}

- (CNManagedConfiguration)init
{
  CNUnimplementedMethodException([(CNManagedConfiguration *)self initWithBundleIdentifier:0 managedProfileConnection:0], a2);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (BOOL)canReadFromLocalAccount
{
  char v3 = [(CNManagedConfiguration *)self profileConnection];
  v4 = [(CNManagedConfiguration *)self bundleIdentifier];
  char v5 = [v3 mayShowLocalContactsAccountsForTargetBundleID:v4 targetAccountManagement:0];

  return v5;
}

- (BOOL)canWriteToLocalAccount
{
  char v3 = [(CNManagedConfiguration *)self profileConnection];
  v4 = [(CNManagedConfiguration *)self bundleIdentifier];
  char v5 = [v3 mayShowLocalContactsAccountsForBundleID:v4 sourceAccountManagement:0];

  return v5;
}

- (int)accountManagementForIdentifier:(id)a3
{
  id v4 = a3;
  if (off_1EE0254C0((uint64_t)&__block_literal_global_121_0, v4))
  {
    if ([(CNManagedConfiguration *)self accountIsManagedForIdentifier:v4]) {
      int v5 = 2;
    }
    else {
      int v5 = 1;
    }
  }
  else
  {
    int v5 = 0;
  }

  return v5;
}

- (BOOL)accountIsManaged:(id)a3
{
  return [a3 MCIsManaged];
}

- (BOOL)accountIsManagedForIdentifier:(id)a3
{
  id v4 = a3;
  if ([(CNManagedConfiguration *)self deviceHasManagementRestrictions])
  {
    int v5 = +[CNManagedAccountsCache sharedCache];
    id v6 = [v5 accountForIdentifier:v4];

    BOOL v7 = [(CNManagedConfiguration *)self accountIsManaged:v6];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)canReadFromAccountWithIdentifier:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (off_1EE025420((uint64_t)&__block_literal_global_119, v4))
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    uint64_t v6 = [(CNManagedConfiguration *)self accountForIdentifier:v4];
    BOOL v7 = (void *)v6;
    if (v6)
    {
      v11[0] = v6;
      v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
      uint64_t v9 = [(CNManagedConfiguration *)self readableAccountsFromAccounts:v8];

      BOOL v5 = !off_1EE0248A0((uint64_t)&__block_literal_global_5, v9);
    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (BOOL)canWriteToAccountWithIdentifier:(id)a3
{
  return [(CNManagedConfiguration *)self canWriteToAccountWithIdentifier:a3 fromSourceAccountIdentifier:0];
}

- (BOOL)canWriteToAccountWithIdentifier:(id)a3 fromSourceAccountIdentifier:(id)a4
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (off_1EE025420((uint64_t)&__block_literal_global_119, v6))
  {
    LOBYTE(v8) = 1;
  }
  else
  {
    uint64_t v9 = [(CNManagedConfiguration *)self accountForIdentifier:v6];
    if (v9)
    {
      uint64_t v10 = [(CNManagedConfiguration *)self accountManagementForIdentifier:v7];
      v14[0] = v9;
      long long v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
      long long v12 = [(CNManagedConfiguration *)self writableAccountsFromAccounts:v11 sourceAccountManagement:v10];

      BOOL v8 = !off_1EE0248A0((uint64_t)&__block_literal_global_5, v12);
    }
    else
    {
      LOBYTE(v8) = 1;
    }
  }
  return v8;
}

- (id)readableAccountIdentifiersFromIdentifiers:(id)a3
{
  id v4 = a3;
  if (off_1EE0248A0((uint64_t)&__block_literal_global_5, v4))
  {
    id v5 = v4;
  }
  else
  {
    id v6 = +[CNManagedAccountsCache sharedCache];
    id v7 = [v6 accountsForIdentifiers:v4];

    BOOL v8 = [(CNManagedConfiguration *)self readableAccountsFromAccounts:v7];
    objc_msgSend(v8, "_cn_map:", &__block_literal_global_74);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

uint64_t __68__CNManagedConfiguration_readableAccountIdentifiersFromIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

- (id)writableAccountIdentifiersFromIdentifiers:(id)a3
{
  id v4 = a3;
  if (off_1EE0248A0((uint64_t)&__block_literal_global_5, v4))
  {
    id v5 = v4;
  }
  else
  {
    id v6 = +[CNManagedAccountsCache sharedCache];
    id v7 = [v6 accountsForIdentifiers:v4];

    BOOL v8 = [(CNManagedConfiguration *)self writableAccountsFromAccounts:v7];
    objc_msgSend(v8, "_cn_map:", &__block_literal_global_76);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

uint64_t __68__CNManagedConfiguration_writableAccountIdentifiersFromIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

- (id)writableAccountsFromAccounts:(id)a3
{
  return [(CNManagedConfiguration *)self writableAccountsFromAccounts:a3 sourceAccountManagement:0];
}

- (id)writableAccountsFromAccounts:(id)a3 sourceAccountManagement:(int)a4
{
  id v6 = a3;
  if (off_1EE0248A0((uint64_t)&__block_literal_global_5, v6))
  {
    id v7 = v6;
  }
  else
  {
    BOOL v8 = [(CNManagedConfiguration *)self profileConnection];
    uint64_t v9 = [(CNManagedConfiguration *)self bundleIdentifier];
    id v7 = [v8 filteredOpenInAccounts:v6 originatingAppBundleID:v9 sourceAccountManagement:a4];
  }

  return v7;
}

- (id)readableAccountsFromAccounts:(id)a3
{
  id v4 = a3;
  if (off_1EE0248A0((uint64_t)&__block_literal_global_5, v4))
  {
    id v5 = v4;
  }
  else
  {
    id v6 = [(CNManagedConfiguration *)self profileConnection];
    id v7 = [(CNManagedConfiguration *)self bundleIdentifier];
    id v5 = [v6 filteredOpenInOriginatingAccounts:v4 targetAppBundleID:v7 targetAccountManagement:0];
  }

  return v5;
}

- (id)accountForIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = +[CNManagedAccountsCache sharedCache];
  id v5 = [v4 accountForIdentifier:v3];

  return v5;
}

- (void)setProviderContainerIdentifier:(id)a3
{
}

- (BOOL)canAccessProviderContainerWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(CNManagedConfiguration *)self providerContainerIdentifier];
  char v6 = [v5 isEqualToString:v4];

  return v6;
}

- (NSString)clientBundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

@end
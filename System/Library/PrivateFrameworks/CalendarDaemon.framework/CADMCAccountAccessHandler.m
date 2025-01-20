@interface CADMCAccountAccessHandler
- (BOOL)_areLocalStoresRestrictedForAction:(unint64_t)a3;
- (BOOL)_isAccount:(id)a3 restrictedForAction:(unint64_t)a4;
- (BOOL)_isDisabledForAction:(unint64_t)a3;
- (BOOL)_mayShowLocalAccountsForAction:(unint64_t)a3;
- (BOOL)isActionAllowed:(unint64_t)a3 forStore:(void *)a4 inDatabase:(CalDatabase *)a5;
- (CADACAccountsProvider)accountsProvider;
- (CADMCAccountAccessHandler)initWithDatabaseDataProvider:(id)a3 accountsProvider:(id)a4 managedConfigHandler:(id)a5 accountManagement:(unint64_t)a6 bundleIdentifier:(id)a7;
- (CADManagedConfigurationHandler)managedConfigHandler;
- (NSString)bundleIdentifier;
- (id)_cachedAccounts;
- (id)_filteredAccountsForAction:(unint64_t)a3 withUnfilteredAccounts:(id)a4;
- (id)_loadAllowedAccountIdentifiersForAction:(unint64_t)a3;
- (unint64_t)accountManagement;
- (void)gatherRestrictedCalendarRowIDs:(id)a3 forAction:(unint64_t)a4 inDatabase:(CalDatabase *)a5;
- (void)reset;
@end

@implementation CADMCAccountAccessHandler

- (void)gatherRestrictedCalendarRowIDs:(id)a3 forAction:(unint64_t)a4 inDatabase:(CalDatabase *)a5
{
  id v8 = a3;
  if (![(CADMCAccountAccessHandler *)self _isDisabledForAction:a4])
  {
    v9.receiver = self;
    v9.super_class = (Class)CADMCAccountAccessHandler;
    [(CADAccountAccessHandler *)&v9 gatherRestrictedCalendarRowIDs:v8 forAction:a4 inDatabase:a5];
  }
}

- (CADMCAccountAccessHandler)initWithDatabaseDataProvider:(id)a3 accountsProvider:(id)a4 managedConfigHandler:(id)a5 accountManagement:(unint64_t)a6 bundleIdentifier:(id)a7
{
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  v21.receiver = self;
  v21.super_class = (Class)CADMCAccountAccessHandler;
  v16 = [(CADAccountAccessHandler *)&v21 initWithDatabaseDataProvider:a3];
  v17 = v16;
  if (v16)
  {
    v16->_accountManagement = a6;
    uint64_t v18 = [v15 copy];
    bundleIdentifier = v17->_bundleIdentifier;
    v17->_bundleIdentifier = (NSString *)v18;

    objc_storeStrong((id *)&v17->_accountsProvider, a4);
    objc_storeStrong((id *)&v17->_managedConfigHandler, a5);
    v17->_lock._os_unfair_lock_opaque = 0;
  }

  return v17;
}

- (BOOL)isActionAllowed:(unint64_t)a3 forStore:(void *)a4 inDatabase:(CalDatabase *)a5
{
  if (-[CADMCAccountAccessHandler _isDisabledForAction:](self, "_isDisabledForAction:")) {
    return 1;
  }
  v10 = [(CADAccountAccessHandler *)self dataProvider];
  if ([v10 isLocalStore:a4 inDatabase:a5])
  {
    BOOL v11 = [(CADMCAccountAccessHandler *)self _areLocalStoresRestrictedForAction:a3];
  }
  else
  {
    v12 = [v10 accountIDForStore:a4 inDatabase:a5];
    BOOL v11 = [(CADMCAccountAccessHandler *)self _isAccount:v12 restrictedForAction:a3];
  }
  BOOL v9 = !v11;

  return v9;
}

- (BOOL)_isDisabledForAction:(unint64_t)a3
{
  v3 = [(CADMCAccountAccessHandler *)self managedConfigHandler];
  char v4 = [v3 isOpenInRestrictionInEffect];

  return v4 ^ 1;
}

- (CADManagedConfigurationHandler)managedConfigHandler
{
  return self->_managedConfigHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_managedConfigHandler, 0);
  objc_storeStrong((id *)&self->_accountsProvider, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_localAccountRestrictionsByAction, 0);
  objc_storeStrong((id *)&self->_allowedAccountIdentifiersByAction, 0);
  objc_storeStrong((id *)&self->_cachedAccounts, 0);
}

- (void)reset
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  localAccountRestrictionsByAction = self->_localAccountRestrictionsByAction;
  self->_localAccountRestrictionsByAction = 0;

  allowedAccountIdentifiersByAction = self->_allowedAccountIdentifiersByAction;
  self->_allowedAccountIdentifiersByAction = 0;

  cachedAccounts = self->_cachedAccounts;
  self->_cachedAccounts = 0;

  os_unfair_lock_unlock(p_lock);
}

- (id)_cachedAccounts
{
  cachedAccounts = self->_cachedAccounts;
  if (!cachedAccounts)
  {
    char v4 = [(CADMCAccountAccessHandler *)self accountsProvider];
    v5 = [v4 accounts];
    v6 = self->_cachedAccounts;
    self->_cachedAccounts = v5;

    cachedAccounts = self->_cachedAccounts;
  }
  return cachedAccounts;
}

- (BOOL)_areLocalStoresRestrictedForAction:(unint64_t)a3
{
  v16[2] = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  localAccountRestrictionsByAction = self->_localAccountRestrictionsByAction;
  if (!localAccountRestrictionsByAction)
  {
    uint64_t v7 = [(CADMCAccountAccessHandler *)self _mayShowLocalAccountsForAction:0] ^ 1;
    uint64_t v8 = [(CADMCAccountAccessHandler *)self _mayShowLocalAccountsForAction:1] ^ 1;
    BOOL v9 = [MEMORY[0x1E4F28ED0] numberWithBool:v7];
    v16[0] = v9;
    v10 = [MEMORY[0x1E4F28ED0] numberWithBool:v8];
    v16[1] = v10;
    BOOL v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
    v12 = self->_localAccountRestrictionsByAction;
    self->_localAccountRestrictionsByAction = v11;

    localAccountRestrictionsByAction = self->_localAccountRestrictionsByAction;
  }
  id v13 = [(NSArray *)localAccountRestrictionsByAction objectAtIndexedSubscript:a3];
  os_unfair_lock_unlock(p_lock);
  char v14 = [v13 BOOLValue];

  return v14;
}

- (BOOL)_isAccount:(id)a3 restrictedForAction:(unint64_t)a4
{
  p_lock = &self->_lock;
  id v7 = a3;
  os_unfair_lock_lock(p_lock);
  uint64_t v8 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a4];
  BOOL v9 = [(NSMutableDictionary *)self->_allowedAccountIdentifiersByAction objectForKeyedSubscript:v8];
  if (!v9)
  {
    BOOL v9 = [(CADMCAccountAccessHandler *)self _loadAllowedAccountIdentifiersForAction:a4];
    allowedAccountIdentifiersByAction = self->_allowedAccountIdentifiersByAction;
    if (!allowedAccountIdentifiersByAction)
    {
      BOOL v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      v12 = self->_allowedAccountIdentifiersByAction;
      self->_allowedAccountIdentifiersByAction = v11;

      allowedAccountIdentifiersByAction = self->_allowedAccountIdentifiersByAction;
    }
    [(NSMutableDictionary *)allowedAccountIdentifiersByAction setObject:v9 forKeyedSubscript:v8];
  }
  os_unfair_lock_unlock(p_lock);
  char v13 = [v9 containsObject:v7];

  return v13 ^ 1;
}

- (id)_loadAllowedAccountIdentifiersForAction:(unint64_t)a3
{
  v5 = [(CADMCAccountAccessHandler *)self _cachedAccounts];
  v6 = [(CADMCAccountAccessHandler *)self _filteredAccountsForAction:a3 withUnfilteredAccounts:v5];
  id v7 = [v6 valueForKey:@"identifier"];
  uint64_t v8 = [MEMORY[0x1E4F1CAD0] setWithArray:v7];

  return v8;
}

- (id)_filteredAccountsForAction:(unint64_t)a3 withUnfilteredAccounts:(id)a4
{
  id v7 = a4;
  if (!a3)
  {
    unint64_t v12 = CADTargetFromAccountManagement([(CADMCAccountAccessHandler *)self accountManagement]);
    BOOL v9 = [(CADMCAccountAccessHandler *)self managedConfigHandler];
    v10 = [(CADMCAccountAccessHandler *)self bundleIdentifier];
    uint64_t v11 = [v9 filteredOpenInOriginatingAccounts:v7 targetAppBundleID:v10 targetAccountManagement:v12];
    goto LABEL_5;
  }
  if (a3 == 1)
  {
    unint64_t v8 = CADSourceFromAccountManagement([(CADMCAccountAccessHandler *)self accountManagement]);
    BOOL v9 = [(CADMCAccountAccessHandler *)self managedConfigHandler];
    v10 = [(CADMCAccountAccessHandler *)self bundleIdentifier];
    uint64_t v11 = [v9 filteredOpenInAccounts:v7 originatingAppBundleID:v10 sourceAccountManagement:v8];
LABEL_5:
    char v13 = (void *)v11;
    goto LABEL_7;
  }
  BOOL v9 = CADAccountActionDescription(a3);
  v10 = [MEMORY[0x1E4F28B00] currentHandler];
  [v10 handleFailureInMethod:a2, self, @"CADMCAccountAccessHandler.m", 172, @"Unsupported CADAccountAction: [%@]", v9 object file lineNumber description];
  char v13 = 0;
LABEL_7:

  return v13;
}

- (BOOL)_mayShowLocalAccountsForAction:(unint64_t)a3
{
  if (a3)
  {
    if (a3 != 1)
    {
      v5 = CADAccountActionDescription(a3);
      v6 = [MEMORY[0x1E4F28B00] currentHandler];
      [v6 handleFailureInMethod:a2, self, @"CADMCAccountAccessHandler.m", 190, @"Unsupported CADAccountAction: [%@]", v5 object file lineNumber description];
      BOOL v9 = 0;
      goto LABEL_7;
    }
    unint64_t v4 = CADSourceFromAccountManagement([(CADMCAccountAccessHandler *)self accountManagement]);
    v5 = [(CADMCAccountAccessHandler *)self managedConfigHandler];
    v6 = [(CADMCAccountAccessHandler *)self bundleIdentifier];
    char v7 = [v5 mayShowLocalAccountsForBundleID:v6 sourceAccountManagement:v4];
  }
  else
  {
    unint64_t v8 = CADTargetFromAccountManagement([(CADMCAccountAccessHandler *)self accountManagement]);
    v5 = [(CADMCAccountAccessHandler *)self managedConfigHandler];
    v6 = [(CADMCAccountAccessHandler *)self bundleIdentifier];
    char v7 = [v5 mayShowLocalAccountsForTargetBundleID:v6 targetAccountManagement:v8];
  }
  BOOL v9 = v7;
LABEL_7:

  return v9;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (CADACAccountsProvider)accountsProvider
{
  return self->_accountsProvider;
}

- (unint64_t)accountManagement
{
  return self->_accountManagement;
}

@end
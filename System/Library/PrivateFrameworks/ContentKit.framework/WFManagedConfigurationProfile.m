@interface WFManagedConfigurationProfile
+ (WFManagedConfigurationProfile)defaultProfile;
- (ACAccount)primaryAppleAccount;
- (ACAccountStore)accountStore;
- (BOOL)isAccountBasedSourceApp:(id)a3;
- (BOOL)isAccountManaged:(id)a3;
- (BOOL)isAppManaged:(id)a3;
- (BOOL)isBluetoothModificationAllowed;
- (BOOL)isOpenInRestrictionInEffect;
- (BOOL)isScreenShotAllowed;
- (BOOL)isWallpaperModificationAllowed;
- (BOOL)isWiFiPowerModificationAllowed;
- (BOOL)mayOpenFromManagedToUnmanaged;
- (BOOL)mayOpenFromUnmanagedToManaged;
- (MCProfileConnection)profileConnection;
- (NSMutableDictionary)accountIdentifiersByDataClass;
- (NSMutableDictionary)accounts;
- (NSSet)managedAppBundleIDs;
- (OS_dispatch_queue)operatingQueue;
- (WFManagedConfigurationProfile)init;
- (WFManagedConfigurationProfile)initWithProfileConnection:(id)a3 accountStore:(id)a4;
- (id)accountIdentifiersEnabledForDataclass:(id)a3;
- (id)accountWithIdentifier:(id)a3;
- (id)allowedOpenInAppBundleIDsAfterApplyingFilterToAppBundleIDs:(id)a3 originatingAppBundleID:(id)a4 originatingAccountIsManaged:(BOOL)a5;
- (unint64_t)managedLevelForContentOfURL:(id)a3;
- (unint64_t)managedLevelForContentOfURLs:(id)a3;
- (void)handleAccountStoreDidChangeNotification:(id)a3;
- (void)handleManagedAppDidChangeNotification:(id)a3;
- (void)removeCachedChildrenAccountForAccount:(id)a3;
@end

@implementation WFManagedConfigurationProfile

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profileConnection, 0);
  objc_storeStrong((id *)&self->_accountIdentifiersByDataClass, 0);
  objc_storeStrong((id *)&self->_accounts, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
  objc_storeStrong((id *)&self->_operatingQueue, 0);
  objc_storeStrong((id *)&self->_primaryAppleAccount, 0);
  objc_storeStrong((id *)&self->_managedAppBundleIDs, 0);
}

- (MCProfileConnection)profileConnection
{
  return self->_profileConnection;
}

- (NSMutableDictionary)accountIdentifiersByDataClass
{
  return self->_accountIdentifiersByDataClass;
}

- (NSMutableDictionary)accounts
{
  return self->_accounts;
}

- (ACAccountStore)accountStore
{
  return self->_accountStore;
}

- (OS_dispatch_queue)operatingQueue
{
  return self->_operatingQueue;
}

- (void)handleManagedAppDidChangeNotification:(id)a3
{
  v4 = [(WFManagedConfigurationProfile *)self operatingQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __71__WFManagedConfigurationProfile_handleManagedAppDidChangeNotification___block_invoke;
  block[3] = &unk_26428A060;
  block[4] = self;
  dispatch_async(v4, block);
}

void __71__WFManagedConfigurationProfile_handleManagedAppDidChangeNotification___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(void **)(v1 + 8);
  if (v2)
  {
    *(void *)(v1 + 8) = 0;
  }
}

- (void)handleAccountStoreDidChangeNotification:(id)a3
{
  v4 = [a3 userInfo];
  v5 = getACAccountIdentifierKey[0]();
  v6 = [v4 objectForKeyedSubscript:v5];

  if (v6)
  {
    v7 = [(WFManagedConfigurationProfile *)self operatingQueue];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __73__WFManagedConfigurationProfile_handleAccountStoreDidChangeNotification___block_invoke;
    v8[3] = &unk_264288C08;
    v8[4] = self;
    id v9 = v6;
    dispatch_async(v7, v8);
  }
}

void __73__WFManagedConfigurationProfile_handleAccountStoreDidChangeNotification___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) accounts];
  v3 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];
  v4 = v3;
  if (v3)
  {
    id v12 = v3;
  }
  else
  {
    v5 = [*(id *)(a1 + 32) accountStore];
    id v12 = [v5 accountWithIdentifier:*(void *)(a1 + 40)];
  }
  [*(id *)(a1 + 32) removeCachedChildrenAccountForAccount:v12];
  v6 = [*(id *)(*(void *)(a1 + 32) + 16) identifier];
  int v7 = [v6 isEqualToString:*(void *)(a1 + 40)];

  if (v7)
  {
    uint64_t v8 = *(void *)(a1 + 32);
    id v9 = *(void **)(v8 + 16);
    *(void *)(v8 + 16) = 0;
  }
  v10 = [*(id *)(a1 + 32) accounts];
  [v10 removeObjectForKey:*(void *)(a1 + 40)];

  v11 = [*(id *)(a1 + 32) accountIdentifiersByDataClass];
  [v11 removeAllObjects];
}

- (void)removeCachedChildrenAccountForAccount:(id)a3
{
  id v4 = a3;
  v5 = [v4 childAccounts];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    int v7 = [(WFManagedConfigurationProfile *)self accounts];
    uint64_t v8 = [v4 childAccounts];
    id v9 = [v8 valueForKey:@"identifier"];
    [v7 removeObjectsForKeys:v9];

    v10 = [v4 childAccounts];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __71__WFManagedConfigurationProfile_removeCachedChildrenAccountForAccount___block_invoke;
    v11[3] = &unk_264288BE0;
    v11[4] = self;
    [v10 enumerateObjectsUsingBlock:v11];
  }
}

uint64_t __71__WFManagedConfigurationProfile_removeCachedChildrenAccountForAccount___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) removeCachedChildrenAccountForAccount:a2];
}

- (NSSet)managedAppBundleIDs
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__15690;
  v11 = __Block_byref_object_dispose__15691;
  id v12 = 0;
  v3 = [(WFManagedConfigurationProfile *)self operatingQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __52__WFManagedConfigurationProfile_managedAppBundleIDs__block_invoke;
  v6[3] = &unk_264288BB8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSSet *)v4;
}

void __52__WFManagedConfigurationProfile_managedAppBundleIDs__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 8);
  if (!v3)
  {
    id v4 = (void *)MEMORY[0x263EFFA08];
    v5 = [*(id *)(v2 + 56) managedAppBundleIDs];
    uint64_t v6 = [v4 setWithArray:v5];
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void **)(v7 + 8);
    *(void *)(v7 + 8) = v6;

    v3 = *(void **)(*(void *)(a1 + 32) + 8);
  }
  uint64_t v9 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  objc_storeStrong(v9, v3);
}

- (ACAccount)primaryAppleAccount
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__15690;
  v11 = __Block_byref_object_dispose__15691;
  id v12 = 0;
  v3 = [(WFManagedConfigurationProfile *)self operatingQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __52__WFManagedConfigurationProfile_primaryAppleAccount__block_invoke;
  v6[3] = &unk_264288BB8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (ACAccount *)v4;
}

void __52__WFManagedConfigurationProfile_primaryAppleAccount__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v3 = (void *)v2[2];
  if (!v3)
  {
    id v4 = [v2 accountStore];
    uint64_t v5 = objc_msgSend(v4, "aa_primaryAppleAccount");
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void **)(v6 + 16);
    *(void *)(v6 + 16) = v5;

    v3 = *(void **)(*(void *)(a1 + 32) + 16);
  }
  uint64_t v8 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  objc_storeStrong(v8, v3);
}

- (WFManagedConfigurationProfile)initWithProfileConnection:(id)a3 accountStore:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v22.receiver = self;
  v22.super_class = (Class)WFManagedConfigurationProfile;
  uint64_t v9 = [(WFManagedConfigurationProfile *)&v22 init];
  if (v9)
  {
    v10 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.shortcuts.ManagedConfigurationManager.queue", v10);
    operatingQueue = v9->_operatingQueue;
    v9->_operatingQueue = (OS_dispatch_queue *)v11;

    uint64_t v13 = objc_opt_new();
    accounts = v9->_accounts;
    v9->_accounts = (NSMutableDictionary *)v13;

    objc_storeStrong((id *)&v9->_accountStore, a4);
    objc_storeStrong((id *)&v9->_profileConnection, a3);
    v15 = [MEMORY[0x263F08A00] defaultCenter];
    v16 = getMCManagedAppsChangedNotification();
    v17 = [(WFManagedConfigurationProfile *)v9 profileConnection];
    [v15 addObserver:v9 selector:sel_handleManagedAppDidChangeNotification_ name:v16 object:v17];

    v18 = [MEMORY[0x263F08A00] defaultCenter];
    v19 = getACDAccountStoreDidChangeNotification[0]();
    [v18 addObserver:v9 selector:sel_handleAccountStoreDidChangeNotification_ name:v19 object:0];

    v20 = v9;
  }

  return v9;
}

- (WFManagedConfigurationProfile)init
{
  v3 = [(objc_class *)getMCProfileConnectionClass() sharedConnection];
  getACAccountStoreClass();
  id v4 = objc_opt_new();
  uint64_t v5 = [(WFManagedConfigurationProfile *)self initWithProfileConnection:v3 accountStore:v4];

  return v5;
}

+ (WFManagedConfigurationProfile)defaultProfile
{
  if (defaultProfile_onceToken != -1) {
    dispatch_once(&defaultProfile_onceToken, &__block_literal_global_15709);
  }
  uint64_t v2 = (void *)defaultProfile_defaultProfile;
  return (WFManagedConfigurationProfile *)v2;
}

uint64_t __47__WFManagedConfigurationProfile_defaultProfile__block_invoke()
{
  defaultProfile_defaultProfile = objc_opt_new();
  return MEMORY[0x270F9A758]();
}

- (BOOL)isWallpaperModificationAllowed
{
  uint64_t v2 = [(WFManagedConfigurationProfile *)self profileConnection];
  char v3 = [v2 isWallpaperModificationAllowed];

  return v3;
}

- (BOOL)isScreenShotAllowed
{
  uint64_t v2 = [(WFManagedConfigurationProfile *)self profileConnection];
  char v3 = [v2 isScreenShotAllowed];

  return v3;
}

- (BOOL)isBluetoothModificationAllowed
{
  uint64_t v2 = [(WFManagedConfigurationProfile *)self profileConnection];
  char v3 = [v2 isBluetoothModificationAllowed];

  return v3;
}

- (BOOL)isWiFiPowerModificationAllowed
{
  uint64_t v2 = [(WFManagedConfigurationProfile *)self profileConnection];
  char v3 = [v2 isWiFiPowerModificationAllowed];

  return v3;
}

- (id)allowedOpenInAppBundleIDsAfterApplyingFilterToAppBundleIDs:(id)a3 originatingAppBundleID:(id)a4 originatingAccountIsManaged:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = [(WFManagedConfigurationProfile *)self profileConnection];
  dispatch_queue_t v11 = [v10 allowedOpenInAppBundleIDsAfterApplyingFilterToAppBundleIDs:v9 originatingAppBundleID:v8 originatingAccountIsManaged:v5];

  return v11;
}

- (unint64_t)managedLevelForContentOfURLs:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    char v7 = 0;
    char v8 = 0;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v4);
        }
        unint64_t v11 = [(WFManagedConfigurationProfile *)self managedLevelForContentOfURL:*(void *)(*((void *)&v14 + 1) + 8 * i)];
        if (v11 == 1)
        {
          char v8 = 1;
        }
        else if (v11 == 2)
        {
          char v7 = 1;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
    if (v7) {
      unint64_t v12 = 2;
    }
    else {
      unint64_t v12 = v8 & 1;
    }
    if ((v7 & 1 & v8) != 0) {
      unint64_t v12 = 3;
    }
  }
  else
  {
    unint64_t v12 = 0;
  }

  return v12;
}

- (unint64_t)managedLevelForContentOfURL:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(WFManagedConfigurationProfile *)self profileConnection];
  int v6 = [v5 isURLManaged:v4];

  if (v6) {
    unint64_t v7 = 2;
  }
  else {
    unint64_t v7 = 1;
  }

  return v7;
}

- (BOOL)isAccountBasedSourceApp:(id)a3
{
  if (a3) {
    return softLinkMCIsAppAccountBasedSourceForOpenIn(a3);
  }
  else {
    return 0;
  }
}

- (BOOL)isAccountManaged:(id)a3
{
  char v3 = [(WFManagedConfigurationProfile *)self accountWithIdentifier:a3];
  char v4 = [v3 MCIsManaged];

  return v4;
}

- (BOOL)isAppManaged:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(WFManagedConfigurationProfile *)self managedAppBundleIDs];
  char v6 = [v5 containsObject:v4];

  return v6;
}

- (BOOL)mayOpenFromManagedToUnmanaged
{
  uint64_t v2 = [(WFManagedConfigurationProfile *)self profileConnection];
  char v3 = [v2 mayOpenFromManagedToUnmanaged];

  return v3;
}

- (BOOL)mayOpenFromUnmanagedToManaged
{
  uint64_t v2 = [(WFManagedConfigurationProfile *)self profileConnection];
  char v3 = [v2 mayOpenFromUnmanagedToManaged];

  return v3;
}

- (BOOL)isOpenInRestrictionInEffect
{
  uint64_t v2 = [(WFManagedConfigurationProfile *)self profileConnection];
  char v3 = [v2 isOpenInRestrictionInEffect];

  return v3;
}

- (id)accountIdentifiersEnabledForDataclass:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  long long v15 = __Block_byref_object_copy__15690;
  long long v16 = __Block_byref_object_dispose__15691;
  id v17 = 0;
  uint64_t v5 = [(WFManagedConfigurationProfile *)self operatingQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __80__WFManagedConfigurationProfile_Account__accountIdentifiersEnabledForDataclass___block_invoke;
  block[3] = &unk_264288C30;
  id v10 = v4;
  unint64_t v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __80__WFManagedConfigurationProfile_Account__accountIdentifiersEnabledForDataclass___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) accountIdentifiersByDataClass];
  uint64_t v3 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    id v6 = [*(id *)(a1 + 32) accountStore];
    uint64_t v7 = [v6 accountIdentifiersEnabledForDataclass:*(void *)(a1 + 40)];
    uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    if (v10)
    {
      id v11 = [*(id *)(a1 + 32) accountIdentifiersByDataClass];
      [v11 setObject:v10 forKeyedSubscript:*(void *)(a1 + 40)];
    }
  }
}

- (id)accountWithIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v11 = 0;
    uint64_t v12 = &v11;
    uint64_t v13 = 0x3032000000;
    uint64_t v14 = __Block_byref_object_copy__15690;
    long long v15 = __Block_byref_object_dispose__15691;
    id v16 = 0;
    uint64_t v5 = [(WFManagedConfigurationProfile *)self operatingQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __64__WFManagedConfigurationProfile_Account__accountWithIdentifier___block_invoke;
    block[3] = &unk_264288C30;
    uint64_t v10 = &v11;
    block[4] = self;
    id v9 = v4;
    dispatch_sync(v5, block);

    id v6 = (id)v12[5];
    _Block_object_dispose(&v11, 8);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

void __64__WFManagedConfigurationProfile_Account__accountWithIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) accounts];
  uint64_t v3 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) identifier];
  uint64_t v4 = [v2 objectForKeyedSubscript:v3];
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    uint64_t v7 = [*(id *)(a1 + 32) accountStore];
    uint64_t v8 = [v7 accountWithIdentifier:*(void *)(a1 + 40)];
    uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    uint64_t v11 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) identifier];

    if (v11)
    {
      uint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      id v14 = [*(id *)(a1 + 32) accounts];
      uint64_t v13 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) identifier];
      [v14 setObject:v12 forKeyedSubscript:v13];
    }
  }
}

@end
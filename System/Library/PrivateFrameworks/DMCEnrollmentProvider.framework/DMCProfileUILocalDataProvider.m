@interface DMCProfileUILocalDataProvider
+ (id)_declarationsPayloadIdentifiersForProfileIdentifier:(id)a3;
+ (id)localRMUIConfigurationInterfaceForProfileIdentifier:(id)a3 scope:(int64_t)a4 initialLoad:(BOOL)a5;
- (BOOL)isPasscodeSet;
- (BOOL)isProvisionallyEnrolled;
- (id)installedMDMProfileIdentifier;
- (id)installedProfileWithIdentifier:(id)a3;
- (id)managedAppsUninstalledOnMDMRemoval;
- (id)payloadsSummaryForProfile:(id)a3 showManagedPayloads:(BOOL)a4;
- (id)rmAccount;
- (id)rmSpecifierProviderForProfileIdentifier:(id)a3 scope:(int64_t)a4;
- (void)unenrollWithCompletionBlock:(id)a3;
- (void)updateProfileWithIdentifier:(id)a3 interactionDelegate:(id)a4;
@end

@implementation DMCProfileUILocalDataProvider

- (BOOL)isProvisionallyEnrolled
{
  v2 = [MEMORY[0x263F53C50] sharedConnection];
  char v3 = [v2 isProvisionallyEnrolled];

  return v3;
}

- (BOOL)isPasscodeSet
{
  v2 = [MEMORY[0x263F53C50] sharedConnection];
  char v3 = [v2 isPasscodeSet];

  return v3;
}

- (id)installedMDMProfileIdentifier
{
  v2 = [MEMORY[0x263F53C50] sharedConnection];
  char v3 = [v2 installedMDMProfileIdentifier];

  return v3;
}

- (id)installedProfileWithIdentifier:(id)a3
{
  char v3 = (void *)MEMORY[0x263F53C50];
  id v4 = a3;
  v5 = [v3 sharedConnection];
  v6 = [v5 installedProfileWithIdentifier:v4];

  return v6;
}

- (id)payloadsSummaryForProfile:(id)a3 showManagedPayloads:(BOOL)a4
{
  return +[DMCProfilePayloadsSummary summaryForProfile:a3 showManagedPayloads:a4 dataSource:0];
}

- (id)managedAppsUninstalledOnMDMRemoval
{
  return (id)[MEMORY[0x263F52840] managedAppsUninstalledOnMDMRemoval];
}

- (id)rmAccount
{
  v2 = [MEMORY[0x263EFB210] defaultStore];
  char v3 = objc_msgSend(v2, "dmc_visibleRemoteManagementAccounts");
  id v4 = [v3 firstObject];

  return v4;
}

- (void)updateProfileWithIdentifier:(id)a3 interactionDelegate:(id)a4
{
  v5 = (void *)MEMORY[0x263F53C50];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 sharedConnection];
  [v8 updateProfileWithIdentifier:v7 interactionDelegate:v6];
}

- (void)unenrollWithCompletionBlock:(id)a3
{
  char v3 = (void *)MEMORY[0x263F53C50];
  id v4 = a3;
  id v5 = [v3 sharedConnection];
  [v5 unenrollWithCompletionBlock:v4];
}

- (id)rmSpecifierProviderForProfileIdentifier:(id)a3 scope:(int64_t)a4
{
  id v4 = +[DMCProfileUILocalDataProvider localRMUIConfigurationInterfaceForProfileIdentifier:a3 scope:a4 initialLoad:1];
  if (v4)
  {
    id v5 = [[RMConfigurationsLocalDataProvider alloc] initWithRMUIConfigurationInterface:v4];
    id v6 = [RMConfigurationsSpecifierProvider alloc];
    id v7 = [v4 rmAccount];
    id v8 = [(RMConfigurationsSpecifierProvider *)v6 initWithAccount:v7 rmDataProvider:v5];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

+ (id)localRMUIConfigurationInterfaceForProfileIdentifier:(id)a3 scope:(int64_t)a4 initialLoad:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  v9 = [MEMORY[0x263F53C50] sharedConnection];
  v10 = [v9 unverifiedInstalledMDMProfileIdentifier];

  if ([v8 isEqualToString:v10])
  {
    v11 = [MEMORY[0x263EFB210] defaultStore];
    v12 = objc_msgSend(v11, "dmc_visibleRemoteManagementAccounts");
    v13 = [v12 firstObject];

    id v14 = objc_alloc(MEMORY[0x263F63728]);
    if (v13) {
      uint64_t v15 = [v14 initWithAccount:v13 scope:a4 initialLoad:v5];
    }
    else {
      uint64_t v15 = [v14 initWithMDMProfileIdentifier:v10 scope:a4 initialLoad:v5];
    }
    goto LABEL_7;
  }
  v13 = [a1 _declarationsPayloadIdentifiersForProfileIdentifier:v8];
  if (v13)
  {
    uint64_t v15 = [objc_alloc(MEMORY[0x263F63728]) initWithDeclarationsPayloadIdentifiers:v13 scope:a4 initialLoad:v5];
LABEL_7:
    v16 = (void *)v15;
    goto LABEL_9;
  }
  v16 = 0;
LABEL_9:

  return v16;
}

+ (id)_declarationsPayloadIdentifiersForProfileIdentifier:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [MEMORY[0x263F53C50] sharedConnection];
  BOOL v5 = [v4 installedProfileWithIdentifier:v3];

  if (v5)
  {
    id v6 = objc_opt_new();
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v7 = objc_msgSend(v5, "payloads", 0);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v13 = [v12 identifier];
            [v6 addObject:v13];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v9);
    }

    if ([v6 count]) {
      id v14 = v6;
    }
    else {
      id v14 = 0;
    }
    id v15 = v14;
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

@end
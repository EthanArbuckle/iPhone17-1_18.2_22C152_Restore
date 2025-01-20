@interface MCUIBridgeDataProvider
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

@implementation MCUIBridgeDataProvider

- (BOOL)isProvisionallyEnrolled
{
  return 0;
}

- (BOOL)isPasscodeSet
{
  v2 = [MEMORY[0x1E4F74230] sharedConnection];
  char v3 = [v2 isPasscodeSet];

  return v3;
}

- (id)installedMDMProfileIdentifier
{
  v2 = +[MCUIWatchManager shared];
  char v3 = [v2 cachedMDMProfileIdentifier];

  return v3;
}

- (id)installedProfileWithIdentifier:(id)a3
{
  id v3 = a3;
  v4 = +[MCUIWatchManager shared];
  v5 = [v4 cachedProfileForIdentifier:v3];

  return v5;
}

- (id)payloadsSummaryForProfile:(id)a3 showManagedPayloads:(BOOL)a4
{
  id v4 = a3;
  v5 = +[MCUIWatchManager shared];
  v6 = [v4 identifier];

  v7 = [v5 cachedProfileSummaryForIdentifier:v6];

  return v7;
}

- (id)managedAppsUninstalledOnMDMRemoval
{
  v2 = +[MCUIWatchManager shared];
  id v3 = [v2 managedAppsUninstalledOnMDMRemoval];

  return v3;
}

- (id)rmAccount
{
  v2 = +[MCUIWatchManager shared];
  id v3 = [v2 rmAccount];

  return v3;
}

- (void)updateProfileWithIdentifier:(id)a3 interactionDelegate:(id)a4
{
}

- (void)unenrollWithCompletionBlock:(id)a3
{
}

- (id)rmSpecifierProviderForProfileIdentifier:(id)a3 scope:(int64_t)a4
{
  id v4 = a3;
  v5 = [[MCUIBridgeRMConfigurationsDataProvider alloc] initWithProfileIdentifier:v4];

  v6 = (void *)[objc_alloc(MEMORY[0x1E4F5E6A8]) initWithAccount:0 rmDataProvider:v5];
  return v6;
}

@end
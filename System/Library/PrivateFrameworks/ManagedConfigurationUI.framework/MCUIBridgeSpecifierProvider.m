@interface MCUIBridgeSpecifierProvider
- (id)_emptySpecifier;
- (id)_specifiersForWatchProfiles;
- (id)specifiers;
- (void)loadProfileFromSpecifier:(id)a3;
@end

@implementation MCUIBridgeSpecifierProvider

- (id)specifiers
{
  v14[1] = *MEMORY[0x1E4F143B8];
  v3 = +[MCUIWatchManager shared];
  uint64_t v4 = [v3 fetchStatus];

  if (v4 == 2) {
    goto LABEL_7;
  }
  if (v4 == 1)
  {
    v7 = [(MCUISpecifierProvider *)self delegate];
    v8 = [v7 mcuiViewController];
    v9 = [v8 navigationController];
    id v10 = (id)[v9 popViewControllerAnimated:0];

LABEL_7:
    v5 = [MEMORY[0x1E4F92E70] preferenceSpecifierNamed:0 target:self set:0 get:0 detail:0 cell:15 edit:0];
    [v5 setProperty:MEMORY[0x1E4F1CC28] forKey:*MEMORY[0x1E4F93130]];
    v13 = v5;
    id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v13 count:1];
    goto LABEL_8;
  }
  if (v4) {
    goto LABEL_10;
  }
  v5 = [(MCUIBridgeSpecifierProvider *)self _specifiersForWatchProfiles];
  if (![v5 count])
  {
    v12 = [(MCUIBridgeSpecifierProvider *)self _emptySpecifier];
    v14[0] = v12;
    v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];

    goto LABEL_9;
  }
  id v6 = v5;
  v5 = v6;
LABEL_8:
  v3 = v6;
LABEL_9:

LABEL_10:
  return v3;
}

- (id)_specifiersForWatchProfiles
{
  v3 = objc_opt_new();
  uint64_t v4 = +[MCUIWatchManager shared];
  v5 = [v4 mdmProfilesInfo];
  id v6 = [(MCUISpecifierProvider *)self specifiersForMDMProfiles:v5];

  if (v6) {
    [v3 addObjectsFromArray:v6];
  }
  v7 = +[MCUIWatchManager shared];
  v8 = [v7 configProfilesInfo];
  v9 = [(MCUISpecifierProvider *)self specifiersForInstalledProfiles:v8];

  if (v9) {
    [v3 addObjectsFromArray:v9];
  }

  return v3;
}

- (id)_emptySpecifier
{
  v2 = [MEMORY[0x1E4F92E70] emptyGroupSpecifier];
  v3 = MCUILocalizedString(@"NO_PROFILES_INSTALLED");
  [v2 setProperty:v3 forKey:*MEMORY[0x1E4F93170]];

  return v2;
}

- (void)loadProfileFromSpecifier:(id)a3
{
  id v4 = a3;
  v5 = [v4 propertyForKey:@"MCUIPSItemKey"];
  if (v5)
  {
    id v6 = [(MCUISpecifierProvider *)self delegate];
    v7 = [v6 mcuiViewController];
    [v7 MCUIShowProgressInNavBar];

    objc_initWeak(&location, self);
    v8 = +[MCUIWatchManager shared];
    v9 = [v5 identifier];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __56__MCUIBridgeSpecifierProvider_loadProfileFromSpecifier___block_invoke;
    v10[3] = &unk_1E6EAD850;
    objc_copyWeak(&v11, &location);
    [v8 fetchProfileIdentifier:v9 completion:v10];

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  else
  {
    NSLog(&cfstr_McuiBridgeSpec.isa, v4);
  }
}

void __56__MCUIBridgeSpecifierProvider_loadProfileFromSpecifier___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__MCUIBridgeSpecifierProvider_loadProfileFromSpecifier___block_invoke_2;
  block[3] = &unk_1E6EAD2D0;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  id v10 = v5;
  id v11 = v6;
  id v7 = v6;
  id v8 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v12);
}

void __56__MCUIBridgeSpecifierProvider_loadProfileFromSpecifier___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v9 = WeakRetained;
    v3 = [WeakRetained delegate];
    id v4 = [v3 mcuiViewController];
    [v4 MCUIHideProgressInNavBarShowBackButton:1];

    if (*(void *)(a1 + 32))
    {
      [MEMORY[0x1E4F42728] MCUIShowWatchUnavailableAlertWithCompletion:0];
    }
    else
    {
      id v5 = [[MCRemoveProfileViewController alloc] initWithProfile:*(void *)(a1 + 40)];
      id v6 = [v9 delegate];
      id v7 = [v6 mcuiViewController];
      id v8 = [v7 navigationController];
      [v8 pushViewController:v5 animated:1];
    }
    id WeakRetained = v9;
  }
}

@end
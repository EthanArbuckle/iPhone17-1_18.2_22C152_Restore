@interface FMFSpecifierProvider
- (AAUISpecifierProviderDelegate)delegate;
- (AIDAAccountManager)accountManager;
- (BOOL)isAccountInGrayMode;
- (BOOL)locationServicesDisabledByRestrictions;
- (BOOL)shouldEnableLocationSharingSpecifier;
- (BOOL)shouldShowLocationSharingSpecifier;
- (FMFSpecifierProvider)initWithAccountManager:(id)a3;
- (NSArray)specifiers;
- (void)locationSharingSpecifierWasTapped:(id)a3;
- (void)setAccountManager:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setSpecifiers:(id)a3;
@end

@implementation FMFSpecifierProvider

- (FMFSpecifierProvider)initWithAccountManager:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FMFSpecifierProvider;
  v6 = [(FMFSpecifierProvider *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_accountManager, a3);
  }

  return v7;
}

- (NSArray)specifiers
{
  v17[1] = *MEMORY[0x263EF8340];
  specifiers = self->_specifiers;
  if (!specifiers)
  {
    if ([(FMFSpecifierProvider *)self shouldShowLocationSharingSpecifier])
    {
      v4 = (void *)MEMORY[0x263F5FC40];
      id v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v6 = [v5 localizedStringForKey:@"LOCATION_SHARING" value:&stru_26CA0AD00 table:@"LocalizableUI"];
      v7 = [v4 preferenceSpecifierNamed:v6 target:self set:0 get:0 detail:0 cell:2 edit:0];

      [v7 setControllerLoadAction:sel_locationSharingSpecifierWasTapped_];
      [v7 setIdentifier:@"LOCATION_SHARING"];
      v8 = (void *)MEMORY[0x263F1C6B0];
      objc_super v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v10 = [v8 imageNamed:@"ShareMyLocationIcon" inBundle:v9];

      [v7 setProperty:v10 forKey:*MEMORY[0x263F60140]];
      if ([(FMFSpecifierProvider *)self shouldEnableLocationSharingSpecifier]) {
        uint64_t v11 = MEMORY[0x263EFFA88];
      }
      else {
        uint64_t v11 = MEMORY[0x263EFFA80];
      }
      [v7 setProperty:v11 forKey:*MEMORY[0x263F600A8]];
      v17[0] = v7;
      v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:1];
      v13 = self->_specifiers;
      self->_specifiers = v12;
    }
    else
    {
      v14 = self->_specifiers;
      self->_specifiers = (NSArray *)MEMORY[0x263EFFA68];
    }
    specifiers = self->_specifiers;
  }
  v15 = specifiers;
  return v15;
}

- (void)locationSharingSpecifierWasTapped:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = LogCategory_Daemon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315138;
    objc_super v9 = "-[FMFSpecifierProvider locationSharingSpecifierWasTapped:]";
    _os_log_impl(&dword_2188D1000, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v8, 0xCu);
  }

  v6 = objc_alloc_init(FMFLocationSharingViewController);
  [(FMFLocationSharingViewController *)v6 setSpecifier:v4];

  v7 = [(FMFSpecifierProvider *)self delegate];
  [v7 specifierProvider:self showViewController:v6];
}

- (BOOL)shouldEnableLocationSharingSpecifier
{
  if ([(FMFSpecifierProvider *)self isAccountInGrayMode]) {
    return 0;
  }
  else {
    return ![(FMFSpecifierProvider *)self locationServicesDisabledByRestrictions];
  }
}

- (BOOL)shouldShowLocationSharingSpecifier
{
  v2 = [(FMFSpecifierProvider *)self accountManager];
  v3 = [v2 accounts];
  id v4 = [v3 objectForKeyedSubscript:@"com.apple.AppleID.Service.Cloud"];

  LOBYTE(v2) = [v4 isProvisionedForDataclass:*MEMORY[0x263EFB488]];
  return (char)v2;
}

- (BOOL)locationServicesDisabledByRestrictions
{
  CFPreferencesAppSynchronize(@"com.apple.springboard");
  v2 = (void *)CFPreferencesCopyAppValue(@"SBParentalControlsCapabilities", @"com.apple.springboard");
  char v3 = [v2 containsObject:@"location"];

  return v3;
}

- (BOOL)isAccountInGrayMode
{
  v2 = [(FMFSpecifierProvider *)self accountManager];
  char v3 = [v2 accounts];
  id v4 = [v3 objectForKeyedSubscript:@"com.apple.AppleID.Service.Cloud"];

  if (v4)
  {
    if ((objc_msgSend(v4, "aa_isSuspended") & 1) != 0 || !objc_msgSend(v4, "aa_isPrimaryEmailVerified"))
    {
      BOOL v6 = 1;
    }
    else
    {
      id v5 = objc_msgSend(v4, "aa_repairState");
      BOOL v6 = [v5 unsignedIntegerValue] == 3;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (AAUISpecifierProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AAUISpecifierProviderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void)setSpecifiers:(id)a3
{
}

- (AIDAAccountManager)accountManager
{
  return self->_accountManager;
}

- (void)setAccountManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountManager, 0);
  objc_storeStrong((id *)&self->_specifiers, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
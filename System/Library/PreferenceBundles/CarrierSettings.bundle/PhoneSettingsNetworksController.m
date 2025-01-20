@interface PhoneSettingsNetworksController
- (BOOL)_isInAutomaticMode;
- (BOOL)_isInManualMode;
- (BOOL)shouldReloadSpecifiersOnResume;
- (BOOL)showNetworkList;
- (NSMutableArray)networksSpecifiersArray;
- (NSString)cachedMobileIdentity;
- (PHNetworkFetcher)fetcher;
- (PSSpecifier)automaticSpecifier;
- (PSSpecifier)networksGroupSpecifier;
- (PSSpecifier)searchingSpecifier;
- (PSSpecifier)titleSpecifier;
- (PhoneSettingsNetworksController)init;
- (PhoneSettingsTelephony)telephonySettings;
- (id)descriptionDictionary;
- (id)getAutomaticSwitchStateForSpecifier:(id)a3;
- (int)_currentNetworkSelectionState;
- (void)_autoSwitchTurnedOff;
- (void)_autoSwitchTurnedOn;
- (void)_handleNetworkFetcherErrorNotification:(id)a3;
- (void)_handleNetworkFetcherStateChangedNotification:(id)a3;
- (void)_handleNetworkSettingsDisabledNotification:(id)a3;
- (void)_handleNetworksChangedNotification:(id)a3;
- (void)_handleRadioOffErrorNotification:(id)a3;
- (void)_handleSimChangedNotification:(id)a3;
- (void)_registerEventListeners;
- (void)_setAutomaticSwitchOn:(BOOL)a3 animated:(BOOL)a4;
- (void)_settingsResumed;
- (void)_updateCachedMobileIdentity;
- (void)dealloc;
- (void)listItemSelected:(id)a3;
- (void)setAutomaticSpecifier:(id)a3;
- (void)setAutomaticSwitchState:(id)a3 forSpecifier:(id)a4;
- (void)setCachedMobileIdentity:(id)a3;
- (void)setFetcher:(id)a3;
- (void)setNetworksGroupSpecifier:(id)a3;
- (void)setNetworksSpecifiersArray:(id)a3;
- (void)setSearchingSpecifier:(id)a3;
- (void)setShowNetworkList:(BOOL)a3;
- (void)setTitleSpecifier:(id)a3;
- (void)updateNetworkListSpecifierStates;
- (void)updateNetworkListSpecifiers;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation PhoneSettingsNetworksController

- (PhoneSettingsNetworksController)init
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v17.receiver = self;
  v17.super_class = (Class)PhoneSettingsNetworksController;
  v2 = [(PhoneSettingsNetworksController *)&v17 init];
  if (v2)
  {
    v3 = objc_alloc_init(PhoneSettingsTelephony);
    telephonySettings = v2->_telephonySettings;
    v2->_telephonySettings = v3;

    [(PhoneSettingsNetworksController *)v2 _registerEventListeners];
    v5 = objc_alloc_init(PHNetworkFetcher);
    fetcher = v2->_fetcher;
    v2->_fetcher = v5;

    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    networksSpecifiersArray = v2->_networksSpecifiersArray;
    v2->_networksSpecifiersArray = v7;

    id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
    v10 = [(PhoneSettingsNetworksController *)v2 titleSpecifier];
    [v9 addObject:v10];

    v11 = [(PhoneSettingsNetworksController *)v2 automaticSpecifier];
    [v9 addObject:v11];

    uint64_t v12 = (int)*MEMORY[0x263F5FDB8];
    v13 = *(Class *)((char *)&v2->super.super.super.super.super.super.isa + v12);
    *(Class *)((char *)&v2->super.super.super.super.super.super.isa + v12) = (Class)v9;

    [(PhoneSettingsNetworksController *)v2 _updateCachedMobileIdentity];
    v14 = PHDefaultLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = [(PhoneSettingsNetworksController *)v2 descriptionDictionary];
      *(_DWORD *)buf = 138412290;
      v19 = v15;
      _os_log_impl(&dword_22C120000, v14, OS_LOG_TYPE_DEFAULT, "Initializing Phone Settings Network Controller: %@", buf, 0xCu);
    }
  }
  return v2;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)PhoneSettingsNetworksController;
  [(PSListItemsController *)&v4 dealloc];
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)PhoneSettingsNetworksController;
  [(PSListItemsController *)&v6 viewDidLoad];
  v3 = [(PhoneSettingsNetworksController *)self navigationItem];
  objc_super v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v5 = [v4 localizedStringForKey:@"Network Selection" value:&stru_26DF94838 table:@"Carrier"];
  [v3 setTitle:v5];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PhoneSettingsNetworksController;
  [(PSListItemsController *)&v4 viewWillAppear:a3];
  if ([(PhoneSettingsNetworksController *)self _isInManualMode]) {
    [(PhoneSettingsNetworksController *)self setShowNetworkList:1];
  }
}

- (BOOL)shouldReloadSpecifiersOnResume
{
  return 0;
}

- (void)listItemSelected:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = PHDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138412290;
    id v18 = v4;
    _os_log_impl(&dword_22C120000, v5, OS_LOG_TYPE_DEFAULT, "IndexPath selected: %@", (uint8_t *)&v17, 0xCu);
  }

  if ([v4 section] == 1)
  {
    uint64_t v6 = [v4 row];
    v7 = [(PhoneSettingsNetworksController *)self searchingSpecifier];
    unsigned int v8 = [(PhoneSettingsNetworksController *)self containsSpecifier:v7];

    uint64_t v9 = v6 - v8;
    if (v9 < 0
      || ([(PhoneSettingsNetworksController *)self fetcher],
          v10 = objc_claimAutoreleasedReturnValue(),
          [v10 networks],
          v11 = objc_claimAutoreleasedReturnValue(),
          unint64_t v12 = [v11 count],
          v11,
          v10,
          v9 >= v12))
    {
      v15 = PHDefaultLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        -[PhoneSettingsNetworksController listItemSelected:](v9, v15);
      }
    }
    else
    {
      v13 = [(PhoneSettingsNetworksController *)self fetcher];
      v14 = [v13 networks];
      v15 = [v14 objectAtIndex:v9];

      v16 = [(PhoneSettingsNetworksController *)self fetcher];
      [v16 selectNetwork:v15];
    }
  }
}

- (void)_handleRadioOffErrorNotification:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = PHDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [v4 name];
    v7 = [(PhoneSettingsNetworksController *)self descriptionDictionary];
    int v8 = 138412546;
    uint64_t v9 = v6;
    __int16 v10 = 2112;
    v11 = v7;
    _os_log_impl(&dword_22C120000, v5, OS_LOG_TYPE_DEFAULT, "%@: %@", (uint8_t *)&v8, 0x16u);
  }
  [(PhoneSettingsNetworksController *)self popRecursivelyToRootController];
}

- (void)_handleSimChangedNotification:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = PHDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [v4 name];
    v7 = [(PhoneSettingsNetworksController *)self descriptionDictionary];
    int v10 = 138412546;
    v11 = v6;
    __int16 v12 = 2112;
    v13 = v7;
    _os_log_impl(&dword_22C120000, v5, OS_LOG_TYPE_DEFAULT, "%@: %@", (uint8_t *)&v10, 0x16u);
  }
  int v8 = [(PhoneSettingsNetworksController *)self telephonySettings];
  char v9 = [v8 simIsPresent];

  if ((v9 & 1) == 0) {
    [(PhoneSettingsNetworksController *)self popRecursivelyToRootController];
  }
}

- (void)_handleNetworkSettingsDisabledNotification:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = PHDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [v4 name];
    v7 = [(PhoneSettingsNetworksController *)self descriptionDictionary];
    int v8 = 138412546;
    char v9 = v6;
    __int16 v10 = 2112;
    v11 = v7;
    _os_log_impl(&dword_22C120000, v5, OS_LOG_TYPE_DEFAULT, "%@: %@", (uint8_t *)&v8, 0x16u);
  }
  [(PhoneSettingsNetworksController *)self popRecursivelyToRootController];
}

- (void)_handleNetworksChangedNotification:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = PHDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [v4 name];
    int v7 = 138412290;
    int v8 = v6;
    _os_log_impl(&dword_22C120000, v5, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v7, 0xCu);
  }
  [(PhoneSettingsNetworksController *)self updateNetworkListSpecifiers];
}

- (void)_handleNetworkFetcherStateChangedNotification:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = PHDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [v4 name];
    int v14 = 138412290;
    v15 = v6;
    _os_log_impl(&dword_22C120000, v5, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v14, 0xCu);
  }
  int v7 = [(PhoneSettingsNetworksController *)self fetcher];
  if ([v7 state] == 1)
  {
    int v8 = [(PhoneSettingsNetworksController *)self searchingSpecifier];
    int v9 = [(PhoneSettingsNetworksController *)self containsSpecifier:v8];

    if (v9)
    {
      __int16 v10 = [(PhoneSettingsNetworksController *)self searchingSpecifier];
      [(PhoneSettingsNetworksController *)self removeSpecifier:v10 animated:1];
LABEL_11:

      goto LABEL_12;
    }
  }
  else
  {
  }
  __int16 v10 = [(PhoneSettingsNetworksController *)self fetcher];
  if ([v10 state] != 2 || !-[PhoneSettingsNetworksController showNetworkList](self, "showNetworkList")) {
    goto LABEL_11;
  }
  v11 = [(PhoneSettingsNetworksController *)self searchingSpecifier];
  char v12 = [(PhoneSettingsNetworksController *)self containsSpecifier:v11];

  if ((v12 & 1) == 0)
  {
    __int16 v10 = [(PhoneSettingsNetworksController *)self searchingSpecifier];
    v13 = [(PhoneSettingsNetworksController *)self networksGroupSpecifier];
    [(PhoneSettingsNetworksController *)self insertSpecifier:v10 afterSpecifier:v13];

    goto LABEL_11;
  }
LABEL_12:
}

- (void)_autoSwitchTurnedOn
{
  if (![(PhoneSettingsNetworksController *)self _isInAutomaticMode])
  {
    v3 = [(PhoneSettingsNetworksController *)self telephonySettings];
    [v3 enableAutomaticNetworkSelection];
  }

  [(PhoneSettingsNetworksController *)self setShowNetworkList:0];
}

- (void)_autoSwitchTurnedOff
{
}

- (void)setShowNetworkList:(BOOL)a3
{
  if (self->_showNetworkList != a3)
  {
    BOOL v3 = a3;
    if (a3)
    {
      v5 = [(PhoneSettingsNetworksController *)self fetcher];
      [v5 fetchNetworkList];
    }
    [(PhoneSettingsNetworksController *)self updateNetworkListSpecifiers];
    [(PhoneSettingsNetworksController *)self updateNetworkListSpecifierStates];
    id v12 = [MEMORY[0x263EFF980] array];
    uint64_t v6 = [(PhoneSettingsNetworksController *)self networksGroupSpecifier];
    [v12 addObject:v6];

    int v7 = [(PhoneSettingsNetworksController *)self fetcher];
    uint64_t v8 = [v7 state];

    if (v8 == 2)
    {
      int v9 = [(PhoneSettingsNetworksController *)self searchingSpecifier];
      [v12 addObject:v9];

      __int16 v10 = [(PSSpecifier *)self->_searchingSpecifier propertyForKey:*MEMORY[0x263F602B0]];
      [v10 setLoading:1];
    }
    v11 = [(PhoneSettingsNetworksController *)self networksSpecifiersArray];
    [v12 addObjectsFromArray:v11];

    if (v3) {
      [(PhoneSettingsNetworksController *)self addSpecifiersFromArray:v12 animated:1];
    }
    else {
      [(PhoneSettingsNetworksController *)self removeContiguousSpecifiers:v12 animated:1];
    }
    self->_showNetworkList = v3;
  }
}

- (void)updateNetworkListSpecifiers
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  BOOL v3 = [MEMORY[0x263EFF980] array];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v18 = self;
  id v4 = [(PhoneSettingsNetworksController *)self fetcher];
  v5 = [v4 networks];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    uint64_t v9 = *MEMORY[0x263F5FFE0];
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        v11 = (void *)MEMORY[0x263F5FC40];
        id v12 = [*(id *)(*((void *)&v19 + 1) + 8 * i) displayName];
        v13 = [v11 preferenceSpecifierNamed:v12 target:0 set:0 get:0 detail:0 cell:3 edit:0];

        [v13 setProperty:objc_opt_class() forKey:v9];
        [v3 addObject:v13];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v25 count:16];
    }
    while (v7);
  }

  int v14 = PHDefaultLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v24 = v3;
    _os_log_impl(&dword_22C120000, v14, OS_LOG_TYPE_DEFAULT, "Updating Carrier Specifiers with list: %@", buf, 0xCu);
  }

  if ([(PhoneSettingsNetworksController *)v18 showNetworkList])
  {
    v15 = [(PhoneSettingsNetworksController *)v18 networksSpecifiersArray];
    uint64_t v16 = [v15 count];

    if (v16)
    {
      int v17 = [(PhoneSettingsNetworksController *)v18 networksSpecifiersArray];
      [(PhoneSettingsNetworksController *)v18 replaceContiguousSpecifiers:v17 withSpecifiers:v3];
    }
    else
    {
      [(PhoneSettingsNetworksController *)v18 addSpecifiersFromArray:v3 animated:1];
    }
  }
  [(PhoneSettingsNetworksController *)v18 setNetworksSpecifiersArray:v3];
}

- (void)updateNetworkListSpecifierStates
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  BOOL v3 = PHDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22C120000, v3, OS_LOG_TYPE_DEFAULT, "Updating list specifier states", buf, 2u);
  }

  id v4 = [(PhoneSettingsNetworksController *)self fetcher];
  v5 = [v4 networks];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    unint64_t v8 = 0;
    *(void *)&long long v7 = 138412290;
    long long v24 = v7;
    uint64_t v9 = (int *)MEMORY[0x263F5FDD0];
    do
    {
      __int16 v10 = [(PhoneSettingsNetworksController *)self fetcher];
      v11 = [v10 networks];
      id v12 = [v11 objectAtIndexedSubscript:v8];

      v13 = PHDefaultLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = v24;
        uint64_t v26 = v12;
        _os_log_impl(&dword_22C120000, v13, OS_LOG_TYPE_DEFAULT, "Updating list specifier for network: %@", buf, 0xCu);
      }

      int v14 = [(PhoneSettingsNetworksController *)self searchingSpecifier];
      unsigned int v15 = [(PhoneSettingsNetworksController *)self containsSpecifier:v14];

      unint64_t v16 = v8 + v15;
      int v17 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + *v9);
      BOOL v18 = 1;
      long long v19 = [MEMORY[0x263F088C8] indexPathForRow:v16 inSection:1];
      long long v20 = [v17 cellForRowAtIndexPath:v19];

      if ([v12 state] != 3) {
        BOOL v18 = [v12 state] == 2;
      }
      [v20 setReallyChecked:v18];

      ++v8;
      long long v21 = [(PhoneSettingsNetworksController *)self fetcher];
      long long v22 = [v21 networks];
      unint64_t v23 = [v22 count];
    }
    while (v23 > v8);
  }
}

- (void)_handleNetworkFetcherErrorNotification:(id)a3
{
  id v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v10 = [v4 localizedStringForKey:@"LIST_LOAD_ERROR" value:&stru_26DF94838 table:@"Carrier"];

  v5 = [MEMORY[0x263F1C3F8] alertControllerWithTitle:v10 message:v10 preferredStyle:1];
  uint64_t v6 = (void *)MEMORY[0x263F1C3F0];
  long long v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  unint64_t v8 = [v7 localizedStringForKey:@"OK" value:&stru_26DF94838 table:@"Carrier"];
  uint64_t v9 = [v6 actionWithTitle:v8 style:0 handler:0];
  [v5 addAction:v9];

  [(PhoneSettingsNetworksController *)self presentViewController:v5 animated:1 completion:0];
}

- (id)descriptionDictionary
{
  BOOL v3 = [(PhoneSettingsNetworksController *)self telephonySettings];
  id v4 = [v3 manuallySelectedNetworkDictionary];

  v5 = NSDictionary;
  if (v4) {
    uint64_t v6 = v4;
  }
  else {
    uint64_t v6 = @"--Nil--";
  }
  long long v7 = NSNumber;
  unint64_t v8 = [(PhoneSettingsNetworksController *)self telephonySettings];
  uint64_t v9 = objc_msgSend(v7, "numberWithInt:", objc_msgSend(v8, "networkSelectionMode"));
  id v10 = (void *)CTRegistrationCopyLocalizedOperatorName();
  v11 = objc_msgSend(v5, "dictionaryWithObjectsAndKeys:", v6, @"ManuallySelectedNetworkDictionary", v9, @"NetworkSelectionMode", v10, @"CTRegistrationCopyLocalizedOperatorName", CTRegistrationGetStatus(), @"CTRegistrationGetStatus", 0);
  id v12 = [v5 dictionaryWithObject:v11 forKey:@"PhoneSettingsNetworkState"];

  return v12;
}

- (void)_registerEventListeners
{
  [(PhoneSettingsTelephony *)self->_telephonySettings startWatching];
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 addObserver:self selector:sel__handleRadioOffErrorNotification_ name:@"SettingsTelephonyRadioModuleOffErrorNotification" object:self->_telephonySettings];
  [v3 addObserver:self selector:sel__handleSimChangedNotification_ name:@"SettingsTelephonySIMRemoved" object:self->_telephonySettings];
  [v3 addObserver:self selector:sel__handleNetworkSettingsDisabledNotification_ name:@"SettingsTelephonyNetworkSettingsDisabledNotification" object:self->_telephonySettings];
  [v3 addObserver:self selector:sel__handleNetworksChangedNotification_ name:@"PHNetworkFetcherNetworksChangedNotification" object:0];
  [v3 addObserver:self selector:sel__handleNetworkFetcherStateChangedNotification_ name:@"PHNetworkFetcherStateChangedNotification" object:0];
  [v3 addObserver:self selector:sel__handleNetworkFetcherNetworkSelectionStateChangedNotification_ name:@"PHNetworkFetcherNetworkSelectionChangedNotification" object:0];
  [v3 addObserver:self selector:sel__handleNetworkFetcherErrorNotification_ name:@"PHNetworkFetcherErrorNotification" object:0];
  [v3 addObserver:self selector:sel__settingsResumed name:*MEMORY[0x263F1D0D0] object:0];
}

- (void)setAutomaticSwitchState:(id)a3 forSpecifier:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PhoneSettingsNetworksController *)self automaticSpecifier];

  if (v8 == v7)
  {
    int v9 = [v6 BOOLValue];
    id v10 = PHDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = @"NO";
      if (v9) {
        v11 = @"YES";
      }
      int v12 = 138412290;
      v13 = v11;
      _os_log_impl(&dword_22C120000, v10, OS_LOG_TYPE_DEFAULT, "Setting automatic switch to %@", (uint8_t *)&v12, 0xCu);
    }

    if (v9) {
      [(PhoneSettingsNetworksController *)self _autoSwitchTurnedOn];
    }
    else {
      [(PhoneSettingsNetworksController *)self _autoSwitchTurnedOff];
    }
  }
}

- (id)getAutomaticSwitchStateForSpecifier:(id)a3
{
  id v4 = a3;
  id v5 = [(PhoneSettingsNetworksController *)self automaticSpecifier];

  BOOL v6 = v5 == v4 && [(PhoneSettingsNetworksController *)self _isInAutomaticMode];
  id v7 = [NSNumber numberWithBool:v6];

  return v7;
}

- (void)_setAutomaticSwitchOn:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v15 = *MEMORY[0x263EF8340];
  BOOL v6 = [(PhoneSettingsNetworksController *)self automaticSpecifier];
  id v7 = [v6 propertyForKey:*MEMORY[0x263F602B0]];
  id v8 = [v7 control];
  int v9 = PHDefaultLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = @"NO";
    if (v5) {
      id v10 = @"YES";
    }
    int v11 = 138412546;
    int v12 = v8;
    __int16 v13 = 2112;
    uint64_t v14 = v10;
    _os_log_impl(&dword_22C120000, v9, OS_LOG_TYPE_DEFAULT, "Updating automatic switch UI %@ to %@", (uint8_t *)&v11, 0x16u);
  }

  [v8 setOn:v5 animated:v4];
}

- (BOOL)_isInAutomaticMode
{
  v2 = [(PhoneSettingsNetworksController *)self telephonySettings];
  int v3 = [v2 networkSelectionMode];

  return v3 == 0;
}

- (BOOL)_isInManualMode
{
  v2 = [(PhoneSettingsNetworksController *)self telephonySettings];
  int v3 = [v2 networkSelectionMode];

  return v3 == 1;
}

- (int)_currentNetworkSelectionState
{
  v2 = [(PhoneSettingsNetworksController *)self telephonySettings];
  int v3 = [v2 currentNetworkSelectionState];

  return v3;
}

- (void)_settingsResumed
{
  BOOL v4 = (void *)[(NSString *)self->_cachedMobileIdentity copy];
  uint64_t v3 = [(PhoneSettingsNetworksController *)self _updateCachedMobileIdentity];
  if (v4)
  {
    uint64_t v3 = [v4 isEqualToString:self->_cachedMobileIdentity];
    if ((v3 & 1) == 0)
    {
      uint64_t v3 = [(PhoneSettingsNetworksController *)self isViewLoaded];
      if (v3) {
        uint64_t v3 = [(PhoneSettingsNetworksController *)self popRecursivelyToRootController];
      }
    }
  }

  MEMORY[0x270F9A758](v3);
}

- (void)_updateCachedMobileIdentity
{
  uint64_t v3 = (const void *)_CTServerConnectionCreate();
  cachedMobileIdentity = self->_cachedMobileIdentity;
  self->_cachedMobileIdentity = 0;

  if (v3)
  {
    _CTServerConnectionCopyMobileEquipmentInfo();
    CFRelease(v3);
  }
}

- (PSSpecifier)titleSpecifier
{
  titleSpecifier = self->_titleSpecifier;
  if (!titleSpecifier)
  {
    BOOL v4 = (void *)MEMORY[0x263F5FC40];
    BOOL v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    BOOL v6 = [v5 localizedStringForKey:@"CARRIER_LIST_TITLE" value:&stru_26DF94838 table:@"Carrier"];
    id v7 = [v4 groupSpecifierWithName:v6];
    id v8 = self->_titleSpecifier;
    self->_titleSpecifier = v7;

    [(PSSpecifier *)self->_titleSpecifier setProperty:objc_opt_class() forKey:*MEMORY[0x263F5FFE0]];
    titleSpecifier = self->_titleSpecifier;
  }

  return titleSpecifier;
}

- (PSSpecifier)automaticSpecifier
{
  automaticSpecifier = self->_automaticSpecifier;
  if (!automaticSpecifier)
  {
    BOOL v4 = (void *)MEMORY[0x263F5FC40];
    BOOL v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    BOOL v6 = [v5 localizedStringForKey:@"Automatic" value:&stru_26DF94838 table:@"Carrier"];
    id v7 = [v4 preferenceSpecifierNamed:v6 target:self set:sel_setAutomaticSwitchState_forSpecifier_ get:sel_getAutomaticSwitchStateForSpecifier_ detail:0 cell:6 edit:0];
    id v8 = self->_automaticSpecifier;
    self->_automaticSpecifier = v7;

    automaticSpecifier = self->_automaticSpecifier;
  }

  return automaticSpecifier;
}

- (PSSpecifier)searchingSpecifier
{
  searchingSpecifier = self->_searchingSpecifier;
  if (!searchingSpecifier)
  {
    BOOL v4 = (void *)MEMORY[0x263F5FC40];
    BOOL v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    BOOL v6 = [v5 localizedStringForKey:@"SEARCHING" value:&stru_26DF94838 table:@"Carrier"];
    id v7 = [v4 preferenceSpecifierNamed:v6 target:self set:0 get:0 detail:0 cell:4 edit:0];
    id v8 = self->_searchingSpecifier;
    self->_searchingSpecifier = v7;

    [(PSSpecifier *)self->_searchingSpecifier setProperty:*MEMORY[0x263EFFB38] forKey:*MEMORY[0x263F600A8]];
    [(PSSpecifier *)self->_searchingSpecifier setProperty:objc_opt_class() forKey:*MEMORY[0x263F5FFE0]];
    searchingSpecifier = self->_searchingSpecifier;
  }

  return searchingSpecifier;
}

- (PSSpecifier)networksGroupSpecifier
{
  networksGroupSpecifier = self->_networksGroupSpecifier;
  if (!networksGroupSpecifier)
  {
    BOOL v4 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
    BOOL v5 = self->_networksGroupSpecifier;
    self->_networksGroupSpecifier = v4;

    networksGroupSpecifier = self->_networksGroupSpecifier;
  }

  return networksGroupSpecifier;
}

- (PhoneSettingsTelephony)telephonySettings
{
  return self->_telephonySettings;
}

- (PHNetworkFetcher)fetcher
{
  return (PHNetworkFetcher *)objc_getProperty(self, a2, 1432, 1);
}

- (void)setFetcher:(id)a3
{
}

- (BOOL)showNetworkList
{
  return self->_showNetworkList;
}

- (void)setTitleSpecifier:(id)a3
{
}

- (void)setAutomaticSpecifier:(id)a3
{
}

- (void)setNetworksGroupSpecifier:(id)a3
{
}

- (void)setSearchingSpecifier:(id)a3
{
}

- (NSMutableArray)networksSpecifiersArray
{
  return (NSMutableArray *)objc_getProperty(self, a2, 1472, 1);
}

- (void)setNetworksSpecifiersArray:(id)a3
{
}

- (NSString)cachedMobileIdentity
{
  return (NSString *)objc_getProperty(self, a2, 1480, 1);
}

- (void)setCachedMobileIdentity:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedMobileIdentity, 0);
  objc_storeStrong((id *)&self->_networksSpecifiersArray, 0);
  objc_storeStrong((id *)&self->_searchingSpecifier, 0);
  objc_storeStrong((id *)&self->_networksGroupSpecifier, 0);
  objc_storeStrong((id *)&self->_automaticSpecifier, 0);
  objc_storeStrong((id *)&self->_titleSpecifier, 0);
  objc_storeStrong((id *)&self->_fetcher, 0);

  objc_storeStrong((id *)&self->_telephonySettings, 0);
}

- (void)listItemSelected:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_22C120000, a2, OS_LOG_TYPE_ERROR, "No network found at index %ld", (uint8_t *)&v2, 0xCu);
}

@end
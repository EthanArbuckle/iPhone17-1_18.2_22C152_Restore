@interface CSAccountController
- (CSAccountController)init;
- (id)_accessLevelStringForSpecifier:(id)a3;
- (id)_valueForAccountEnabledness:(id)a3;
- (id)specifiers;
- (id)specifiersForAccountsICanAccess;
- (id)specifiersForAccountsWithGrantedAccess;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (void)_updateSpecifierSubtitle:(id)a3;
- (void)accountRefreshFinished:(id)a3;
- (void)cleanupAccountRefresher;
- (void)didModifyDelegate:(id)a3;
- (void)reloadDelegateSources;
- (void)reloadGrantedDelegates;
- (void)setSpecifier:(id)a3;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation CSAccountController

- (CSAccountController)init
{
  v7.receiver = self;
  v7.super_class = (Class)CSAccountController;
  v2 = [(CSAccountController *)&v7 init];
  if (v2)
  {
    v3 = (EKEventStore *)[objc_alloc((Class)EKEventStore) initWithEKOptions:64 path:0 changeTrackingClientId:0 enablePropertyModificationLogging:1 allowDelegateSources:1];
    eventStore = v2->_eventStore;
    v2->_eventStore = v3;

    v5 = +[NSNotificationCenter defaultCenter];
    [v5 addObserver:v2 selector:"eventStoreChanged:" name:EKEventStoreChangedNotification object:0];
  }
  return v2;
}

- (void)viewDidAppear:(BOOL)a3
{
  v16.receiver = self;
  v16.super_class = (Class)CSAccountController;
  [(CSAccountController *)&v16 viewDidAppear:a3];
  if ([*(id *)&self->PSListController_opaque[OBJC_IVAR___PSViewController__specifier] isEqual:@"DELEGATE_CALENDARS"])
  {
    v4 = +[NSURL URLWithString:@"settings-navigation://com.apple.Settings.Apps/com.apple.mobilecal/DELEGATE_CALENDARS"];
    id v5 = objc_alloc((Class)_NSLocalizedStringResource);
    v6 = +[NSLocale currentLocale];
    objc_super v7 = +[NSBundle bundleForClass:objc_opt_class()];
    v8 = [v7 bundleURL];
    id v9 = [v5 initWithKey:@"Delegate Calendars" table:@"MobileCalSettings" locale:v6 bundleURL:v8];

    id v10 = objc_alloc((Class)_NSLocalizedStringResource);
    v11 = +[NSLocale currentLocale];
    v12 = +[NSBundle bundleForClass:objc_opt_class()];
    v13 = [v12 bundleURL];
    id v14 = [v10 initWithKey:@"Calendar" table:@"MobileCalSettings" locale:v11 bundleURL:v13];

    id v17 = v14;
    v15 = +[NSArray arrayWithObjects:&v17 count:1];
    [(CSAccountController *)self pe_emitNavigationEventForApplicationSettingsWithApplicationBundleIdentifier:@"com.apple.mobilecal" title:v9 localizedNavigationComponents:v15 deepLink:v4];
  }
}

- (void)setSpecifier:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)CSAccountController;
  id v4 = a3;
  [(CSAccountController *)&v12 setSpecifier:v4];
  objc_msgSend(v4, "propertyForKey:", @"CSSourceKey", v12.receiver, v12.super_class);
  id v5 = (EKSource *)objc_claimAutoreleasedReturnValue();
  ownerSource = self->_ownerSource;
  self->_ownerSource = v5;

  objc_super v7 = [v4 propertyForKey:@"CSPresentedFromDisambiguationControllerKey"];

  LODWORD(v4) = [v7 BOOLValue];
  if (v4)
  {
    v8 = CUIKDisplayedTitleForSource();
    id v9 = [(CSAccountController *)self navigationItem];
    [v9 setTitle:v8];
  }
  [(CSAccountController *)self cleanupAccountRefresher];
  id v10 = (EKAccountRefresher *)[objc_alloc((Class)EKAccountRefresher) initWithEventStore:self->_eventStore];
  currentAccountRefresher = self->_currentAccountRefresher;
  self->_currentAccountRefresher = v10;

  [(EKAccountRefresher *)self->_currentAccountRefresher setDelegate:self];
  [(EKAccountRefresher *)self->_currentAccountRefresher refresh];
  [(CSAccountController *)self reloadGrantedDelegates];
  [(CSAccountController *)self reloadDelegateSources];
}

- (void)cleanupAccountRefresher
{
  [(EKAccountRefresher *)self->_currentAccountRefresher setDelegate:0];
  currentAccountRefresher = self->_currentAccountRefresher;
  self->_currentAccountRefresher = 0;
}

- (void)accountRefreshFinished:(id)a3
{
  [(CSAccountController *)self reloadDelegateSources];

  [(CSAccountController *)self cleanupAccountRefresher];
}

- (void)reloadGrantedDelegates
{
  self->_loadingGrantedDelegates = 1;
  eventStore = self->_eventStore;
  ownerSource = self->_ownerSource;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_B38C;
  v4[3] = &unk_1CAE0;
  v4[4] = self;
  [(EKEventStore *)eventStore fetchGrantedDelegatesForSource:ownerSource results:v4];
}

- (void)reloadDelegateSources
{
  v3 = [(EKEventStore *)self->_eventStore delegateSourcesForSource:self->_ownerSource];
  id v4 = [v3 sortedArrayUsingComparator:&stru_1CB20];
  accountsICanAccess = self->_accountsICanAccess;
  self->_accountsICanAccess = v4;

  [(CSAccountController *)self reloadSpecifiers];
}

- (id)specifiersForAccountsICanAccess
{
  id v13 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSArray count](self->_accountsICanAccess, "count"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  obj = self->_accountsICanAccess;
  id v3 = [(NSArray *)obj countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v15;
    uint64_t v6 = PSCellClassKey;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v15 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        id v9 = CUIKDisplayedTitleForSource();
        id v10 = +[PSSpecifier preferenceSpecifierNamed:v9 target:self set:0 get:"_valueForAccountEnabledness:" detail:objc_opt_class() cell:2 edit:0];

        [v10 setProperty:v8 forKey:@"CSSourceKey"];
        [v10 setProperty:objc_opt_class() forKey:v6];
        [(CSAccountController *)self _updateSpecifierSubtitle:v10];
        [v13 addObject:v10];
      }
      id v4 = [(NSArray *)obj countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v4);
  }

  return v13;
}

- (void)_updateSpecifierSubtitle:(id)a3
{
  id v3 = a3;
  id v9 = [v3 propertyForKey:@"CSSourceKey"];
  unsigned int v4 = [v9 isWritable];
  uint64_t v5 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v6 = v5;
  if (v4) {
    CFStringRef v7 = @"View & Edit";
  }
  else {
    CFStringRef v7 = @"View Only";
  }
  uint64_t v8 = [v5 localizedStringForKey:v7 value:&stru_1CE38 table:@"MobileCalSettings"];
  [v3 setProperty:v8 forKey:PSTableCellSubtitleTextKey];
}

- (id)_valueForAccountEnabledness:(id)a3
{
  id v3 = [a3 propertyForKey:@"CSSourceKey"];
  unsigned int v4 = [v3 isEnabled];
  uint64_t v5 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v6 = v5;
  if (v4) {
    CFStringRef v7 = @"On";
  }
  else {
    CFStringRef v7 = @"Off";
  }
  uint64_t v8 = [v5 localizedStringForKey:v7 value:&stru_1CE38 table:@"MobileCalSettings"];

  return v8;
}

- (id)specifiersForAccountsWithGrantedAccess
{
  id v12 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSArray count](self->_accountsWithGrantedAccess, "count"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  obj = self->_accountsWithGrantedAccess;
  id v3 = [(NSArray *)obj countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v11 = *(void *)v14;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        CFStringRef v7 = [v6 displayName];
        uint64_t v8 = +[PSSpecifier preferenceSpecifierNamed:v7 target:self set:0 get:"_accessLevelStringForSpecifier:" detail:objc_opt_class() cell:2 edit:0];

        [v8 setProperty:v6 forKey:@"CSGrantedDelegateKey"];
        [v8 setProperty:self->_ownerSource forKey:@"CSSourceKey"];
        [v8 setProperty:self forKey:@"CSDelegateClassInstanceKey"];
        [v12 addObject:v8];
      }
      id v4 = [(NSArray *)obj countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v4);
  }

  return v12;
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  id v4 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    uint64_t v5 = +[NSMutableArray array];
    uint64_t v6 = +[NSBundle bundleForClass:objc_opt_class()];
    self->_accountsWithGrantedAccessSection = 0;
    self->_accountsICanAccessSection = 1;
    CFStringRef v7 = [v6 localizedStringForKey:@"Accounts with access to me group title" value:@"Allow access to my calendar:" table:@"MobileCalSettings"];
    uint64_t v8 = +[PSSpecifier groupSpecifierWithName:v7];

    id v9 = [v6 localizedStringForKey:@"Accounts with access to me explanatory note" value:@"Manage who has access to your calendars." table:@"MobileCalSettings"];
    uint64_t v10 = PSFooterTextGroupKey;
    [v8 setProperty:v9 forKey:PSFooterTextGroupKey];

    [v5 addObject:v8];
    uint64_t v11 = [(CSAccountController *)self specifiersForAccountsWithGrantedAccess];
    [v5 addObjectsFromArray:v11];

    if (self->_loadingGrantedDelegates && ![(NSArray *)self->_accountsWithGrantedAccess count])
    {
      self->_isShowingLoadingCell = 1;
      uint64_t v12 = +[PSSpecifier preferenceSpecifierNamed:0 target:0 set:0 get:0 detail:0 cell:15 edit:0];

      [v5 addObject:v12];
      uint64_t v8 = (void *)v12;
    }
    else
    {
      self->_isShowingLoadingCell = 0;
    }
    long long v13 = [v6 localizedStringForKey:@"New button title" value:@"Add Person" table:@"MobileCalSettings"];
    long long v14 = +[PSSpecifier preferenceSpecifierNamed:v13 target:self set:0 get:0 detail:objc_opt_class() cell:2 edit:0];

    [v14 setProperty:self->_ownerSource forKey:@"CSSourceKey"];
    [v14 setProperty:self forKey:@"CSParentControllerKey"];
    [v5 addObject:v14];
    long long v15 = [v6 localizedStringForKey:@"Accounts I can access group title" value:@"Accounts I can access:" table:@"MobileCalSettings"];
    long long v16 = +[PSSpecifier groupSpecifierWithName:v15];

    if ([(NSArray *)self->_accountsICanAccess count])
    {
      CFStringRef v17 = @"Accounts I can access explanatory note";
      CFStringRef v18 = @"Use the Calendar app to show or hide calendars for the accounts you have turned on.";
    }
    else
    {
      CFStringRef v17 = @"No accounts I can access explanatory note";
      CFStringRef v18 = @"No accounts have granted you access to read or manage their calendars.";
    }
    v19 = [v6 localizedStringForKey:v17 value:v18 table:@"MobileCalSettings"];
    [v16 setProperty:v19 forKey:v10];

    [v5 addObject:v16];
    v20 = [(CSAccountController *)self specifiersForAccountsICanAccess];
    [v5 addObjectsFromArray:v20];

    v21 = *(void **)&self->PSListController_opaque[v3];
    *(void *)&self->PSListController_opaque[v3] = v5;

    id v4 = *(void **)&self->PSListController_opaque[v3];
  }

  return v4;
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  if ([v5 section] == self->_accountsWithGrantedAccessSection && !self->_isShowingLoadingCell)
  {
    id v7 = [v5 row];
    int64_t v6 = v7 != (id)[(NSArray *)self->_accountsWithGrantedAccess count];
  }
  else
  {
    int64_t v6 = 0;
  }

  return v6;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  id v7 = a5;
  uint64_t v8 = v7;
  if (a4 == 1 && [v7 section] == self->_accountsWithGrantedAccessSection)
  {
    id v9 = [(CSAccountController *)self specifierAtIndexPath:v8];
    uint64_t v10 = [v9 propertyForKey:@"CSGrantedDelegateKey"];

    [v10 setPermission:0];
    eventStore = self->_eventStore;
    ownerSource = self->_ownerSource;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_C100;
    v15[3] = &unk_1C900;
    v15[4] = self;
    [(EKEventStore *)eventStore updateGrantedDelegate:v10 action:2 source:ownerSource completion:v15];
    long long v13 = +[NSMutableArray arrayWithArray:self->_accountsWithGrantedAccess];
    -[NSArray removeObjectAtIndex:](v13, "removeObjectAtIndex:", [v8 row]);
    accountsWithGrantedAccess = self->_accountsWithGrantedAccess;
    self->_accountsWithGrantedAccess = v13;

    [(CSAccountController *)self reloadSpecifiers];
  }
}

- (id)_accessLevelStringForSpecifier:(id)a3
{
  uint64_t v3 = [a3 propertyForKey:@"CSGrantedDelegateKey"];
  if ([v3 permission] == (char *)&dword_0 + 1)
  {
    id v4 = +[NSBundle bundleForClass:objc_opt_class()];
    id v5 = v4;
    CFStringRef v6 = @"View Only";
LABEL_5:
    id v7 = [v4 localizedStringForKey:v6 value:&stru_1CE38 table:@"MobileCalSettings"];

    goto LABEL_7;
  }
  if ([v3 permission] == (char *)&dword_0 + 2)
  {
    id v4 = +[NSBundle bundleForClass:objc_opt_class()];
    id v5 = v4;
    CFStringRef v6 = @"View & Edit";
    goto LABEL_5;
  }
  id v7 = 0;
LABEL_7:

  return v7;
}

- (void)didModifyDelegate:(id)a3
{
  id v4 = a3;
  accountsWithGrantedAccess = self->_accountsWithGrantedAccess;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_C3D8;
  v15[3] = &unk_1CB48;
  id v6 = v4;
  id v16 = v6;
  id v7 = [(NSArray *)accountsWithGrantedAccess indexOfObjectPassingTest:v15];
  if (v7 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v8 = [(NSArray *)self->_accountsWithGrantedAccess arrayByAddingObject:v6];
    id v9 = [v8 sortedArrayUsingComparator:&stru_1CA90];
    uint64_t v10 = self->_accountsWithGrantedAccess;
    self->_accountsWithGrantedAccess = v9;
  }
  else
  {
    id v11 = v7;
    id v12 = [v6 permission];
    long long v13 = self->_accountsWithGrantedAccess;
    if (v12)
    {
      uint64_t v8 = [(NSArray *)v13 objectAtIndexedSubscript:v11];
      objc_msgSend(v8, "setPermission:", objc_msgSend(v6, "permission"));
    }
    else
    {
      long long v14 = (NSArray *)[(NSArray *)v13 mutableCopy];
      [(NSArray *)v14 removeObjectAtIndex:v11];
      uint64_t v8 = self->_accountsWithGrantedAccess;
      self->_accountsWithGrantedAccess = v14;
    }
  }

  [(CSAccountController *)self reloadSpecifiers];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentAccountRefresher, 0);
  objc_storeStrong((id *)&self->_ownerSource, 0);
  objc_storeStrong((id *)&self->_eventStore, 0);
  objc_storeStrong((id *)&self->_accountsWithGrantedAccess, 0);

  objc_storeStrong((id *)&self->_accountsICanAccess, 0);
}

@end
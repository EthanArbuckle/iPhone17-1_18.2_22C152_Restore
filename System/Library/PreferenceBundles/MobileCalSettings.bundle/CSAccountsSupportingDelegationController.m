@interface CSAccountsSupportingDelegationController
- (CSAccountsSupportingDelegationController)init;
- (id)specifiers;
- (id)specifiersForAccountsSupportingDelegation;
- (void)reloadDelegates;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation CSAccountsSupportingDelegationController

- (CSAccountsSupportingDelegationController)init
{
  v6.receiver = self;
  v6.super_class = (Class)CSAccountsSupportingDelegationController;
  v2 = [(CSAccountsSupportingDelegationController *)&v6 init];
  if (v2)
  {
    v3 = (EKEventStore *)objc_alloc_init((Class)EKEventStore);
    eventStore = v2->_eventStore;
    v2->_eventStore = v3;

    [(CSAccountsSupportingDelegationController *)v2 reloadDelegates];
  }
  return v2;
}

- (void)viewDidAppear:(BOOL)a3
{
  v16.receiver = self;
  v16.super_class = (Class)CSAccountsSupportingDelegationController;
  [(CSAccountsSupportingDelegationController *)&v16 viewDidAppear:a3];
  v4 = +[NSURL URLWithString:@"settings-navigation://com.apple.Settings.Apps/com.apple.mobilecal/DELEGATE_CALENDARS"];
  id v5 = objc_alloc((Class)_NSLocalizedStringResource);
  objc_super v6 = +[NSLocale currentLocale];
  v7 = +[NSBundle bundleForClass:objc_opt_class()];
  v8 = [v7 bundleURL];
  id v9 = [v5 initWithKey:@"Delegate Calendars" table:@"MobileCalSettings" locale:v6 bundleURL:v8];

  id v10 = objc_alloc((Class)_NSLocalizedStringResource);
  v11 = +[NSLocale currentLocale];
  v12 = +[NSBundle bundleForClass:objc_opt_class()];
  v13 = [v12 bundleURL];
  id v14 = [v10 initWithKey:@"Calendar" table:@"MobileCalSettings" locale:v11 bundleURL:v13];

  id v17 = v14;
  v15 = +[NSArray arrayWithObjects:&v17 count:1];
  [(CSAccountsSupportingDelegationController *)self pe_emitNavigationEventForApplicationSettingsWithApplicationBundleIdentifier:@"com.apple.mobilecal" title:v9 localizedNavigationComponents:v15 deepLink:v4];
}

- (void)reloadDelegates
{
  v3 = [(EKEventStore *)self->_eventStore sources];
  v4 = +[NSPredicate predicateWithBlock:&stru_1CC08];
  id v5 = [v3 filteredArrayUsingPredicate:v4];

  accountsSupportingDelegation = self->_accountsSupportingDelegation;
  self->_accountsSupportingDelegation = v5;

  [(CSAccountsSupportingDelegationController *)self reloadSpecifiers];
}

- (id)specifiersForAccountsSupportingDelegation
{
  id v3 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSArray count](self->_accountsSupportingDelegation, "count"));
  [(NSArray *)self->_accountsSupportingDelegation sortedArrayUsingComparator:&stru_1CC28];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v4 = [obj countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v15;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(obj);
        }
        v8 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v9 = CUIKDisplayedTitleForSource();
        id v10 = +[PSSpecifier preferenceSpecifierNamed:v9 target:self set:0 get:0 detail:objc_opt_class() cell:2 edit:0];

        v11 = [v8 sourceIdentifier];
        [v10 setIdentifier:v11];

        [v10 setProperty:v8 forKey:@"CSSourceKey"];
        [v10 setProperty:&__kCFBooleanTrue forKey:@"CSPresentedFromDisambiguationControllerKey"];
        [v3 addObject:v10];
      }
      id v5 = [obj countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }

  return v3;
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  id v4 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    id v5 = +[NSMutableArray array];
    uint64_t v6 = +[NSBundle bundleForClass:objc_opt_class()];
    v7 = [v6 localizedStringForKey:@"Delegation first screen group title" value:@"Accounts supporting delegation" table:@"MobileCalSettings"];
    v8 = +[PSSpecifier groupSpecifierWithName:v7];

    [v5 addObject:v8];
    id v9 = [(CSAccountsSupportingDelegationController *)self specifiersForAccountsSupportingDelegation];
    [v5 addObjectsFromArray:v9];

    id v10 = *(void **)&self->PSListController_opaque[v3];
    *(void *)&self->PSListController_opaque[v3] = v5;

    id v4 = *(void **)&self->PSListController_opaque[v3];
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventStore, 0);

  objc_storeStrong((id *)&self->_accountsSupportingDelegation, 0);
}

@end
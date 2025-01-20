@interface HOSSettingsController
+ (void)initialize;
- (BOOL)_showMyHomesGroup;
- (BOOL)_showNoHomesGroup;
- (BOOL)_showSharedHomesGroup;
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (HMHomeManager)homeManager;
- (HOSSettingsController)init;
- (HUEditLocationViewController)detailController;
- (NSObject)activeAssertion;
- (id)_sortByNameDescriptor;
- (id)_sortedHomesPassingTest:(id)a3;
- (id)_sortedMyHomes;
- (id)_sortedSharedHomes;
- (id)createAppReinstallSpecifiers;
- (id)createGroupSpecifierForHomeHub;
- (id)createGroupSpecifierForMyHomes;
- (id)createGroupSpecifierForNoHomes;
- (id)createGroupSpecifierForResetButton;
- (id)createGroupSpecifierForSharedHomes;
- (id)createHomeHubSpecifiers;
- (id)createMyHomesSpecifiers;
- (id)createSharedHomesSpecifiers;
- (id)createSpecifierForHome:(id)a3;
- (id)createSpecifierForHomeHub;
- (id)createSpecifierForHomeKitReset;
- (id)finishPresentation:(id)a3 animated:(BOOL)a4;
- (id)homeHubEnabled:(id)a3;
- (id)specifierForHome:(id)a3;
- (id)specifiers;
- (id)tableView:(id)a3 titleForDeleteConfirmationButtonForRowAtIndexPath:(id)a4;
- (int64_t)specifierIndexForHome:(id)a3;
- (void)_resetButtonConfirmed;
- (void)_resetButtonPressed:(id)a3;
- (void)_setUpActiveAssertion;
- (void)_tearDownActiveAssertion;
- (void)deleteHome:(id)a3;
- (void)home:(id)a3 didAddUser:(id)a4;
- (void)home:(id)a3 didRemoveUser:(id)a4;
- (void)homeDidUpdateName:(id)a3;
- (void)homeManager:(id)a3 didAddHome:(id)a4;
- (void)homeManager:(id)a3 didRemoveHome:(id)a4;
- (void)homeManagerDidUpdateHomes:(id)a3;
- (void)receivedApplicationDidEnterBackground:(id)a3;
- (void)setActiveAssertion:(id)a3;
- (void)setDetailController:(id)a3;
- (void)setHomeHubEnabled:(id)a3 specifier:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updateHomesSections;
@end

@implementation HOSSettingsController

+ (void)initialize
{
  v2 = +[HFHomeKitDispatcher configuration];
  id v3 = [v2 mutableCopy];

  [v3 setDiscretionary:1];
  [v3 setAdaptive:1];
  +[HFHomeKitDispatcher setConfiguration:v3];
}

- (HOSSettingsController)init
{
  v13.receiver = self;
  v13.super_class = (Class)HOSSettingsController;
  v2 = [(HOSSettingsController *)&v13 init];
  if (v2)
  {
    id v3 = +[NSBundle bundleForClass:objc_opt_class()];
    v4 = [v3 localizedStringForKey:@"HOSHomeTitle" value:&stru_108B0 table:@"HOSLocalizable"];
    [(HOSSettingsController *)v2 setTitle:v4];

    v5 = +[HFHomeKitDispatcher sharedDispatcher];
    v6 = [v5 homeManager];

    if (!v6)
    {
      v7 = HFLogForCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Presented Home settings when the home manager has not yet been created!", v12, 2u);
      }
    }
    v8 = +[HFHomeKitDispatcher sharedDispatcher];
    [v8 addHomeManagerObserver:v2];

    v9 = +[HFHomeKitDispatcher sharedDispatcher];
    [v9 addHomeObserver:v2];

    v10 = +[NSNotificationCenter defaultCenter];
    [v10 addObserver:v2 selector:"receivedApplicationDidEnterBackground:" name:UIApplicationDidEnterBackgroundNotification object:0];
  }
  return v2;
}

- (void)_setUpActiveAssertion
{
  id v3 = [(HOSSettingsController *)self activeAssertion];

  if (!v3)
  {
    id v5 = [(HOSSettingsController *)self homeManager];
    v4 = [v5 _beginActiveAssertionWithReason:@"HOSSettingsHomeVisible"];
    [(HOSSettingsController *)self setActiveAssertion:v4];
  }
}

- (void)_tearDownActiveAssertion
{
  id v3 = [(HOSSettingsController *)self activeAssertion];

  if (v3)
  {
    v4 = [(HOSSettingsController *)self homeManager];
    id v5 = [(HOSSettingsController *)self activeAssertion];
    [v4 _endActiveAssertion:v5];

    [(HOSSettingsController *)self setActiveAssertion:0];
  }
}

- (HMHomeManager)homeManager
{
  v2 = +[HFHomeKitDispatcher sharedDispatcher];
  id v3 = [v2 homeManager];

  return (HMHomeManager *)v3;
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    id v5 = +[NSMutableArray array];
    v6 = [(HOSSettingsController *)self homeManager];
    unsigned int v7 = [v6 isThisDeviceResidentCapable];

    if (v7)
    {
      v8 = [(HOSSettingsController *)self createHomeHubSpecifiers];
      [v5 addObjectsFromArray:v8];
    }
    v9 = +[LSApplicationProxy applicationProxyForIdentifier:@"com.apple.Home"];
    v10 = [v9 appState];
    unsigned __int8 v11 = [v10 isInstalled];

    if ((v11 & 1) == 0)
    {
      v12 = [(HOSSettingsController *)self createAppReinstallSpecifiers];
      [v5 addObjectsFromArray:v12];

      if ([(HOSSettingsController *)self _showMyHomesGroup])
      {
        objc_super v13 = [(HOSSettingsController *)self createMyHomesSpecifiers];
        [v5 addObjectsFromArray:v13];
      }
      if ([(HOSSettingsController *)self _showSharedHomesGroup])
      {
        v14 = [(HOSSettingsController *)self createGroupSpecifierForSharedHomes];
        [v5 addObject:v14];

        v15 = [(HOSSettingsController *)self createSharedHomesSpecifiers];
        [v5 addObjectsFromArray:v15];
      }
    }
    if ([(HOSSettingsController *)self _showNoHomesGroup])
    {
      v16 = [(HOSSettingsController *)self createGroupSpecifierForNoHomes];
      [v5 addObject:v16];
    }
    if (CFPreferencesGetAppBooleanValue(@"kDisplayResetButton", @"com.apple.HomeSettings", 0))
    {
      v17 = [(HOSSettingsController *)self createGroupSpecifierForResetButton];
      [v5 addObject:v17];

      v18 = [(HOSSettingsController *)self createSpecifierForHomeKitReset];
      [v5 addObject:v18];
    }
    v19 = *(void **)&self->PSListController_opaque[v3];
    *(void *)&self->PSListController_opaque[v3] = v5;

    v4 = *(void **)&self->PSListController_opaque[v3];
  }

  return v4;
}

- (id)_sortByNameDescriptor
{
  id v2 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"name" ascending:1 selector:"localizedStandardCompare:"];

  return v2;
}

- (id)_sortedHomesPassingTest:(id)a3
{
  id v4 = a3;
  id v5 = [(HOSSettingsController *)self homeManager];
  v6 = [v5 homes];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_43F0;
  v16[3] = &unk_10628;
  id v17 = v4;
  id v7 = v4;
  v8 = [v6 indexesOfObjectsPassingTest:v16];

  v9 = [(HOSSettingsController *)self homeManager];
  v10 = [v9 homes];
  unsigned __int8 v11 = [v10 objectsAtIndexes:v8];

  v12 = [(HOSSettingsController *)self _sortByNameDescriptor];
  v18 = v12;
  objc_super v13 = +[NSArray arrayWithObjects:&v18 count:1];
  v14 = [v11 sortedArrayUsingDescriptors:v13];

  return v14;
}

- (id)_sortedMyHomes
{
  return [(HOSSettingsController *)self _sortedHomesPassingTest:&stru_10668];
}

- (id)_sortedSharedHomes
{
  return [(HOSSettingsController *)self _sortedHomesPassingTest:&stru_10688];
}

- (BOOL)_showMyHomesGroup
{
  id v2 = [(HOSSettingsController *)self _sortedMyHomes];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (BOOL)_showSharedHomesGroup
{
  id v2 = [(HOSSettingsController *)self _sortedSharedHomes];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (BOOL)_showNoHomesGroup
{
  if ([(HOSSettingsController *)self _showMyHomesGroup]) {
    return 0;
  }
  else {
    return ![(HOSSettingsController *)self _showSharedHomesGroup];
  }
}

- (id)homeHubEnabled:(id)a3
{
  BOOL v3 = [(HOSSettingsController *)self homeManager];
  id v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 isResidentEnabledForThisDevice]);

  return v4;
}

- (void)setHomeHubEnabled:(id)a3 specifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v8 = [(HOSSettingsController *)self homeManager];
  id v9 = [v6 BOOLValue];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_4680;
  v11[3] = &unk_106B0;
  objc_copyWeak(&v13, &location);
  id v10 = v7;
  id v12 = v10;
  [v8 updateResidentEnabledForThisDevice:v9 completionHandler:v11];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (id)createHomeHubSpecifiers
{
  BOOL v3 = [(HOSSettingsController *)self createGroupSpecifierForHomeHub];
  v7[0] = v3;
  id v4 = [(HOSSettingsController *)self createSpecifierForHomeHub];
  v7[1] = v4;
  id v5 = +[NSArray arrayWithObjects:v7 count:2];

  return v5;
}

- (id)createAppReinstallSpecifiers
{
  id v2 = +[PSSpecifier groupSpecifierWithID:@"HOSSettingsAppReinstallID"];
  unsigned int v3 = +[HMClientConnection areAnySpeakersConfigured];
  id v4 = +[NSBundle bundleForClass:objc_opt_class()];
  id v5 = v4;
  if (v3) {
    CFStringRef v6 = @"HOSAppReinstallInfo_IsInPossessionOfAHomePod";
  }
  else {
    CFStringRef v6 = @"HOSAppReinstallInfo_IsNotInPossessionOfAHomePod";
  }
  id v7 = [v4 localizedStringForKey:v6 value:&stru_108B0 table:@"HOSLocalizable"];
  [v2 setProperty:v7 forKey:PSFooterTextGroupKey];

  v8 = +[HOSHomeAppReinstallPreferencesCell specifier];
  v11[0] = v2;
  v11[1] = v8;
  id v9 = +[NSArray arrayWithObjects:v11 count:2];

  return v9;
}

- (id)createMyHomesSpecifiers
{
  unsigned int v3 = objc_opt_new();
  id v4 = [(HOSSettingsController *)self createGroupSpecifierForMyHomes];
  [v3 addObject:v4];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = [(HOSSettingsController *)self _sortedMyHomes];
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = [(HOSSettingsController *)self createSpecifierForHome:*(void *)(*((void *)&v12 + 1) + 8 * i)];
        [v3 addObject:v10];
      }
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v3;
}

- (id)createSharedHomesSpecifiers
{
  unsigned int v3 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(HOSSettingsController *)self _sortedSharedHomes];
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = [(HOSSettingsController *)self createSpecifierForHome:*(void *)(*((void *)&v11 + 1) + 8 * i)];
        [v3 addObject:v9];
      }
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)createGroupSpecifierForSharedHomes
{
  id v2 = +[NSBundle bundleForClass:objc_opt_class()];
  unsigned int v3 = [v2 localizedStringForKey:@"HOSSharedHomesTitle" value:&stru_108B0 table:@"HOSLocalizable"];
  id v4 = +[PSSpecifier groupSpecifierWithID:@"HOSSettingsSharedHomesGroupID" name:v3];

  id v5 = +[NSBundle bundleForClass:objc_opt_class()];
  id v6 = [v5 localizedStringForKey:@"HOSSharedHomesInfo" value:&stru_108B0 table:@"HOSLocalizable"];
  [v4 setProperty:v6 forKey:PSFooterTextGroupKey];

  return v4;
}

- (id)createGroupSpecifierForMyHomes
{
  id v2 = +[NSBundle bundleForClass:objc_opt_class()];
  unsigned int v3 = [v2 localizedStringForKey:@"HOSMyHomesTitle" value:&stru_108B0 table:@"HOSLocalizable"];
  id v4 = +[PSSpecifier groupSpecifierWithID:@"HOSSettingsMyHomesGroupID" name:v3];

  return v4;
}

- (id)createGroupSpecifierForNoHomes
{
  id v2 = +[PSSpecifier groupSpecifierWithID:@"HOSSettingsNoHomesGroupID"];
  unsigned int v3 = +[NSBundle bundleForClass:objc_opt_class()];
  id v4 = [v3 localizedStringForKey:@"HOSNoHomesInfo" value:&stru_108B0 table:@"HOSLocalizable"];
  [v2 setProperty:v4 forKey:PSFooterTextGroupKey];

  return v2;
}

- (id)createGroupSpecifierForResetButton
{
  return +[PSSpecifier groupSpecifierWithID:@"HOSSettingsResetButtonGroupID"];
}

- (id)createGroupSpecifierForHomeHub
{
  id v2 = +[PSSpecifier groupSpecifierWithID:@"HOSSettingsHomeHubGroupID"];
  unsigned int v3 = +[NSBundle bundleForClass:objc_opt_class()];
  id v4 = [v3 localizedStringForKey:@"HOSHomeHubFooter" value:&stru_108B0 table:@"HOSLocalizable"];

  id v5 = +[NSBundle bundleForClass:objc_opt_class()];
  id v6 = [v5 localizedStringForKey:@"HOSHomeHubLearnMore" value:&stru_108B0 table:@"HOSLocalizable"];

  uint64_t v7 = +[NSString stringWithFormat:@"%@ %@", v4, v6];
  id v8 = [v7 rangeOfString:v6];
  NSUInteger v10 = v9;
  long long v11 = +[NSURL URLWithString:@"https://support.apple.com/kb/HT207057"];
  long long v12 = (objc_class *)objc_opt_class();
  long long v13 = NSStringFromClass(v12);
  [v2 setProperty:v13 forKey:PSFooterCellClassGroupKey];

  [v2 setProperty:v7 forKey:PSFooterHyperlinkViewTitleKey];
  v17.id location = (NSUInteger)v8;
  v17.length = v10;
  long long v14 = NSStringFromRange(v17);
  [v2 setProperty:v14 forKey:PSFooterHyperlinkViewLinkRangeKey];

  [v2 setProperty:v11 forKey:PSFooterHyperlinkViewURLKey];

  return v2;
}

- (id)createSpecifierForHomeHub
{
  unsigned int v3 = +[NSBundle bundleForClass:objc_opt_class()];
  id v4 = [v3 localizedStringForKey:@"HOSHomeHubSwitchTitle" value:&stru_108B0 table:@"HOSLocalizable"];
  id v5 = +[PSSpecifier preferenceSpecifierNamed:v4 target:self set:"setHomeHubEnabled:specifier:" get:"homeHubEnabled:" detail:0 cell:6 edit:0];

  [v5 setIdentifier:@"HOSSettingsHomeHubSpecifierID"];

  return v5;
}

- (id)createSpecifierForHome:(id)a3
{
  id v4 = a3;
  if (objc_msgSend(v4, "hos_isMyHome"))
  {
    id v5 = [v4 name];
LABEL_4:
    +[PSSpecifier preferenceSpecifierNamed:v5 target:self set:0 get:0 detail:objc_opt_class() cell:1 edit:0];
    goto LABEL_6;
  }
  id v6 = [v4 administrator];
  uint64_t v7 = [v6 name];

  id v5 = [v4 name];
  if (v7) {
    goto LABEL_4;
  }
  +[PSSpecifier preferenceSpecifierNamed:v5 target:self set:0 get:0 detail:0 cell:3 edit:0];
  id v8 = LABEL_6:;

  NSUInteger v9 = [v4 uniqueIdentifier];
  NSUInteger v10 = [v9 UUIDString];
  [v8 setIdentifier:v10];

  [v8 setProperty:v4 forKey:kHUHomePropertyKey];
  long long v11 = NSStringFromSelector("reloadSpecifier:");
  [v8 setProperty:v11 forKey:kHUUpdateSpecifierActionKey];

  [v8 setProperty:&off_11BD8 forKey:PSTableCellHeightKey];
  long long v12 = NSStringFromSelector("deleteHome:");
  [v8 setProperty:v12 forKey:PSDeletionActionKey];

  return v8;
}

- (int64_t)specifierIndexForHome:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  long long v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0x7FFFFFFFFFFFFFFFLL;
  id v5 = [(HOSSettingsController *)self specifiers];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_53DC;
  v9[3] = &unk_106D8;
  id v6 = v4;
  id v10 = v6;
  long long v11 = &v12;
  [v5 enumerateObjectsUsingBlock:v9];

  int64_t v7 = v13[3];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (id)specifierForHome:(id)a3
{
  id v4 = [a3 uniqueIdentifier];
  id v5 = [v4 UUIDString];
  id v6 = [(HOSSettingsController *)self specifierForID:v5];

  return v6;
}

- (void)deleteHome:(id)a3
{
  id v4 = a3;
  id v5 = [v4 propertyForKey:kHUHomePropertyKey];
  id v6 = [(HOSSettingsController *)self homeManager];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_559C;
  v8[3] = &unk_10700;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [v6 removeHome:v5 completionHandler:v8];
}

- (id)createSpecifierForHomeKitReset
{
  unsigned int v3 = +[NSBundle bundleForClass:objc_opt_class()];
  id v4 = [v3 localizedStringForKey:@"HOSButtonResetConfirmation" value:&stru_108B0 table:@"HOSLocalizable"];
  id v5 = +[PSSpecifier deleteButtonSpecifierWithName:v4 target:self action:"_resetButtonPressed:"];

  return v5;
}

- (void)_resetButtonPressed:(id)a3
{
  id v16 = objc_alloc_init((Class)PSConfirmationSpecifier);
  uint64_t v14 = +[NSBundle bundleForClass:objc_opt_class()];
  long long v13 = [v14 localizedStringForKey:@"HOSResetHomeAlertTitle" value:&stru_108B0 table:@"HOSLocalizable"];
  uint64_t v12 = PSConfirmationTitleKey;
  unsigned int v3 = +[NSBundle bundleForClass:objc_opt_class()];
  id v4 = [v3 localizedStringForKey:@"HOSResetHomeAlertMessage" value:&stru_108B0 table:@"HOSLocalizable"];
  uint64_t v5 = PSConfirmationPromptKey;
  id v6 = +[NSBundle bundleForClass:objc_opt_class()];
  id v7 = [v6 localizedStringForKey:@"HOSButtonResetConfirmation" value:&stru_108B0 table:@"HOSLocalizable"];
  uint64_t v8 = PSConfirmationOKKey;
  id v9 = +[NSBundle bundleForClass:objc_opt_class()];
  id v10 = [v9 localizedStringForKey:@"HOSButtonAlertCancel" value:&stru_108B0 table:@"HOSLocalizable"];
  long long v11 = +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v13, v12, v4, v5, v7, v8, v10, PSConfirmationCancelKey, 0);
  [v16 setupWithDictionary:v11];

  [v16 setProperty:&__kCFBooleanTrue forKey:PSConfirmationDestructiveKey];
  [v16 setTarget:self];
  [v16 setConfirmationAction:"_resetButtonConfirmed"];
  [(HOSSettingsController *)self showConfirmationViewForSpecifier:v16];
}

- (void)_resetButtonConfirmed
{
  unsigned int v3 = [(HOSSettingsController *)self homeManager];
  id v4 = [(HOSSettingsController *)self homeManager];

  if (!v4)
  {
    uint64_t v5 = HFLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      sub_94A4(v5);
    }

    id v6 = objc_alloc_init((Class)HMHomeManager);
    unsigned int v3 = v6;
  }
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  void v7[2] = sub_5A04;
  v7[3] = &unk_10728;
  v7[4] = self;
  [v3 eraseHomeDataWithCompletionHandler:v7];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HOSSettingsController *)self specifierAtIndexPath:v7];
  id v9 = [v8 propertyForKey:kHUHomePropertyKey];
  if (v9)
  {
    [(HOSSettingsController *)self _setUpActiveAssertion];
    id v10 = [objc_alloc((Class)HFHomeBuilder) initWithExistingObject:v9 inHome:v9];
    id v11 = [objc_alloc((Class)HUEditLocationViewController) initWithHomeBuilder:v10 presentationDelegate:self addLocationDelegate:0 context:1];
    [(HOSSettingsController *)self setDetailController:v11];
    uint64_t v12 = [(HOSSettingsController *)self navigationController];
    [v12 pushViewController:v11 animated:1];
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)HOSSettingsController;
    [(HOSSettingsController *)&v13 tableView:v6 didSelectRowAtIndexPath:v7];
  }
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  id v4 = [(HOSSettingsController *)self specifierAtIndexPath:a4];
  uint64_t v5 = [v4 propertyForKey:kHUHomePropertyKey];
  BOOL v6 = v5 != 0;

  return v6;
}

- (id)tableView:(id)a3 titleForDeleteConfirmationButtonForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HOSSettingsController *)self specifierAtIndexPath:v7];
  id v9 = [v8 propertyForKey:kHUHomePropertyKey];
  id v10 = v9;
  if (v9)
  {
    unsigned __int8 v11 = objc_msgSend(v9, "hos_isMyHome");
    uint64_t v12 = +[NSBundle bundleForClass:objc_opt_class()];
    objc_super v13 = v12;
    if (v11) {
      CFStringRef v14 = @"HOSRemoveHomeTitle";
    }
    else {
      CFStringRef v14 = @"HOSLeaveHomeTitle";
    }
    uint64_t v15 = [v12 localizedStringForKey:v14 value:&stru_108B0 table:@"HOSLocalizable"];
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)HOSSettingsController;
    uint64_t v15 = [(HOSSettingsController *)&v17 tableView:v6 titleForDeleteConfirmationButtonForRowAtIndexPath:v7];
  }

  return v15;
}

- (void)updateHomesSections
{
  uint64_t v9 = 0;
  if (([(HOSSettingsController *)self getGroup:&v9 row:0 ofSpecifierID:@"HOSSettingsHomeHubGroupID"] & 1) == 0)uint64_t v9 = 0x7FFFFFFFFFFFFFFFLL; {
  if ([(HOSSettingsController *)self _showMyHomesGroup])
  }
  {
    unsigned int v3 = [(HOSSettingsController *)self specifierForID:@"HOSSettingsMyHomesGroupID"];

    if (!v3)
    {
      id v4 = [(HOSSettingsController *)self createGroupSpecifierForMyHomes];
      [(HOSSettingsController *)self hos_insertSpecifier:v4 atEndOfGroup:v9 animated:1];
    }
    ++v9;
  }
  else
  {
    [(HOSSettingsController *)self removeSpecifierID:@"HOSSettingsMyHomesGroupID" animated:1];
  }
  if ([(HOSSettingsController *)self _showSharedHomesGroup])
  {
    uint64_t v5 = [(HOSSettingsController *)self specifierForID:@"HOSSettingsSharedHomesGroupID"];

    if (!v5)
    {
      id v6 = [(HOSSettingsController *)self createGroupSpecifierForSharedHomes];
      [(HOSSettingsController *)self hos_insertSpecifier:v6 atEndOfGroup:v9 animated:1];
    }
    ++v9;
  }
  else
  {
    [(HOSSettingsController *)self removeSpecifierID:@"HOSSettingsSharedHomesGroupID" animated:1];
  }
  if ([(HOSSettingsController *)self _showNoHomesGroup])
  {
    id v7 = [(HOSSettingsController *)self specifierForID:@"HOSSettingsNoHomesGroupID"];

    if (!v7)
    {
      uint64_t v8 = [(HOSSettingsController *)self createGroupSpecifierForNoHomes];
      [(HOSSettingsController *)self hos_insertSpecifier:v8 atEndOfGroup:v9 animated:1];
    }
  }
  else
  {
    [(HOSSettingsController *)self removeSpecifierID:@"HOSSettingsNoHomesGroupID" animated:1];
  }
}

- (void)homeManagerDidUpdateHomes:(id)a3
{
  id v4 = a3;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_6194;
  v13[3] = &unk_10750;
  v13[4] = self;
  uint64_t v5 = +[NSPredicate predicateWithBlock:v13];
  uint64_t v6 = [(HOSSettingsController *)self detailController];
  if (v6)
  {
    id v7 = (void *)v6;
    uint64_t v8 = [v4 homes];
    uint64_t v9 = [v8 filteredArrayUsingPredicate:v5];
    id v10 = [v9 count];

    if (!v10)
    {
      unsigned __int8 v11 = [(HOSSettingsController *)self navigationController];
      id v12 = [v11 popToViewController:self animated:1];

      [(HOSSettingsController *)self setDetailController:0];
      [(HOSSettingsController *)self _tearDownActiveAssertion];
    }
  }
  [(HOSSettingsController *)self reloadSpecifiers];
}

- (void)homeManager:(id)a3 didAddHome:(id)a4
{
  id v15 = a4;
  if (objc_msgSend(v15, "hos_isMyHome")) {
    [(HOSSettingsController *)self _sortedMyHomes];
  }
  else {
  uint64_t v6 = [(HOSSettingsController *)self _sortedSharedHomes];
  }
  [v15 setDelegate:self];
  id v7 = (char *)[v6 indexOfObject:v15];
  if (v7 == (char *)0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v8 = +[NSAssertionHandler currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"HOSSettingsController.m" lineNumber:514 description:@"This home isn't in the HomeList - this is a serious bug.  Please triage / file a radar."];
  }
  else
  {
    uint64_t v9 = v7;
    [(HOSSettingsController *)self updateHomesSections];
    if (v9)
    {
      id v10 = [v6 objectAtIndexedSubscript:v9 - 1];
      uint64_t v8 = [(HOSSettingsController *)self specifierForHome:v10];

      id v11 = v15;
    }
    else
    {
      if (objc_msgSend(v15, "hos_isMyHome")) {
        CFStringRef v12 = @"HOSSettingsMyHomesGroupID";
      }
      else {
        CFStringRef v12 = @"HOSSettingsSharedHomesGroupID";
      }
      uint64_t v13 = [(HOSSettingsController *)self specifierForID:v12];
      id v11 = v15;
      uint64_t v8 = (void *)v13;
    }
    CFStringRef v14 = [(HOSSettingsController *)self createSpecifierForHome:v11];
    [(HOSSettingsController *)self insertSpecifier:v14 afterSpecifier:v8 animated:1];
  }
}

- (void)homeManager:(id)a3 didRemoveHome:(id)a4
{
  id v13 = a4;
  uint64_t v5 = [(HOSSettingsController *)self detailController];
  if (v5)
  {
    uint64_t v6 = (void *)v5;
    id v7 = [(HOSSettingsController *)self detailController];
    uint64_t v8 = [v7 homeBuilder];
    id v9 = [v8 home];

    if (v9 == v13)
    {
      id v10 = [(HOSSettingsController *)self navigationController];
      id v11 = [v10 popToViewController:self animated:1];

      [(HOSSettingsController *)self setDetailController:0];
      [(HOSSettingsController *)self _tearDownActiveAssertion];
    }
  }
  CFStringRef v12 = [(HOSSettingsController *)self specifierForHome:v13];
  [(HOSSettingsController *)self removeSpecifier:v12 animated:1];
  [(HOSSettingsController *)self updateHomesSections];
}

- (void)homeDidUpdateName:(id)a3
{
  id v4 = a3;
  id v6 = [(HOSSettingsController *)self specifierForHome:v4];
  uint64_t v5 = [v4 name];

  [v6 setName:v5];
  [(HOSSettingsController *)self reloadSpecifier:v6 animated:1];
}

- (void)home:(id)a3 didAddUser:(id)a4
{
  -[HOSSettingsController specifierForHome:](self, "specifierForHome:", a3, a4);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(HOSSettingsController *)self reloadSpecifier:v5 animated:1];
}

- (void)home:(id)a3 didRemoveUser:(id)a4
{
  -[HOSSettingsController specifierForHome:](self, "specifierForHome:", a3, a4);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(HOSSettingsController *)self reloadSpecifier:v5 animated:1];
}

- (id)finishPresentation:(id)a3 animated:(BOOL)a4
{
  id v5 = [(HOSSettingsController *)self navigationController];
  id v6 = [v5 popToViewController:self animated:1];

  [(HOSSettingsController *)self setDetailController:0];
  [(HOSSettingsController *)self _tearDownActiveAssertion];

  return +[NAFuture futureWithNoResult];
}

- (void)receivedApplicationDidEnterBackground:(id)a3
{
  id v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "[PREF] receivedApplicationDidEnterBackground", v5, 2u);
  }

  [(HOSSettingsController *)self _tearDownActiveAssertion];
}

- (HUEditLocationViewController)detailController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_detailController);

  return (HUEditLocationViewController *)WeakRetained;
}

- (void)setDetailController:(id)a3
{
}

- (NSObject)activeAssertion
{
  return self->_activeAssertion;
}

- (void)setActiveAssertion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeAssertion, 0);

  objc_destroyWeak((id *)&self->_detailController);
}

@end
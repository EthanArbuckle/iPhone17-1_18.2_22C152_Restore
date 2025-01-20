@interface VSTVAppDeveloperSettingsAccountViewController_iOS
- (PSSpecifier)refreshSpecifier;
- (VSRemoteNotifier)remoteNotifier;
- (VSTVAppDeveloperSettingsAccountViewController_iOS)init;
- (VSTVAppDeveloperSettingsAccountViewController_iOS)initWithNibName:(id)a3 bundle:(id)a4;
- (VSUserAccount)account;
- (VSUserAccountFacade)facade;
- (id)billingGroupSpecifiers;
- (id)dateGroupSpecifiers;
- (id)deviceGroupSpecifiers;
- (id)groupWithSpecifiers:(id)a3;
- (id)infoGroupSpecifiers;
- (id)refreshGroupSpecifiers;
- (id)sourceIdentifierGroupSpecifiers;
- (id)specifierWithTitle:(id)a3 value:(id)a4 details:(id)a5 copyable:(BOOL)a6;
- (id)specifiers;
- (id)valueForSpecifier:(id)a3;
- (void)refreshAccount;
- (void)remoteNotifier:(id)a3 didReceiveRemoteNotificationWithUserInfo:(id)a4;
- (void)setAccount:(id)a3;
- (void)setFacade:(id)a3;
- (void)setRefreshSpecifier:(id)a3;
- (void)setRemoteNotifier:(id)a3;
- (void)viewDidLoad;
@end

@implementation VSTVAppDeveloperSettingsAccountViewController_iOS

- (VSTVAppDeveloperSettingsAccountViewController_iOS)init
{
  return [(VSTVAppDeveloperSettingsAccountViewController_iOS *)self initWithNibName:0 bundle:0];
}

- (VSTVAppDeveloperSettingsAccountViewController_iOS)initWithNibName:(id)a3 bundle:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)VSTVAppDeveloperSettingsAccountViewController_iOS;
  v4 = [(VSTVAppDeveloperSettingsAccountViewController_iOS *)&v9 initWithNibName:0 bundle:0];
  if (v4)
  {
    id v5 = objc_alloc((Class)VSRemoteNotifier);
    v6 = (VSRemoteNotifier *)[v5 initWithNotificationName:VSUserAccountsDidChangeNotification];
    remoteNotifier = v4->_remoteNotifier;
    v4->_remoteNotifier = v6;

    [(VSRemoteNotifier *)v4->_remoteNotifier setDelegate:v4];
  }
  return v4;
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)VSTVAppDeveloperSettingsAccountViewController_iOS;
  [(VSTVAppDeveloperSettingsAccountViewController_iOS *)&v5 viewDidLoad];
  v3 = [(VSTVAppDeveloperSettingsAccountViewController_iOS *)self specifier];
  v4 = [v3 propertyForKey:@"VSTVAppDeveloperSettingsUserAccountKey"];
  [(VSTVAppDeveloperSettingsAccountViewController_iOS *)self setAccount:v4];

  [(VSTVAppDeveloperSettingsAccountViewController_iOS *)self reloadSpecifiers];
}

- (id)specifiers
{
  v3 = [(VSTVAppDeveloperSettingsAccountViewController_iOS *)self account];
  uint64_t v4 = OBJC_IVAR___PSListController__specifiers;
  objc_super v5 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (v5) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v3 == 0;
  }
  if (!v6)
  {
    v7 = [[VSUserAccountFacade alloc] initWithAccount:v3];
    [(VSTVAppDeveloperSettingsAccountViewController_iOS *)self setFacade:v7];

    id v8 = objc_alloc_init((Class)NSMutableArray);
    objc_super v9 = [(VSTVAppDeveloperSettingsAccountViewController_iOS *)self sourceIdentifierGroupSpecifiers];

    if (v9)
    {
      v10 = [(VSTVAppDeveloperSettingsAccountViewController_iOS *)self sourceIdentifierGroupSpecifiers];
      [v8 addObjectsFromArray:v10];
    }
    v11 = [(VSTVAppDeveloperSettingsAccountViewController_iOS *)self dateGroupSpecifiers];

    if (v11)
    {
      v12 = [(VSTVAppDeveloperSettingsAccountViewController_iOS *)self dateGroupSpecifiers];
      [v8 addObjectsFromArray:v12];
    }
    v13 = [(VSTVAppDeveloperSettingsAccountViewController_iOS *)self deviceGroupSpecifiers];

    if (v13)
    {
      v14 = [(VSTVAppDeveloperSettingsAccountViewController_iOS *)self deviceGroupSpecifiers];
      [v8 addObjectsFromArray:v14];
    }
    v15 = [(VSTVAppDeveloperSettingsAccountViewController_iOS *)self infoGroupSpecifiers];

    if (v15)
    {
      v16 = [(VSTVAppDeveloperSettingsAccountViewController_iOS *)self infoGroupSpecifiers];
      [v8 addObjectsFromArray:v16];
    }
    v17 = [(VSTVAppDeveloperSettingsAccountViewController_iOS *)self billingGroupSpecifiers];

    if (v17)
    {
      v18 = [(VSTVAppDeveloperSettingsAccountViewController_iOS *)self billingGroupSpecifiers];
      [v8 addObjectsFromArray:v18];
    }
    if ([v3 isFromCurrentDevice])
    {
      v19 = [v3 updateURL];

      if (v19)
      {
        v20 = [(VSTVAppDeveloperSettingsAccountViewController_iOS *)self refreshGroupSpecifiers];
        [v8 addObjectsFromArray:v20];
      }
    }
    id v21 = [v8 copy];
    v22 = *(void **)&self->PSListController_opaque[v4];
    *(void *)&self->PSListController_opaque[v4] = v21;

    objc_super v5 = *(void **)&self->PSListController_opaque[v4];
  }
  id v23 = v5;

  return v23;
}

- (void)remoteNotifier:(id)a3 didReceiveRemoteNotificationWithUserInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = +[VSUserAccountManager sharedUserAccountManager];
  objc_super v9 = [(VSTVAppDeveloperSettingsAccountViewController_iOS *)self account];
  v10 = [v9 sourceIdentifier];
  id v11 = [v9 sourceType];
  v12 = [v9 deviceIdentifier];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_4854;
  v13[3] = &unk_82C0;
  objc_copyWeak(&v14, &location);
  [v8 fetchUserAccountWithSourceIdentifier:v10 sourceType:v11 deviceIdentifier:v12 withCompletion:v13];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)refreshAccount
{
  id v4 = +[VSUserAccountManager sharedUserAccountManager];
  v3 = [(VSTVAppDeveloperSettingsAccountViewController_iOS *)self account];
  [v4 forceRefreshUserAccount:v3 withCompletion:&stru_8300];
}

- (id)valueForSpecifier:(id)a3
{
  return [a3 propertyForKey:PSValueKey];
}

- (id)specifierWithTitle:(id)a3 value:(id)a4 details:(id)a5 copyable:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v12) {
    uint64_t v13 = objc_opt_class();
  }
  else {
    uint64_t v13 = 0;
  }
  if (v11) {
    uint64_t v14 = 4;
  }
  else {
    uint64_t v14 = 1;
  }
  v15 = +[PSSpecifier preferenceSpecifierNamed:v10 target:self set:0 get:"valueForSpecifier:" detail:v13 cell:v14 edit:0];
  [v15 setProperty:v11 forKey:PSValueKey];
  v16 = +[NSNumber numberWithBool:v6];
  [v15 setProperty:v16 forKey:PSCopyableCellKey];

  [v15 setProperty:v12 forKey:@"VSTVAppDeveloperSettingsAccountDetailsListKey"];

  return v15;
}

- (id)groupWithSpecifiers:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    id v4 = objc_alloc_init((Class)NSMutableArray);
    objc_super v5 = +[PSSpecifier groupSpecifierWithName:0];
    [v4 addObject:v5];
    [v4 addObjectsFromArray:v3];
    id v6 = [v4 copy];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)sourceIdentifierGroupSpecifiers
{
  id v3 = +[NSBundle vs_frameworkBundle];
  id v4 = [v3 localizedStringForKey:@"TV_APP_DEVELOPER_SOURCE_IDENTIFIER" value:0 table:0];

  objc_super v5 = [(VSTVAppDeveloperSettingsAccountViewController_iOS *)self facade];
  id v6 = [v5 sourceIdentifier];
  id v7 = [(VSTVAppDeveloperSettingsAccountViewController_iOS *)self specifierWithTitle:v4 value:v6 details:0 copyable:1];

  id v11 = v7;
  id v8 = +[NSArray arrayWithObjects:&v11 count:1];
  objc_super v9 = [(VSTVAppDeveloperSettingsAccountViewController_iOS *)self groupWithSpecifiers:v8];

  return v9;
}

- (id)dateGroupSpecifiers
{
  id v3 = +[NSBundle vs_frameworkBundle];
  id v4 = [v3 localizedStringForKey:@"TV_APP_DEVELOPER_CREATED_ON" value:0 table:0];

  objc_super v5 = [(VSTVAppDeveloperSettingsAccountViewController_iOS *)self facade];
  id v6 = [v5 created];
  id v7 = [(VSTVAppDeveloperSettingsAccountViewController_iOS *)self specifierWithTitle:v4 value:v6 details:0 copyable:1];

  id v8 = +[NSBundle vs_frameworkBundle];
  objc_super v9 = [v8 localizedStringForKey:@"TV_APP_DEVELOPER_LAST_MODIFIED" value:0 table:0];

  id v10 = [(VSTVAppDeveloperSettingsAccountViewController_iOS *)self facade];
  id v11 = [v10 lastModified];
  id v12 = [(VSTVAppDeveloperSettingsAccountViewController_iOS *)self specifierWithTitle:v9 value:v11 details:0 copyable:1];

  v16[0] = v7;
  v16[1] = v12;
  uint64_t v13 = +[NSArray arrayWithObjects:v16 count:2];
  uint64_t v14 = [(VSTVAppDeveloperSettingsAccountViewController_iOS *)self groupWithSpecifiers:v13];

  return v14;
}

- (id)deviceGroupSpecifiers
{
  id v3 = +[NSBundle vs_frameworkBundle];
  id v4 = [v3 localizedStringForKey:@"TV_APP_DEVELOPER_FROM_THIS_DEVICE" value:0 table:0];

  objc_super v5 = [(VSTVAppDeveloperSettingsAccountViewController_iOS *)self facade];
  id v6 = [v5 fromThisDevice];
  id v7 = [(VSTVAppDeveloperSettingsAccountViewController_iOS *)self specifierWithTitle:v4 value:v6 details:0 copyable:0];

  id v8 = [(VSTVAppDeveloperSettingsAccountViewController_iOS *)self facade];
  objc_super v9 = [v8 deviceCategory];
  id v10 = [(VSTVAppDeveloperSettingsAccountViewController_iOS *)self specifierWithTitle:@"Device Genre" value:v9 details:0 copyable:0];

  v14[0] = v7;
  v14[1] = v10;
  id v11 = +[NSArray arrayWithObjects:v14 count:2];
  id v12 = [(VSTVAppDeveloperSettingsAccountViewController_iOS *)self groupWithSpecifiers:v11];

  return v12;
}

- (id)infoGroupSpecifiers
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  id v4 = [(VSTVAppDeveloperSettingsAccountViewController_iOS *)self facade];
  objc_super v5 = [v4 identifier];
  id v6 = [v5 length];

  if (v6)
  {
    id v7 = +[NSBundle vs_frameworkBundle];
    id v8 = [v7 localizedStringForKey:@"TV_APP_DEVELOPER_IDENTIFIER" value:0 table:0];

    objc_super v9 = [(VSTVAppDeveloperSettingsAccountViewController_iOS *)self facade];
    id v10 = [v9 identifier];
    id v11 = [(VSTVAppDeveloperSettingsAccountViewController_iOS *)self specifierWithTitle:v8 value:v10 details:0 copyable:1];

    [v3 addObject:v11];
  }
  id v12 = [(VSTVAppDeveloperSettingsAccountViewController_iOS *)self facade];
  uint64_t v13 = [v12 tvProviderIdentifier];
  id v14 = [v13 length];

  if (v14)
  {
    v15 = +[NSBundle vs_frameworkBundle];
    v16 = [v15 localizedStringForKey:@"TV_APP_DEVELOPER_TV_PROVIDER_IDENTIFIER" value:0 table:0];

    v17 = [(VSTVAppDeveloperSettingsAccountViewController_iOS *)self facade];
    v18 = [v17 tvProviderIdentifier];
    v19 = [(VSTVAppDeveloperSettingsAccountViewController_iOS *)self specifierWithTitle:v16 value:v18 details:0 copyable:1];

    [v3 addObject:v19];
  }
  v20 = [(VSTVAppDeveloperSettingsAccountViewController_iOS *)self facade];
  id v21 = [v20 updateURLString];
  id v22 = [v21 length];

  if (v22)
  {
    id v23 = +[NSBundle vs_frameworkBundle];
    v24 = [v23 localizedStringForKey:@"TV_APP_DEVELOPER_UPDATE_URL" value:0 table:0];

    v25 = [(VSTVAppDeveloperSettingsAccountViewController_iOS *)self facade];
    v26 = [v25 updateURLString];
    v46 = v26;
    v27 = +[NSArray arrayWithObjects:&v46 count:1];

    v28 = [(VSTVAppDeveloperSettingsAccountViewController_iOS *)self specifierWithTitle:v24 value:0 details:v27 copyable:0];
    [v3 addObject:v28];
  }
  v29 = [(VSTVAppDeveloperSettingsAccountViewController_iOS *)self facade];
  v30 = [v29 authenticationDataString];
  id v31 = [v30 length];

  if (v31)
  {
    v32 = +[NSBundle vs_frameworkBundle];
    v33 = [v32 localizedStringForKey:@"TV_APP_DEVELOPER_AUTH_DATA" value:0 table:0];

    v34 = [(VSTVAppDeveloperSettingsAccountViewController_iOS *)self facade];
    v35 = [v34 authenticationDataString];
    v45 = v35;
    v36 = +[NSArray arrayWithObjects:&v45 count:1];

    v37 = [(VSTVAppDeveloperSettingsAccountViewController_iOS *)self specifierWithTitle:v33 value:0 details:v36 copyable:0];
    [v3 addObject:v37];
  }
  v38 = +[NSBundle vs_frameworkBundle];
  v39 = [v38 localizedStringForKey:@"TV_APP_DEVELOPER_SYSTEM_TRUST" value:0 table:0];

  v40 = [(VSTVAppDeveloperSettingsAccountViewController_iOS *)self facade];
  v41 = [v40 requiresSystemTrust];
  v42 = [(VSTVAppDeveloperSettingsAccountViewController_iOS *)self specifierWithTitle:v39 value:v41 details:0 copyable:0];

  [v3 addObject:v42];
  v43 = [(VSTVAppDeveloperSettingsAccountViewController_iOS *)self groupWithSpecifiers:v3];

  return v43;
}

- (id)billingGroupSpecifiers
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  id v4 = +[NSBundle vs_frameworkBundle];
  objc_super v5 = [v4 localizedStringForKey:@"TV_APP_DEVELOPER_ACCOUNT_TYPE" value:0 table:0];

  id v6 = [(VSTVAppDeveloperSettingsAccountViewController_iOS *)self facade];
  id v7 = [v6 accountType];
  id v8 = [(VSTVAppDeveloperSettingsAccountViewController_iOS *)self specifierWithTitle:v5 value:v7 details:0 copyable:1];

  [v3 addObject:v8];
  objc_super v9 = [(VSTVAppDeveloperSettingsAccountViewController_iOS *)self facade];
  id v10 = [v9 billingIdentifier];
  id v11 = [v10 length];

  if (v11)
  {
    id v12 = +[NSBundle vs_frameworkBundle];
    uint64_t v13 = [v12 localizedStringForKey:@"TV_APP_DEVELOPER_BILLING_ID" value:0 table:0];

    id v14 = [(VSTVAppDeveloperSettingsAccountViewController_iOS *)self facade];
    v15 = [v14 billingIdentifier];
    v16 = [(VSTVAppDeveloperSettingsAccountViewController_iOS *)self specifierWithTitle:v13 value:v15 details:0 copyable:1];

    [v3 addObject:v16];
  }
  v17 = [(VSTVAppDeveloperSettingsAccountViewController_iOS *)self facade];
  v18 = [v17 billingCycleEndDate];
  id v19 = [v18 length];

  if (v19)
  {
    v20 = +[NSBundle vs_frameworkBundle];
    id v21 = [v20 localizedStringForKey:@"TV_APP_DEVELOPER_BILLING_CYCLE_END_DATE" value:0 table:0];

    id v22 = [(VSTVAppDeveloperSettingsAccountViewController_iOS *)self facade];
    id v23 = [v22 billingCycleEndDate];
    v24 = [(VSTVAppDeveloperSettingsAccountViewController_iOS *)self specifierWithTitle:v21 value:v23 details:0 copyable:1];

    [v3 addObject:v24];
  }
  v25 = [(VSTVAppDeveloperSettingsAccountViewController_iOS *)self facade];
  v26 = [v25 tierIdentifiers];
  id v27 = [v26 count];

  if (v27)
  {
    v28 = +[NSBundle vs_frameworkBundle];
    v29 = [v28 localizedStringForKey:@"TV_APP_DEVELOPER_TIERS" value:0 table:0];

    v30 = [(VSTVAppDeveloperSettingsAccountViewController_iOS *)self facade];
    id v31 = [v30 tierIdentifiers];
    v32 = [(VSTVAppDeveloperSettingsAccountViewController_iOS *)self specifierWithTitle:v29 value:0 details:v31 copyable:0];

    [v3 addObject:v32];
  }
  v33 = [(VSTVAppDeveloperSettingsAccountViewController_iOS *)self groupWithSpecifiers:v3];

  return v33;
}

- (id)refreshGroupSpecifiers
{
  id v3 = +[NSBundle vs_frameworkBundle];
  id v4 = [v3 localizedStringForKey:@"TV_APP_DEVELOPER_REFRESH_ACCOUNT" value:0 table:0];

  objc_super v5 = +[PSSpecifier preferenceSpecifierNamed:v4 target:self set:0 get:0 detail:0 cell:13 edit:0];
  [v5 setButtonAction:"refreshAccount"];
  [v5 setProperty:&off_8780 forKey:PSAlignmentKey];
  [(VSTVAppDeveloperSettingsAccountViewController_iOS *)self setRefreshSpecifier:v5];
  objc_super v9 = v5;
  id v6 = +[NSArray arrayWithObjects:&v9 count:1];
  id v7 = [(VSTVAppDeveloperSettingsAccountViewController_iOS *)self groupWithSpecifiers:v6];

  return v7;
}

- (VSUserAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

- (VSUserAccountFacade)facade
{
  return self->_facade;
}

- (void)setFacade:(id)a3
{
}

- (VSRemoteNotifier)remoteNotifier
{
  return self->_remoteNotifier;
}

- (void)setRemoteNotifier:(id)a3
{
}

- (PSSpecifier)refreshSpecifier
{
  return self->_refreshSpecifier;
}

- (void)setRefreshSpecifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_refreshSpecifier, 0);
  objc_storeStrong((id *)&self->_remoteNotifier, 0);
  objc_storeStrong((id *)&self->_facade, 0);

  objc_storeStrong((id *)&self->_account, 0);
}

@end
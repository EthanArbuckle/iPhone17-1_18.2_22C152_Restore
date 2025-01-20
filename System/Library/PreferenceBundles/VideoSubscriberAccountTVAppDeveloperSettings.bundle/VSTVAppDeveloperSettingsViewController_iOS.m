@interface VSTVAppDeveloperSettingsViewController_iOS
- (BOOL)loading;
- (NSDictionary)groupedDeveloperAccounts;
- (VSRemoteNotifier)remoteNotifier;
- (VSTVAppDeveloperSettingsViewController_iOS)init;
- (VSTVAppDeveloperSettingsViewController_iOS)initWithNibName:(id)a3 bundle:(id)a4;
- (id)specifiers;
- (void)fetchAccounts;
- (void)setGroupedDeveloperAccounts:(id)a3;
- (void)setLoading:(BOOL)a3;
- (void)setRemoteNotifier:(id)a3;
- (void)viewDidLoad;
@end

@implementation VSTVAppDeveloperSettingsViewController_iOS

- (VSTVAppDeveloperSettingsViewController_iOS)init
{
  return [(VSTVAppDeveloperSettingsViewController_iOS *)self initWithNibName:0 bundle:0];
}

- (VSTVAppDeveloperSettingsViewController_iOS)initWithNibName:(id)a3 bundle:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)VSTVAppDeveloperSettingsViewController_iOS;
  v4 = [(VSTVAppDeveloperSettingsViewController_iOS *)&v9 initWithNibName:0 bundle:0];
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
  v3.receiver = self;
  v3.super_class = (Class)VSTVAppDeveloperSettingsViewController_iOS;
  [(VSTVAppDeveloperSettingsViewController_iOS *)&v3 viewDidLoad];
  [(VSTVAppDeveloperSettingsViewController_iOS *)self fetchAccounts];
}

- (id)specifiers
{
  id v36 = objc_alloc_init((Class)NSMutableArray);
  objc_super v3 = [(VSTVAppDeveloperSettingsViewController_iOS *)self groupedDeveloperAccounts];
  if ([v3 count])
  {
    v35 = self;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    v28 = v3;
    id obj = v3;
    id v30 = [obj countByEnumeratingWithState:&v41 objects:v46 count:16];
    if (v30)
    {
      uint64_t v29 = *(void *)v42;
      uint64_t v4 = PSCellClassKey;
      uint64_t v5 = PSTitleKey;
      uint64_t v6 = PSTableCellSubtitleTextKey;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v42 != v29) {
            objc_enumerationMutation(obj);
          }
          uint64_t v33 = v7;
          uint64_t v8 = *(void *)(*((void *)&v41 + 1) + 8 * v7);
          v32 = +[PSSpecifier groupSpecifierWithName:v8];
          objc_msgSend(v36, "addObject:");
          objc_super v9 = [obj objectForKey:v8];
          long long v37 = 0u;
          long long v38 = 0u;
          long long v39 = 0u;
          long long v40 = 0u;
          id v34 = v9;
          id v10 = [v9 countByEnumeratingWithState:&v37 objects:v45 count:16];
          if (v10)
          {
            id v11 = v10;
            uint64_t v12 = *(void *)v38;
            do
            {
              for (i = 0; i != v11; i = (char *)i + 1)
              {
                if (*(void *)v38 != v12) {
                  objc_enumerationMutation(v34);
                }
                uint64_t v14 = *(void *)(*((void *)&v37 + 1) + 8 * i);
                v15 = [[VSUserAccountFacade alloc] initWithAccount:v14];
                v16 = [(VSUserAccountFacade *)v15 displayName];
                v17 = +[PSSpecifier preferenceSpecifierNamed:v16 target:v35 set:0 get:0 detail:objc_opt_class() cell:1 edit:0];

                [v17 setProperty:v14 forKey:@"VSTVAppDeveloperSettingsUserAccountKey"];
                [v17 setProperty:objc_opt_class() forKey:v4];
                v18 = [(VSUserAccountFacade *)v15 displayNameWithSynchedToThisDeviceIndicator];
                [v17 setProperty:v18 forKey:v5];
                v19 = [(VSUserAccountFacade *)v15 lastModifiedLong];
                [v17 setProperty:v19 forKey:v6];

                [v36 addObject:v17];
              }
              id v11 = [v34 countByEnumeratingWithState:&v37 objects:v45 count:16];
            }
            while (v11);
          }

          uint64_t v7 = v33 + 1;
        }
        while ((id)(v33 + 1) != v30);
        id v30 = [obj countByEnumeratingWithState:&v41 objects:v46 count:16];
      }
      while (v30);
    }

    self = v35;
    objc_super v3 = v28;
  }
  else if (![(VSTVAppDeveloperSettingsViewController_iOS *)self loading])
  {
    v20 = +[NSBundle vs_frameworkBundle];
    v21 = [v20 localizedStringForKey:@"TV_APP_DEVELOPER_NO_ACCOUNTS_PLACEHOLDER" value:0 table:0];

    v22 = +[PSSpecifier groupSpecifierWithName:0];
    [v22 setProperty:v21 forKey:PSFooterTextGroupKey];
    [v22 setProperty:&off_8768 forKey:PSFooterAlignmentGroupKey];
    [v36 addObject:v22];
  }
  id v23 = [v36 copy];
  uint64_t v24 = OBJC_IVAR___PSListController__specifiers;
  v25 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  *(void *)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers] = v23;

  id v26 = *(id *)&self->PSListController_opaque[v24];
  return v26;
}

- (void)fetchAccounts
{
  [(VSTVAppDeveloperSettingsViewController_iOS *)self setLoading:1];
  objc_super v3 = +[VSUserAccountManager sharedUserAccountManager];
  objc_initWeak(&location, self);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_3560;
  v4[3] = &unk_8288;
  objc_copyWeak(&v5, &location);
  [v3 fetchDeveloperUserAccountsWithCompletion:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (NSDictionary)groupedDeveloperAccounts
{
  return self->_groupedDeveloperAccounts;
}

- (void)setGroupedDeveloperAccounts:(id)a3
{
}

- (VSRemoteNotifier)remoteNotifier
{
  return self->_remoteNotifier;
}

- (void)setRemoteNotifier:(id)a3
{
}

- (BOOL)loading
{
  return self->_loading;
}

- (void)setLoading:(BOOL)a3
{
  self->_loading = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteNotifier, 0);

  objc_storeStrong((id *)&self->_groupedDeveloperAccounts, 0);
}

@end
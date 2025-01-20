@interface MFNanoAccountsSettingsViewController
- (MFNanoAccountsSettingsDataSource)datasource;
- (NMCUICloudNotificationAccountDataSource)cloudNotificationDatasource;
- (UITableView)tableView;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)accountsSettingsDataSource:(id)a3 didReceivedAuthenticationFailureForAccount:(id)a4;
- (void)accountsSettingsDataSourceDidUpdate:(id)a3;
- (void)setCloudNotificationDatasource:(id)a3;
- (void)setDatasource:(id)a3;
- (void)setTableView:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updateAccounts;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation MFNanoAccountsSettingsViewController

- (void)viewDidLoad
{
  v30.receiver = self;
  v30.super_class = (Class)MFNanoAccountsSettingsViewController;
  [(MFNanoAccountsSettingsViewController *)&v30 viewDidLoad];
  v3 = [(MFNanoAccountsSettingsViewController *)self specifier];
  v4 = [v3 userInfo];
  v5 = [v4 objectForKeyedSubscript:@"MFNanoSettingsAccountDataSourceKey"];

  if (v5)
  {
    v6 = [(MFNanoAccountsSettingsViewController *)self specifier];
    v7 = [v6 userInfo];
    v8 = [v7 objectForKeyedSubscript:@"MFNanoSettingsAccountDataSourceKey"];
    datasource = self->_datasource;
    self->_datasource = v8;
  }
  else
  {
    v10 = objc_alloc_init(MFNanoAccountsSettingsDataSource);
    v6 = self->_datasource;
    self->_datasource = v10;
  }

  [(MFNanoAccountsSettingsDataSource *)self->_datasource addObserver:self];
  v11 = [(MFNanoAccountsSettingsViewController *)self specifier];
  v12 = [v11 userInfo];
  v13 = [v12 objectForKeyedSubscript:@"MFNanoSettingsCloudNotificationDataSourceKey"];

  if (v13)
  {
    v14 = [(MFNanoAccountsSettingsViewController *)self specifier];
    v15 = [v14 userInfo];
    v16 = [(MFNanoCloudNotificationAccountDataSource *)v15 objectForKeyedSubscript:@"MFNanoSettingsCloudNotificationDataSourceKey"];
  }
  else
  {
    id v17 = objc_alloc((Class)NMCUICloudNotificationAccountDataSource);
    v18 = [MFNanoCloudNotificationAccountDataSource alloc];
    v14 = [(MFNanoAccountsSettingsViewController *)self datasource];
    v15 = [(MFNanoCloudNotificationAccountDataSource *)v18 initWithAccountDataSource:v14];
    v16 = (NMCUICloudNotificationAccountDataSource *)[v17 initWithAccountDataSource:v15];
  }
  cloudNotificationDatasource = self->_cloudNotificationDatasource;
  self->_cloudNotificationDatasource = v16;

  id v20 = objc_alloc((Class)UITableView);
  v21 = [(MFNanoAccountsSettingsViewController *)self view];
  [v21 bounds];
  v22 = (UITableView *)objc_msgSend(v20, "initWithFrame:style:", 2);
  tableView = self->_tableView;
  self->_tableView = v22;

  [(UITableView *)self->_tableView setAutoresizingMask:18];
  [(UITableView *)self->_tableView setDelegate:self];
  [(UITableView *)self->_tableView setDataSource:self];
  v24 = [(MFNanoAccountsSettingsViewController *)self view];
  [v24 addSubview:self->_tableView];

  v25 = [(MFNanoAccountsSettingsViewController *)self tableView];
  uint64_t v26 = objc_opt_class();
  v27 = +[NMCUIAccountsSettingsViewCell reuseIdentifier];
  [v25 registerClass:v26 forCellReuseIdentifier:v27];

  [(MFNanoAccountsSettingsDataSource *)self->_datasource refreshAccounts];
  v28 = +[NSBundle bundleForClass:objc_opt_class()];
  v29 = [v28 localizedStringForKey:@"ACCOUNTS_SCREEN_TITLE" value:&stru_2CC10 table:@"Main"];
  [(MFNanoAccountsSettingsViewController *)self setTitle:v29];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MFNanoAccountsSettingsViewController;
  [(MFNanoAccountsSettingsViewController *)&v4 viewWillAppear:a3];
  [(MFNanoAccountsSettingsViewController *)self updateAccounts];
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MFNanoAccountsSettingsViewController;
  [(MFNanoAccountsSettingsViewController *)&v5 viewDidAppear:a3];
  objc_super v4 = +[NSNotificationCenter defaultCenter];
  [v4 addObserver:self selector:"applicationWillEnterForegroundNotification" name:UIApplicationWillEnterForegroundNotification object:0];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MFNanoAccountsSettingsViewController;
  [(MFNanoAccountsSettingsViewController *)&v5 viewDidDisappear:a3];
  objc_super v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self];
}

- (void)updateAccounts
{
  id v3 = [(MFNanoAccountsSettingsViewController *)self datasource];
  [v3 refreshAccounts];

  id v4 = [(MFNanoAccountsSettingsViewController *)self tableView];
  [v4 reloadData];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  objc_super v5 = [(MFNanoAccountsSettingsViewController *)self datasource];
  v6 = [v5 accounts];
  id v7 = [v6 count];

  if (!v7) {
    return 1;
  }
  v8 = [(MFNanoAccountsSettingsViewController *)self datasource];
  v9 = [v8 accounts];
  id v10 = [v9 count];

  return (int64_t)v10;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v4 = +[NSBundle bundleForClass:objc_opt_class()];
  objc_super v5 = [v4 localizedStringForKey:@"WATCH_ACCOUNTS_SECTION_TITLE" value:&stru_2CC10 table:@"Main"];

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = +[NMCUIAccountsSettingsViewCell reuseIdentifier];
  v9 = [v6 dequeueReusableCellWithIdentifier:v8 forIndexPath:v7];

  id v10 = [(MFNanoAccountsSettingsViewController *)self datasource];
  v11 = [v10 accounts];
  id v12 = [v11 count];

  if (v12)
  {
    v13 = [(MFNanoAccountsSettingsViewController *)self datasource];
    v14 = [v13 accounts];
    v15 = objc_msgSend(v14, "objectAtIndexedSubscript:", objc_msgSend(v7, "item"));

    v16 = [v15 displayName];
    id v17 = [v9 textLabel];
    [v17 setText:v16];

    v18 = [v15 defaultEmailAddress];
    v19 = v18;
    if (!v18)
    {
      id v17 = [v15 emailAddresses];
      v19 = [v17 firstObject];
    }
    id v20 = [v9 detailTextLabel];
    [v20 setText:v19];

    if (!v18)
    {
    }
    v21 = [(MFNanoAccountsSettingsViewController *)self datasource];
    unsigned __int8 v22 = [v21 isAccountActive:v15];

    if ((v22 & 1) != 0
      || ([(MFNanoAccountsSettingsViewController *)self datasource],
          v23 = objc_claimAutoreleasedReturnValue(),
          unsigned int v24 = [v23 isAccountDisabled:v15],
          v23,
          v24))
    {
      [v9 setAccessoryView:0];
      uint64_t v25 = 0;
    }
    else
    {
      objc_super v30 = [(MFNanoAccountsSettingsViewController *)self datasource];
      unsigned int v31 = [v30 isAccountRequiringAttention:v15];

      if (v31)
      {
        v32 = [v9 warningLabel];
        [v9 setAccessoryView:v32];
        uint64_t v25 = 3;
      }
      else
      {
        if ([v15 standaloneState] != (char *)&dword_0 + 1) {
          goto LABEL_10;
        }
        v33 = [v9 spinner];
        [v33 startAnimating];

        v32 = [v9 spinner];
        [v9 setAccessoryView:v32];
        uint64_t v25 = 0;
      }
    }
    [v9 setSelectionStyle:v25];
LABEL_10:

    goto LABEL_12;
  }
  uint64_t v26 = +[NSBundle bundleForClass:objc_opt_class()];
  v27 = [v26 localizedStringForKey:@"NO_ACCOUNTS" value:&stru_2CC10 table:@"Main"];
  v28 = [v9 textLabel];
  [v28 setText:v27];

  [v9 setSelectionStyle:0];
LABEL_12:

  return v9;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(MFNanoAccountsSettingsViewController *)self datasource];
  v9 = [v8 accounts];
  id v10 = [v9 count];

  if (v10)
  {
    v11 = [(MFNanoAccountsSettingsViewController *)self datasource];
    id v12 = [v11 accounts];
    v13 = objc_msgSend(v12, "objectAtIndexedSubscript:", objc_msgSend(v7, "item"));

    v14 = [(MFNanoAccountsSettingsViewController *)self datasource];
    if ([v14 canMakeChanges:v13])
    {
      v15 = [(MFNanoAccountsSettingsViewController *)self datasource];
      unsigned int v16 = [v15 isGmailAccount:v13];

      if (v16)
      {
        id location = (id)0xAAAAAAAAAAAAAAAALL;
        objc_initWeak(&location, self);
        id v17 = objc_alloc((Class)SLGoogleAuthController);
        v18 = +[GmailAccount displayedAccountTypeString];
        v26[0] = _NSConcreteStackBlock;
        v26[1] = 3221225472;
        v26[2] = sub_A8E4;
        v26[3] = &unk_2C890;
        objc_copyWeak(&v27, &location);
        id v19 = [v17 initWithAccountDescription:v18 presentationBlock:v26];

        id v20 = _NSConcreteStackBlock;
        uint64_t v21 = 3221225472;
        unsigned __int8 v22 = sub_A960;
        v23 = &unk_2C8E0;
        objc_copyWeak(&v25, &location);
        id v24 = v13;
        [v19 setCompletion:&v20];

        objc_destroyWeak(&v25);
        objc_destroyWeak(&v27);
        objc_destroyWeak(&location);
      }
    }
    else
    {
    }
  }
  objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v7, 1, v20, v21, v22, v23);
}

- (void)accountsSettingsDataSourceDidUpdate:(id)a3
{
  id v3 = [(MFNanoAccountsSettingsViewController *)self tableView];
  [v3 reloadData];
}

- (void)accountsSettingsDataSource:(id)a3 didReceivedAuthenticationFailureForAccount:(id)a4
{
  objc_super v5 = +[NSBundle bundleForClass:objc_opt_class()];
  id v6 = [v5 localizedStringForKey:@"AUTHENTICATION_FAILURE_ALERT_TITLE" value:&stru_2CC10 table:@"Main"];
  id v7 = +[NSBundle bundleForClass:objc_opt_class()];
  v8 = [v7 localizedStringForKey:@"AUTHENTICATION_FAILURE_ALERT_DETAILS" value:&stru_2CC10 table:@"Main"];
  id v12 = +[UIAlertController alertControllerWithTitle:v6 message:v8 preferredStyle:1];

  v9 = +[NSBundle bundleForClass:objc_opt_class()];
  id v10 = [v9 localizedStringForKey:@"OK_ALERT_BUTTON" value:&stru_2CC10 table:@"Main"];
  v11 = +[UIAlertAction actionWithTitle:v10 style:1 handler:0];

  [v12 addAction:v11];
  [(MFNanoAccountsSettingsViewController *)self presentViewController:v12 animated:1 completion:0];
}

- (MFNanoAccountsSettingsDataSource)datasource
{
  return self->_datasource;
}

- (void)setDatasource:(id)a3
{
}

- (NMCUICloudNotificationAccountDataSource)cloudNotificationDatasource
{
  return self->_cloudNotificationDatasource;
}

- (void)setCloudNotificationDatasource:(id)a3
{
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_cloudNotificationDatasource, 0);

  objc_storeStrong((id *)&self->_datasource, 0);
}

@end
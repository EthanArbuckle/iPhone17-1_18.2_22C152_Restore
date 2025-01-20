@interface ICSettingsAccountsPasswordViewController
- (NSArray)accountSpecifiers;
- (PSSpecifier)accountGroupSpecifier;
- (id)specifierForAccount:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (void)didTapAccountButton:(id)a3;
- (void)reloadSpecifiers;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation ICSettingsAccountsPasswordViewController

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ICSettingsAccountsPasswordViewController;
  [(ICSettingsAccountsPasswordViewController *)&v6 viewWillAppear:a3];
  v4 = [(ICSettingsAccountsPasswordViewController *)self bundle];
  v5 = [v4 localizedStringForKey:@"NOTES_PW_NAVIGATION_TITLE" value:@"Password" table:@"Settings"];
  [(ICSettingsAccountsPasswordViewController *)self setTitle:v5];

  [(ICSettingsAccountsPasswordViewController *)self reloadSpecifiers];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ICSettingsAccountsPasswordViewController;
  [(ICSettingsAccountsPasswordViewController *)&v4 viewDidAppear:a3];
  [(ICSettingsAccountsPasswordViewController *)self ic_submitNavigationEventForIdentifier:@"PASSWORD" titleStringKey:@"PASSWORD_SETTINGS" navigationComponents:&off_1F1C0];
}

- (void)reloadSpecifiers
{
  accountGroupSpecifier = self->_accountGroupSpecifier;
  self->_accountGroupSpecifier = 0;

  accountSpecifiers = self->_accountSpecifiers;
  self->_accountSpecifiers = 0;

  id v7 = objc_alloc_init((Class)NSMutableArray);
  v5 = [(ICSettingsAccountsPasswordViewController *)self accountGroupSpecifier];
  [v7 addObject:v5];

  objc_super v6 = [(ICSettingsAccountsPasswordViewController *)self accountSpecifiers];
  [v7 addObjectsFromArray:v6];

  [(ICSettingsAccountsPasswordViewController *)self setSpecifiers:v7];
}

- (PSSpecifier)accountGroupSpecifier
{
  accountGroupSpecifier = self->_accountGroupSpecifier;
  if (!accountGroupSpecifier)
  {
    objc_super v4 = [(ICSettingsAccountsPasswordViewController *)self bundle];
    v5 = [v4 localizedStringForKey:@"ACCOUNTS_GROUP_TITLE" value:@"Accounts" table:@"Settings"];
    objc_super v6 = +[PSSpecifier groupSpecifierWithName:v5];
    id v7 = self->_accountGroupSpecifier;
    self->_accountGroupSpecifier = v6;

    accountGroupSpecifier = self->_accountGroupSpecifier;
  }

  return accountGroupSpecifier;
}

- (NSArray)accountSpecifiers
{
  accountSpecifiers = self->_accountSpecifiers;
  if (!accountSpecifiers)
  {
    objc_super v4 = +[ICNoteContext sharedContext];
    v5 = [v4 managedObjectContext];
    objc_super v6 = +[ICAccount allActiveAccountsInContextSortedByAccountType:v5];

    id v7 = ICKeyPathFromSelector();
    v8 = +[NSSortDescriptor sortDescriptorWithKey:v7 ascending:1 selector:"localizedCaseInsensitiveCompare:"];
    v15 = v8;
    v9 = +[NSArray arrayWithObjects:&v15 count:1];
    v10 = [v6 sortedArrayUsingDescriptors:v9];

    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_94A8;
    v14[3] = &unk_1C9E8;
    v14[4] = self;
    objc_msgSend(v10, "ic_map:", v14);
    v11 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v12 = self->_accountSpecifiers;
    self->_accountSpecifiers = v11;

    accountSpecifiers = self->_accountSpecifiers;
  }

  return accountSpecifiers;
}

- (id)specifierForAccount:(id)a3
{
  id v4 = a3;
  v5 = +[ICAccountUtilities sharedInstance];
  objc_super v6 = [v4 identifier];
  id v7 = [v5 iCloudACAccountWithIdentifier:v6];
  v8 = [v7 username];

  v9 = [v4 name];
  v10 = +[PSSpecifier preferenceSpecifierNamed:v9 target:self set:0 get:0 detail:objc_opt_class() cell:2 edit:0];

  [v10 setButtonAction:"didTapAccountButton:"];
  [v10 setProperty:objc_opt_class() forKey:PSCellClassKey];
  [v10 setProperty:v8 forKey:PSTableCellSubtitleTextKey];
  CFStringRef v14 = @"ICAccountID";
  v11 = [v4 objectID];

  v15 = v11;
  v12 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
  [v10 setUserInfo:v12];

  return v10;
}

- (void)didTapAccountButton:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  v5 = [v4 userInfo];

  objc_super v6 = [v5 objectForKeyedSubscript:@"ICAccountID"];
  ICCheckedDynamicCast();
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  id v7 = [[ICSettingsPasswordViewController alloc] initWithAccountID:v9];
  v8 = [(ICSettingsAccountsPasswordViewController *)self navigationController];
  [v8 pushViewController:v7 animated:1];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)ICSettingsAccountsPasswordViewController;
  id v6 = a4;
  id v7 = [(ICSettingsAccountsPasswordViewController *)&v12 tableView:a3 cellForRowAtIndexPath:v6];
  v8 = -[ICSettingsAccountsPasswordViewController specifierAtIndexPath:](self, "specifierAtIndexPath:", v6, v12.receiver, v12.super_class);

  id v9 = [v8 propertyForKey:PSTableCellSubtitleTextKey];
  if ([v9 length])
  {
    v10 = [v7 detailTextLabel];
    [v10 setText:v9];
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountSpecifiers, 0);

  objc_storeStrong((id *)&self->_accountGroupSpecifier, 0);
}

@end
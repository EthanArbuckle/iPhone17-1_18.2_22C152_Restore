@interface BYODSelectEmailTableViewController
- (BOOL)_isSelectedEmailAddress:(id)a3;
- (BYODSelectEmailTableViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 adoptTableViewScrollView:(BOOL)a6 userAccount:(id)a7 emailListResponse:(id)a8 domainName:(id)a9;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_buttonTapped:(id)a3;
- (void)_continueButtonTapped:(id)a3;
- (void)_mailSettingsTapped:(id)a3;
- (void)_obDoneTapped:(id)a3;
- (void)_setDefaultEmailAddress:(id)a3;
- (void)_showDefaultEmailDoneScreen;
- (void)viewDidLoad;
@end

@implementation BYODSelectEmailTableViewController

- (BYODSelectEmailTableViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 adoptTableViewScrollView:(BOOL)a6 userAccount:(id)a7 emailListResponse:(id)a8 domainName:(id)a9
{
  BOOL v11 = a6;
  id v27 = a7;
  id v16 = a8;
  id v17 = a9;
  v28.receiver = self;
  v28.super_class = (Class)BYODSelectEmailTableViewController;
  v18 = [(BYODSelectEmailTableViewController *)&v28 initWithTitle:a3 detailText:a4 icon:a5 adoptTableViewScrollView:v11];
  if (v18)
  {
    v19 = +[OBBoldTrayButton boldButton];
    v20 = +[NSBundle bundleForClass:objc_opt_class()];
    v21 = [v20 localizedStringForKey:@"CONTINUE_TEXT" value:&stru_B9F70 table:@"AccountPreferences"];
    [v19 setTitle:v21 forState:0];

    [v19 addTarget:v18 action:"_continueButtonTapped:" forControlEvents:64];
    v22 = [(BYODSelectEmailTableViewController *)v18 buttonTray];
    [v22 addButton:v19];

    objc_storeStrong((id *)&_loggedInUserAccount, a7);
    objc_storeStrong((id *)&_defaultEmailList, a8);
    v23 = [(id)_defaultEmailList result];
    uint64_t v24 = [v23 defaultSendFromEmail];
    v25 = (void *)_selectedEmailAddress;
    _selectedEmailAddress = v24;

    objc_storeStrong((id *)&_selectedEmailDomainName, a9);
  }

  return v18;
}

- (void)viewDidLoad
{
  v13.receiver = self;
  v13.super_class = (Class)BYODSelectEmailTableViewController;
  [(BYODSelectEmailTableViewController *)&v13 viewDidLoad];
  v3 = [(BYODSelectEmailTableViewController *)self navigationItem];
  [v3 setHidesBackButton:1];

  id v4 = objc_msgSend(objc_alloc((Class)UITableView), "initWithFrame:style:", 2, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  [(BYODSelectEmailTableViewController *)self setTableView:v4];

  v5 = [(BYODSelectEmailTableViewController *)self tableView];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];

  v6 = [(BYODSelectEmailTableViewController *)self tableView];
  [v6 setRowHeight:50.0];

  v7 = +[UIColor clearColor];
  v8 = [(BYODSelectEmailTableViewController *)self tableView];
  [v8 setBackgroundColor:v7];

  v9 = [(BYODSelectEmailTableViewController *)self tableView];
  [v9 registerClass:objc_opt_class() forCellReuseIdentifier:@"BYODTableViewCellWithSelectorView"];

  v10 = [(BYODSelectEmailTableViewController *)self tableView];
  [v10 setDelegate:self];

  BOOL v11 = [(BYODSelectEmailTableViewController *)self tableView];
  [v11 setDataSource:self];

  v12 = [(BYODSelectEmailTableViewController *)self tableView];
  [v12 reloadData];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  v7 = [a3 dequeueReusableCellWithIdentifier:@"BYODTableViewCellWithSelectorView"];
  if (!v7) {
    v7 = [[BYODTableViewCellWithSelectorView alloc] initWithStyle:0 reuseIdentifier:@"BYODTableViewCellWithSelectorView"];
  }
  v8 = [(id)_defaultEmailList result];
  v9 = [v8 emails];
  v10 = objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v6, "row"));

  BOOL v11 = +[UIColor secondarySystemBackgroundColor];
  [(BYODTableViewCellWithSelectorView *)v7 setBackgroundColor:v11];

  v12 = [(BYODTableViewCellWithSelectorView *)v7 titleLabel];
  [v12 setText:v10];

  objc_super v13 = +[UIColor labelColor];
  v14 = [(BYODTableViewCellWithSelectorView *)v7 titleLabel];
  [v14 setTextColor:v13];

  [(BYODTableViewCellWithSelectorView *)v7 setSelectionStyle:0];
  v15 = [(BYODTableViewCellWithSelectorView *)v7 selectButton];
  [v15 addTarget:self action:"_buttonTapped:" forControlEvents:64];

  id v16 = [(BYODTableViewCellWithSelectorView *)v7 selectButton];
  objc_msgSend(v16, "setTag:", objc_msgSend(v6, "row"));

  id v17 = +[UIImageSymbolConfiguration configurationWithPointSize:23.0];
  if ([(BYODSelectEmailTableViewController *)self _isSelectedEmailAddress:v10])
  {
    v18 = +[UIImage systemImageNamed:@"checkmark.circle.fill" withConfiguration:v17];
    v19 = [(BYODTableViewCellWithSelectorView *)v7 selectButton];
    [v19 setBackgroundImage:v18 forState:0];

    v20 = [(BYODTableViewCellWithSelectorView *)v7 selectButton];
    +[UIColor systemBlueColor];
  }
  else
  {
    v18 = +[UIImage systemImageNamed:@"circle" withConfiguration:v17];
    v22 = [(BYODTableViewCellWithSelectorView *)v7 selectButton];
    [v22 setBackgroundImage:v18 forState:0];

    v20 = [(BYODTableViewCellWithSelectorView *)v7 selectButton];
    +[UIColor lightGrayColor];
  v21 = };
  [v20 setTintColor:v21];

  return v7;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v4 = objc_msgSend((id)_defaultEmailList, "result", a3, a4);
  v5 = [v4 emails];
  id v6 = [v5 count];

  return (int64_t)v6;
}

- (BOOL)_isSelectedEmailAddress:(id)a3
{
  return [a3 isEqualToString:_selectedEmailAddress];
}

- (void)_buttonTapped:(id)a3
{
  id v11 = a3;
  id v4 = +[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", [v11 tag], 0);
  v5 = [(BYODSelectEmailTableViewController *)self tableView];
  id v6 = [v5 cellForRowAtIndexPath:v4];

  v7 = [v6 titleLabel];
  uint64_t v8 = [v7 text];
  v9 = (void *)_selectedEmailAddress;
  _selectedEmailAddress = v8;

  v10 = [(BYODSelectEmailTableViewController *)self tableView];
  [v10 reloadData];
}

- (void)_continueButtonTapped:(id)a3
{
}

- (void)_setDefaultEmailAddress:(id)a3
{
  id v4 = a3;
  [v4 showsBusyIndicator];
  v5 = [BYODSetDefaultEmailRequest alloc];
  uint64_t v6 = _loggedInUserAccount;
  v7 = [(id)_loggedInUserAccount accountStore];
  uint64_t v8 = [(BYODSetDefaultEmailRequest *)v5 initWithAccount:v6 accountStore:v7 email:_selectedEmailAddress domain:_selectedEmailDomainName];

  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_62C80;
  v10[3] = &unk_B9598;
  objc_copyWeak(&v12, &location);
  id v9 = v4;
  id v11 = v9;
  [(BYODSetDefaultEmailRequest *)v8 performRequestWithCallback:v10];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (void)_showDefaultEmailDoneScreen
{
  v3 = +[NSBundle bundleForClass:objc_opt_class()];
  id v4 = [v3 localizedStringForKey:@"BYOD_SELECT_DEFAULT_EMAIL_DONE_TITLE" value:&stru_B9F70 table:@"AccountPreferences"];
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", v4, _selectedEmailAddress);
  id v20 = (id)objc_claimAutoreleasedReturnValue();

  v5 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v6 = +[UIImage imageNamed:@"CustomDomainIcon.png" inBundle:v5];

  id v7 = objc_alloc((Class)OBWelcomeController);
  uint64_t v8 = +[NSBundle bundleForClass:objc_opt_class()];
  id v9 = [v8 localizedStringForKey:@"BYOD_SELECT_DEFAULT_EMAIL_DONE_CONTENT" value:&stru_B9F70 table:@"AccountPreferences"];
  id v10 = [v7 initWithTitle:v20 detailText:v9 icon:v6];

  id v11 = +[OBBoldTrayButton boldButton];
  id v12 = +[NSBundle bundleForClass:objc_opt_class()];
  objc_super v13 = [v12 localizedStringForKey:@"DONE" value:&stru_B9F70 table:@"AccountPreferences"];
  [v11 setTitle:v13 forState:0];

  [v11 addTarget:self action:"_obDoneTapped:" forEvents:64];
  v14 = [v10 buttonTray];
  [v14 addButton:v11];

  v15 = +[OBLinkTrayButton linkButton];
  id v16 = +[NSBundle bundleForClass:objc_opt_class()];
  id v17 = [v16 localizedStringForKey:@"BYOD_MAIL_SETTINGS_PREFS_LINK" value:&stru_B9F70 table:@"AccountPreferences"];
  [v15 setTitle:v17 forState:0];

  [v15 addTarget:self action:"_mailSettingsTapped:" forEvents:64];
  v18 = [v10 buttonTray];
  [v18 addButton:v15];

  v19 = [(BYODSelectEmailTableViewController *)self navigationController];
  [v19 pushViewController:v10 animated:1];
}

- (void)_obDoneTapped:(id)a3
{
  id v4 = [(BYODSelectEmailTableViewController *)self navigationController];
  v3 = [v4 byodDelegate];
  [v3 updateDomainData];
}

- (void)_mailSettingsTapped:(id)a3
{
  id v4 = +[LSApplicationWorkspace defaultWorkspace];
  v3 = +[NSURL URLWithString:@"prefs:root=APPLE_ACCOUNT&path=ICLOUD_SERVICE/com.apple.Dataclass.Mail"];
  [v4 openSensitiveURL:v3 withOptions:0];
}

@end
@interface BYODDoneSetupDomainViewController
- (ACAccount)loggedInUserAccount;
- (BOOL)showDefaultEmailSelect;
- (BYODDoneSetupDomainViewController)initWithDomainName:(id)a3 acAccount:(id)a4;
- (BYODSpinner)spinner;
- (NSString)domainName;
- (void)_addButtonTrayButtons:(id)a3;
- (void)_loadDomainDetails;
- (void)setDomainName:(id)a3;
- (void)setLoggedInUserAccount:(id)a3;
- (void)setShowDefaultEmailSelect:(BOOL)a3;
- (void)setSpinner:(id)a3;
- (void)viewDidLoad;
@end

@implementation BYODDoneSetupDomainViewController

- (BYODDoneSetupDomainViewController)initWithDomainName:(id)a3 acAccount:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)BYODDoneSetupDomainViewController;
  v8 = [(BYODBaseViewController *)&v11 initWithACAccount:v7];
  v9 = v8;
  if (v8)
  {
    [(BYODDoneSetupDomainViewController *)v8 setDomainName:v6];
    [(BYODDoneSetupDomainViewController *)v9 setLoggedInUserAccount:v7];
  }

  return v9;
}

- (void)viewDidLoad
{
  v12.receiver = self;
  v12.super_class = (Class)BYODDoneSetupDomainViewController;
  [(BYODBaseViewController *)&v12 viewDidLoad];
  v3 = +[NSBundle bundleForClass:objc_opt_class()];
  v4 = [v3 localizedStringForKey:@"BYOD_DONE_DOMAIN_SETUP_TITLE" value:&stru_B9F70 table:@"AccountPreferences"];

  v5 = +[NSBundle bundleForClass:objc_opt_class()];
  id v6 = [v5 localizedStringForKey:@"BYOD_DONE_DOMAIN_SETUP_BODY" value:&stru_B9F70 table:@"AccountPreferences"];

  id v7 = [(BYODDoneSetupDomainViewController *)self domainName];
  v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v6, v7);

  v9 = +[NSBundle bundleForClass:objc_opt_class()];
  v10 = +[UIImage imageNamed:@"CustomDomainIcon.png" inBundle:v9];

  [(BYODBaseViewController *)self createViewControllerWithTitle:v4 detail:v8 icon:v10];
  objc_super v11 = [(BYODDoneSetupDomainViewController *)self navigationItem];
  [v11 setHidesBackButton:1];
}

- (void)_addButtonTrayButtons:(id)a3
{
  id v8 = a3;
  v4 = +[OBBoldTrayButton boldButton];
  v5 = +[NSBundle bundleForClass:objc_opt_class()];
  id v6 = [v5 localizedStringForKey:@"DONE" value:&stru_B9F70 table:@"AccountPreferences"];
  [v4 setTitle:v6 forState:0];

  [v4 addTarget:self action:"_doneButtonTapped:" forEvents:64];
  id v7 = [v8 buttonTray];
  [v7 addButton:v4];
}

- (void)_loadDomainDetails
{
  v3 = [BYODGetDomainRequest alloc];
  loggedInUserAccount = self->_loggedInUserAccount;
  v5 = [(ACAccount *)loggedInUserAccount accountStore];
  id v6 = [(BYODGetDomainRequest *)v3 initWithAccount:loggedInUserAccount accountStore:v5 domain:self->_domainName];

  id v7 = [(BYODDoneSetupDomainViewController *)self spinner];

  if (!v7)
  {
    id v8 = [[BYODSpinner alloc] initWithViewController:self];
    [(BYODDoneSetupDomainViewController *)self setSpinner:v8];
  }
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_47EC0;
  v13[3] = &unk_B8E88;
  v13[4] = self;
  v9 = +[EFScheduler mainThreadScheduler];
  [v9 performBlock:v13];

  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_47F20;
  v10[3] = &unk_B9290;
  objc_copyWeak(&v11, &location);
  [(BYODGetDomainRequest *)v6 performRequestWithCallback:v10];
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (BOOL)showDefaultEmailSelect
{
  return self->_showDefaultEmailSelect;
}

- (void)setShowDefaultEmailSelect:(BOOL)a3
{
  self->_showDefaultEmailSelect = a3;
}

- (ACAccount)loggedInUserAccount
{
  return self->_loggedInUserAccount;
}

- (void)setLoggedInUserAccount:(id)a3
{
}

- (NSString)domainName
{
  return self->_domainName;
}

- (void)setDomainName:(id)a3
{
}

- (BYODSpinner)spinner
{
  return self->_spinner;
}

- (void)setSpinner:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_domainName, 0);

  objc_storeStrong((id *)&self->_loggedInUserAccount, 0);
}

@end
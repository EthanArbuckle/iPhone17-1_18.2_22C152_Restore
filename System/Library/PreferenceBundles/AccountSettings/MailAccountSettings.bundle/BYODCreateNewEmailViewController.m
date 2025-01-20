@interface BYODCreateNewEmailViewController
+ (id)log;
- (BYODCreateNewEmailViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 adoptTableViewScrollView:(BOOL)a6 acAccount:(id)a7 domainName:(id)a8;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_createEmailTapped:(id)a3;
- (void)_notNowTapped:(id)a3;
- (void)viewDidLoad;
@end

@implementation BYODCreateNewEmailViewController

+ (id)log
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_315C4;
  block[3] = &unk_B8D50;
  block[4] = a1;
  if (qword_D73F8 != -1) {
    dispatch_once(&qword_D73F8, block);
  }
  v2 = (void *)qword_D73F0;

  return v2;
}

- (BYODCreateNewEmailViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 adoptTableViewScrollView:(BOOL)a6 acAccount:(id)a7 domainName:(id)a8
{
  BOOL v10 = a6;
  id v15 = a7;
  id v16 = a8;
  v20.receiver = self;
  v20.super_class = (Class)BYODCreateNewEmailViewController;
  v17 = [(BYODCreateNewEmailViewController *)&v20 initWithTitle:a3 detailText:a4 icon:a5 adoptTableViewScrollView:v10];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_domainName, a8);
    objc_storeStrong((id *)&v18->_loggedInAppleAccount, a7);
  }

  return v18;
}

- (void)viewDidLoad
{
  v22.receiver = self;
  v22.super_class = (Class)BYODCreateNewEmailViewController;
  [(BYODCreateNewEmailViewController *)&v22 viewDidLoad];
  id v3 = objc_alloc((Class)UIBarButtonItem);
  v4 = +[NSBundle bundleForClass:objc_opt_class()];
  v5 = [v4 localizedStringForKey:@"BYOD_CREATE_EMAIL_NOT_NOW" value:&stru_B9F70 table:@"AccountPreferences"];
  id v6 = [v3 initWithTitle:v5 style:0 target:self action:"_notNowTapped:"];
  v7 = [(BYODCreateNewEmailViewController *)self navigationItem];
  [v7 setLeftBarButtonItem:v6];

  v8 = [(BYODCreateNewEmailViewController *)self navigationItem];
  id v9 = objc_alloc((Class)UIBarButtonItem);
  BOOL v10 = +[NSBundle bundleForClass:objc_opt_class()];
  v11 = [v10 localizedStringForKey:@"BYOD_CREATE_EMAIL_BUTTON" value:&stru_B9F70 table:@"AccountPreferences"];
  id v12 = [v9 initWithTitle:v11 style:0 target:self action:"_createEmailTapped:"];
  [v8 setRightBarButtonItem:v12];

  id v13 = objc_msgSend(objc_alloc((Class)UITableView), "initWithFrame:style:", 2, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  [(BYODCreateNewEmailViewController *)self setTableView:v13];

  v14 = [(BYODCreateNewEmailViewController *)self tableView];
  [v14 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v15 = [(BYODCreateNewEmailViewController *)self tableView];
  [v15 setRowHeight:50.0];

  id v16 = +[UIColor clearColor];
  v17 = [(BYODCreateNewEmailViewController *)self tableView];
  [v17 setBackgroundColor:v16];

  v18 = [(BYODCreateNewEmailViewController *)self tableView];
  [v18 registerClass:objc_opt_class() forCellReuseIdentifier:@"BYODTableViewCellWithEmailField"];

  v19 = [(BYODCreateNewEmailViewController *)self tableView];
  [v19 setDelegate:self];

  objc_super v20 = [(BYODCreateNewEmailViewController *)self tableView];
  [v20 setDataSource:self];

  v21 = [(BYODCreateNewEmailViewController *)self tableView];
  [v21 reloadData];
}

- (void)_notNowTapped:(id)a3
{
  v4 = +[BYODCreateNewEmailViewController log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    loggedInAppleAccount = self->_loggedInAppleAccount;
    int v6 = 138412290;
    v7 = loggedInAppleAccount;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "member %@ didn't create email", (uint8_t *)&v6, 0xCu);
  }

  [(BYODCreateNewEmailViewController *)self dismissViewControllerAnimated:1 completion:0];
}

- (void)_createEmailTapped:(id)a3
{
  v4 = +[BYODCreateNewEmailViewController log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    loggedInAppleAccount = self->_loggedInAppleAccount;
    *(_DWORD *)buf = 138412290;
    *(void *)&buf[4] = loggedInAppleAccount;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "member %@ did create email", buf, 0xCu);
  }

  int v6 = [(UITextField *)self->_emailTextField text];
  v7 = +[NSString stringWithFormat:@"%@@%@", v6, self->_domainName];

  v8 = [BYODAddAliasRequest alloc];
  id v9 = self->_loggedInAppleAccount;
  BOOL v10 = [(ACAccount *)v9 accountStore];
  domainName = self->_domainName;
  objc_super v20 = v7;
  id v12 = +[NSArray arrayWithObjects:&v20 count:1];
  id v13 = [(ACAccount *)self->_loggedInAppleAccount normalizedDSID];
  v14 = [(BYODAddAliasRequest *)v8 initWithAccount:v9 accountStore:v10 domain:domainName emailArray:v12 dsid:v13];

  spinner = self->_spinner;
  if (!spinner)
  {
    id v16 = [[BYODSpinner alloc] initWithViewController:self];
    v17 = self->_spinner;
    self->_spinner = v16;

    spinner = self->_spinner;
  }
  [(BYODSpinner *)spinner startSpinner];
  *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_31E08;
  v18[3] = &unk_B9290;
  objc_copyWeak(&v19, (id *)buf);
  [(BYODAddAliasRequest *)v14 performRequestWithCallback:v18];
  objc_destroyWeak(&v19);
  objc_destroyWeak((id *)buf);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5 = a3;
  int v6 = [v5 dequeueReusableCellWithIdentifier:@"BYODTableViewCellWithEmailField"];
  if (!v6) {
    int v6 = objc_alloc_init(BYODTextFieldTableViewCell);
  }
  v7 = +[UIColor secondarySystemBackgroundColor];
  [(BYODTextFieldTableViewCell *)v6 setBackgroundColor:v7];

  v8 = [(BYODTextFieldTableViewCell *)v6 textField];
  id v9 = +[NSString stringWithFormat:@"@%@", self->_domainName];
  BOOL v10 = +[UIColor systemGrayColor];
  [v8 _setSuffix:v9 withColor:v10];

  v11 = [(BYODTextFieldTableViewCell *)v6 textField];
  emailTextField = self->_emailTextField;
  self->_emailTextField = v11;

  [(UITextField *)self->_emailTextField becomeFirstResponder];

  return v6;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_emailTextField, 0);
  objc_storeStrong((id *)&self->_loggedInAppleAccount, 0);

  objc_storeStrong((id *)&self->_domainName, 0);
}

@end
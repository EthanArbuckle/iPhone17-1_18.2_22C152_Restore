@interface BYODConfirmFinishSetupViewController
+ (id)log;
- (ACAccount)loggedInUserAccount;
- (BOOL)showDefaultEmailSelect;
- (BYODConfirmFinishSetupViewController)initWithDomainName:(id)a3 acAccount:(id)a4;
- (BYODSpinner)spinner;
- (NSString)domainName;
- (void)_addButtonTrayButtons:(id)a3;
- (void)_cancelButtonTapped:(id)a3;
- (void)_listDefaultEmail;
- (void)_verifyButtonTapped:(id)a3;
- (void)setDomainName:(id)a3;
- (void)setLoggedInUserAccount:(id)a3;
- (void)setShowDefaultEmailSelect:(BOOL)a3;
- (void)setSpinner:(id)a3;
- (void)viewDidLoad;
@end

@implementation BYODConfirmFinishSetupViewController

+ (id)log
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_2E1F8;
  block[3] = &unk_B8D50;
  block[4] = a1;
  if (qword_D73B8 != -1) {
    dispatch_once(&qword_D73B8, block);
  }
  v2 = (void *)qword_D73B0;

  return v2;
}

- (BYODConfirmFinishSetupViewController)initWithDomainName:(id)a3 acAccount:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)BYODConfirmFinishSetupViewController;
  v8 = [(BYODBaseViewController *)&v11 initWithACAccount:v7];
  v9 = v8;
  if (v8)
  {
    [(BYODConfirmFinishSetupViewController *)v8 setDomainName:v6];
    [(BYODConfirmFinishSetupViewController *)v9 setLoggedInUserAccount:v7];
  }

  return v9;
}

- (void)viewDidLoad
{
  v21.receiver = self;
  v21.super_class = (Class)BYODConfirmFinishSetupViewController;
  [(BYODBaseViewController *)&v21 viewDidLoad];
  v3 = +[NSBundle bundleForClass:objc_opt_class()];
  v4 = [v3 localizedStringForKey:@"BYOD_CONFIRM_RECORDS_UPDATED_TITLE" value:&stru_B9F70 table:@"AccountPreferences"];

  v5 = +[NSBundle bundleForClass:objc_opt_class()];
  id v6 = [v5 localizedStringForKey:@"BYOD_CONFIRM_RECORDS_UPDATED_BODY" value:&stru_B9F70 table:@"AccountPreferences"];

  id v7 = [objc_alloc((Class)NSMutableAttributedString) initWithMarkdownString:v6 options:0 baseURL:0 error:0];
  id v8 = [v7 length];
  NSAttributedStringKey v22 = NSLinkAttributeName;
  v9 = +[NSBundle bundleForClass:objc_opt_class()];
  v10 = [v9 localizedStringForKey:@"DOMAIN_SETUP_VIEW_INSTRUCTION_ON_WEB_URL" value:&stru_B9F70 table:@"AccountPreferences"];
  v23 = v10;
  objc_super v11 = +[NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];

  v12 = +[UIColor labelColor];
  objc_msgSend(v7, "addAttribute:value:range:", NSForegroundColorAttributeName, v12, 0, v8);

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_2E724;
  v18[3] = &unk_B91A0;
  id v13 = v7;
  id v19 = v13;
  id v14 = v11;
  id v20 = v14;
  objc_msgSend(v13, "enumerateAttributesInRange:options:usingBlock:", 0, v8, 0, v18);
  v15 = +[NSBundle bundleForClass:objc_opt_class()];
  v16 = +[UIImage imageNamed:@"CustomDomainIcon.png" inBundle:v15];

  [(BYODBaseViewController *)self createViewControllerWithTitle:v4 attributedDetail:v13 detailTextAlignment:1 detailTextFontSize:v16 icon:18.0];
  v17 = [(BYODConfirmFinishSetupViewController *)self navigationItem];
  [v17 setHidesBackButton:1];
}

- (void)_addButtonTrayButtons:(id)a3
{
  id v12 = a3;
  v4 = +[OBBoldTrayButton boldButton];
  v5 = +[NSBundle bundleForClass:objc_opt_class()];
  id v6 = [v5 localizedStringForKey:@"BYOD_VERIFY_BUTTON" value:&stru_B9F70 table:@"AccountPreferences"];
  [v4 setTitle:v6 forState:0];

  [v4 addTarget:self action:"_verifyButtonTapped:" forEvents:64];
  id v7 = [v12 buttonTray];
  [v7 addButton:v4];

  id v8 = +[OBLinkTrayButton linkButton];
  v9 = +[NSBundle bundleForClass:objc_opt_class()];
  v10 = [v9 localizedStringForKey:@"BYOD_GO_BACK_BUTTON" value:&stru_B9F70 table:@"AccountPreferences"];
  [v8 setTitle:v10 forState:0];

  [v8 addTarget:self action:"_cancelButtonTapped:" forEvents:64];
  objc_super v11 = [v12 buttonTray];
  [v11 addButton:v8];
}

- (void)_verifyButtonTapped:(id)a3
{
  id v4 = a3;
  [v4 setEnabled:0];
  v5 = [[BYODSpinner alloc] initWithViewController:self];
  [(BYODConfirmFinishSetupViewController *)self setSpinner:v5];

  id v6 = [(BYODConfirmFinishSetupViewController *)self spinner];
  [v6 startSpinner];

  id v7 = [BYODDomainVerifyTransferRequest alloc];
  id v8 = [(BYODConfirmFinishSetupViewController *)self loggedInUserAccount];
  v9 = [(BYODConfirmFinishSetupViewController *)self loggedInUserAccount];
  v10 = [v9 accountStore];
  objc_super v11 = [(BYODConfirmFinishSetupViewController *)self domainName];
  id v12 = [(BYODDomainVerifyTransferRequest *)v7 initWithAccount:v8 accountStore:v10 domain:v11];

  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_2EBDC;
  v13[3] = &unk_B91C8;
  objc_copyWeak(&v14, &location);
  [(BYODDomainVerifyTransferRequest *)v12 performRequestWithCallback:v13];
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)_listDefaultEmail
{
  v3 = [BYODListEmailRequest alloc];
  id v4 = [(BYODConfirmFinishSetupViewController *)self loggedInUserAccount];
  v5 = [(BYODConfirmFinishSetupViewController *)self loggedInUserAccount];
  id v6 = [v5 accountStore];
  id v7 = [(BYODListEmailRequest *)v3 initWithAccount:v4 accountStore:v6];

  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_2F068;
  v8[3] = &unk_B91F0;
  objc_copyWeak(&v9, &location);
  [(BYODListEmailRequest *)v7 performRequestWithCallback:v8];
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)_cancelButtonTapped:(id)a3
{
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
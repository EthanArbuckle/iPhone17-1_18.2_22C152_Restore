@interface BYODDomainManualSetupViewController
+ (id)log;
- (ACAccount)loggedInUserAccount;
- (BOOL)showRedBadge;
- (BYODDomainManualSetupViewController)initWithDomainName:(id)a3 acAccount:(id)a4 showRedBadge:(BOOL)a5;
- (NSArray)dnsRecords;
- (NSString)domainName;
- (PSSpecifier)finishSetupSpecifier;
- (PSSpecifier)viewInstructionSpecifier;
- (id)specifiers;
- (void)_finishSetupSpecifierWasTapped:(id)a3;
- (void)_loadDnsRecords:(id)a3;
- (void)_refreshDomainResultNotification:(id)a3;
- (void)_viewInstructionSpecifierWasTapped:(id)a3;
- (void)dealloc;
- (void)setDnsRecords:(id)a3;
- (void)setDomainName:(id)a3;
- (void)setFinishSetupSpecifier:(id)a3;
- (void)setLoggedInUserAccount:(id)a3;
- (void)setShowRedBadge:(BOOL)a3;
- (void)setViewInstructionSpecifier:(id)a3;
- (void)viewDidLoad;
@end

@implementation BYODDomainManualSetupViewController

+ (id)log
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_3FB34;
  block[3] = &unk_B8D50;
  block[4] = a1;
  if (qword_D7418 != -1) {
    dispatch_once(&qword_D7418, block);
  }
  v2 = (void *)qword_D7410;

  return v2;
}

- (BYODDomainManualSetupViewController)initWithDomainName:(id)a3 acAccount:(id)a4 showRedBadge:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)BYODDomainManualSetupViewController;
  v10 = [(BYODDomainManualSetupViewController *)&v13 init];
  v11 = v10;
  if (v10)
  {
    [(BYODDomainManualSetupViewController *)v10 setDomainName:v8];
    [(BYODDomainManualSetupViewController *)v11 setLoggedInUserAccount:v9];
    [(BYODDomainManualSetupViewController *)v11 setShowRedBadge:v5];
  }

  return v11;
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)BYODDomainManualSetupViewController;
  [(BYODDomainManualSetupViewController *)&v4 viewDidLoad];
  v3 = [(BYODDomainManualSetupViewController *)self domainName];
  [(BYODDomainManualSetupViewController *)self setTitle:v3];
}

- (id)specifiers
{
  id v30 = objc_alloc_init((Class)NSMutableArray);
  v29 = +[PSSpecifier groupSpecifierWithID:@"BYOD_MANUAL_SETUP_TITLE_GROUP_ID"];
  v3 = +[NSBundle bundleForClass:objc_opt_class()];
  objc_super v4 = [v3 localizedStringForKey:@"DOMAIN_MANUAL_SETUP_STEPS_PAGE_HEADER" value:&stru_B9F70 table:@"AccountPreferences"];
  uint64_t v5 = PSFooterTextGroupKey;
  [v29 setProperty:v4 forKey:PSFooterTextGroupKey];

  [v30 addObject:v29];
  id v6 = objc_alloc_init((Class)NSMutableArray);
  v28 = +[PSSpecifier groupSpecifierWithID:@"BYOD_DOMAIN_VIEW_INSTRUCTION_GROUP_SPECIFIER"];
  v7 = +[NSBundle bundleForClass:objc_opt_class()];
  id v8 = [v7 localizedStringForKey:@"DOMAIN_MANUAL_SETUP_VIEW_INSTRUCTION_FOOTER" value:&stru_B9F70 table:@"AccountPreferences"];
  [v28 setProperty:v8 forKey:v5];

  [v6 addObject:v28];
  id v9 = +[NSBundle bundleForClass:objc_opt_class()];
  v10 = [v9 localizedStringForKey:@"DOMAIN_MANUAL_SETUP_VIEW_INSTRUCTION_TITLE" value:&stru_B9F70 table:@"AccountPreferences"];
  v11 = +[PSSpecifier preferenceSpecifierNamed:v10 target:self set:0 get:0 detail:0 cell:1 edit:0];

  [v11 setIdentifier:@"BYOD_DOMAIN_VIEW_INSTRUCTION_SPECIFIER_ID"];
  [v11 setControllerLoadAction:"_viewInstructionSpecifierWasTapped:"];
  [v11 setProperty:objc_opt_class() forKey:PSCellClassKey];
  if ([(BYODDomainManualSetupViewController *)self showRedBadge])
  {
    v12 = +[NSNumberFormatter localizedStringFromNumber:&off_C0390 numberStyle:0];
    [v11 setProperty:v12 forKey:PSBadgeNumberKey];
  }
  [v6 addObject:v11];
  [(BYODDomainManualSetupViewController *)self setViewInstructionSpecifier:v11];
  [v30 addObjectsFromArray:v6];
  id v13 = objc_alloc_init((Class)NSMutableArray);
  v14 = +[PSSpecifier groupSpecifierWithID:@"BYOD_DOMAIN_FINISH_SETUP_GROUP_SPECIFIER"];
  v15 = +[NSBundle bundleForClass:objc_opt_class()];
  v16 = [v15 localizedStringForKey:@"DOMAIN_MANUAL_SETUP_FINISH_SETUP_FOOTER" value:&stru_B9F70 table:@"AccountPreferences"];
  [v14 setProperty:v16 forKey:v5];

  [v13 addObject:v14];
  v17 = +[NSBundle bundleForClass:objc_opt_class()];
  v18 = [v17 localizedStringForKey:@"DOMAIN_MANUAL_SETUP_FINISH_SETUP_TITLE" value:&stru_B9F70 table:@"AccountPreferences"];
  v19 = +[PSSpecifier preferenceSpecifierNamed:v18 target:self set:0 get:0 detail:0 cell:13 edit:0];

  [v19 setIdentifier:@"BYOD_DOMAIN_FINISH_SETUP_SPECIFIER_ID"];
  [v19 setButtonAction:"_finishSetupSpecifierWasTapped:"];
  v20 = +[NSNumber numberWithBool:0];
  [v19 setProperty:v20 forKey:PSEnabledKey];

  [v13 addObject:v19];
  [v30 addObjectsFromArray:v13];
  [(BYODDomainManualSetupViewController *)self setFinishSetupSpecifier:v19];
  v21 = +[NSNotificationCenter defaultCenter];
  [v21 removeObserver:self name:@"BYOD_MANUAL_DOMAIN_DATA_REFRESH_NOTIFICATION" object:0];

  v22 = +[NSNotificationCenter defaultCenter];
  [v22 addObserver:self selector:"_refreshDomainResultNotification:" name:@"BYOD_MANUAL_DOMAIN_DATA_REFRESH_NOTIFICATION" object:0];

  id v23 = [v30 copy];
  uint64_t v24 = OBJC_IVAR___PSListController__specifiers;
  v25 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  *(void *)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers] = v23;

  id v26 = *(id *)&self->PSListController_opaque[v24];
  return v26;
}

- (void)_viewInstructionSpecifierWasTapped:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(BYODDomainManualSetupViewController *)self viewInstructionSpecifier];
  [v5 removePropertyForKey:PSBadgeNumberKey];

  id v6 = [(BYODDomainManualSetupViewController *)self viewInstructionSpecifier];
  [(BYODDomainManualSetupViewController *)self reloadSpecifier:v6];

  v7 = [(BYODDomainManualSetupViewController *)self finishSetupSpecifier];
  id v8 = +[NSNumber numberWithBool:1];
  [v7 setProperty:v8 forKey:PSEnabledKey];

  id v9 = [(BYODDomainManualSetupViewController *)self finishSetupSpecifier];
  [(BYODDomainManualSetupViewController *)self reloadSpecifier:v9];

  id v13 = self;
  id v10 = v4;
  id v14 = v10;
  v11 = +[EFScheduler mainThreadScheduler];
  [v11 performBlock:&v12];
}

- (void)_finishSetupSpecifierWasTapped:(id)a3
{
  id v4 = [BYODConfirmFinishSetupViewController alloc];
  uint64_t v5 = [(BYODDomainManualSetupViewController *)self domainName];
  id v6 = [(BYODDomainManualSetupViewController *)self loggedInUserAccount];
  v7 = [(BYODConfirmFinishSetupViewController *)v4 initWithDomainName:v5 acAccount:v6];

  v11 = self;
  id v8 = [objc_alloc((Class)UINavigationController) initWithRootViewController:v7];
  id v12 = v8;
  id v9 = +[EFScheduler mainThreadScheduler];
  [v9 performBlock:&v10];
}

- (void)_loadDnsRecords:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(BYODDomainManualSetupViewController *)self dnsRecords];
  id v6 = [v5 count];

  if (v6)
  {
    v7 = [BYODDomainSetupInstructionViewController alloc];
    id v8 = [(BYODDomainManualSetupViewController *)self dnsRecords];
    id v9 = [(BYODDomainSetupInstructionViewController *)v7 initWithDnsRecords:v8];

    uint64_t v10 = v9;
    v20 = v10;
    v11 = +[EFScheduler mainThreadScheduler];
    [v11 performBlock:&v19];
  }
  else
  {
    objc_msgSend(v4, "byod_startSpinner");
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    id v12 = +[BYODDomainManualSetupViewController log];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "load DNS records", buf, 2u);
    }

    id v13 = [BYODGetDnsRecordsRequest alloc];
    id v14 = [(BYODDomainManualSetupViewController *)self loggedInUserAccount];
    v15 = [(BYODDomainManualSetupViewController *)self loggedInUserAccount];
    v16 = [v15 accountStore];
    v17 = [(BYODDomainManualSetupViewController *)self domainName];
    v18 = [(BYODGetDnsRecordsRequest *)v13 initWithAccount:v14 accountStore:v16 domain:v17];

    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_40938;
    v21[3] = &unk_B92E8;
    objc_copyWeak(&v23, &location);
    id v22 = v4;
    [(BYODGetDnsRecordsRequest *)v18 performRequestWithCallback:v21];

    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }
}

- (void)_refreshDomainResultNotification:(id)a3
{
  id v4 = [(BYODDomainManualSetupViewController *)self navigationController];
  id v3 = [v4 popViewControllerAnimated:1];
}

- (void)dealloc
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)BYODDomainManualSetupViewController;
  [(BYODDomainManualSetupViewController *)&v4 dealloc];
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

- (NSArray)dnsRecords
{
  return self->_dnsRecords;
}

- (void)setDnsRecords:(id)a3
{
}

- (PSSpecifier)finishSetupSpecifier
{
  return self->_finishSetupSpecifier;
}

- (void)setFinishSetupSpecifier:(id)a3
{
}

- (PSSpecifier)viewInstructionSpecifier
{
  return self->_viewInstructionSpecifier;
}

- (void)setViewInstructionSpecifier:(id)a3
{
}

- (BOOL)showRedBadge
{
  return self->_showRedBadge;
}

- (void)setShowRedBadge:(BOOL)a3
{
  self->_showRedBadge = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewInstructionSpecifier, 0);
  objc_storeStrong((id *)&self->_finishSetupSpecifier, 0);
  objc_storeStrong((id *)&self->_dnsRecords, 0);
  objc_storeStrong((id *)&self->_domainName, 0);

  objc_storeStrong((id *)&self->_loggedInUserAccount, 0);
}

@end
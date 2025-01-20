@interface BYODInvitationViewController
+ (id)log;
- (BYODInvitationViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 acAccount:(id)a6 domainName:(id)a7;
- (void)_acceptButtonTapped:(id)a3;
- (void)_declineLinkTapped:(id)a3;
- (void)_showErrorAlert;
@end

@implementation BYODInvitationViewController

+ (id)log
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_50CE4;
  block[3] = &unk_B8D50;
  block[4] = a1;
  if (qword_D7478 != -1) {
    dispatch_once(&qword_D7478, block);
  }
  v2 = (void *)qword_D7470;

  return v2;
}

- (BYODInvitationViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 acAccount:(id)a6 domainName:(id)a7
{
  id v13 = a6;
  id v14 = a7;
  v26.receiver = self;
  v26.super_class = (Class)BYODInvitationViewController;
  v15 = [(BYODInvitationViewController *)&v26 initWithTitle:a3 detailText:a4 icon:a5];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_domainName, a7);
    objc_storeStrong((id *)&v16->_loggedInICloudAccount, a6);
    v17 = +[OBBoldTrayButton boldButton];
    v18 = +[NSBundle bundleForClass:objc_opt_class()];
    v19 = [v18 localizedStringForKey:@"BYOD_INVITE_ACCEPT_BUTTON" value:&stru_B9F70 table:@"AccountPreferences"];
    [v17 setTitle:v19 forState:0];

    [v17 addTarget:v16 action:"_acceptButtonTapped:" forControlEvents:64];
    v20 = [(BYODInvitationViewController *)v16 buttonTray];
    [v20 addButton:v17];

    v21 = +[OBLinkTrayButton linkButton];
    v22 = +[NSBundle bundleForClass:objc_opt_class()];
    v23 = [v22 localizedStringForKey:@"BYOD_INVITE_DECLINE_BUTTON" value:&stru_B9F70 table:@"AccountPreferences"];
    [v21 setTitle:v23 forState:0];

    [v21 addTarget:v16 action:"_declineLinkTapped:" forControlEvents:64];
    v24 = [(BYODInvitationViewController *)v16 buttonTray];
    [v24 addButton:v21];
  }
  return v16;
}

- (void)_acceptButtonTapped:(id)a3
{
  id v4 = a3;
  v5 = +[BYODInvitationViewController log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [(ACAccount *)self->_loggedInICloudAccount normalizedDSID];
    *(_DWORD *)buf = 138412290;
    *(void *)&buf[4] = v6;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "member %@ accepted invite", buf, 0xCu);
  }
  v7 = [BYODAcceptInviteRequest alloc];
  loggedInICloudAccount = self->_loggedInICloudAccount;
  v9 = [(ACAccount *)loggedInICloudAccount accountStore];
  v10 = [(BYODAcceptInviteRequest *)v7 initWithAccount:loggedInICloudAccount accountStore:v9 domain:self->_domainName];

  *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  id v11 = v4;
  [v11 showsBusyIndicator];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_51230;
  v13[3] = &unk_B9598;
  objc_copyWeak(&v15, (id *)buf);
  id v12 = v11;
  id v14 = v12;
  [(BYODAcceptInviteRequest *)v10 performRequestWithCallback:v13];

  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);
}

- (void)_declineLinkTapped:(id)a3
{
  id v4 = +[BYODInvitationViewController log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = [(ACAccount *)self->_loggedInICloudAccount normalizedDSID];
    *(_DWORD *)buf = 138412290;
    *(void *)&buf[4] = v5;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "member %@ declined invite", buf, 0xCu);
  }
  v6 = [BYODDeclineInviteRequest alloc];
  loggedInICloudAccount = self->_loggedInICloudAccount;
  v8 = [(ACAccount *)loggedInICloudAccount accountStore];
  v9 = [(BYODDeclineInviteRequest *)v6 initWithAccount:loggedInICloudAccount accountStore:v8 domain:self->_domainName];

  *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_517A4;
  v10[3] = &unk_B9178;
  objc_copyWeak(&v11, (id *)buf);
  [(BYODDeclineInviteRequest *)v9 performRequestWithCallback:v10];
  objc_destroyWeak(&v11);
  objc_destroyWeak((id *)buf);
}

- (void)_showErrorAlert
{
  v3 = +[NSBundle bundleForClass:objc_opt_class()];
  id v4 = [v3 localizedStringForKey:@"BYOD_GENERIC_ERROR_MESSAGE" value:&stru_B9F70 table:@"AccountPreferences"];
  v5 = +[UIAlertController alertControllerWithTitle:0 message:v4 preferredStyle:1];

  v6 = +[NSBundle bundleForClass:objc_opt_class()];
  v7 = [v6 localizedStringForKey:@"OK" value:&stru_B9F70 table:@"AccountPreferences"];
  v8 = +[UIAlertAction actionWithTitle:v7 style:1 handler:0];

  [v5 addAction:v8];
  id v12 = self;
  id v9 = v5;
  id v13 = v9;
  v10 = +[EFScheduler mainThreadScheduler];
  [v10 performBlock:&v11];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_loggedInICloudAccount, 0);

  objc_storeStrong((id *)&self->_domainName, 0);
}

@end
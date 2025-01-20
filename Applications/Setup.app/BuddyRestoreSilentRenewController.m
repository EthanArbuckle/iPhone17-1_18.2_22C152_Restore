@interface BuddyRestoreSilentRenewController
- (BOOL)renewSucceeded;
- (BuddyRestoreSilentRenewController)init;
- (void)loadView;
- (void)performExtendedInitializationWithCompletion:(id)a3;
- (void)setRenewSucceeded:(BOOL)a3;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation BuddyRestoreSilentRenewController

- (BuddyRestoreSilentRenewController)init
{
  v3 = +[NSBundle mainBundle];
  v4 = [(NSBundle *)v3 localizedStringForKey:@"UPGRADING_ICLOUD_WORDY" value:&stru_1002B4E18 table:@"Localizable"];
  id location = [(BuddyRestoreSilentRenewController *)self initWithSpinnerText:v4];
  v5 = (BuddyRestoreSilentRenewController *)location;

  objc_storeStrong(&location, 0);
  return v5;
}

- (void)loadView
{
  v5 = self;
  SEL v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)BuddyRestoreSilentRenewController;
  [(BuddyRestoreSilentRenewController *)&v3 loadView];
  id v2 = [(BuddyRestoreSilentRenewController *)v5 navigationItem];
  [v2 setHidesBackButton:1];
}

- (void)viewDidAppear:(BOOL)a3
{
  v6 = self;
  SEL v5 = a2;
  BOOL v4 = a3;
  v3.receiver = self;
  v3.super_class = (Class)BuddyRestoreSilentRenewController;
  [(BuddyRestoreSilentRenewController *)&v3 viewDidAppear:a3];
}

- (void)performExtendedInitializationWithCompletion:(id)a3
{
  v34 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = +[BYSecurityInterface sharedInterface];
  char v4 = [v3 isHSA2EnabledForPrimaryAccount] ^ 1;

  if (v4)
  {
    id v32 = (id)_BYLoggingFacility();
    os_log_type_t v31 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v32, OS_LOG_TYPE_DEFAULT))
    {
      SEL v5 = v32;
      os_log_type_t v6 = v31;
      sub_10004B24C(buf);
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "Unable to perform silent renew; account is not HSA2", buf, 2u);
    }
    objc_storeStrong(&v32, 0);
    if (location[0]) {
      (*((void (**)(id, void))location[0] + 2))(location[0], 0);
    }
    int v29 = 1;
  }
  else
  {
    id v7 = +[ACAccountStore defaultStore];
    id v28 = [v7 aa_primaryAppleAccount];

    if (v28)
    {
      if (location[0])
      {
        (*((void (**)(id, uint64_t))location[0] + 2))(location[0], 1);
        os_log_t v24 = (os_log_t)(id)_BYLoggingFacility();
        os_log_type_t v23 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          v10 = v24;
          os_log_type_t v11 = v23;
          sub_10004B24C(v22);
          _os_log_impl((void *)&_mh_execute_header, v10, v11, "Renewing account credentials prior to restore...", v22, 2u);
        }
        objc_storeStrong((id *)&v24, 0);
        id v12 = +[ACAccountStore defaultStore];
        id v21 = [v12 aa_primaryAppleAccount];

        v35[0] = kACRenewCredentialsShouldAvoidUIKey;
        v36[0] = &__kCFBooleanTrue;
        v35[1] = kACRenewCredentialsShouldForceKey;
        v36[1] = &__kCFBooleanTrue;
        id v20 = +[NSDictionary dictionaryWithObjects:v36 forKeys:v35 count:2];
        id v13 = +[ACAccountStore defaultStore];
        v14 = _NSConcreteStackBlock;
        int v15 = -1073741824;
        int v16 = 0;
        v17 = sub_100169960;
        v18 = &unk_1002B3CF0;
        v19 = v34;
        [v13 renewCredentialsForAccount:v21 options:v20 completion:&v14];

        objc_storeStrong((id *)&v19, 0);
        objc_storeStrong(&v20, 0);
        objc_storeStrong(&v21, 0);
      }
      int v29 = 0;
    }
    else
    {
      os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
      os_log_type_t v26 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        v8 = oslog;
        os_log_type_t v9 = v26;
        sub_10004B24C(v25);
        _os_log_impl((void *)&_mh_execute_header, v8, v9, "Unable to perform silent renew; no primary account!",
          v25,
          2u);
      }
      objc_storeStrong((id *)&oslog, 0);
      if (location[0]) {
        (*((void (**)(id, void))location[0] + 2))(location[0], 0);
      }
      int v29 = 1;
    }
    objc_storeStrong(&v28, 0);
  }
  objc_storeStrong(location, 0);
}

- (BOOL)renewSucceeded
{
  return self->_renewSucceeded;
}

- (void)setRenewSucceeded:(BOOL)a3
{
  self->_renewSucceeded = a3;
}

@end
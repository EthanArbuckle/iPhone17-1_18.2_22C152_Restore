@interface BuddyAppleIDRepairController
+ (id)cloudConfigSkipKey;
+ (unint64_t)applicableDispositions;
- (ACAccount)primaryAccount;
- (AKAppleIDAuthenticationPurpleBuddyContext)authContext;
- (BOOL)responsibleForViewController:(id)a3;
- (BOOL)shouldSuppressExtendedInitializationActivityIndicator;
- (BuddyAppleIDRepairController)init;
- (void)performExtendedInitializationWithCompletion:(id)a3;
- (void)setAuthContext:(id)a3;
- (void)setPrimaryAccount:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation BuddyAppleIDRepairController

- (BuddyAppleIDRepairController)init
{
  SEL v7 = a2;
  id location = 0;
  v6.receiver = self;
  v6.super_class = (Class)BuddyAppleIDRepairController;
  v2 = [(BuddyAppleIDSpinnerPage *)&v6 init];
  id location = v2;
  objc_storeStrong(&location, v2);
  if (v2)
  {
    id v3 = [location navigationItem];
    [v3 setHidesBackButton:1 animated:0];
  }
  v4 = (BuddyAppleIDRepairController *)location;
  objc_storeStrong(&location, 0);
  return v4;
}

- (void)performExtendedInitializationWithCompletion:(id)a3
{
  v22 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = +[ACAccountStore defaultStore];
  id v4 = [v3 aa_primaryAppleAccount];
  [(BuddyAppleIDRepairController *)v22 setPrimaryAccount:v4];

  if (location[0])
  {
    v5 = [(BuddyAppleIDRepairController *)v22 primaryAccount];

    if (v5)
    {
      objc_super v6 = +[AKAccountManager sharedInstance];
      SEL v7 = [(BuddyAppleIDRepairController *)v22 primaryAccount];
      id v8 = [(ACAccount *)v7 aa_altDSID];
      id v20 = [(AKAccountManager *)v6 authKitAccountWithAltDSID:v8];

      v9 = +[AKAccountManager sharedInstance];
      id v10 = [(AKAccountManager *)v9 repairStateForAccount:v20];

      v19[1] = v10;
      if (v10)
      {
        (*((void (**)(void))location[0] + 2))();
      }
      else
      {
        v19[0] = (id)objc_opt_new();
        v11 = [(BuddyAppleIDRepairController *)v22 primaryAccount];
        id v12 = [(ACAccount *)v11 aa_altDSID];
        v13 = _NSConcreteStackBlock;
        int v14 = -1073741824;
        int v15 = 0;
        v16 = sub_10011255C;
        v17 = &unk_1002B33D0;
        id v18 = location[0];
        [v19[0] getUserInformationForAltDSID:v12 completion:&v13];

        objc_storeStrong(&v18, 0);
        objc_storeStrong(v19, 0);
      }
      objc_storeStrong(&v20, 0);
    }
    else
    {
      (*((void (**)(id, void))location[0] + 2))(location[0], 0);
    }
  }
  objc_storeStrong(location, 0);
}

- (void)viewDidAppear:(BOOL)a3
{
  v27 = self;
  SEL v26 = a2;
  BOOL v25 = a3;
  v24.receiver = self;
  v24.super_class = (Class)BuddyAppleIDRepairController;
  [(BuddyAppleIDSpinnerPage *)&v24 viewDidAppear:a3];
  id v3 = objc_alloc_init((Class)AKAppleIDAuthenticationPurpleBuddyContext);
  [(BuddyAppleIDRepairController *)v27 setAuthContext:v3];

  id v4 = [(BuddyAppleIDRepairController *)v27 primaryAccount];
  id v5 = [(ACAccount *)v4 aa_altDSID];
  objc_super v6 = [(BuddyAppleIDRepairController *)v27 authContext];
  [(AKAppleIDAuthenticationPurpleBuddyContext *)v6 setAltDSID:v5];

  SEL v7 = [(BuddyAppleIDRepairController *)v27 authContext];
  [(AKAppleIDAuthenticationPurpleBuddyContext *)v7 setNeedsRepair:1];

  id v8 = [(BuddyAppleIDRepairController *)v27 authContext];
  id v9 = [(BuddyAppleIDRepairController *)v27 navigationController];
  [(AKAppleIDAuthenticationPurpleBuddyContext *)v8 setPresentingViewController:v9];

  id location = objc_alloc_init((Class)AKAppleIDAuthenticationController);
  os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
  os_log_type_t v21 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = oslog;
    os_log_type_t v11 = v21;
    sub_10004B24C(buf);
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "Starting Apple ID repair flow...", buf, 2u);
  }
  objc_storeStrong((id *)&oslog, 0);
  id v12 = location;
  v13 = [(BuddyAppleIDRepairController *)v27 authContext];
  int v14 = _NSConcreteStackBlock;
  int v15 = -1073741824;
  int v16 = 0;
  v17 = sub_10011296C;
  id v18 = &unk_1002B2EA8;
  v19 = v27;
  [v12 authenticateWithContext:v13 completion:&v14];

  objc_storeStrong((id *)&v19, 0);
  objc_storeStrong(&location, 0);
}

+ (unint64_t)applicableDispositions
{
  return 4;
}

+ (id)cloudConfigSkipKey
{
  return kMCCCSkipSetupAppleID;
}

- (BOOL)shouldSuppressExtendedInitializationActivityIndicator
{
  return 0;
}

- (BOOL)responsibleForViewController:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
  os_log_type_t v7 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = (objc_class *)objc_opt_class();
    objc_super v6 = NSStringFromClass(v3);
    sub_10004B238((uint64_t)buf, (uint64_t)v6);
    _os_log_impl((void *)&_mh_execute_header, oslog, v7, "Repair flow responsibleForViewController %@", buf, 0xCu);

    objc_storeStrong((id *)&v6, 0);
  }
  objc_storeStrong((id *)&oslog, 0);
  objc_opt_class();
  char isKindOfClass = 1;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    char isKindOfClass = 1;
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
    }
  }
  objc_storeStrong(location, 0);
  return isKindOfClass & 1;
}

- (ACAccount)primaryAccount
{
  return (ACAccount *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPrimaryAccount:(id)a3
{
}

- (AKAppleIDAuthenticationPurpleBuddyContext)authContext
{
  return (AKAppleIDAuthenticationPurpleBuddyContext *)objc_getProperty(self, a2, 24, 1);
}

- (void)setAuthContext:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
@interface BuddyProximitySetupDependentController
- (BOOL)hasAccountType;
- (BuddyFeatureFlags)featureFlags;
- (BuddyProximitySetupDependentController)initWithMessageSession:(id)a3 featureFlags:(id)a4;
- (NSNumber)readyForPresentation;
- (PASFlowResult)result;
- (PASUIDependentViewPresenter)dependentViewPresenter;
- (PASUIDependentViewPresenterDelegate)delegate;
- (UIViewController)parentViewController;
- (id)accountTypeSelectedBlock;
- (id)passcodeSetUpCompletionBlock;
- (id)viewControllerAvailableBlock;
- (int64_t)accountType;
- (void)_accountTypeSelected:(int64_t)a3;
- (void)connectionTerminated;
- (void)proximitySetupCompletedWithResult:(id)a3;
- (void)proximitySetupSelectedAccount:(int64_t)a3 completion:(id)a4;
- (void)proximitySetupSelectedAccountType:(int64_t)a3;
- (void)setAccountType:(int64_t)a3;
- (void)setAccountTypeSelectedBlock:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDependentViewPresenter:(id)a3;
- (void)setFeatureFlags:(id)a3;
- (void)setHasAccountType:(BOOL)a3;
- (void)setParentViewController:(id)a3;
- (void)setPasscodeSetUpCompletionBlock:(id)a3;
- (void)setReadyForPresentation:(id)a3;
- (void)setResult:(id)a3;
- (void)setViewControllerAvailableBlock:(id)a3;
- (void)setupPasscodeAndBiometricWithCompletion:(id)a3;
- (void)setupPerformAIDASignInWith:(id)a3 completion:(id)a4;
- (void)waitForSelectedAccountType:(id)a3;
- (void)waitForViewController:(id)a3;
@end

@implementation BuddyProximitySetupDependentController

- (BuddyProximitySetupDependentController)initWithMessageSession:(id)a3 featureFlags:(id)a4
{
  id v24 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id obj = 0;
  objc_storeStrong(&obj, a4);
  id v5 = v24;
  id v24 = 0;
  v21.receiver = v5;
  v21.super_class = (Class)BuddyProximitySetupDependentController;
  id v24 = [(BuddyProximitySetupDependentController *)&v21 init];
  objc_storeStrong(&v24, v24);
  if (v24)
  {
    v6 = objc_alloc_init(BuddyProximitySetupDependentParentViewController);
    v7 = (void *)*((void *)v24 + 4);
    *((void *)v24 + 4) = v6;

    id v8 = objc_alloc((Class)sub_1001338D0());
    id v9 = [v8 initWithParentViewController:*((void *)v24 + 4)];
    v10 = (void *)*((void *)v24 + 5);
    *((void *)v24 + 5) = v9;

    [*((id *)v24 + 5) setDelegate:v24];
    objc_storeStrong((id *)v24 + 3, obj);
    v11 = (void *)*((void *)v24 + 5);
    id v12 = location[0];
    v15 = _NSConcreteStackBlock;
    int v16 = -1073741824;
    int v17 = 0;
    v18 = sub_1001339E8;
    v19 = &unk_1002B3768;
    id v20 = v24;
    [v11 activateWithTemplateMessageSession:v12 completion:&v15];
    objc_storeStrong(&v20, 0);
  }
  v13 = (BuddyProximitySetupDependentController *)v24;
  objc_storeStrong(&obj, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v24, 0);
  return v13;
}

- (void)setDelegate:(id)a3
{
  v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);

  objc_storeWeak((id *)&v10->_delegate, location[0]);
  v3 = [(BuddyProximitySetupDependentController *)v10 result];

  if (v3)
  {
    v4 = [(BuddyProximitySetupDependentController *)v10 delegate];
    id v5 = [(BuddyProximitySetupDependentController *)v10 result];
    [(PASUIDependentViewPresenterDelegate *)v4 proximitySetupCompletedWithResult:v5];

    [(BuddyProximitySetupDependentController *)v10 setResult:0];
  }
  else
  {
    id v6 = [(BuddyProximitySetupDependentController *)v10 passcodeSetUpCompletionBlock];

    if (v6)
    {
      v7 = [(BuddyProximitySetupDependentController *)v10 delegate];
      id v8 = [(BuddyProximitySetupDependentController *)v10 passcodeSetUpCompletionBlock];
      [(PASUIDependentViewPresenterDelegate *)v7 setupPasscodeAndBiometricWithCompletion:v8];

      [(BuddyProximitySetupDependentController *)v10 setPasscodeSetUpCompletionBlock:0];
    }
  }
  objc_storeStrong(location, 0);
}

- (void)waitForViewController:(id)a3
{
  id v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = &_dispatch_main_q;
  block = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  v7 = sub_100133E60;
  id v8 = &unk_1002B0CD0;
  id v9 = v12;
  id v10 = location[0];
  dispatch_async((dispatch_queue_t)v3, &block);

  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)waitForSelectedAccountType:(id)a3
{
  id v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = &_dispatch_main_q;
  block = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  v7 = sub_10013400C;
  id v8 = &unk_1002B0CD0;
  id v9 = v12;
  id v10 = location[0];
  dispatch_async((dispatch_queue_t)v3, &block);

  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)setParentViewController:(id)a3
{
  int v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = &_dispatch_main_q;
  dispatch_assert_queue_V2((dispatch_queue_t)v3);

  objc_storeStrong((id *)&v5->_parentViewController, location[0]);
  objc_storeStrong(location, 0);
}

- (void)setDependentViewPresenter:(id)a3
{
  int v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = &_dispatch_main_q;
  dispatch_assert_queue_V2((dispatch_queue_t)v3);

  objc_storeStrong((id *)&v5->_dependentViewPresenter, location[0]);
  objc_storeStrong(location, 0);
}

- (void)setReadyForPresentation:(id)a3
{
  int v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = &_dispatch_main_q;
  dispatch_assert_queue_V2((dispatch_queue_t)v3);

  objc_storeStrong((id *)&v5->_readyForPresentation, location[0]);
  objc_storeStrong(location, 0);
}

- (void)setViewControllerAvailableBlock:(id)a3
{
  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = &_dispatch_main_q;
  dispatch_assert_queue_V2((dispatch_queue_t)v3);

  id v4 = objc_retainBlock(location[0]);
  id viewControllerAvailableBlock = v7->_viewControllerAvailableBlock;
  v7->_id viewControllerAvailableBlock = v4;

  objc_storeStrong(location, 0);
}

- (void)setAccountType:(int64_t)a3
{
  v3 = &_dispatch_main_q;
  dispatch_assert_queue_V2((dispatch_queue_t)v3);

  self->_accountType = a3;
}

- (void)setAccountTypeSelectedBlock:(id)a3
{
  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = &_dispatch_main_q;
  dispatch_assert_queue_V2((dispatch_queue_t)v3);

  id v4 = objc_retainBlock(location[0]);
  id accountTypeSelectedBlock = v7->_accountTypeSelectedBlock;
  v7->_id accountTypeSelectedBlock = v4;

  objc_storeStrong(location, 0);
}

- (void)_accountTypeSelected:(int64_t)a3
{
  id v9 = self;
  SEL v8 = a2;
  uint64_t v7 = a3;
  v3 = &_dispatch_main_q;
  dispatch_assert_queue_V2((dispatch_queue_t)v3);

  os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_100046588((uint64_t)buf, v7);
    _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "Source device selected account type: %ld", buf, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  [(BuddyProximitySetupDependentController *)v9 setHasAccountType:1];
  [(BuddyProximitySetupDependentController *)v9 setAccountType:v7];
  id v4 = [(BuddyProximitySetupDependentController *)v9 accountTypeSelectedBlock];

  if (v4)
  {
    int v5 = (void (**)(id, uint64_t))[(BuddyProximitySetupDependentController *)v9 accountTypeSelectedBlock];
    v5[2](v5, v7);

    [(BuddyProximitySetupDependentController *)v9 setAccountTypeSelectedBlock:0];
  }
}

- (void)setupPasscodeAndBiometricWithCompletion:(id)a3
{
  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(BuddyProximitySetupDependentController *)v11 setPasscodeSetUpCompletionBlock:location[0]];
  v3 = [(BuddyProximitySetupDependentController *)v11 delegate];

  if (v3)
  {
    id v4 = [(BuddyProximitySetupDependentController *)v11 delegate];
    [(PASUIDependentViewPresenterDelegate *)v4 setupPasscodeAndBiometricWithCompletion:location[0]];
  }
  else
  {
    os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v8 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = oslog;
      os_log_type_t v6 = v8;
      sub_10004B24C(v7);
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "Proximity dependent setup will show biometric/passcode setup", (uint8_t *)v7, 2u);
    }
    objc_storeStrong((id *)&oslog, 0);
  }
  objc_storeStrong(location, 0);
}

- (void)proximitySetupCompletedWithResult:(id)a3
{
  v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(BuddyProximitySetupDependentController *)v15 setResult:location[0]];
  v3 = &_dispatch_main_q;
  block = _NSConcreteStackBlock;
  int v8 = -1073741824;
  int v9 = 0;
  id v10 = sub_100134800;
  v11 = &unk_1002B12F0;
  id v12 = v15;
  id v13 = location[0];
  dispatch_async((dispatch_queue_t)v3, &block);

  id v4 = [(BuddyProximitySetupDependentController *)v15 delegate];
  if (v4)
  {
    int v5 = [(BuddyProximitySetupDependentController *)v15 delegate];
    [(PASUIDependentViewPresenterDelegate *)v5 proximitySetupCompletedWithResult:location[0]];
  }
  else
  {
    os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      sub_10004B238((uint64_t)buf, (uint64_t)location[0]);
      _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "Proximity dependent setup completed with result: %@", buf, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
  }
  objc_storeStrong(&v13, 0);
  objc_storeStrong((id *)&v12, 0);
  objc_storeStrong(location, 0);
}

- (void)proximitySetupSelectedAccountType:(int64_t)a3
{
}

- (void)proximitySetupSelectedAccount:(int64_t)a3 completion:(id)a4
{
  v14 = self;
  SEL v13 = a2;
  id v12 = (void *)a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  id v4 = &_dispatch_main_q;
  int v5 = _NSConcreteStackBlock;
  int v6 = -1073741824;
  int v7 = 0;
  int v8 = sub_1001349B8;
  int v9 = &unk_1002B1198;
  v10[0] = v14;
  v10[1] = v12;
  dispatch_async((dispatch_queue_t)v4, &v5);

  if (location) {
    (*((void (**)(id, uint64_t))location + 2))(location, 1);
  }
  objc_storeStrong(v10, 0);
  objc_storeStrong(&location, 0);
}

- (void)setupPerformAIDASignInWith:(id)a3 completion:(id)a4
{
  int v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v6 = 0;
  objc_storeStrong(&v6, a4);
  int v5 = [(BuddyProximitySetupDependentController *)v8 delegate];
  [(PASUIDependentViewPresenterDelegate *)v5 setupPerformAIDASignInWith:location[0] completion:v6];

  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

- (void)connectionTerminated
{
  int v9 = self;
  v8[1] = (id)a2;
  v2 = &_dispatch_main_q;
  block = _NSConcreteStackBlock;
  int v4 = -1073741824;
  int v5 = 0;
  id v6 = sub_100134B4C;
  int v7 = &unk_1002B0D20;
  v8[0] = v9;
  dispatch_async((dispatch_queue_t)v2, &block);

  objc_storeStrong(v8, 0);
}

- (PASUIDependentViewPresenterDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PASUIDependentViewPresenterDelegate *)WeakRetained;
}

- (BuddyFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (void)setFeatureFlags:(id)a3
{
}

- (UIViewController)parentViewController
{
  return self->_parentViewController;
}

- (PASUIDependentViewPresenter)dependentViewPresenter
{
  return self->_dependentViewPresenter;
}

- (NSNumber)readyForPresentation
{
  return self->_readyForPresentation;
}

- (id)viewControllerAvailableBlock
{
  return self->_viewControllerAvailableBlock;
}

- (int64_t)accountType
{
  return self->_accountType;
}

- (BOOL)hasAccountType
{
  return self->_hasAccountType;
}

- (void)setHasAccountType:(BOOL)a3
{
  self->_hasAccountType = a3;
}

- (id)accountTypeSelectedBlock
{
  return self->_accountTypeSelectedBlock;
}

- (id)passcodeSetUpCompletionBlock
{
  return self->_passcodeSetUpCompletionBlock;
}

- (void)setPasscodeSetUpCompletionBlock:(id)a3
{
}

- (PASFlowResult)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
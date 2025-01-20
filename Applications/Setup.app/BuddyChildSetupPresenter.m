@interface BuddyChildSetupPresenter
- (AISChildSetupPresenter)presenter;
- (BuddyChildSetupPresenter)init;
- (BuddyChildSetupPresenterDelegate)delegate;
- (void)_ensurePresenter;
- (void)childSetupPresenter:(id)a3 didCompleteWithResult:(id)a4;
- (void)childSetupPresenter:(id)a3 didFail:(id)a4;
- (void)fetchCutOffAgeForChildAccountWithCompletionHandler:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPresenter:(id)a3;
- (void)setupLocationServicesWithCompletion:(id)a3;
- (void)setupLocationServicesWithNextTaskInfo:(id)a3 completion:(id)a4;
- (void)setupPasscodeForAccount:(id)a3 nextTaskInfo:(id)a4 completion:(id)a5;
- (void)setupPasscodeWithCompletion:(id)a3;
- (void)setupPerformAIDASignInWith:(id)a3 completion:(id)a4;
- (void)startFlowWithNavigationController:(id)a3;
@end

@implementation BuddyChildSetupPresenter

- (BuddyChildSetupPresenter)init
{
  SEL v5 = a2;
  id location = 0;
  v4.receiver = self;
  v4.super_class = (Class)BuddyChildSetupPresenter;
  id location = [(BuddyChildSetupPresenter *)&v4 init];
  objc_storeStrong(&location, location);
  if (location) {
    objc_storeStrong((id *)location + 2, 0);
  }
  v2 = (BuddyChildSetupPresenter *)location;
  objc_storeStrong(&location, 0);
  return v2;
}

- (void)startFlowWithNavigationController:(id)a3
{
  SEL v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(BuddyChildSetupPresenter *)v5 _ensurePresenter];
  v3 = [(BuddyChildSetupPresenter *)v5 presenter];
  [(AISChildSetupPresenter *)v3 startFlowWithViewControllerPresentationHandler:location[0]];

  objc_storeStrong(location, 0);
}

- (void)fetchCutOffAgeForChildAccountWithCompletionHandler:(id)a3
{
  v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(BuddyChildSetupPresenter *)v16 _ensurePresenter];
  os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
  os_log_type_t v13 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    v3 = [(BuddyChildSetupPresenter *)v16 presenter];
    id v4 = [(AISChildSetupPresenter *)v3 childSetupStore];
    sub_10004B238((uint64_t)buf, (uint64_t)v4);
    _os_log_impl((void *)&_mh_execute_header, oslog, v13, "Will fetch cut off age for child account with child setup store %@", buf, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  SEL v5 = [(BuddyChildSetupPresenter *)v16 presenter];
  id v6 = [(AISChildSetupPresenter *)v5 childSetupStore];
  v7 = _NSConcreteStackBlock;
  int v8 = -1073741824;
  int v9 = 0;
  v10 = sub_100188760;
  v11 = &unk_1002B40B0;
  id v12 = location[0];
  [v6 fetchMaxAgeForChildAccountWithCompletionHandler:&v7];

  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
}

- (void)_ensurePresenter
{
  v2 = &_dispatch_main_q;
  dispatch_assert_queue_V2((dispatch_queue_t)v2);

  if (!self->_presenter)
  {
    v3 = (AISChildSetupPresenter *)objc_alloc_init((Class)sub_100188AAC());
    presenter = self->_presenter;
    self->_presenter = v3;

    -[AISChildSetupPresenter setDelegate:](self->_presenter, "setDelegate:", self, a2);
  }
}

- (void)childSetupPresenter:(id)a3 didCompleteWithResult:(id)a4
{
  int v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v6 = 0;
  objc_storeStrong(&v6, a4);
  SEL v5 = [(BuddyChildSetupPresenter *)v8 delegate];
  [(BuddyChildSetupPresenterDelegate *)v5 didSucceedWithChildSetupPresenter:v8];

  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

- (void)childSetupPresenter:(id)a3 didFail:(id)a4
{
  int v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v6 = 0;
  objc_storeStrong(&v6, a4);
  SEL v5 = [(BuddyChildSetupPresenter *)v8 delegate];
  [(BuddyChildSetupPresenterDelegate *)v5 childSetupPresenter:v8 didFail:v6];

  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

- (void)setupLocationServicesWithCompletion:(id)a3
{
  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
  os_log_type_t v8 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    v3 = oslog;
    os_log_type_t v4 = v8;
    sub_10004B24C(buf);
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Child setup presenter requesting location services setup", buf, 2u);
  }
  objc_storeStrong((id *)&oslog, 0);
  id v6 = [[BuddyAISFlowTaskInfo alloc] initWithUnderlyingFlowTaskInfo:0];
  SEL v5 = [(BuddyChildSetupPresenter *)v11 delegate];
  [(BuddyChildSetupPresenterDelegate *)v5 setupLocationServicesWithNextTaskInfo:v6 completion:location[0]];

  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

- (void)setupPasscodeWithCompletion:(id)a3
{
  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
  os_log_type_t v8 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    v3 = oslog;
    os_log_type_t v4 = v8;
    sub_10004B24C(buf);
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Child setup presenter requesting passcode setup", buf, 2u);
  }
  objc_storeStrong((id *)&oslog, 0);
  id v6 = [[BuddyAISFlowTaskInfo alloc] initWithUnderlyingFlowTaskInfo:0];
  SEL v5 = [(BuddyChildSetupPresenter *)v11 delegate];
  [(BuddyChildSetupPresenterDelegate *)v5 setupPasscodeWithNextTaskInfo:v6 completion:location[0]];

  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

- (void)setupPasscodeForAccount:(id)a3 nextTaskInfo:(id)a4 completion:(id)a5
{
  v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v13 = 0;
  objc_storeStrong(&v13, a4);
  id v12 = 0;
  objc_storeStrong(&v12, a5);
  os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
  os_log_type_t v10 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_10004B238((uint64_t)buf, (uint64_t)v13);
    _os_log_impl((void *)&_mh_execute_header, oslog, v10, "Child setup presenter requesting passcode setup with nextTaskInfo %@", buf, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  v7 = [BuddyAISFlowTaskInfo alloc];
  int v9 = [(BuddyAISFlowTaskInfo *)v7 initWithUnderlyingFlowTaskInfo:v13];
  os_log_type_t v8 = [(BuddyChildSetupPresenter *)v15 delegate];
  [(BuddyChildSetupPresenterDelegate *)v8 setupPasscodeWithNextTaskInfo:v9 completion:v12];

  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
}

- (void)setupLocationServicesWithNextTaskInfo:(id)a3 completion:(id)a4
{
  id v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v10 = 0;
  objc_storeStrong(&v10, a4);
  os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
  os_log_type_t v8 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_10004B238((uint64_t)buf, (uint64_t)location[0]);
    _os_log_impl((void *)&_mh_execute_header, oslog, v8, "Child setup presenter requesting location services setup with nextTaskInfo %@", buf, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  SEL v5 = [BuddyAISFlowTaskInfo alloc];
  id v7 = [(BuddyAISFlowTaskInfo *)v5 initWithUnderlyingFlowTaskInfo:location[0]];
  id v6 = [(BuddyChildSetupPresenter *)v12 delegate];
  [(BuddyChildSetupPresenterDelegate *)v6 setupLocationServicesWithNextTaskInfo:v7 completion:v10];

  objc_storeStrong(&v7, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
}

- (void)setupPerformAIDASignInWith:(id)a3 completion:(id)a4
{
  os_log_type_t v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v6 = 0;
  objc_storeStrong(&v6, a4);
  SEL v5 = [(BuddyChildSetupPresenter *)v8 delegate];
  [(BuddyChildSetupPresenterDelegate *)v5 setupPerformAIDASignInWith:location[0] completion:v6];

  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

- (BuddyChildSetupPresenterDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BuddyChildSetupPresenterDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (AISChildSetupPresenter)presenter
{
  return self->_presenter;
}

- (void)setPresenter:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
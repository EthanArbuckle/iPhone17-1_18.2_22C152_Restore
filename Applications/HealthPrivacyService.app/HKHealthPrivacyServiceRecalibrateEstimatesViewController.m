@interface HKHealthPrivacyServiceRecalibrateEstimatesViewController
+ (id)_exportedInterface;
+ (id)_remoteViewControllerInterface;
- (BKSApplicationStateMonitor)applicationStateMonitor;
- (HKAuthorizationStore)authorizationStore;
- (NSError)transactionError;
- (UIAlertController)alertViewController;
- (id)_healthPrivacyHostViewController;
- (id)requestCompletion;
- (void)_configureAlertControllerWithSourceName:(id)a3 sampleType:(id)a4 effectiveDate:(id)a5;
- (void)_configureApplicationStateMonitor;
- (void)_finishRequestWithError:(id)a3;
- (void)_finishWithError:(id)a3;
- (void)_hostApplicationStateDidChange:(unsigned int)a3;
- (void)_hostDidTerminate;
- (void)setAlertViewController:(id)a3;
- (void)setApplicationStateMonitor:(id)a3;
- (void)setAuthorizationStore:(id)a3;
- (void)setRequestCompletion:(id)a3;
- (void)setRequestRecord:(id)a3 completion:(id)a4;
- (void)setTransactionError:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation HKHealthPrivacyServiceRecalibrateEstimatesViewController

- (void)setRequestRecord:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = objc_retainBlock(a4);
  id requestCompletion = self->_requestCompletion;
  self->_id requestCompletion = v7;

  id v9 = objc_alloc((Class)HKAuthorizationStore);
  id v10 = objc_alloc_init((Class)HKHealthStore);
  v11 = (HKAuthorizationStore *)[v9 initWithHealthStore:v10];
  authorizationStore = self->_authorizationStore;
  self->_authorizationStore = v11;

  v13 = self->_authorizationStore;
  id v19 = 0;
  LOBYTE(v10) = [(HKAuthorizationStore *)v13 validateRecalibrateEstimatesRequestRecord:v6 error:&v19];
  id v14 = v19;
  if (v10)
  {
    [(HKHealthPrivacyServiceRecalibrateEstimatesViewController *)self _configureApplicationStateMonitor];
    v15 = [v6 source];
    v16 = [v15 name];
    v17 = [v6 sampleType];
    v18 = [v6 effectiveDate];
    [(HKHealthPrivacyServiceRecalibrateEstimatesViewController *)self _configureAlertControllerWithSourceName:v16 sampleType:v17 effectiveDate:v18];
  }
  else
  {
    [(HKHealthPrivacyServiceRecalibrateEstimatesViewController *)self _finishRequestWithError:v14];
  }
}

- (void)_hostApplicationStateDidChange:(unsigned int)a3
{
  if (a3 <= 3)
  {
    block[9] = v3;
    block[10] = v4;
    _HKInitializeLogging();
    id v7 = HKLogAuthorization;
    if (os_log_type_enabled(HKLogAuthorization, OS_LOG_TYPE_DEBUG)) {
      sub_1000074F0(a3, v7);
    }
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100002A78;
    block[3] = &unk_10000C340;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)_configureApplicationStateMonitor
{
  v2 = self;
  objc_initWeak(&location, self);
  id v3 = objc_alloc((Class)BKSApplicationStateMonitor);
  uint64_t v4 = [(HKHealthPrivacyServiceRecalibrateEstimatesViewController *)v2 _hostApplicationBundleIdentifier];
  v12 = v4;
  v5 = +[NSArray arrayWithObjects:&v12 count:1];
  id v6 = [v3 initWithBundleIDs:v5 states:BKSApplicationStateAll];
  v2 = (HKHealthPrivacyServiceRecalibrateEstimatesViewController *)((char *)v2 + 40);
  id v7 = *(void **)v2->HKViewController_opaque;
  *(void *)v2->HKViewController_opaque = v6;

  v8 = *(void **)v2->HKViewController_opaque;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100002C00;
  v9[3] = &unk_10000C368;
  objc_copyWeak(&v10, &location);
  [v8 setHandler:v9];
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)_hostDidTerminate
{
  applicationStateMonitor = self->_applicationStateMonitor;
  self->_applicationStateMonitor = 0;

  id v4 = +[NSError errorWithDomain:HKErrorDomain code:5 userInfo:0];
  [(HKHealthPrivacyServiceRecalibrateEstimatesViewController *)self _finishRequestWithError:v4];
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HKHealthPrivacyServiceRecalibrateEstimatesViewController;
  [(HKHealthPrivacyServiceRecalibrateEstimatesViewController *)&v6 viewWillAppear:a3];
  alertViewController = self->_alertViewController;
  if (alertViewController)
  {
    v5 = [(UIAlertController *)alertViewController presentingViewController];

    if (!v5) {
      [(HKHealthPrivacyServiceRecalibrateEstimatesViewController *)self presentViewController:self->_alertViewController animated:1 completion:0];
    }
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HKHealthPrivacyServiceRecalibrateEstimatesViewController;
  [(HKHealthPrivacyServiceRecalibrateEstimatesViewController *)&v6 viewDidDisappear:a3];
  transactionError = self->_transactionError;
  self->_transactionError = 0;
  v5 = transactionError;

  (*((void (**)(id, BOOL, NSError *))self->_requestCompletion + 2))(self->_requestCompletion, v5 == 0, v5);
}

- (void)_configureAlertControllerWithSourceName:(id)a3 sampleType:(id)a4 effectiveDate:(id)a5
{
  id v32 = a4;
  id v34 = a5;
  id v8 = a3;
  id v9 = HKLocalizedStringForDateAndTemplate();
  if ([v32 code] == (id)183) {
    CFStringRef v10 = @"6MWD";
  }
  else {
    CFStringRef v10 = &stru_10000C628;
  }
  uint64_t v11 = [@"RECALIBRATE_ESTIMATES_ALERT_TITLE_%@_" stringByAppendingString:v10];
  v12 = +[NSBundle bundleWithIdentifier:@"com.apple.HealthUI"];
  v36 = (void *)v11;
  v13 = [v12 localizedStringForKey:v11 value:&stru_10000C628 table:@"HealthUI-Localizable"];
  uint64_t v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v13, v8);

  uint64_t v15 = [@"RECALIBRATE_ESTIMATES_ALERT_MESSAGE_%@_" stringByAppendingString:v10];
  v16 = +[NSBundle bundleWithIdentifier:@"com.apple.HealthUI"];
  v33 = (void *)v15;
  v17 = [v16 localizedStringForKey:v15 value:&stru_10000C628 table:@"HealthUI-Localizable"];
  uint64_t v18 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v17, v9);

  v35 = (void *)v14;
  v31 = (void *)v18;
  id v19 = +[UIAlertController alertControllerWithTitle:v14 message:v18 preferredStyle:1];
  alertViewController = self->_alertViewController;
  self->_alertViewController = v19;

  v21 = self->_alertViewController;
  v22 = +[NSBundle bundleWithIdentifier:@"com.apple.HealthUI"];
  v23 = [v22 localizedStringForKey:@"RECALIBRATE_ESTIMATES_ALERT_CANCEL" value:&stru_10000C628 table:@"HealthUI-Localizable"];
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_1000031F0;
  v40[3] = &unk_10000C390;
  v40[4] = self;
  v24 = +[UIAlertAction actionWithTitle:v23 style:1 handler:v40];
  [(UIAlertController *)v21 addAction:v24];

  v25 = self->_alertViewController;
  v26 = +[NSBundle bundleWithIdentifier:@"com.apple.HealthUI"];
  v27 = [v26 localizedStringForKey:@"RECALIBRATE_ESTIMATES_ALERT_RESET" value:&stru_10000C628 table:@"HealthUI-Localizable"];
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_100003258;
  v37[3] = &unk_10000C408;
  v37[4] = self;
  id v28 = v32;
  id v38 = v28;
  id v29 = v34;
  id v39 = v29;
  v30 = +[UIAlertAction actionWithTitle:v27 style:0 handler:v37];
  [(UIAlertController *)v25 addAction:v30];

  if ([(HKHealthPrivacyServiceRecalibrateEstimatesViewController *)self isViewLoaded]) {
    [(HKHealthPrivacyServiceRecalibrateEstimatesViewController *)self presentViewController:self->_alertViewController animated:1 completion:0];
  }
}

- (void)_finishRequestWithError:(id)a3
{
  id v4 = a3;
  [(HKHealthPrivacyServiceRecalibrateEstimatesViewController *)self _finishWithError:v4];
  (*((void (**)(id, BOOL))self->_requestCompletion + 2))(self->_requestCompletion, v4 == 0);
}

- (void)_finishWithError:(id)a3
{
  objc_storeStrong((id *)&self->_transactionError, a3);
  id v5 = a3;
  id v6 = [(HKHealthPrivacyServiceRecalibrateEstimatesViewController *)self _healthPrivacyHostViewController];
  [v6 didFinishWithError:v5];
}

- (id)_healthPrivacyHostViewController
{
  return [(HKHealthPrivacyServiceRecalibrateEstimatesViewController *)self _remoteViewControllerProxy];
}

+ (id)_remoteViewControllerInterface
{
  return (id)_HKHealthPrivacyHostRemoteViewControllerInterface(a1, a2);
}

+ (id)_exportedInterface
{
  return (id)_HKHealthPrivacyServiceRemoteRecalibrateEstimatesViewControllerInterface(a1, a2);
}

- (HKAuthorizationStore)authorizationStore
{
  return self->_authorizationStore;
}

- (void)setAuthorizationStore:(id)a3
{
}

- (UIAlertController)alertViewController
{
  return self->_alertViewController;
}

- (void)setAlertViewController:(id)a3
{
}

- (NSError)transactionError
{
  return self->_transactionError;
}

- (void)setTransactionError:(id)a3
{
}

- (id)requestCompletion
{
  return self->_requestCompletion;
}

- (void)setRequestCompletion:(id)a3
{
}

- (BKSApplicationStateMonitor)applicationStateMonitor
{
  return self->_applicationStateMonitor;
}

- (void)setApplicationStateMonitor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationStateMonitor, 0);
  objc_storeStrong(&self->_requestCompletion, 0);
  objc_storeStrong((id *)&self->_transactionError, 0);
  objc_storeStrong((id *)&self->_alertViewController, 0);

  objc_storeStrong((id *)&self->_authorizationStore, 0);
}

@end
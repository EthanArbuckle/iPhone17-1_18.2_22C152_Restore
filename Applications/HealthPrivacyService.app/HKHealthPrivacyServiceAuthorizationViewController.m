@interface HKHealthPrivacyServiceAuthorizationViewController
+ (id)_exportedInterface;
+ (id)_remoteViewControllerInterface;
- (BKSApplicationStateMonitor)applicationStateMonitor;
- (BOOL)_isPresentingLastRequest;
- (HKAuthorizationPresentationRequest)presentedRequest;
- (HKAuthorizationRequestRecord)requestRecord;
- (HKHealthPrivacyHostRemoteViewController)_healthPrivacyHostViewController;
- (HKHealthPrivacyServiceAuthorizationViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (HKHealthStore)healthStore;
- (HKNavigationController)navigationController;
- (HKSource)currentTransactionSource;
- (NSArray)presentationRequests;
- (NSUUID)currentTransactionSessionIdentifier;
- (id)_promptControllerForClinicalHealthRecordsPresentationRequest:(id)a3 source:(id)a4;
- (id)_promptControllerForHealthDataPresentationRequest:(id)a3 source:(id)a4;
- (id)_promptControllerForPresentationRequest:(id)a3 source:(id)a4;
- (unsigned)_appStateTerminationUpperBound;
- (void)_beginAuthorizationSessionWithIdentifier:(id)a3;
- (void)_configureApplicationStateMonitor;
- (void)_didFinishPresentingRequestWithError:(id)a3;
- (void)_finishWithError:(id)a3;
- (void)_hostApplicationStateDidChange:(unsigned int)a3;
- (void)_hostDidTerminate;
- (void)_presentNextRequest;
- (void)_presentRequestIfNeeded:(id)a3;
- (void)promptControllerDidFinish:(id)a3 error:(id)a4;
- (void)setApplicationStateMonitor:(id)a3;
- (void)setCurrentTransactionSessionIdentifier:(id)a3;
- (void)setCurrentTransactionSource:(id)a3;
- (void)setNavigationController:(id)a3;
- (void)setPresentationRequests:(id)a3;
- (void)setPresentedRequest:(id)a3;
- (void)setRequestRecord:(id)a3;
- (void)setRequestRecord:(id)a3 presentationRequests:(id)a4;
- (void)show;
- (void)viewDidLoad;
@end

@implementation HKHealthPrivacyServiceAuthorizationViewController

- (HKHealthPrivacyServiceAuthorizationViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)HKHealthPrivacyServiceAuthorizationViewController;
  v4 = [(HKHealthPrivacyServiceAuthorizationViewController *)&v8 initWithNibName:a3 bundle:a4];
  if (v4)
  {
    v5 = (HKHealthStore *)objc_alloc_init((Class)HKHealthStore);
    healthStore = v4->_healthStore;
    v4->_healthStore = v5;
  }
  return v4;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)HKHealthPrivacyServiceAuthorizationViewController;
  [(HKHealthPrivacyServiceAuthorizationViewController *)&v3 viewDidLoad];
  if (self->_showAtViewLoad) {
    [(HKHealthPrivacyServiceAuthorizationViewController *)self show];
  }
}

- (void)setRequestRecord:(id)a3 presentationRequests:(id)a4
{
  id v11 = a4;
  id v7 = a3;
  if ((objc_msgSend(v11, "hk_allElementsUnique") & 1) == 0)
  {
    v9 = +[NSAssertionHandler currentHandler];
    [v9 handleFailureInMethod:a2, self, @"HKHealthPrivacyServiceAuthorizationViewController.m", 77, @"Invalid parameter not satisfying: %@", @"[presentationRequests hk_allElementsUnique]" object file lineNumber description];
  }
  if (![v11 count])
  {
    v10 = +[NSAssertionHandler currentHandler];
    [v10 handleFailureInMethod:a2, self, @"HKHealthPrivacyServiceAuthorizationViewController.m", 78, @"Invalid parameter not satisfying: %@", @"presentationRequests.count > 0" object file lineNumber description];
  }
  [(HKHealthPrivacyServiceAuthorizationViewController *)self setRequestRecord:v7];
  [(HKHealthPrivacyServiceAuthorizationViewController *)self setPresentationRequests:v11];
  objc_super v8 = [v7 sessionIdentifier];

  [(HKHealthPrivacyServiceAuthorizationViewController *)self _beginAuthorizationSessionWithIdentifier:v8];
}

- (void)show
{
  if (([(HKHealthPrivacyServiceAuthorizationViewController *)self isViewLoaded] & 1) == 0)
  {
    self->_showAtViewLoad = 1;
    return;
  }
  v4 = [(HKHealthPrivacyServiceAuthorizationViewController *)self currentTransactionSource];
  if (!v4)
  {
    self->_showAtNextSourceFetch = 1;
    goto LABEL_8;
  }
  id v11 = v4;
  self->_showAtViewLoad = 0;
  self->_showAtNextSourceFetch = 0;
  v5 = [(HKHealthPrivacyServiceAuthorizationViewController *)self requestRecord];
  uint64_t v6 = [(HKHealthPrivacyServiceAuthorizationViewController *)self presentationRequests];
  id v7 = (void *)v6;
  if (!v5)
  {
    v9 = +[NSAssertionHandler currentHandler];
    [v9 handleFailureInMethod:a2, self, @"HKHealthPrivacyServiceAuthorizationViewController.m", 103, @"Invalid parameter not satisfying: %@", @"requestRecord != nil" object file lineNumber description];

    if (v7) {
      goto LABEL_5;
    }
LABEL_12:
    v10 = +[NSAssertionHandler currentHandler];
    [v10 handleFailureInMethod:a2, self, @"HKHealthPrivacyServiceAuthorizationViewController.m", 104, @"Invalid parameter not satisfying: %@", @"presentationRequests != nil" object file lineNumber description];

    goto LABEL_5;
  }
  if (!v6) {
    goto LABEL_12;
  }
LABEL_5:
  objc_super v8 = [v7 firstObject];
  [(HKHealthPrivacyServiceAuthorizationViewController *)self _presentRequestIfNeeded:v8];

  v4 = v11;
LABEL_8:
}

- (void)_presentRequestIfNeeded:(id)a3
{
  id v13 = a3;
  v5 = [(HKHealthPrivacyServiceAuthorizationViewController *)self currentTransactionSessionIdentifier];

  if (!v5)
  {
    id v11 = +[NSAssertionHandler currentHandler];
    [v11 handleFailureInMethod:a2, self, @"HKHealthPrivacyServiceAuthorizationViewController.m", 112, @"Invalid parameter not satisfying: %@", @"self.currentTransactionSessionIdentifier != nil" object file lineNumber description];
  }
  uint64_t v6 = [(HKHealthPrivacyServiceAuthorizationViewController *)self currentTransactionSource];
  if (!v6)
  {
    v12 = +[NSAssertionHandler currentHandler];
    [v12 handleFailureInMethod:a2, self, @"HKHealthPrivacyServiceAuthorizationViewController.m", 114, @"Invalid parameter not satisfying: %@", @"source != nil" object file lineNumber description];
  }
  [(HKHealthPrivacyServiceAuthorizationViewController *)self setPresentedRequest:v13];
  id v7 = [(HKHealthPrivacyServiceAuthorizationViewController *)self _promptControllerForPresentationRequest:v13 source:v6];
  if (v7 && ((objc_opt_respondsToSelector() & 1) == 0 || ([v7 shouldPresent] & 1) != 0))
  {
    objc_super v8 = [(HKHealthPrivacyServiceAuthorizationViewController *)self presentationRequests];
    BOOL v9 = [v8 indexOfObject:v13] != 0;

    id v10 = [objc_alloc((Class)HKNavigationController) initWithRootViewController:v7];
    [v10 setModalInPresentation:1];
    [v10 setModalPresentationStyle:5];
    [(HKHealthPrivacyServiceAuthorizationViewController *)self presentViewController:v10 animated:v9 completion:0];
  }
  else
  {
    [(HKHealthPrivacyServiceAuthorizationViewController *)self _didFinishPresentingRequestWithError:0];
  }
}

- (BOOL)_isPresentingLastRequest
{
  objc_super v3 = [(HKHealthPrivacyServiceAuthorizationViewController *)self presentedRequest];
  if (v3)
  {
    v4 = [(HKHealthPrivacyServiceAuthorizationViewController *)self presentationRequests];
    v5 = [v4 lastObject];
    unsigned __int8 v6 = [v3 isEqual:v5];
  }
  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (void)_presentNextRequest
{
  id v10 = [(HKHealthPrivacyServiceAuthorizationViewController *)self presentedRequest];
  v4 = [(HKHealthPrivacyServiceAuthorizationViewController *)self currentTransactionSessionIdentifier];

  if (!v4)
  {
    id v7 = +[NSAssertionHandler currentHandler];
    [v7 handleFailureInMethod:a2, self, @"HKHealthPrivacyServiceAuthorizationViewController.m", 144, @"Invalid parameter not satisfying: %@", @"self.currentTransactionSessionIdentifier != nil" object file lineNumber description];
  }
  if (!v10)
  {
    objc_super v8 = +[NSAssertionHandler currentHandler];
    [v8 handleFailureInMethod:a2, self, @"HKHealthPrivacyServiceAuthorizationViewController.m", 145, @"Invalid parameter not satisfying: %@", @"presentedRequest != nil" object file lineNumber description];
  }
  if ([(HKHealthPrivacyServiceAuthorizationViewController *)self _isPresentingLastRequest])
  {
    BOOL v9 = +[NSAssertionHandler currentHandler];
    [v9 handleFailureInMethod:a2, self, @"HKHealthPrivacyServiceAuthorizationViewController.m", 146, @"Invalid parameter not satisfying: %@", @"[self _isPresentingLastRequest] == NO" object file lineNumber description];
  }
  v5 = [(HKHealthPrivacyServiceAuthorizationViewController *)self presentationRequests];
  unsigned __int8 v6 = [v5 objectAtIndexedSubscript:[v5 indexOfObject:v10] + 1];
  [(HKHealthPrivacyServiceAuthorizationViewController *)self _presentRequestIfNeeded:v6];
}

- (void)_didFinishPresentingRequestWithError:(id)a3
{
  id v5 = a3;
  if ([(HKHealthPrivacyServiceAuthorizationViewController *)self _isPresentingLastRequest]
    || ([(HKHealthPrivacyServiceAuthorizationViewController *)self currentTransactionSessionIdentifier], v4 = objc_claimAutoreleasedReturnValue(), v4, !v4))
  {
    [(HKHealthPrivacyServiceAuthorizationViewController *)self _finishWithError:v5];
  }
  else
  {
    [(HKHealthPrivacyServiceAuthorizationViewController *)self _presentNextRequest];
  }
}

- (id)_promptControllerForPresentationRequest:(id)a3 source:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 type];
  if (v8 == (id)1)
  {
    uint64_t v9 = [(HKHealthPrivacyServiceAuthorizationViewController *)self _promptControllerForHealthDataPresentationRequest:v6 source:v7];
    goto LABEL_5;
  }
  if (!v8)
  {
    uint64_t v9 = [(HKHealthPrivacyServiceAuthorizationViewController *)self _promptControllerForClinicalHealthRecordsPresentationRequest:v6 source:v7];
LABEL_5:
    id v10 = (void *)v9;
    goto LABEL_7;
  }
  id v10 = 0;
LABEL_7:

  return v10;
}

- (id)_promptControllerForClinicalHealthRecordsPresentationRequest:(id)a3 source:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  if ([v8 type])
  {
    id v13 = +[NSAssertionHandler currentHandler];
    [v13 handleFailureInMethod:a2, self, @"HKHealthPrivacyServiceAuthorizationViewController.m", 185, @"Invalid parameter not satisfying: %@", @"request.type == HKAuthorizationPresentationTypeClinicalHealthRecords" object file lineNumber description];
  }
  uint64_t v9 = [(HKHealthPrivacyServiceAuthorizationViewController *)self healthStore];
  id v10 = +[HKClinicalAuthorizationSequenceContext contextWithHealthStore:v9 request:v8 source:v7];

  id v11 = [v10 createInitialViewControllerWithDelegate:self];

  return v11;
}

- (id)_promptControllerForHealthDataPresentationRequest:(id)a3 source:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  if ([v8 type] != (id)1)
  {
    v18 = +[NSAssertionHandler currentHandler];
    [v18 handleFailureInMethod:a2, self, @"HKHealthPrivacyServiceAuthorizationViewController.m", 197, @"Invalid parameter not satisfying: %@", @"request.type == HKAuthorizationPresentationTypeHealthData" object file lineNumber description];
  }
  id v9 = objc_alloc((Class)HKAuthorizationSettingsViewController);
  id v10 = [(HKHealthPrivacyServiceAuthorizationViewController *)self healthStore];
  id v11 = [v9 initWithHealthStore:v10 style:1];

  [v11 setDelegate:self];
  v12 = [v8 typesRequiringReadAuthorization];
  [v11 setTypesToRead:v12];

  id v13 = [v8 typesRequiringShareAuthorization];
  [v11 setTypesToShare:v13];

  v14 = [v8 shareUsageDescription];
  [v11 setUpdateDescription:v14];

  v15 = [v8 readUsageDescription];
  [v11 setShareDescription:v15];

  v16 = [v8 researchStudyUsageDescription];

  [v11 setResearchStudyUsageDescription:v16];
  [v11 setSource:v7];

  return v11;
}

- (unsigned)_appStateTerminationUpperBound
{
  v2 = [(HKHealthPrivacyServiceAuthorizationViewController *)self presentedRequest];
  if ([v2 shouldDismissWhenBackgrounded]) {
    unsigned int v3 = 4;
  }
  else {
    unsigned int v3 = 2;
  }

  return v3;
}

- (void)_hostApplicationStateDidChange:(unsigned int)a3
{
  if ([(HKHealthPrivacyServiceAuthorizationViewController *)self _appStateTerminationUpperBound] > a3)
  {
    _HKInitializeLogging();
    id v5 = HKLogAuthorization;
    if (os_log_type_enabled(HKLogAuthorization, OS_LOG_TYPE_DEBUG)) {
      sub_10000762C(a3, v5);
    }
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100006968;
    block[3] = &unk_10000C340;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)_configureApplicationStateMonitor
{
  objc_initWeak(&location, self);
  id v3 = objc_alloc((Class)BKSApplicationStateMonitor);
  v4 = [(HKHealthPrivacyServiceAuthorizationViewController *)self _hostApplicationBundleIdentifier];
  id v13 = v4;
  id v5 = +[NSArray arrayWithObjects:&v13 count:1];
  id v6 = [v3 initWithBundleIDs:v5 states:BKSApplicationStateAll];

  id v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472;
  id v9 = sub_100006AF8;
  id v10 = &unk_10000C368;
  objc_copyWeak(&v11, &location);
  [v6 setHandler:&v7];
  -[HKHealthPrivacyServiceAuthorizationViewController setApplicationStateMonitor:](self, "setApplicationStateMonitor:", v6, v7, v8, v9, v10);
  objc_destroyWeak(&v11);

  objc_destroyWeak(&location);
}

- (void)_hostDidTerminate
{
  [(HKHealthPrivacyServiceAuthorizationViewController *)self setApplicationStateMonitor:0];
  id v3 = [(HKHealthPrivacyServiceAuthorizationViewController *)self currentTransactionSessionIdentifier];

  if (v3)
  {
    id v4 = +[NSError errorWithDomain:HKErrorDomain code:5 userInfo:0];
    [(HKHealthPrivacyServiceAuthorizationViewController *)self _finishWithError:v4];
  }
}

- (void)_beginAuthorizationSessionWithIdentifier:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v13 = +[NSAssertionHandler currentHandler];
    [v13 handleFailureInMethod:a2, self, @"HKHealthPrivacyServiceAuthorizationViewController.m", 255, @"Invalid parameter not satisfying: %@", @"sessionIdentifier != nil" object file lineNumber description];
  }
  id v6 = [(HKHealthPrivacyServiceAuthorizationViewController *)self currentTransactionSessionIdentifier];

  if (v6)
  {
    v14 = +[NSAssertionHandler currentHandler];
    [v14 handleFailureInMethod:a2, self, @"HKHealthPrivacyServiceAuthorizationViewController.m", 256, @"Invalid parameter not satisfying: %@", @"self.currentTransactionSessionIdentifier == nil" object file lineNumber description];
  }
  _HKInitializeLogging();
  id v7 = (void *)HKLogAuthorization;
  if (os_log_type_enabled(HKLogAuthorization, OS_LOG_TYPE_DEBUG)) {
    sub_100007960(v7, (uint64_t)self, (uint64_t)v5);
  }
  [(HKHealthPrivacyServiceAuthorizationViewController *)self setCurrentTransactionSessionIdentifier:v5];
  [(HKHealthPrivacyServiceAuthorizationViewController *)self _configureApplicationStateMonitor];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100006E4C;
  v17[3] = &unk_10000C518;
  v17[4] = self;
  id v8 = v5;
  id v18 = v8;
  id v9 = objc_retainBlock(v17);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100006FD8;
  v15[3] = &unk_10000C5E0;
  v15[4] = self;
  id v16 = v8;
  id v10 = v8;
  id v11 = objc_retainBlock(v15);
  v12 = [(HKHealthPrivacyServiceAuthorizationViewController *)self healthStore];
  [v12 beginAuthorizationDelegateTransactionWithSessionIdentifier:v10 sourceHandler:v11 errorHandler:v9];
}

- (void)promptControllerDidFinish:(id)a3 error:(id)a4
{
  id v5 = a4;
  id v6 = [(HKHealthPrivacyServiceAuthorizationViewController *)self presentedViewController];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100007238;
  v8[3] = &unk_10000C608;
  BOOL v10 = v5 == 0;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  [v6 dismissViewControllerAnimated:1 completion:v8];
}

- (void)_finishWithError:(id)a3
{
  id v7 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  id v4 = [(HKHealthPrivacyServiceAuthorizationViewController *)self currentTransactionSessionIdentifier];
  if (v4)
  {
    id v5 = [(HKHealthPrivacyServiceAuthorizationViewController *)self healthStore];
    [v5 endAuthorizationDelegateTransactionWithSessionIdentifier:v4 error:v7];
  }
  [(HKHealthPrivacyServiceAuthorizationViewController *)self setCurrentTransactionSessionIdentifier:0];
  [(HKHealthPrivacyServiceAuthorizationViewController *)self setCurrentTransactionSource:0];
  [(HKHealthPrivacyServiceAuthorizationViewController *)self setPresentedRequest:0];
  id v6 = [(HKHealthPrivacyServiceAuthorizationViewController *)self _healthPrivacyHostViewController];
  [v6 didFinishWithError:v7];
}

- (HKHealthPrivacyHostRemoteViewController)_healthPrivacyHostViewController
{
  return (HKHealthPrivacyHostRemoteViewController *)[(HKHealthPrivacyServiceAuthorizationViewController *)self _remoteViewControllerProxy];
}

+ (id)_remoteViewControllerInterface
{
  return (id)_HKHealthPrivacyHostRemoteViewControllerInterface(a1, a2);
}

+ (id)_exportedInterface
{
  return (id)_HKHealthPrivacyServiceRemoteAuthorizationViewControllerInterface(a1, a2);
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (HKNavigationController)navigationController
{
  return self->_navigationController;
}

- (void)setNavigationController:(id)a3
{
}

- (HKAuthorizationRequestRecord)requestRecord
{
  return self->_requestRecord;
}

- (void)setRequestRecord:(id)a3
{
}

- (NSArray)presentationRequests
{
  return self->_presentationRequests;
}

- (void)setPresentationRequests:(id)a3
{
}

- (NSUUID)currentTransactionSessionIdentifier
{
  return self->_currentTransactionSessionIdentifier;
}

- (void)setCurrentTransactionSessionIdentifier:(id)a3
{
}

- (HKSource)currentTransactionSource
{
  return self->_currentTransactionSource;
}

- (void)setCurrentTransactionSource:(id)a3
{
}

- (HKAuthorizationPresentationRequest)presentedRequest
{
  return self->_presentedRequest;
}

- (void)setPresentedRequest:(id)a3
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
  objc_storeStrong((id *)&self->_presentedRequest, 0);
  objc_storeStrong((id *)&self->_currentTransactionSource, 0);
  objc_storeStrong((id *)&self->_currentTransactionSessionIdentifier, 0);
  objc_storeStrong((id *)&self->_presentationRequests, 0);
  objc_storeStrong((id *)&self->_requestRecord, 0);
  objc_storeStrong((id *)&self->_navigationController, 0);

  objc_storeStrong((id *)&self->_healthStore, 0);
}

@end
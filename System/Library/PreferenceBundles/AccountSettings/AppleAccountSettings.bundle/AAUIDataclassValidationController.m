@interface AAUIDataclassValidationController
- (AAUIDataclassValidationController)initWithAccount:(id)a3 presentingViewController:(id)a4;
- (AAUIDataclassValidationControllerDelegate)delegate;
- (ACAccount)account;
- (BOOL)_isDataclassAllowlisted:(id)a3;
- (BOOL)_isEligibleForWalrus;
- (BOOL)isDataclassAvailable:(id)a3;
- (UIViewController)presentingViewController;
- (unint64_t)_currentWalrusStatus;
- (void)_reloadSpecifiers;
- (void)_startObservingManateeAvailabilityNotification;
- (void)_startObservingNotifications;
- (void)_startObservingWalrusStateChangeNotification;
- (void)_stopObservingManateeAvailabilityNotification;
- (void)_stopObservingNotifications;
- (void)_stopObservingWalrusStateChangeNotification;
- (void)_walrusPresentUnknownErrorWithCompletionHandler:(id)a3;
- (void)_walrusValidateAccessForDataclass:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)validateAccessForDataclass:(id)a3 completion:(id)a4;
@end

@implementation AAUIDataclassValidationController

- (AAUIDataclassValidationController)initWithAccount:(id)a3 presentingViewController:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)AAUIDataclassValidationController;
  v9 = [(AAUIDataclassValidationController *)&v17 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_account, a3);
    objc_storeWeak((id *)&v10->_presentingViewController, v8);
    dispatch_semaphore_t v11 = dispatch_semaphore_create(1);
    validationAccessSemaphore = v10->_validationAccessSemaphore;
    v10->_validationAccessSemaphore = (OS_dispatch_semaphore *)v11;

    v13 = dispatch_queue_attr_make_with_autorelease_frequency((dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v14 = dispatch_queue_create("com.apple.validation-access-queue", v13);
    validationAccessQueue = v10->_validationAccessQueue;
    v10->_validationAccessQueue = (OS_dispatch_queue *)v14;

    [(AAUIDataclassValidationController *)v10 _startObservingNotifications];
  }

  return v10;
}

- (void)dealloc
{
  [(AAUIDataclassValidationController *)self _stopObservingNotifications];
  v3.receiver = self;
  v3.super_class = (Class)AAUIDataclassValidationController;
  [(AAUIDataclassValidationController *)&v3 dealloc];
}

- (BOOL)isDataclassAvailable:(id)a3
{
  id v4 = a3;
  if (self->_manateeAvailable
    || (char *)[(AAUIDataclassValidationController *)self _currentWalrusStatus] == (char *)&dword_0 + 2)
  {
    BOOL v5 = 1;
  }
  else
  {
    BOOL v5 = [(AAUIDataclassValidationController *)self _isDataclassAllowlisted:v4];
  }

  return v5;
}

- (void)validateAccessForDataclass:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t))a4;
  id v8 = _AAUILogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v18 = v6;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "[AAUIDataclassValidationController validateAccessForDataclass] dataclass: %@", buf, 0xCu);
  }

  if (self->_manateeAvailable
    || (char *)[(AAUIDataclassValidationController *)self _currentWalrusStatus] == (char *)&dword_0 + 2
    || [(AAUIDataclassValidationController *)self _isDataclassAllowlisted:v6])
  {
    v7[2](v7, 1);
  }
  else
  {
    objc_initWeak((id *)buf, self);
    v9 = self->_validationAccessSemaphore;
    validationAccessQueue = self->_validationAccessQueue;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_27074;
    v12[3] = &unk_75D28;
    v13 = v9;
    dispatch_semaphore_t v11 = v9;
    objc_copyWeak(&v16, (id *)buf);
    v15 = v7;
    id v14 = v6;
    dispatch_async(validationAccessQueue, v12);

    objc_destroyWeak(&v16);
    objc_destroyWeak((id *)buf);
  }
}

- (void)_startObservingNotifications
{
  [(AAUIDataclassValidationController *)self _startObservingWalrusStateChangeNotification];

  [(AAUIDataclassValidationController *)self _startObservingManateeAvailabilityNotification];
}

- (void)_stopObservingNotifications
{
  [(AAUIDataclassValidationController *)self _stopObservingWalrusStateChangeNotification];

  [(AAUIDataclassValidationController *)self _stopObservingManateeAvailabilityNotification];
}

- (void)_reloadSpecifiers
{
  id v3 = [(AAUIDataclassValidationController *)self delegate];
  [v3 reloadSpecifiersForDataclassValidationController:self];
}

- (BOOL)_isEligibleForWalrus
{
  v2 = [(AAUIDataclassValidationController *)self account];
  unsigned __int8 v3 = objc_msgSend(v2, "aa_isAccountClass:", AAAccountClassPrimary);

  return v3;
}

- (unint64_t)_currentWalrusStatus
{
  if ([(AAUIDataclassValidationController *)self _isEligibleForWalrus]) {
    return self->_currentWalrusStatus;
  }
  else {
    return 2;
  }
}

- (void)_startObservingWalrusStateChangeNotification
{
  if ([(AAUIDataclassValidationController *)self _isEligibleForWalrus])
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_2764C;
    v7[3] = &unk_75DA0;
    id v8 = objc_alloc_init((Class)CDPWalrusStateController);
    v9 = self;
    unsigned __int8 v3 = v8;
    id v6 = objc_retainBlock(v7);
    id v4 = (void (*)(void))v6[2];
    BOOL v5 = v6;
    v4();
  }
  else
  {
    unsigned __int8 v3 = _AAUILogSystem();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      sub_49E84();
    }
  }
}

- (void)_stopObservingWalrusStateChangeNotification
{
  id v5 = self->_walrusStateChangeNotificationObserver;
  if (v5)
  {
    unsigned __int8 v3 = +[NSNotificationCenter defaultCenter];
    [v3 removeObserver:v5];
  }
  id walrusStateChangeNotificationObserver = self->_walrusStateChangeNotificationObserver;
  self->_id walrusStateChangeNotificationObserver = 0;
}

- (void)_startObservingManateeAvailabilityNotification
{
  if ([(AAUIDataclassValidationController *)self _isEligibleForWalrus])
  {
    id v3 = objc_alloc_init((Class)CDPStateController);
    id v21 = 0;
    unsigned __int8 v4 = [v3 isManateeAvailable:&v21];
    id v5 = v21;
    self->_manateeAvailable = v4;
    if (v5)
    {
      id v6 = _AAUILogSystem();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_49F24((uint64_t)v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
    objc_initWeak(&location, self);
    v13 = +[NSString stringWithUTF8String:CDPManateeAvailabilityNotification];
    id v14 = +[NSDistributedNotificationCenter defaultCenter];
    v15 = +[NSOperationQueue mainQueue];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_27BE0;
    v18[3] = &unk_75640;
    objc_copyWeak(&v19, &location);
    id v16 = [v14 addObserverForName:v13 object:0 suspensionBehavior:4 queue:v15 usingBlock:v18];
    id manateeAvailabilityNotificationObserver = self->_manateeAvailabilityNotificationObserver;
    self->_id manateeAvailabilityNotificationObserver = v16;

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
  else
  {
    id v5 = _AAUILogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_49F90();
    }
  }
}

- (void)_stopObservingManateeAvailabilityNotification
{
  id v5 = self->_manateeAvailabilityNotificationObserver;
  if (v5)
  {
    id v3 = +[NSNotificationCenter defaultCenter];
    [v3 removeObserver:v5];
  }
  id manateeAvailabilityNotificationObserver = self->_manateeAvailabilityNotificationObserver;
  self->_id manateeAvailabilityNotificationObserver = 0;
}

- (void)_walrusValidateAccessForDataclass:(id)a3 completion:(id)a4
{
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_27EF4;
  v15[3] = &unk_75838;
  id v5 = a4;
  id v16 = v5;
  id v6 = objc_retainBlock(v15);
  if ([(AAUIDataclassValidationController *)self _isEligibleForWalrus])
  {
    id v7 = [objc_alloc((Class)AAUID2DEncryptionFlowContext) initWithType:4];
    id v8 = objc_alloc((Class)AAUIManateeStateValidator);
    uint64_t v9 = [(AAUIDataclassValidationController *)self presentingViewController];
    id v10 = [v8 initWithFlowContext:v7 withPresentingViewController:v9];

    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_27F84;
    v12[3] = &unk_75838;
    v13 = v6;
    [v10 verifyAndRepairManateeWithCompletion:v12];
  }
  else
  {
    uint64_t v11 = _AAUILogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "Account not eligible for walrus, will not perform dataclass access validation", buf, 2u);
    }

    ((void (*)(void *, uint64_t, void))v6[2])(v6, 1, 0);
  }
}

- (void)_walrusPresentUnknownErrorWithCompletionHandler:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  id v5 = +[NSBundle bundleForClass:objc_opt_class()];
  id v6 = [v5 localizedStringForKey:@"ACCESS_DATACLASS_VALIDATION_FAILED_TITLE" value:&stru_76890 table:@"Localizable"];
  id v7 = +[NSBundle bundleForClass:objc_opt_class()];
  id v8 = [v7 localizedStringForKey:@"ACCESS_DATACLASS_VALIDATION_FAILED_MESSAGE" value:&stru_76890 table:@"Localizable"];
  uint64_t v9 = +[NSBundle bundleForClass:objc_opt_class()];
  id v10 = [v9 localizedStringForKey:@"ACCESS_DATACLASS_VALIDATION_FAILED_BUTTON_TITLE" value:&stru_76890 table:@"Localizable"];
  id v12 = +[UIAlertController alertWithTitle:v6 message:v8 buttonTitle:v10];

  uint64_t v11 = [(AAUIDataclassValidationController *)self presentingViewController];
  [v11 presentViewController:v12 animated:1 completion:v4];
}

- (BOOL)_isDataclassAllowlisted:(id)a3
{
  uint64_t v3 = qword_8FFF8;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&qword_8FFF8, &stru_75E38);
  }
  unsigned __int8 v5 = [(id)qword_8FFF0 containsObject:v4];

  return v5;
}

- (ACAccount)account
{
  return self->_account;
}

- (UIViewController)presentingViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);

  return (UIViewController *)WeakRetained;
}

- (AAUIDataclassValidationControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AAUIDataclassValidationControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_validationAccessQueue, 0);
  objc_storeStrong((id *)&self->_validationAccessSemaphore, 0);
  objc_storeStrong(&self->_manateeAvailabilityNotificationObserver, 0);

  objc_storeStrong(&self->_walrusStateChangeNotificationObserver, 0);
}

@end
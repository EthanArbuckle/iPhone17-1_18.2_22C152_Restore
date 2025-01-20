@interface VSSettingsViewController
- (BOOL)isReadyToHandleDeepLinks;
- (BOOL)shouldShowMVPDAppInstallPrompt;
- (NSOperationQueue)privateQueue;
- (UIViewController)currentChildViewController;
- (VSASDDialogObserver)dialogObserver;
- (VSDestinationOperation)currentOperation;
- (VSIdentityProviderRequestManager)requestManager;
- (VSPersistentStorage)storage;
- (VSRemoteNotifier)remoteNotifier;
- (VSRestrictionsCenter)restrictionsCenter;
- (VSSettingsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)_appWillForeground;
- (void)_confirmDeletionOfAccount:(id)a3 withAccountInfoViewController:(id)a4;
- (void)_didEnterBackground;
- (void)_forciblySignOutOfAccount:(id)a3;
- (void)_handleDestination:(id)a3 completion:(id)a4;
- (void)_loadAppropriateChildViewController;
- (void)_presentAlertForError:(id)a3 offeringToDeleteAccount:(id)a4;
- (void)_presentError:(id)a3;
- (void)_presentError:(id)a3 withAccount:(id)a4;
- (void)_removeCurrentChildViewControllerIfNecessary;
- (void)_setupAppropriateChildViewController;
- (void)_showLoadingViewControllerWithTitle:(id)a3;
- (void)_showLoadingViewControllerWithTitle:(id)a3 andSpinner:(BOOL)a4;
- (void)_startSigningOutOfAccount:(id)a3 withAccountInfoViewController:(id)a4;
- (void)_updateChildViewController:(id)a3 searchController:(id)a4 rightBarButtonItem:(id)a5;
- (void)accountInfoViewController:(id)a3 didSelectEditAccountForAccount:(id)a4 identityProvider:(id)a5;
- (void)accountInfoViewControllerDidShowMVPDAppInstallPrompt;
- (void)accountInfoViewControllerWantsMoreApps:(id)a3;
- (void)dealloc;
- (void)dismissIdentityProviderViewController:(id)a3;
- (void)enqueueOperation:(id)a3;
- (void)handleDestination:(id)a3 completion:(id)a4;
- (void)handleURL:(id)a3 withCompletion:(id)a4;
- (void)identityProviderPickerViewController:(id)a3 didPickIdentityProvider:(id)a4;
- (void)identityProviderRequestManager:(id)a3 finishedRequest:(id)a4 withResult:(id)a5;
- (void)identityProviderViewController:(id)a3 didFinishRequest:(id)a4 withResult:(id)a5;
- (void)identityProviderViewControllerDidCancel:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)presentAccountsViewController:(id)a3;
- (void)presentIdentityProvidersViewController;
- (void)remoteNotifier:(id)a3 didReceiveRemoteNotificationWithUserInfo:(id)a4;
- (void)setCurrentChildViewController:(id)a3;
- (void)setCurrentOperation:(id)a3;
- (void)setDialogObserver:(id)a3;
- (void)setPrivateQueue:(id)a3;
- (void)setReadyToHandleDeepLinks:(BOOL)a3;
- (void)setRemoteNotifier:(id)a3;
- (void)setRequestManager:(id)a3;
- (void)setRestrictionsCenter:(id)a3;
- (void)setShouldShowMVPDAppInstallPrompt:(BOOL)a3;
- (void)setStorage:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)willMoveToParentViewController:(id)a3;
@end

@implementation VSSettingsViewController

- (VSSettingsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v18.receiver = self;
  v18.super_class = (Class)VSSettingsViewController;
  v4 = [(VSSettingsViewController *)&v18 initWithNibName:a3 bundle:a4];
  if (v4)
  {
    v5 = (VSPersistentStorage *)objc_alloc_init((Class)VSPersistentStorage);
    storage = v4->_storage;
    v4->_storage = v5;

    uint64_t v7 = +[VSRestrictionsCenter defaultRestrictionsCenter];
    restrictionsCenter = v4->_restrictionsCenter;
    v4->_restrictionsCenter = (VSRestrictionsCenter *)v7;

    id v9 = objc_alloc((Class)VSRemoteNotifier);
    v10 = (VSRemoteNotifier *)[v9 initWithNotificationName:VSAccountStoreDidChangeNotification];
    remoteNotifier = v4->_remoteNotifier;
    v4->_remoteNotifier = v10;

    [(VSRemoteNotifier *)v4->_remoteNotifier setDelegate:v4];
    v12 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    privateQueue = v4->_privateQueue;
    v4->_privateQueue = v12;

    [(NSOperationQueue *)v4->_privateQueue setName:@"VSSettingsViewController"];
    [(NSOperationQueue *)v4->_privateQueue setMaxConcurrentOperationCount:1];
    v4->_shouldShowMVPDAppInstallPrompt = 0;
    v14 = objc_alloc_init(VSASDDialogObserver);
    [(VSASDDialogObserver *)v14 setPresenterViewController:v4];
    [(VSSettingsViewController *)v4 setDialogObserver:v14];
    v15 = +[NSNotificationCenter defaultCenter];
    [v15 addObserver:v4 selector:"_didEnterBackground" name:UIApplicationDidEnterBackgroundNotification object:0];

    v16 = +[NSNotificationCenter defaultCenter];
    [v16 addObserver:v4 selector:"_appWillForeground" name:UIApplicationWillEnterForegroundNotification object:0];
  }
  return v4;
}

- (void)willMoveToParentViewController:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VSSettingsViewController;
  -[VSSettingsViewController willMoveToParentViewController:](&v4, "willMoveToParentViewController:");
  if (a3) {
    +[VSMetricsManagerObjC recordEnterEventWithPage:VSMetricPageSettingsHome pageType:VSMetricPageTypeSettings];
  }
  else {
    +[VSMetricsManagerObjC recordExitEventWithPage:VSMetricPageSettingsHome pageType:VSMetricPageTypeSettings];
  }
}

- (void)dealloc
{
  VSRequireMainThread();
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  objc_super v4 = [(VSSettingsViewController *)self dialogObserver];
  [v4 stopListening];

  v5.receiver = self;
  v5.super_class = (Class)VSSettingsViewController;
  [(VSSettingsViewController *)&v5 dealloc];
}

- (void)_didEnterBackground
{
}

- (void)_appWillForeground
{
  v3 = [(VSSettingsViewController *)self navigationController];
  objc_super v4 = [v3 visibleViewController];

  if (v4 == self)
  {
    uint64_t v5 = VSMetricPageSettingsHome;
    uint64_t v6 = VSMetricPageTypeSettings;
    +[VSMetricsManagerObjC recordEnterEventWithPage:v5 pageType:v6];
  }
}

- (void)identityProviderPickerViewController:(id)a3 didPickIdentityProvider:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  VSRequireMainThread();
  +[VSMetricsManagerObjC recordClickEventWithPage:VSMetricPageSettingsPicker pageType:VSMetricPageTypeSettings target:VSMetricClickTargetIdentityProvider];
  if ([v7 isFullySupportedForRequestsExpectingAuthenticationSchemes:0])
  {
    v8 = [(VSSettingsViewController *)self storage];
    id v9 = +[VSIdentityProviderRequest makeAccountRequestWithStorage:v8];

    id v10 = [objc_alloc((Class)VSIdentityProviderViewController) initWithIdentityProvider:v7];
    [v10 setDelegate:self];
    [v10 setCanIssuePrivacyVouchers:1];
    [v10 enqueueRequest:v9];
    v11 = [(VSSettingsViewController *)self navigationController];
    [v11 pushViewController:v10 animated:1];
  }
  else
  {
    v12 = +[VSViewControllerFactory sharedFactory];
    v13 = [(VSSettingsViewController *)self storage];
    v16 = _NSConcreteStackBlock;
    uint64_t v17 = 3221225472;
    objc_super v18 = sub_621C;
    v19 = &unk_14688;
    v20 = self;
    id v21 = v6;
    v14 = [v12 viewControllerForUnsupportedProvider:v7 withRequestingAppDisplayName:0 storage:v13 acknowledgementHandler:&v16];

    v15 = objc_msgSend(v14, "forceUnwrapObject", v16, v17, v18, v19, v20);
    [(VSSettingsViewController *)self presentViewController:v15 animated:1 completion:0];
  }
}

- (void)remoteNotifier:(id)a3 didReceiveRemoteNotificationWithUserInfo:(id)a4
{
  [(VSSettingsViewController *)self _setupAppropriateChildViewController];
  id v6 = [(VSSettingsViewController *)self navigationController];
  id v5 = [v6 popToViewController:self animated:1];
}

- (void)accountInfoViewControllerWantsMoreApps:(id)a3
{
  v3 = [a3 identityProvider];
  id v5 = [v3 appStoreRoomURL];

  objc_super v4 = v5;
  if (v5)
  {
    VSOpenURL();
    objc_super v4 = v5;
  }
}

- (void)accountInfoViewController:(id)a3 didSelectEditAccountForAccount:(id)a4 identityProvider:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v10 isFullySupportedForRequestsExpectingAuthenticationSchemes:0])
  {
    [(VSSettingsViewController *)self _confirmDeletionOfAccount:v9 withAccountInfoViewController:v8];
  }
  else
  {
    id v11 = objc_initWeak(&location, v8);
    [(VSSettingsViewController *)self _startSigningOutOfAccount:v9 withAccountInfoViewController:v8];

    objc_destroyWeak(&location);
  }
}

- (void)accountInfoViewControllerDidShowMVPDAppInstallPrompt
{
}

- (void)identityProviderRequestManager:(id)a3 finishedRequest:(id)a4 withResult:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  VSRequireMainThread();
  [(VSSettingsViewController *)self setRequestManager:0];
  id v9 = [v7 account];

  if (!v9) {
    +[NSException raise:NSInvalidArgumentException format:@"The [request account] parameter must not be nil."];
  }
  [v7 account];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_67D0;
  v13[3] = &unk_146B0;
  v13[4] = self;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_6844;
  v11[3] = &unk_146D8;
  v11[4] = self;
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  id v10 = v12;
  [v8 unwrapObject:v13 error:v11];
}

- (void)dismissIdentityProviderViewController:(id)a3
{
  id v7 = [a3 navigationController];
  v3 = [v7 viewControllers];
  id v4 = [v3 count];

  if ((unint64_t)v4 < 2)
  {
    id v6 = [v7 presentingViewController];
    [v6 dismissViewControllerAnimated:1 completion:0];
  }
  else
  {
    id v5 = [v7 popViewControllerAnimated:1];
  }
}

- (void)identityProviderViewControllerDidCancel:(id)a3
{
  id v7 = [a3 navigationController];
  v3 = [v7 viewControllers];
  id v4 = [v3 count];

  if ((unint64_t)v4 < 2)
  {
    id v6 = [v7 presentingViewController];
    [v6 dismissViewControllerAnimated:1 completion:0];
  }
  else
  {
    id v5 = [v7 popViewControllerAnimated:1];
  }
}

- (void)identityProviderViewController:(id)a3 didFinishRequest:(id)a4 withResult:(id)a5
{
  id v6 = a5;
  id v7 = [v6 object];

  if (v7)
  {
    [(VSSettingsViewController *)self _setupAppropriateChildViewController];
    [(VSSettingsViewController *)self setShouldShowMVPDAppInstallPrompt:1];
  }
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_6B70;
  v15[3] = &unk_14740;
  id v8 = v6;
  id v16 = v8;
  uint64_t v17 = self;
  id v9 = objc_retainBlock(v15);
  id v10 = [(VSSettingsViewController *)self presentedViewController];

  if (v10)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_6C50;
    v13[3] = &unk_145E8;
    v14 = v9;
    [(VSSettingsViewController *)self dismissViewControllerAnimated:1 completion:v13];
  }
  else
  {
    id v11 = [(VSSettingsViewController *)self navigationController];
    id v12 = [v11 popToViewController:self animated:1];

    ((void (*)(void *))v9[2])(v9);
  }
}

- (void)_forciblySignOutOfAccount:(id)a3
{
  id v4 = a3;
  VSRequireMainThread();
  id v5 = [(VSSettingsViewController *)self storage];
  id v6 = [v5 channelsCenter];
  [v6 _removeSavedAccountChannelsWithCompletionHandler:0];

  id v7 = [v5 privacyFacade];
  [v7 reset];

  id v8 = [v5 accountStore];
  id v11 = v4;
  id v9 = +[NSArray arrayWithObjects:&v11 count:1];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_6DA8;
  v10[3] = &unk_14768;
  v10[4] = self;
  [v8 removeAccounts:v9 withCompletionHandler:v10];
}

- (void)_startSigningOutOfAccount:(id)a3 withAccountInfoViewController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(VSSettingsViewController *)self privateQueue];
  id v9 = objc_alloc((Class)VSIdentityProviderFetchOperation);
  id v10 = [v6 identityProviderID];
  id v11 = [v10 forceUnwrapObject];
  id v12 = [v9 initWithIdentityProviderID:v11];

  [v8 addOperation:v12];
  objc_super v18 = v12;
  v19 = v6;
  id v13 = v6;
  id v14 = v12;
  v15 = VSMainThreadOperationWithBlock();
  [v15 addDependency:v14];
  VSEnqueueCompletionOperation();
  id v16 = +[NSBundle vs_frameworkBundle];
  uint64_t v17 = [v16 localizedStringForKey:@"SIGNING_OUT_TITLE" value:0 table:0];
  [(VSSettingsViewController *)self _showLoadingViewControllerWithTitle:v17];

  [v7 disableAccountSignOutButton];
}

- (void)_confirmDeletionOfAccount:(id)a3 withAccountInfoViewController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, v7);
  id v8 = +[VSViewControllerFactory sharedFactory];
  id v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472;
  id v14 = sub_7404;
  v15 = &unk_147E0;
  id v16 = self;
  id v9 = v6;
  id v17 = v9;
  objc_copyWeak(&v18, &location);
  id v10 = [v8 viewControllerToConfirmAccountDeletionForAccount:v9 preferredStyle:1 confirmationHandler:&v12];
  id v11 = objc_msgSend(v10, "forceUnwrapObject", v12, v13, v14, v15, v16);

  [(VSSettingsViewController *)self presentViewController:v11 animated:1 completion:0];
  objc_destroyWeak(&v18);

  objc_destroyWeak(&location);
}

- (void)_presentAlertForError:(id)a3 offeringToDeleteAccount:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v7)
  {
    id v9 = v7;
    id v10 = [v6 userInfo];
    id v11 = [v10 mutableCopy];

    id v12 = objc_alloc_init((Class)VSErrorRecoveryOption);
    uint64_t v13 = +[NSBundle vs_frameworkBundle];
    id v14 = [v13 localizedStringForKey:@"ERROR_DISMISS_BUTTON_TITLE" value:0 table:0];
    [v12 setLocalizedAlertButtonTitle:v14];

    id v15 = objc_alloc_init((Class)VSErrorRecoveryOption);
    id v16 = +[NSBundle vs_frameworkBundle];
    id v17 = [v16 localizedStringForKey:@"SIGN_OUT_BUTTON_TITLE" value:0 table:0];
    [v15 setLocalizedAlertButtonTitle:v17];

    [v15 setDestructive:1];
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_7714;
    v25[3] = &unk_14808;
    v25[4] = self;
    id v26 = v9;
    id v18 = v9;
    [v15 setAttemptHandler:v25];
    v27[0] = v12;
    v27[1] = v15;
    v19 = +[NSArray arrayWithObjects:v27 count:2];
    v20 = VSUserInfoForErrorRecoveryOptions();
    [v11 addEntriesFromDictionary:v20];

    id v21 = [v6 domain];
    uint64_t v22 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v21, [v6 code], v11);

    id v6 = (id)v22;
  }
  v23 = VSErrorLogObject();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
    sub_BBDC();
  }

  v24 = VSAlertForError();
  [(VSSettingsViewController *)self presentViewController:v24 animated:1 completion:0];
}

- (void)_presentError:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)VSOptional);
  [(VSSettingsViewController *)self _presentError:v4 withAccount:v5];
}

- (void)_presentError:(id)a3 withAccount:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t IsPrivateError = VSErrorIsPrivateError();
  id v9 = objc_alloc_init((Class)VSErrorViewController);
  [v9 setRecoveryDestructive:IsPrivateError];
  uint64_t v13 = v6;
  id v14 = v9;
  id v10 = v9;
  id v11 = v6;
  id v12 = VSPrivateAccountLoadingErrorWithRecoveryHandler();

  objc_msgSend(v10, "setError:", v12, _NSConcreteStackBlock, 3221225472, sub_78D4, &unk_14830);
  [(VSSettingsViewController *)self _updateChildViewController:v10 searchController:0 rightBarButtonItem:0];
}

- (void)presentAccountsViewController:(id)a3
{
  id v4 = a3;
  id v5 = [(VSSettingsViewController *)self storage];
  id v6 = [(VSSettingsViewController *)self privateQueue];
  id v7 = [(VSSettingsViewController *)self restrictionsCenter];
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = sub_7E2C;
  v19 = sub_7E3C;
  v20 = [[VSAccountInfoViewController alloc] initWithAccount:v4 storage:v5 restrictionsCenter:v7];
  [(id)v16[5] setDelegate:self];
  [(VSSettingsViewController *)self _updateChildViewController:v16[5] searchController:0 rightBarButtonItem:0];
  id v8 = objc_alloc((Class)VSIdentityProviderFetchOperation);
  id v9 = [v4 identityProviderID];
  id v10 = [v9 forceUnwrapObject];
  id v11 = [v8 initWithIdentityProviderID:v10];

  id v13 = v11;
  id v14 = v4;
  id v12 = VSMainThreadOperationWithBlock();
  objc_msgSend(v6, "addOperation:", v13, _NSConcreteStackBlock, 3221225472, sub_7E44, &unk_14880);
  [v12 addDependency:v13];
  VSEnqueueCompletionOperation();

  _Block_object_dispose(&v15, 8);
}

- (void)presentIdentityProvidersViewController
{
  id v3 = objc_alloc_init((Class)VSIdentityProviderFetchAllOperation);
  id v4 = objc_alloc_init((Class)VSStorefrontCodeLoadOperation);
  id v5 = objc_alloc_init((Class)VSAMSStorefrontFetchAllOperation);
  objc_initWeak(&location, v3);
  objc_initWeak(&from, v4);
  objc_initWeak(&v15, v5);
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x3032000000;
  v13[3] = sub_7E2C;
  void v13[4] = sub_7E3C;
  id v14 = 0;
  objc_copyWeak(&v10, &location);
  objc_copyWeak(&v11, &from);
  objc_copyWeak(&v12, &v15);
  id v9 = v3;
  id v6 = VSMainThreadOperationWithBlock();
  id v7 = [objc_alloc((Class)VSTimeoutOperation) initWithOperation:v9 timeout:30.0];
  [v5 addDependency:v4];
  [v9 addDependency:v5];
  [v7 addDependency:v5];
  [v6 addDependency:v7];
  id v8 = [(VSSettingsViewController *)self privateQueue];
  [v8 addOperation:v4];
  [v8 addOperation:v5];
  [v8 addOperation:v7];
  VSEnqueueCompletionOperation();

  objc_destroyWeak(&v12);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&v10);
  _Block_object_dispose(v13, 8);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

- (void)_loadAppropriateChildViewController
{
  id v3 = [(VSSettingsViewController *)self storage];
  id v4 = [v3 accountStore];
  id v5 = [v4 firstAccountIfLoaded];

  if (v5)
  {
    [(VSSettingsViewController *)self presentAccountsViewController:v5];
  }
  else
  {
    id v6 = [v3 accountStore];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_8A3C;
    v7[3] = &unk_14660;
    v7[4] = self;
    [v6 fetchAccountsWithCompletionHandler:v7];
  }
}

- (void)_setupAppropriateChildViewController
{
  VSRequireMainThread();
  id v3 = [(VSSettingsViewController *)self storage];
  id v4 = [v3 accountStore];
  id v5 = [v4 firstAccountIfLoaded];

  [(VSSettingsViewController *)self _showLoadingViewControllerWithTitle:0 andSpinner:v5 == 0];
  [(VSSettingsViewController *)self _loadAppropriateChildViewController];
}

- (void)_showLoadingViewControllerWithTitle:(id)a3
{
}

- (void)_showLoadingViewControllerWithTitle:(id)a3 andSpinner:(BOOL)a4
{
  BOOL v4 = a4;
  id v9 = a3;
  id v6 = +[VSViewControllerFactory sharedFactory];
  id v7 = [v6 loadingViewController];
  id v8 = [v7 forceUnwrapObject];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v8 setLoadingTitle:v9];
    [v8 setIsAnimating:v4];
  }
  [(VSSettingsViewController *)self _updateChildViewController:v8 searchController:0 rightBarButtonItem:0];
}

- (void)_updateChildViewController:(id)a3 searchController:(id)a4 rightBarButtonItem:(id)a5
{
  id v15 = a3;
  id v8 = a4;
  id v9 = a5;
  if (!v15) {
    +[NSException raise:NSInvalidArgumentException format:@"The newChildViewController parameter must not be nil."];
  }
  VSRequireMainThread();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ([(VSSettingsViewController *)self currentChildViewController],
        id v10 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v10,
        (isKindOfClass & 1) != 0))
  {
    id v12 = v15;
    id v13 = [(VSSettingsViewController *)self currentChildViewController];
    id v14 = [v12 loadingTitle];

    [v13 setLoadingTitle:v14];
  }
  else
  {
    [(VSSettingsViewController *)self _removeCurrentChildViewControllerIfNecessary];
    [(VSSettingsViewController *)self addChildViewController:v15];
    id v13 = [v15 view];
    id v14 = [(VSSettingsViewController *)self view];
    [v14 bounds];
    objc_msgSend(v13, "setFrame:");
    [v13 setAutoresizingMask:18];
    [v14 addSubview:v13];
    [v15 didMoveToParentViewController:self];
    [(VSSettingsViewController *)self setCurrentChildViewController:v15];
    [(VSSettingsViewController *)self vs_updateNavigationItemAndForceViewReloadWithSearchController:v8 rightBarButtonItem:v9];
  }
}

- (void)setCurrentChildViewController:(id)a3
{
  BOOL v4 = (UIViewController *)a3;
  if ([(UIViewController *)v4 conformsToProtocol:&OBJC_PROTOCOL___VSDestinationHandler])
  {
    id v5 = [(VSSettingsViewController *)self currentChildViewController];
    [v5 removeObserver:self forKeyPath:@"readyToHandleDeepLinks" context:0];
  }
  [(VSSettingsViewController *)self setReadyToHandleDeepLinks:0];
  currentChildViewController = self->_currentChildViewController;
  self->_currentChildViewController = v4;
  id v7 = v4;

  LODWORD(currentChildViewController) = [(UIViewController *)v7 conformsToProtocol:&OBJC_PROTOCOL___VSDestinationHandler];
  if (currentChildViewController)
  {
    id v8 = [(VSSettingsViewController *)self currentChildViewController];
    [v8 addObserver:self forKeyPath:@"readyToHandleDeepLinks" options:5 context:0];
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ([v10 isEqualToString:@"readyToHandleDeepLinks"])
  {
    id v13 = [(VSSettingsViewController *)self currentChildViewController];

    if (v13 == v11)
    {
      id v14 = [v12 objectForKeyedSubscript:NSKeyValueChangeNewKey];
      id v15 = [v14 BOOLValue];

      [(VSSettingsViewController *)self setReadyToHandleDeepLinks:v15];
    }
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)VSSettingsViewController;
    [(VSSettingsViewController *)&v16 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

- (void)setReadyToHandleDeepLinks:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = VSDefaultLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = +[NSString vs_yesNoStringValueFromBool:v3];
    int v8 = 138412290;
    id v9 = v6;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "_readyToHandleDeepLinks=%@", (uint8_t *)&v8, 0xCu);
  }
  self->_readyToHandleDeepLinks = v3;
  if (v3)
  {
    id v7 = [(VSSettingsViewController *)self currentOperation];
    [(VSSettingsViewController *)self enqueueOperation:v7];
  }
}

- (void)enqueueOperation:(id)a3
{
  id v3 = a3;
  BOOL v4 = +[NSOperationQueue mainQueue];
  if (v3)
  {
    if (([v3 isFinished] & 1) == 0
      && ([v3 isExecuting] & 1) == 0)
    {
      id v5 = [v4 operations];
      unsigned __int8 v6 = [v5 containsObject:v3];

      if ((v6 & 1) == 0)
      {
        id v7 = VSDefaultLogObject();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          int v8 = [v3 debugDescription];
          int v9 = 138412290;
          id v10 = v8;
          _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Enqueing operation %@", (uint8_t *)&v9, 0xCu);
        }
        [v4 addOperation:v3];
      }
    }
  }
}

- (void)_removeCurrentChildViewControllerIfNecessary
{
  id v3 = [(VSSettingsViewController *)self currentChildViewController];
  if (v3)
  {
    id v5 = v3;
    [v3 willMoveToParentViewController:0];
    BOOL v4 = [v5 view];
    [v4 removeFromSuperview];

    [v5 removeFromParentViewController];
    [(VSSettingsViewController *)self setCurrentChildViewController:0];
    id v3 = v5;
  }
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)VSSettingsViewController;
  [(VSSettingsViewController *)&v7 viewDidLoad];
  id v3 = +[NSBundle vs_frameworkBundle];
  BOOL v4 = [v3 localizedStringForKey:@"TV_PROVIDER_TITLE" value:0 table:0];
  [(VSSettingsViewController *)self setTitle:v4];

  [(VSSettingsViewController *)self _setupAppropriateChildViewController];
  id v5 = [(VSSettingsViewController *)self navigationItem];
  [v5 setLargeTitleDisplayMode:2];
  unsigned __int8 v6 = [(VSSettingsViewController *)self dialogObserver];
  [v6 startListening];
}

- (void)viewDidAppear:(BOOL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)VSSettingsViewController;
  [(VSSettingsViewController *)&v10 viewDidAppear:a3];
  BOOL v4 = +[NSURL URLWithString:@"settings-navigation://com.apple.Settings.TVProvider"];
  id v5 = objc_alloc((Class)_NSLocalizedStringResource);
  unsigned __int8 v6 = +[NSLocale currentLocale];
  objc_super v7 = +[NSBundle vs_frameworkBundle];
  int v8 = [v7 bundleURL];
  id v9 = [v5 initWithKey:@"TV_PROVIDER_TITLE" table:0 locale:v6 bundleURL:v8];

  [(VSSettingsViewController *)self pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:@"com.apple.graphic-icon.tv-provider" title:v9 localizedNavigationComponents:&__NSArray0__struct deepLink:v4];
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)VSSettingsViewController;
  [(VSSettingsViewController *)&v3 viewDidLayoutSubviews];
  [(VSSettingsViewController *)self vs_adjustContentScrollViewInsets];
}

- (void)handleURL:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = VSDefaultLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v6 description];
    int v11 = 138412290;
    id v12 = v9;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Received URL resource dictionary: %@", (uint8_t *)&v11, 0xCu);
  }
  objc_super v10 = VSDestinationFromResourceDictionary();
  if (v10) {
    [(VSSettingsViewController *)self _handleDestination:v10 completion:v7];
  }
}

- (void)setCurrentOperation:(id)a3
{
  BOOL v4 = (VSDestinationOperation *)a3;
  if (![(VSSettingsViewController *)self isReadyToHandleDeepLinks])
  {
    int v8 = VSDefaultLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = [(VSDestinationOperation *)v4 debugDescription];
      objc_super v10 = v9;
      if (!v9)
      {
        objc_super v10 = +[NSNull null];
      }
      int v11 = 138412290;
      id v12 = v10;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Not ready, set current operation to %@", (uint8_t *)&v11, 0xCu);
      if (!v9) {
    }
      }
    currentOperation = self->_currentOperation;
    self->_currentOperation = v4;
    goto LABEL_15;
  }
  if (self->_currentOperation) {
    -[VSDestinationOperation addDependency:](v4, "addDependency:");
  }
  id v5 = self->_currentOperation;
  self->_currentOperation = v4;

  if (v4)
  {
    id v6 = VSDefaultLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11) = 0;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Already ready...", (uint8_t *)&v11, 2u);
    }

    currentOperation = [(VSSettingsViewController *)self currentOperation];
    [(VSSettingsViewController *)self enqueueOperation:currentOperation];
LABEL_15:
  }
}

- (void)_handleDestination:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = [[VSDestinationOperation alloc] initWithDestination:v5 viewController:self];

  [(VSSettingsViewController *)self setCurrentOperation:v6];
}

- (void)handleDestination:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [(VSSettingsViewController *)self currentChildViewController];
  unsigned int v9 = [v8 conformsToProtocol:&OBJC_PROTOCOL___VSDestinationHandler];

  if (v9)
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_9B68;
    v15[3] = &unk_14998;
    void v15[4] = self;
    id v16 = v6;
    id v17 = v7;
    [(VSSettingsViewController *)self vs_makeFrontmostAnimated:1 completion:v15];
  }
  else
  {
    objc_super v10 = [(VSSettingsViewController *)self currentChildViewController];
    int v11 = [v10 debugDescription];
    id v12 = v11;
    if (!v11)
    {
      id v12 = +[NSNull null];
    }
    id v13 = +[NSString stringWithFormat:@"Invalid childViewController %@", v12];
    id v14 = VSDestinationError();
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v14);

    if (!v11) {
  }
    }
}

- (VSPersistentStorage)storage
{
  return self->_storage;
}

- (void)setStorage:(id)a3
{
}

- (VSRestrictionsCenter)restrictionsCenter
{
  return self->_restrictionsCenter;
}

- (void)setRestrictionsCenter:(id)a3
{
}

- (UIViewController)currentChildViewController
{
  return self->_currentChildViewController;
}

- (NSOperationQueue)privateQueue
{
  return self->_privateQueue;
}

- (void)setPrivateQueue:(id)a3
{
}

- (VSRemoteNotifier)remoteNotifier
{
  return self->_remoteNotifier;
}

- (void)setRemoteNotifier:(id)a3
{
}

- (VSIdentityProviderRequestManager)requestManager
{
  return self->_requestManager;
}

- (void)setRequestManager:(id)a3
{
}

- (BOOL)shouldShowMVPDAppInstallPrompt
{
  return self->_shouldShowMVPDAppInstallPrompt;
}

- (void)setShouldShowMVPDAppInstallPrompt:(BOOL)a3
{
  self->_shouldShowMVPDAppInstallPrompt = a3;
}

- (VSASDDialogObserver)dialogObserver
{
  return self->_dialogObserver;
}

- (void)setDialogObserver:(id)a3
{
}

- (VSDestinationOperation)currentOperation
{
  return self->_currentOperation;
}

- (BOOL)isReadyToHandleDeepLinks
{
  return self->_readyToHandleDeepLinks;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentOperation, 0);
  objc_storeStrong((id *)&self->_dialogObserver, 0);
  objc_storeStrong((id *)&self->_requestManager, 0);
  objc_storeStrong((id *)&self->_remoteNotifier, 0);
  objc_storeStrong((id *)&self->_privateQueue, 0);
  objc_storeStrong((id *)&self->_currentChildViewController, 0);
  objc_storeStrong((id *)&self->_restrictionsCenter, 0);

  objc_storeStrong((id *)&self->_storage, 0);
}

@end
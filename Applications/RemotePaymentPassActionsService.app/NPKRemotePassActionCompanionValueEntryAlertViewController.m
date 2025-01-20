@interface NPKRemotePassActionCompanionValueEntryAlertViewController
- (unint64_t)supportedInterfaceOrientations;
- (void)configureWithContext:(id)a3 completion:(id)a4;
- (void)enterValueViewController:(id)a3 didCancelForRequestIdentifier:(id)a4;
- (void)enterValueViewController:(id)a3 didFinishWithCurrencyAmount:(id)a4 forRequestIdentifier:(id)a5;
- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4;
@end

@implementation NPKRemotePassActionCompanionValueEntryAlertViewController

- (unint64_t)supportedInterfaceOrientations
{
  v2 = +[UIDevice currentDevice];
  unint64_t v3 = (unint64_t)[v2 userInterfaceIdiom];

  if ((v3 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    return 30;
  }
  else {
    return 2;
  }
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(NPKRemotePassActionCompanionValueEntryAlertViewController *)self _remoteViewControllerProxyWithErrorHandler:&stru_100010528];
  [v8 setAllowsAlertStacking:1];
  [v8 setAllowsAlertItems:1];
  [v8 setAllowsSiri:0];
  [v8 setAllowsBanners:1];
  [v8 setDesiredHardwareButtonEvents:16];
  [v8 setSwipeDismissalStyle:0];
  [v8 setDismissalAnimationStyle:1];
  v9 = [v6 userInfo];
  v10 = [v9 objectForKey:@"request"];

  if (v10)
  {
    objc_opt_class();
    uint64_t v11 = NPKSecureUnarchiveObject();
    if (v11)
    {
      v12 = v11;
      v13 = [v6 userInfo];
      v14 = [v13 objectForKey:@"contact"];

      if (v14)
      {
        objc_opt_class();
        v15 = NPKSecureUnarchiveObject();
      }
      else
      {
        v15 = 0;
      }
      v18 = [[NPKRemotePassActionCompanionEnterValueViewController alloc] initWithRequest:v12 contact:v15 delegate:self];
      enterValueViewController = self->_enterValueViewController;
      self->_enterValueViewController = v18;

      v20 = (UINavigationController *)[objc_alloc((Class)UINavigationController) initWithRootViewController:self->_enterValueViewController];
      navigationController = self->_navigationController;
      self->_navigationController = v20;

      [(UINavigationController *)self->_navigationController setModalInPresentation:1];
      v22 = [(UINavigationController *)self->_navigationController sheetPresentationController];
      [v22 setLargestUndimmedDetentIdentifier:UISheetPresentationControllerDetentIdentifierLarge];

      [(NPKRemotePassActionCompanionValueEntryAlertViewController *)self showViewController:self->_navigationController sender:0];
LABEL_10:

      goto LABEL_11;
    }
  }
  v16 = pk_RemotePassAction_log();
  BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);

  if (v17)
  {
    v12 = pk_RemotePassAction_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v25 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Error: NPKRemotePassActionCompanionValueEntryAlertViewController: No request (%@) identified! Unable to present NPKRemotePassActionCompanionEnterValueViewController", buf, 0xCu);
    }
    goto LABEL_10;
  }
LABEL_11:
  v23.receiver = self;
  v23.super_class = (Class)NPKRemotePassActionCompanionValueEntryAlertViewController;
  [(NPKCompanionBaseAlertViewController *)&v23 configureWithContext:v6 completion:v7];
}

- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4
{
  id v6 = (void (**)(void))a4;
  v5 = [(NPKRemotePassActionCompanionValueEntryAlertViewController *)self _remoteViewControllerProxyWithErrorHandler:&stru_100010548];
  [v5 setStatusBarHidden:1 withDuration:0.4];
  if (v6) {
    v6[2]();
  }
}

- (void)enterValueViewController:(id)a3 didCancelForRequestIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = pk_RemotePassAction_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    v10 = pk_RemotePassAction_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412546;
      id v13 = v6;
      __int16 v14 = 2112;
      id v15 = v7;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Notice: NPKRemotePassActionCompanionValueEntryAlertViewController: Value entry view controller (%@) did cancel for request identifier: %@", (uint8_t *)&v12, 0x16u);
    }
  }
  uint64_t v11 = [(NPKCompanionBaseAlertViewController *)self viewServicePresenter];
  [v11 handleCompanionValueEntryCancelledForRequestIdentifier:v7];

  [(NPKCompanionBaseAlertViewController *)self dismiss];
}

- (void)enterValueViewController:(id)a3 didFinishWithCurrencyAmount:(id)a4 forRequestIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = pk_RemotePassAction_log();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

  if (v12)
  {
    id v13 = pk_RemotePassAction_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412802;
      id v16 = v8;
      __int16 v17 = 2112;
      id v18 = v9;
      __int16 v19 = 2112;
      id v20 = v10;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Notice: NPKRemotePassActionCompanionValueEntryAlertViewController: Value entry view controller (%@) did finish with currency amount: %@ for request identifier: %@", (uint8_t *)&v15, 0x20u);
    }
  }
  __int16 v14 = [(NPKCompanionBaseAlertViewController *)self viewServicePresenter];
  [v14 handleCompanionValueEntryFinishedWithCurrencyAmount:v9 forRequestIdentifier:v10];

  [(NPKCompanionBaseAlertViewController *)self dismiss];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navigationController, 0);

  objc_storeStrong((id *)&self->_enterValueViewController, 0);
}

@end
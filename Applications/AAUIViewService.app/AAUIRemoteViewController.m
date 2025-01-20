@interface AAUIRemoteViewController
- (AAFlowPresenterHostProtocol)hostProxy;
- (AAUIOBWelcomeController)welcomeController;
- (AAUIOBWelcomeControllerViewModelProtocol)viewModel;
- (NSDictionary)remoteContextInfo;
- (OS_xpc_object)xpcEndpoint;
- (id)remoteObjectInterface;
- (int64_t)preferredStatusBarStyle;
- (unint64_t)supportedInterfaceOrientations;
- (void)_acceptCustodianshipInvite;
- (void)_acceptInheritanceInvite;
- (void)_buildViewModelWithContextInfo:(id)a3;
- (void)_callCompletionWithError:(id)a3;
- (void)_checkManateeAvailabilityForFlowType:(unint64_t)a3 completion:(id)a4;
- (void)_declineCustodianshipInvite;
- (void)_declineInheritanceInvite;
- (void)_dismissAndExit;
- (void)_dismissBeneficiaryInvitationReminderFollowUp;
- (void)_dismissCustodianInvitationReminderFollowUp;
- (void)_goToAccountBeneficiarySettings;
- (void)_goToAccountRecoverySettings;
- (void)_invalidateLookupConnection;
- (void)_legacyContactExitWithoutSettings;
- (void)_main_dismissAndExit;
- (void)_prepareMessagesInvitation;
- (void)_respondToCustodianInvitationWithResponse:(BOOL)a3;
- (void)_respondToInheritanceInvitationWithResponse:(BOOL)a3;
- (void)_setupRemoteProxy;
- (void)_showCustodianInvitationAcceptedView;
- (void)_showInheritanceInvitationAcceptedView;
- (void)_showInvitedAsFlow;
- (void)configureWithContext:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)endUIService;
- (void)handleButtonActions:(id)a3;
- (void)handleCancellation;
- (void)notifyFlowCompletionToExitScene;
- (void)prepareViewServiceForPresentation;
- (void)setHostProxy:(id)a3;
- (void)setRemoteContextInfo:(id)a3;
- (void)setUpHostProxy;
- (void)setUpLookupConnection:(id)a3;
- (void)setViewModel:(id)a3;
- (void)setWelcomeController:(id)a3;
- (void)setXpcEndpoint:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)welcomeViewController:(id)a3 didCompleteWithSuccess:(BOOL)a4 error:(id)a5;
@end

@implementation AAUIRemoteViewController

- (void)viewWillAppear:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)AAUIRemoteViewController;
  [(AAUIRemoteViewController *)&v9 viewWillAppear:a3];
  v4 = [(AAUIRemoteViewController *)self view];
  v5 = [v4 window];
  v6 = [v5 _rootSheetPresentationController];
  [v6 _setShouldScaleDownBehindDescendantSheets:0];

  [(AAUIRemoteViewController *)self setNeedsStatusBarAppearanceUpdate];
  [(AAUIRemoteViewController *)self _setupRemoteProxy];
  v7 = _AAUILogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Showing invited as flow", v8, 2u);
  }

  [(AAUIRemoteViewController *)self _showInvitedAsFlow];
}

- (unint64_t)supportedInterfaceOrientations
{
  v2 = +[UIDevice currentDevice];
  id v3 = [v2 userInterfaceIdiom];

  if (v3 == (id)1) {
    return 30;
  }
  else {
    return 2;
  }
}

- (int64_t)preferredStatusBarStyle
{
  return 0;
}

- (void)_showInvitedAsFlow
{
  if (self->_welcomeController)
  {
    v2 = _AAUILogSystem();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      sub_100006F94();
    }
    goto LABEL_4;
  }
  [(AAUIRemoteViewController *)self _prepareMessagesInvitation];
  if (!self->_isCustodianFlow)
  {
    v2 = [objc_alloc((Class)AAUID2DEncryptionFlowContext) initWithType:1];
    id v5 = [objc_alloc((Class)AAUIManateeStateValidator) initWithFlowContext:v2 withPresentingViewController:self];
    objc_initWeak(&location, self);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100004204;
    v7[3] = &unk_10000C398;
    id v6 = v5;
    id v8 = v6;
    objc_copyWeak(&v9, &location);
    [v6 verifyAndRepairManateeWithCompletion:v7];
    objc_destroyWeak(&v9);

    objc_destroyWeak(&location);
LABEL_4:

    return;
  }
  welcomeController = self->_welcomeController;

  [(AAUIRemoteViewController *)self presentViewController:welcomeController animated:1 completion:0];
}

- (void)_buildViewModelWithContextInfo:(id)a3
{
  v4 = (AAUIOBWelcomeControllerViewModelProtocol *)a3;
  id v5 = _AAUILogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v38 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Building with context info: %@", buf, 0xCu);
  }

  id v6 = [(AAUIOBWelcomeControllerViewModelProtocol *)v4 objectForKeyedSubscript:@"modelData"];
  v7 = [(AAUIOBWelcomeControllerViewModelProtocol *)v4 objectForKeyedSubscript:@"modelType"];
  id v8 = (objc_class *)objc_opt_class();
  id v9 = NSStringFromClass(v8);
  unsigned int v10 = [v7 isEqualToString:v9];

  if (v10)
  {
    id v36 = 0;
    v11 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v6 error:&v36];
    id v12 = v36;
    v13 = (AAUIOBWelcomeControllerViewModelProtocol *)[objc_alloc((Class)AAUIOBCustodianInvitationModel) initWithModel:v11];
    viewModel = self->_viewModel;
    self->_viewModel = v13;

    v15 = _AAUILogSystem();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = self->_viewModel;
      *(_DWORD *)buf = 138412290;
      v38 = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "_viewModel %@", buf, 0xCu);
    }

    v17 = 0;
  }
  else
  {
    v18 = [(AAUIOBWelcomeControllerViewModelProtocol *)v4 objectForKeyedSubscript:@"modelType"];
    v19 = (objc_class *)objc_opt_class();
    v20 = NSStringFromClass(v19);
    unsigned int v21 = [v18 isEqualToString:v20];

    if (v21)
    {
      id v35 = 0;
      v17 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v6 error:&v35];
      id v12 = v35;
      v22 = (objc_class *)AAUIOBInvitationSentViewModel;
    }
    else
    {
      v23 = [(AAUIOBWelcomeControllerViewModelProtocol *)v4 objectForKeyedSubscript:@"modelType"];
      v24 = (objc_class *)objc_opt_class();
      v25 = NSStringFromClass(v24);
      unsigned int v26 = [v23 isEqualToString:v25];

      if (v26)
      {
        id v34 = 0;
        v17 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v6 error:&v34];
        id v12 = v34;
        v22 = (objc_class *)AAUIOBTrustedContactInviteMessageModel;
      }
      else
      {
        v27 = [(AAUIOBWelcomeControllerViewModelProtocol *)v4 objectForKeyedSubscript:@"modelType"];
        v28 = (objc_class *)objc_opt_class();
        v29 = NSStringFromClass(v28);
        unsigned int v30 = [v27 isEqualToString:v29];

        if (!v30)
        {
          id v12 = 0;
          v17 = 0;
          if ([v6 length]) {
            goto LABEL_22;
          }
LABEL_19:
          v32 = _AAUILogSystem();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
            sub_100007030();
          }
          goto LABEL_21;
        }
        id v33 = 0;
        v17 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v6 error:&v33];
        id v12 = v33;
        v22 = (objc_class *)AAUIOBInheritanceInvitationViewModel;
      }
    }
    v31 = (AAUIOBWelcomeControllerViewModelProtocol *)[[v22 alloc] initWithModel:v17];
    v11 = self->_viewModel;
    self->_viewModel = v31;
  }

  if (![v6 length]) {
    goto LABEL_19;
  }
  if (v12)
  {
    v32 = _AAUILogSystem();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      sub_100007064();
    }
LABEL_21:
  }
LABEL_22:
}

- (void)_prepareMessagesInvitation
{
  id v3 = (AAUIOBWelcomeController *)[objc_alloc((Class)AAUIOBWelcomeController) initWithViewModel:self->_viewModel];
  welcomeController = self->_welcomeController;
  self->_welcomeController = v3;

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [(AAUIOBWelcomeControllerViewModelProtocol *)self->_viewModel custodianshipInfo];
    id v6 = [v5 status];

    v7 = _AAUILogSystem();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
    if (v6 == (id)1)
    {
      if (v8) {
        sub_1000070CC();
      }

      id v9 = [(AAUIOBWelcomeController *)self->_welcomeController primaryButton];
      [v9 addTarget:self action:"_acceptInheritanceInvite" forEvents:64];

      unsigned int v10 = [(AAUIOBWelcomeController *)self->_welcomeController secondaryButton];
      v11 = v10;
      id v12 = "_declineInheritanceInvite";
    }
    else
    {
      if (v8) {
        sub_100007100();
      }

      v19 = [(AAUIOBWelcomeController *)self->_welcomeController primaryButton];
      [v19 addTarget:self action:"_legacyContactExitWithoutSettings" forEvents:64];

      unsigned int v10 = [(AAUIOBWelcomeController *)self->_welcomeController secondaryButton];
      v11 = v10;
      id v12 = "_goToAccountBeneficiarySettings";
    }
  }
  else
  {
    v13 = _AAUILogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      sub_1000071D0();
    }

    self->_isCustodianFlow = 1;
    if ((objc_opt_respondsToSelector() & 1) == 0
      || ([(AAUIOBWelcomeControllerViewModelProtocol *)self->_viewModel custodianshipInfo],
          v14 = objc_claimAutoreleasedReturnValue(),
          v14,
          !v14))
    {
      [(AAUIOBWelcomeController *)self->_welcomeController setDelegate:self];
      return;
    }
    v15 = [(AAUIOBWelcomeControllerViewModelProtocol *)self->_viewModel custodianshipInfo];
    id v16 = [v15 status];

    if (v16 == (id)1)
    {
      v17 = _AAUILogSystem();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
        sub_100007134();
      }

      v18 = [(AAUIOBWelcomeController *)self->_welcomeController primaryButton];
      [v18 addTarget:self action:"_acceptCustodianshipInvite" forEvents:64];

      unsigned int v10 = [(AAUIOBWelcomeController *)self->_welcomeController secondaryButton];
    }
    else
    {
      v20 = [(AAUIOBWelcomeControllerViewModelProtocol *)self->_viewModel custodianshipInfo];
      id v21 = [v20 status];

      v22 = _AAUILogSystem();
      BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG);
      if (v21 != (id)5)
      {
        if (v23) {
          sub_10000719C();
        }

        v24 = [(AAUIOBWelcomeController *)self->_welcomeController primaryButton];
        [v24 addTarget:self action:"_dismissAndExit" forEvents:64];

        unsigned int v10 = [(AAUIOBWelcomeController *)self->_welcomeController secondaryButton];
        v11 = v10;
        id v12 = "_goToAccountRecoverySettings";
        goto LABEL_26;
      }
      if (v23) {
        sub_100007168();
      }

      unsigned int v10 = [(AAUIOBWelcomeController *)self->_welcomeController primaryButton];
    }
    v11 = v10;
    id v12 = "_declineCustodianshipInvite";
  }
LABEL_26:
  [v10 addTarget:self action:v12 forEvents:64];
}

- (void)prepareViewServiceForPresentation
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100004AEC;
  block[3] = &unk_10000C348;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (id)remoteObjectInterface
{
  return +[AAFlowPresenterHostInterface XPCInterface];
}

- (void)setUpLookupConnection:(id)a3
{
  id v4 = a3;
  id v5 = _AALogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_100007204();
  }

  id v6 = objc_opt_new();
  [v6 _setEndpoint:v4];
  v7 = (NSXPCConnection *)[objc_alloc((Class)NSXPCConnection) initWithListenerEndpoint:v6];
  BOOL v8 = [(AAUIRemoteViewController *)self remoteObjectInterface];
  [(NSXPCConnection *)v7 setRemoteObjectInterface:v8];

  [(NSXPCConnection *)v7 resume];
  lookupConnection = self->_lookupConnection;
  self->_lookupConnection = v7;

  [(AAUIRemoteViewController *)self setUpHostProxy];
}

- (void)setUpHostProxy
{
  id v3 = _AALogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_10000726C();
  }

  objc_initWeak(&location, self);
  lookupConnection = self->_lookupConnection;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100004DFC;
  v7[3] = &unk_10000C3C0;
  objc_copyWeak(&v8, &location);
  id v5 = [(NSXPCConnection *)lookupConnection remoteObjectProxyWithErrorHandler:v7];
  hostProxy = self->_hostProxy;
  self->_hostProxy = v5;

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)handleCancellation
{
  id v3 = +[NSError aa_errorWithCode:-1];
  [(AAUIRemoteViewController *)self _callCompletionWithError:v3];
}

- (void)_setupRemoteProxy
{
  v2 = [(AAUIRemoteViewController *)self _remoteViewControllerProxy];
  id v3 = _AAUILogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Setting up remote proxy", v4, 2u);
  }

  [v2 setShouldDisableFadeInAnimation:1];
  [v2 setAllowsMenuButtonDismissal:1];
  [v2 setAllowsSiri:0];
  [v2 setAllowsAlertStacking:1];
  [v2 setDesiredHardwareButtonEvents:17];
  [v2 setSwipeDismissalStyle:0];
  [v2 setDismissalAnimationStyle:1];
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(void))a4;
  id v8 = _AAUILogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Configuring remote view service with context %@", (uint8_t *)&v11, 0xCu);
  }

  id v9 = [v6 xpcEndpoint];
  [(AAUIRemoteViewController *)self setUpLookupConnection:v9];

  unsigned int v10 = [v6 userInfo];
  [(AAUIRemoteViewController *)self _buildViewModelWithContextInfo:v10];

  v7[2](v7);
}

- (void)handleButtonActions:(id)a3
{
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        unint64_t v10 = (unint64_t)[v9 events] & 0x10;
        if (v10 & 0xFFFFFFFFFFFFFFFELL | (unint64_t)[v9 events] & 1)
        {
          int v11 = +[NSError aa_errorWithCode:-1];
          [(AAUIRemoteViewController *)self _callCompletionWithError:v11];
        }
        [v9 sendResponseWithUnHandledEvents:[v9 events] ^ v10];
      }
      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
}

- (void)_legacyContactExitWithoutSettings
{
}

- (void)_callCompletionWithError:(id)a3
{
  hostProxy = self->_hostProxy;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000528C;
  v4[3] = &unk_10000C3E8;
  v4[4] = self;
  [(AAFlowPresenterHostProtocol *)hostProxy flowFinishedWithError:a3 completion:v4];
}

- (void)endUIService
{
  id v2 = [(AAUIRemoteViewController *)self _remoteViewControllerProxy];
  [v2 invalidate];
}

- (void)notifyFlowCompletionToExitScene
{
}

- (void)_dismissAndExit
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000054A0;
  block[3] = &unk_10000C348;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_main_dismissAndExit
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100005598;
  v6[3] = &unk_10000C348;
  v6[4] = self;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000055D8;
  v4[3] = &unk_10000C450;
  id v5 = objc_retainBlock(v6);
  id v3 = v5;
  [(AAUIRemoteViewController *)self dismissViewControllerAnimated:1 completion:v4];
}

- (void)_invalidateLookupConnection
{
  [(NSXPCConnection *)self->_lookupConnection invalidate];
  lookupConnection = self->_lookupConnection;
  self->_lookupConnection = 0;
}

- (void)dealloc
{
  id v3 = _AAUILogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_100007308();
  }

  [(AAUIRemoteViewController *)self _invalidateLookupConnection];
  v4.receiver = self;
  v4.super_class = (Class)AAUIRemoteViewController;
  [(AAUIRemoteViewController *)&v4 dealloc];
}

- (void)_checkManateeAvailabilityForFlowType:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = [objc_alloc((Class)AAUID2DEncryptionFlowContext) initWithType:a3];
  id v8 = [objc_alloc((Class)AAUIManateeStateValidator) initWithFlowContext:v7 withPresentingViewController:self->_welcomeController];
  objc_initWeak(&location, self);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000057B8;
  v10[3] = &unk_10000C478;
  id v9 = v6;
  id v11 = v9;
  [v8 verifyAndRepairManateeWithCompletion:v10];

  objc_destroyWeak(&location);
}

- (void)_acceptInheritanceInvite
{
  id v3 = _AAUILogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "LCInvite: Checking manatee availability before accepting", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100005994;
  v4[3] = &unk_10000C4A0;
  objc_copyWeak(&v5, buf);
  [(AAUIRemoteViewController *)self _checkManateeAvailabilityForFlowType:1 completion:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(buf);
}

- (void)_declineInheritanceInvite
{
  id v3 = _AAUILogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "LCInvite: Declining", v4, 2u);
  }

  [(AAUIRemoteViewController *)self _respondToInheritanceInvitationWithResponse:0];
}

- (void)_respondToInheritanceInvitationWithResponse:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = _AAUILogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v6 = @"Declining";
    if (v3) {
      CFStringRef v6 = @"Accepting";
    }
    *(_DWORD *)buf = 138543362;
    CFStringRef v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "LCInvite: %{public}@ the Inheritance invitation...", buf, 0xCu);
  }

  id v7 = objc_alloc_init((Class)AAInheritanceController);
  id v8 = [(AAUIOBWelcomeControllerViewModelProtocol *)self->_viewModel custodianshipInfo];
  id v9 = [v8 custodianID];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100005BEC;
  v10[3] = &unk_10000C4C8;
  void v10[4] = self;
  BOOL v11 = v3;
  [v7 respondToInvitation:v9 accepted:v3 completion:v10];
}

- (void)_acceptCustodianshipInvite
{
  id v3 = [objc_alloc((Class)AAUID2DEncryptionFlowContext) initWithType:0];
  id v4 = [objc_alloc((Class)AAUIManateeStateValidator) initWithFlowContext:v3 withPresentingViewController:self->_welcomeController];
  objc_initWeak(&location, self);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100005DA0;
  v6[3] = &unk_10000C398;
  id v5 = v4;
  id v7 = v5;
  objc_copyWeak(&v8, &location);
  [v5 verifyAndRepairManateeWithCompletion:v6];
  objc_destroyWeak(&v8);

  objc_destroyWeak(&location);
}

- (void)_declineCustodianshipInvite
{
}

- (void)_respondToCustodianInvitationWithResponse:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = _AAUILogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v6 = @"Declining";
    if (v3) {
      CFStringRef v6 = @"Accepting";
    }
    *(_DWORD *)buf = 138412290;
    CFStringRef v15 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ the custodian invitation...", buf, 0xCu);
  }

  id v7 = objc_alloc((Class)AACustodianInvitationResponseContext);
  id v8 = [(AAUIOBWelcomeControllerViewModelProtocol *)self->_viewModel custodianshipInfo];
  id v9 = [v8 custodianID];
  id v10 = [v7 initWithCustodianID:v9 didAccept:v3];

  BOOL v11 = objc_opt_new();
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100006010;
  v12[3] = &unk_10000C4C8;
  v12[4] = self;
  BOOL v13 = v3;
  [v11 respondToCustodianRequestWithResponse:v10 completion:v12];
}

- (void)_showCustodianInvitationAcceptedView
{
  BOOL v3 = _AAUILogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Displaying custodian acceptance UI.", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100006190;
  block[3] = &unk_10000C4F0;
  objc_copyWeak(&v5, buf);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  objc_destroyWeak(&v5);
  objc_destroyWeak(buf);
}

- (void)_showInheritanceInvitationAcceptedView
{
  BOOL v3 = _AAUILogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "LCInvite: Displaying Inheritance accepted UI.", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100006400;
  block[3] = &unk_10000C4F0;
  objc_copyWeak(&v5, buf);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  objc_destroyWeak(&v5);
  objc_destroyWeak(buf);
}

- (void)_dismissCustodianInvitationReminderFollowUp
{
  id v3 = objc_alloc_init((Class)AAFollowUpController);
  uint64_t v4 = AAFollowUpIdentifierCustodianInvitationReminder;
  id v5 = [(AAUIOBWelcomeControllerViewModelProtocol *)self->_viewModel custodianshipInfo];
  CFStringRef v6 = [v5 custodianID];
  id v7 = +[NSString stringWithFormat:@"%@-%@", v4, v6];

  id v8 = _AAUILogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_100007510();
  }

  [v3 dismissFollowUpWithIdentifier:v7 completion:&stru_10000C530];
}

- (void)_dismissBeneficiaryInvitationReminderFollowUp
{
  id v3 = _AAUILogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "LCInvite: Dismissing Inheritance Invitation Reminder CFU.", buf, 2u);
  }

  id v4 = objc_alloc_init((Class)AAFollowUpController);
  id v5 = [(AAUIOBWelcomeControllerViewModelProtocol *)self->_viewModel custodianshipInfo];
  CFStringRef v6 = [v5 custodianID];
  id v7 = +[NSString stringWithFormat:@"%@-%@", @"com.apple.AAFollowUpIdentifier.beneficiaryInvitationReminder", v6];

  id v8 = _AAUILogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_100007510();
  }

  [v4 dismissFollowUpWithIdentifier:v7 completion:&stru_10000C550];
}

- (void)_goToAccountRecoverySettings
{
  id v2 = _AALogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Taking user to account recovery settings", v5, 2u);
  }

  id v3 = +[NSURL URLWithString:@"prefs:root=APPLE_ACCOUNT&aaaction=accountRecovery"];
  id v4 = +[LSApplicationWorkspace defaultWorkspace];
  [v4 openSensitiveURL:v3 withOptions:0];
}

- (void)_goToAccountBeneficiarySettings
{
  id v2 = _AALogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Taking user to account beneficiary settings", v5, 2u);
  }

  id v3 = +[NSURL URLWithString:@"prefs:root=APPLE_ACCOUNT&aaaction=accountBeneficiary"];
  id v4 = +[LSApplicationWorkspace defaultWorkspace];
  [v4 openSensitiveURL:v3 withOptions:0];
}

- (void)welcomeViewController:(id)a3 didCompleteWithSuccess:(BOOL)a4 error:(id)a5
{
}

- (NSDictionary)remoteContextInfo
{
  return self->_remoteContextInfo;
}

- (void)setRemoteContextInfo:(id)a3
{
}

- (OS_xpc_object)xpcEndpoint
{
  return self->_xpcEndpoint;
}

- (void)setXpcEndpoint:(id)a3
{
}

- (AAUIOBWelcomeControllerViewModelProtocol)viewModel
{
  return self->_viewModel;
}

- (void)setViewModel:(id)a3
{
}

- (AAUIOBWelcomeController)welcomeController
{
  return self->_welcomeController;
}

- (void)setWelcomeController:(id)a3
{
}

- (AAFlowPresenterHostProtocol)hostProxy
{
  return self->_hostProxy;
}

- (void)setHostProxy:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostProxy, 0);
  objc_storeStrong((id *)&self->_welcomeController, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_xpcEndpoint, 0);
  objc_storeStrong((id *)&self->_remoteContextInfo, 0);

  objc_storeStrong((id *)&self->_lookupConnection, 0);
}

@end
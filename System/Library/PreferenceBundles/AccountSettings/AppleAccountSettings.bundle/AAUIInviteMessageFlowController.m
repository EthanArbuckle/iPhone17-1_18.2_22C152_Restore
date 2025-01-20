@interface AAUIInviteMessageFlowController
- (AAUIInviteMessageFlowController)initWithContext:(id)a3 flow:(unint64_t)a4 navigationController:(id)a5 defaultMessageViewModel:(id)a6 messageSentViewModel:(id)a7;
- (AAUIInviteMessageFlowController)initWithContext:(id)a3 flow:(unint64_t)a4 navigationController:(id)a5 defaultMessageViewModel:(id)a6 messageSentViewModel:(id)a7 isADPUpsellFlow:(BOOL)a8 isFamilyMember:(BOOL)a9 cdpContext:(id)a10;
- (AAUIInviteMessageFlowControllerDelegate)delegate;
- (AIDAAccountManager)accountManager;
- (BOOL)hideCancel;
- (NSString)telemetryFlowID;
- (UINavigationController)navigationController;
- (id)_bubbleImageForFlow:(unint64_t)a3;
- (void)_cancelMessageInvitationFlow;
- (void)_finishMessageInvitationFlow;
- (void)_hideActivitySpinnerInNavigationBar;
- (void)_invitationWasSent;
- (void)_messageSentSecondaryActionTapped;
- (void)_postAdpUpsellCFUCustodianInviteSentEvent;
- (void)_postAdpUpsellCFUFamilyCustodianAddedEvent;
- (void)_sendDefaultMessage;
- (void)_sendEscapeOfferSelectedEvent:(id)a3;
- (void)_sendRecoveryContactSendMessageLandingEvent:(id)a3;
- (void)_sendTelemetryEventWithSuccess:(id)a3 didSucceed:(BOOL)a4 error:(id)a5;
- (void)_showActivitySpinnerInNavigationBar;
- (void)_showDefaultMessageView;
- (void)_showInvitationSent;
- (void)_showMessagesComposeController;
- (void)inviteController:(id)a3 didFinishWithStatus:(unint64_t)a4 recipients:(id)a5 userInfo:(id)a6 error:(id)a7;
- (void)setAccountManager:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHideCancel:(BOOL)a3;
- (void)setNavigationController:(id)a3;
- (void)setTelemetryFlowID:(id)a3;
- (void)start;
@end

@implementation AAUIInviteMessageFlowController

- (AAUIInviteMessageFlowController)initWithContext:(id)a3 flow:(unint64_t)a4 navigationController:(id)a5 defaultMessageViewModel:(id)a6 messageSentViewModel:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a3;
  v16 = _AAUILogSystem();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
    sub_48930(v16);
  }

  LOBYTE(v19) = 0;
  v17 = [(AAUIInviteMessageFlowController *)self initWithContext:v15 flow:a4 navigationController:v14 defaultMessageViewModel:v13 messageSentViewModel:v12 isADPUpsellFlow:0 isFamilyMember:v19 cdpContext:0];

  return v17;
}

- (AAUIInviteMessageFlowController)initWithContext:(id)a3 flow:(unint64_t)a4 navigationController:(id)a5 defaultMessageViewModel:(id)a6 messageSentViewModel:(id)a7 isADPUpsellFlow:(BOOL)a8 isFamilyMember:(BOOL)a9 cdpContext:(id)a10
{
  id v16 = a3;
  id v17 = a5;
  id v27 = a6;
  id v26 = a7;
  id v18 = a10;
  v28.receiver = self;
  v28.super_class = (Class)AAUIInviteMessageFlowController;
  uint64_t v19 = [(AAUIInviteMessageFlowController *)&v28 init];
  v20 = v19;
  if (v19)
  {
    v19->_flow = a4;
    objc_storeStrong((id *)&v19->_context, a3);
    v21 = [v16 recipients];
    uint64_t v22 = [v21 firstObject];
    recipientHandle = v20->_recipientHandle;
    v20->_recipientHandle = (NSString *)v22;

    objc_storeStrong((id *)&v20->_navigationController, a5);
    objc_storeStrong((id *)&v20->_defaultMessageViewModel, a6);
    objc_storeStrong((id *)&v20->_messageSentViewModel, a7);
    v20->_isADPUpsellFlow = a8;
    v20->_isFamilyMember = a9;
    objc_storeStrong((id *)&v20->_cdpContext, a10);
  }

  return v20;
}

- (void)start
{
  v3 = _AAUILogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Initiating Trusted Contact invitation message flow...", v4, 2u);
  }

  [(AAUIInviteMessageFlowController *)self _showDefaultMessageView];
}

- (void)_showActivitySpinnerInNavigationBar
{
  spinnerManager = self->_spinnerManager;
  if (!spinnerManager)
  {
    v4 = [(AAUIInviteMessageFlowController *)self navigationController];
    v5 = [v4 topViewController];
    v6 = [v5 navigationItem];

    v7 = (AAUISpinnerManager *)[objc_alloc((Class)AAUISpinnerManager) initWithNavigationItem:v6 hideBackButton:1];
    v8 = self->_spinnerManager;
    self->_spinnerManager = v7;

    spinnerManager = self->_spinnerManager;
  }

  [(AAUISpinnerManager *)spinnerManager startNavigationSpinner];
}

- (void)_hideActivitySpinnerInNavigationBar
{
  spinnerManager = self->_spinnerManager;
  if (spinnerManager)
  {
    [(AAUISpinnerManager *)spinnerManager stopNavigationSpinner];
    v4 = self->_spinnerManager;
    self->_spinnerManager = 0;
  }
}

- (void)_showDefaultMessageView
{
  id v11 = objc_alloc_init((Class)NSMutableArray);
  id v3 = [objc_alloc((Class)AAUIOBWelcomeController) initWithViewModel:self->_defaultMessageViewModel];
  v4 = [v3 primaryButton];
  [v4 addTarget:self action:"_sendDefaultMessage" forEvents:64];

  v5 = [v3 secondaryButton];
  [v5 addTarget:self action:"_showMessagesComposeController" forEvents:64];

  if (!self->_hideCancel)
  {
    id v6 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:1 target:self action:"_cancelMessageInvitationFlow"];
    v7 = [v3 navigationItem];
    [v7 setLeftBarButtonItem:v6];

    [v11 addObject:kAccountAccessCancel];
  }
  [v11 addObject:kAccountAccessEditInvite];
  [v11 addObject:kAccountAccessSend];
  [(AAUIInviteMessageFlowController *)self _sendRecoveryContactSendMessageLandingEvent:v11];
  navigationController = self->_navigationController;
  if (navigationController)
  {
    [(UINavigationController *)navigationController pushViewController:v3 animated:1];
  }
  else
  {
    v9 = (UINavigationController *)[objc_alloc((Class)UINavigationController) initWithRootViewController:v3];
    v10 = self->_navigationController;
    self->_navigationController = v9;
  }
}

- (void)_showMessagesComposeController
{
  id v3 = _AAUILogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Show message composer...", v6, 2u);
  }

  [(AAUIInviteMessageFlowController *)self _sendEscapeOfferSelectedEvent:kAccountAccessEditInvite];
  v4 = (AAUIMessagesInviteConfigurationController *)[objc_alloc((Class)AAUIMessagesInviteConfigurationController) initWithInviteContext:self->_context flow:self->_flow presentingController:self->_navigationController];
  messageComposer = self->_messageComposer;
  self->_messageComposer = v4;

  [(AAUIMessagesInviteConfigurationController *)self->_messageComposer setDelegate:self];
  [(AAUIMessagesInviteConfigurationController *)self->_messageComposer presentWhenReadyWithCompletion:0];
}

- (void)_showInvitationSent
{
  id v3 = _AAUILogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Initiating Trusted Contact invitation message flow...", (uint8_t *)buf, 2u);
  }

  v4 = _AAUILogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Show invitation message sent UI...", (uint8_t *)buf, 2u);
  }

  v5 = (AAUIOBWelcomeController *)[objc_alloc((Class)AAUIOBWelcomeController) initWithViewModel:self->_messageSentViewModel];
  allSetVC = self->_allSetVC;
  self->_allSetVC = v5;

  v7 = [(AAUIOBWelcomeController *)self->_allSetVC navigationItem];
  [v7 setHidesBackButton:1];

  v8 = [(AAUIOBWelcomeController *)self->_allSetVC primaryButton];
  [v8 addTarget:self action:"_finishMessageInvitationFlow" forEvents:64];

  v9 = [(AAUIOBWelcomeController *)self->_allSetVC secondaryButton];
  [v9 addTarget:self action:"_messageSentSecondaryActionTapped" forEvents:64];

  objc_initWeak(buf, self);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_EA94;
  v10[3] = &unk_75610;
  objc_copyWeak(&v11, buf);
  v10[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v10);
  objc_destroyWeak(&v11);
  objc_destroyWeak(buf);
}

- (void)_postAdpUpsellCFUFamilyCustodianAddedEvent
{
  id v3 = [(CDPContext *)self->_cdpContext altDSID];
  v4 = [(CDPContext *)self->_cdpContext telemetryFlowID];
  id v6 = +[AAFAnalyticsEvent analyticsEventWithName:@"com.apple.appleaccount.familyCustodianAdded" altDSID:v3 flowID:v4];

  v5 = +[AAAnalyticsRTCReporter reporter];
  [v5 sendEvent:v6];
}

- (void)_postAdpUpsellCFUCustodianInviteSentEvent
{
  id v3 = [(CDPContext *)self->_cdpContext altDSID];
  v4 = [(CDPContext *)self->_cdpContext telemetryFlowID];
  id v6 = +[AAFAnalyticsEvent analyticsEventWithName:@"com.apple.appleaccount.custodianInviteSent" altDSID:v3 flowID:v4];

  v5 = +[AAAnalyticsRTCReporter reporter];
  [v5 sendEvent:v6];
}

- (void)_invitationWasSent
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accountManager);
  v4 = [WeakRetained accounts];
  v5 = [v4 objectForKeyedSubscript:AIDAServiceTypeCloud];

  if (v5)
  {
    uint64_t v6 = kAAAnalyticsEventRecoveryContactInviteSent;
    v7 = objc_msgSend(v5, "aida_alternateDSID");
    v8 = [(AAUIInviteMessageFlowController *)self telemetryFlowID];
    v9 = +[AAFAnalyticsEvent analyticsEventWithName:v6 altDSID:v7 flowID:v8];
  }
  else
  {
    v9 = 0;
  }
  v10 = [(AAUIInviteMessageFlowController *)self delegate];
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    objc_initWeak(&location, self);
    id v12 = [(AAUIInviteMessageFlowController *)self delegate];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_EE70;
    v13[3] = &unk_75748;
    v13[4] = self;
    id v14 = v9;
    objc_copyWeak(&v15, &location);
    [v12 inviteMessageWasSent:self completion:v13];

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  else
  {
    [(AAUIInviteMessageFlowController *)self _showInvitationSent];
    [(AAUIInviteMessageFlowController *)self _sendTelemetryEventWithSuccess:v9 didSucceed:1 error:0];
  }
}

- (void)_sendTelemetryEventWithSuccess:(id)a3 didSucceed:(BOOL)a4 error:(id)a5
{
  if (a3)
  {
    BOOL v5 = a4;
    id v7 = a5;
    id v8 = a3;
    v9 = +[NSNumber numberWithBool:v5];
    [v8 setObject:v9 forKeyedSubscript:kAAFDidSucceed];

    [v8 populateUnderlyingErrorsStartingWithRootError:v7];
    id v10 = +[AAAnalyticsRTCReporter reporter];
    [v10 sendEvent:v8];
  }
}

- (void)_cancelMessageInvitationFlow
{
  id v3 = _AAUILogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Cancelling invitation flow...", (uint8_t *)buf, 2u);
  }

  v4 = [(AAUIInviteMessageFlowController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    uint64_t v6 = [(AAUIInviteMessageFlowController *)self delegate];
    [v6 inviteMessageFlowWasCancelled:self];
  }
  else
  {
    objc_initWeak(buf, self);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_F0FC;
    block[3] = &unk_75770;
    objc_copyWeak(&v8, buf);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    objc_destroyWeak(&v8);
    objc_destroyWeak(buf);
  }
}

- (void)_finishMessageInvitationFlow
{
  id v3 = _AAUILogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Finishing invitation flow...", (uint8_t *)buf, 2u);
  }

  v4 = [(AAUIOBWelcomeController *)self->_allSetVC primaryButton];
  [v4 setEnabled:0];

  char v5 = [(AAUIInviteMessageFlowController *)self delegate];

  if (v5)
  {
    uint64_t v6 = [(AAUIInviteMessageFlowController *)self delegate];
    [v6 inviteMessageFlowDidFinish:self];
  }
  else
  {
    objc_initWeak(buf, self);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_F288;
    block[3] = &unk_75770;
    objc_copyWeak(&v8, buf);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    objc_destroyWeak(&v8);
    objc_destroyWeak(buf);
  }
}

- (void)_messageSentSecondaryActionTapped
{
  id v3 = _AAUILogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Invite Message Completed - Secondary Button tapped", v7, 2u);
  }

  v4 = [(AAUIInviteMessageFlowController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    uint64_t v6 = [(AAUIInviteMessageFlowController *)self delegate];
    [v6 inviteMessageCompleteSecondaryButtonTapped:self];
  }
}

- (void)_sendDefaultMessage
{
  id v3 = _AAUILogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Sending default message...", (uint8_t *)buf, 2u);
  }

  id v4 = [objc_alloc((Class)AAUIInviteLinkMetadataProvider) initWithContext:self->_context];
  char v5 = [(AAUIInviteMessageFlowController *)self _bubbleImageForFlow:self->_flow];
  objc_initWeak(buf, self);
  [(AAUIInviteMessageFlowController *)self _sendEscapeOfferSelectedEvent:kAccountAccessSend];
  [(AAUIInviteMessageFlowController *)self _showActivitySpinnerInNavigationBar];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_F4F4;
  v6[3] = &unk_75798;
  objc_copyWeak(&v7, buf);
  [v4 loadMetadataWithImage:v5 completion:v6];
  objc_destroyWeak(&v7);
  objc_destroyWeak(buf);
}

- (id)_bubbleImageForFlow:(unint64_t)a3
{
  if (a3 == 1)
  {
    id v3 = +[NSBundle bundleForClass:objc_opt_class()];
    CFStringRef v4 = @"beneficiary_message_bubble";
    goto LABEL_5;
  }
  if (!a3)
  {
    id v3 = +[NSBundle bundleForClass:objc_opt_class()];
    CFStringRef v4 = @"custodian_message_bubble";
LABEL_5:
    char v5 = +[UIImage imageNamed:v4 inBundle:v3];

    goto LABEL_7;
  }
  char v5 = 0;
LABEL_7:

  return v5;
}

- (void)_sendRecoveryContactSendMessageLandingEvent:(id)a3
{
  id v13 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accountManager);
  char v5 = [WeakRetained accounts];
  uint64_t v6 = [v5 objectForKeyedSubscript:AIDAServiceTypeCloud];

  if (v6)
  {
    uint64_t v7 = kAAAnalyticsEventRecoveryContactSendMessageLanding;
    id v8 = objc_msgSend(v6, "aida_alternateDSID");
    v9 = [(AAUIInviteMessageFlowController *)self telemetryFlowID];
    id v10 = +[AAFAnalyticsEvent analyticsEventWithName:v7 altDSID:v8 flowID:v9];

    char v11 = objc_msgSend(v13, "aaf_arrayAsCommaSeperatedString");
    [v10 setObject:v11 forKeyedSubscript:kCDPAnalyticsEscapeOffer];

    id v12 = +[AAAnalyticsRTCReporter reporter];
    [v12 sendEvent:v10];
  }
}

- (void)_sendEscapeOfferSelectedEvent:(id)a3
{
  id v12 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accountManager);
  char v5 = [WeakRetained accounts];
  uint64_t v6 = [v5 objectForKeyedSubscript:AIDAServiceTypeCloud];

  if (v6)
  {
    uint64_t v7 = kAAAnalyticsEventSignOutEscapeOfferSelected;
    id v8 = objc_msgSend(v6, "aida_alternateDSID");
    v9 = [(AAUIInviteMessageFlowController *)self telemetryFlowID];
    id v10 = +[AAFAnalyticsEvent analyticsEventWithName:v7 altDSID:v8 flowID:v9];

    [v10 setObject:v12 forKeyedSubscript:kCDPAnalyticsEscapeOfferSelected];
    char v11 = +[AAAnalyticsRTCReporter reporter];
    [v11 sendEvent:v10];
  }
}

- (void)inviteController:(id)a3 didFinishWithStatus:(unint64_t)a4 recipients:(id)a5 userInfo:(id)a6 error:(id)a7
{
  p_accountManager = &self->_accountManager;
  id v10 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_accountManager);
  id v12 = [WeakRetained accounts];
  id v13 = [v12 objectForKeyedSubscript:AIDAServiceTypeCloud];

  if (v13)
  {
    uint64_t v14 = kAAAnalyticsEventRecoveryContactInviteSent;
    id v15 = objc_msgSend(v13, "aida_alternateDSID");
    id v16 = [(AAUIInviteMessageFlowController *)self telemetryFlowID];
    id v17 = +[AAFAnalyticsEvent analyticsEventWithName:v14 altDSID:v15 flowID:v16];

    if (a4) {
      goto LABEL_3;
    }
LABEL_6:
    id v18 = _AAUILogSystem();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v22 = 0;
      _os_log_impl(&dword_0, v18, OS_LOG_TYPE_DEFAULT, "User cancelled", v22, 2u);
    }

    uint64_t v19 = -1;
    goto LABEL_12;
  }
  id v17 = 0;
  if (!a4) {
    goto LABEL_6;
  }
LABEL_3:
  if (a4 != 1)
  {
    v20 = _AAUILogSystem();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_48AB4(v20);
    }

    uint64_t v19 = 0;
LABEL_12:
    v21 = +[NSError aa_errorWithCode:v19];
    [(AAUIInviteMessageFlowController *)self _sendTelemetryEventWithSuccess:v17 didSucceed:0 error:v21];

    goto LABEL_13;
  }
  [(AAUIInviteMessageFlowController *)self _invitationWasSent];
LABEL_13:
  [v10 dismissViewControllerAnimated:1 completion:0];
}

- (UINavigationController)navigationController
{
  return self->_navigationController;
}

- (void)setNavigationController:(id)a3
{
}

- (AAUIInviteMessageFlowControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AAUIInviteMessageFlowControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)hideCancel
{
  return self->_hideCancel;
}

- (void)setHideCancel:(BOOL)a3
{
  self->_hideCancel = a3;
}

- (NSString)telemetryFlowID
{
  return self->_telemetryFlowID;
}

- (void)setTelemetryFlowID:(id)a3
{
}

- (AIDAAccountManager)accountManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accountManager);

  return (AIDAAccountManager *)WeakRetained;
}

- (void)setAccountManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_accountManager);
  objc_storeStrong((id *)&self->_telemetryFlowID, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_navigationController, 0);
  objc_storeStrong((id *)&self->_cdpContext, 0);
  objc_storeStrong((id *)&self->_allSetVC, 0);
  objc_storeStrong((id *)&self->_spinnerManager, 0);
  objc_storeStrong((id *)&self->_messageComposer, 0);
  objc_storeStrong((id *)&self->_messageSentViewModel, 0);
  objc_storeStrong((id *)&self->_defaultMessageViewModel, 0);
  objc_storeStrong((id *)&self->_recipientHandle, 0);

  objc_storeStrong((id *)&self->_context, 0);
}

@end
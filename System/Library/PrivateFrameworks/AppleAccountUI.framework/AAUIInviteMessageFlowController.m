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
    -[AAUIInviteMessageFlowController initWithContext:flow:navigationController:defaultMessageViewModel:messageSentViewModel:](v16);
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
    _os_log_impl(&dword_209754000, v3, OS_LOG_TYPE_DEFAULT, "Initiating Trusted Contact invitation message flow...", v4, 2u);
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

    v7 = [[AAUISpinnerManager alloc] initWithNavigationItem:v6 hideBackButton:1];
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
  id v11 = objc_alloc_init(MEMORY[0x263EFF980]);
  v3 = [[AAUIOBWelcomeController alloc] initWithViewModel:self->_defaultMessageViewModel];
  v4 = [(AAUIOBWelcomeController *)v3 primaryButton];
  [v4 addTarget:self action:sel__sendDefaultMessage forEvents:64];

  v5 = [(AAUIOBWelcomeController *)v3 secondaryButton];
  [v5 addTarget:self action:sel__showMessagesComposeController forEvents:64];

  if (!self->_hideCancel)
  {
    v6 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:1 target:self action:sel__cancelMessageInvitationFlow];
    v7 = [(OBBaseWelcomeController *)v3 navigationItem];
    [v7 setLeftBarButtonItem:v6];

    [v11 addObject:*MEMORY[0x263F25BF8]];
  }
  [v11 addObject:@"com.apple.accountaccess.editInvite"];
  [v11 addObject:@"com.apple.accountaccess.send"];
  [(AAUIInviteMessageFlowController *)self _sendRecoveryContactSendMessageLandingEvent:v11];
  navigationController = self->_navigationController;
  if (navigationController)
  {
    [(UINavigationController *)navigationController pushViewController:v3 animated:1];
  }
  else
  {
    v9 = (UINavigationController *)[objc_alloc(MEMORY[0x263F829B8]) initWithRootViewController:v3];
    v10 = self->_navigationController;
    self->_navigationController = v9;
  }
}

- (void)_showMessagesComposeController
{
  v3 = _AAUILogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_209754000, v3, OS_LOG_TYPE_DEFAULT, "Show message composer...", v6, 2u);
  }

  [(AAUIInviteMessageFlowController *)self _sendEscapeOfferSelectedEvent:@"com.apple.accountaccess.editInvite"];
  v4 = [[AAUIMessagesInviteConfigurationController alloc] initWithInviteContext:self->_context flow:self->_flow presentingController:self->_navigationController];
  messageComposer = self->_messageComposer;
  self->_messageComposer = v4;

  [(AAUIMessagesInviteConfigurationController *)self->_messageComposer setDelegate:self];
  [(AAUIMessagesInviteConfigurationController *)self->_messageComposer presentWhenReadyWithCompletion:0];
}

- (void)_showInvitationSent
{
  v3 = _AAUILogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_209754000, v3, OS_LOG_TYPE_DEFAULT, "Initiating Trusted Contact invitation message flow...", (uint8_t *)buf, 2u);
  }

  v4 = _AAUILogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_209754000, v4, OS_LOG_TYPE_DEFAULT, "Show invitation message sent UI...", (uint8_t *)buf, 2u);
  }

  v5 = [[AAUIOBWelcomeController alloc] initWithViewModel:self->_messageSentViewModel];
  allSetVC = self->_allSetVC;
  self->_allSetVC = v5;

  v7 = [(OBBaseWelcomeController *)self->_allSetVC navigationItem];
  [v7 setHidesBackButton:1];

  v8 = [(AAUIOBWelcomeController *)self->_allSetVC primaryButton];
  [v8 addTarget:self action:sel__finishMessageInvitationFlow forEvents:64];

  v9 = [(AAUIOBWelcomeController *)self->_allSetVC secondaryButton];
  [v9 addTarget:self action:sel__messageSentSecondaryActionTapped forEvents:64];

  objc_initWeak(buf, self);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __54__AAUIInviteMessageFlowController__showInvitationSent__block_invoke;
  v10[3] = &unk_263F92668;
  objc_copyWeak(&v11, buf);
  v10[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], v10);
  objc_destroyWeak(&v11);
  objc_destroyWeak(buf);
}

void __54__AAUIInviteMessageFlowController__showInvitationSent__block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained[11] showViewController:*(void *)(*(void *)(a1 + 32) + 64) sender:0];
  v2 = WeakRetained;
  if (*((unsigned char *)WeakRetained + 80))
  {
    if (*((unsigned char *)WeakRetained + 81)) {
      [WeakRetained _postAdpUpsellCFUFamilyCustodianAddedEvent];
    }
    else {
      [WeakRetained _postAdpUpsellCFUCustodianInviteSentEvent];
    }
    v2 = WeakRetained;
  }
}

- (void)_postAdpUpsellCFUFamilyCustodianAddedEvent
{
  v3 = (void *)MEMORY[0x263F202A8];
  v4 = [(CDPContext *)self->_cdpContext altDSID];
  v5 = [(CDPContext *)self->_cdpContext telemetryFlowID];
  id v7 = [v3 analyticsEventWithName:@"com.apple.appleaccount.familyCustodianAdded" altDSID:v4 flowID:v5];

  v6 = [MEMORY[0x263F25780] reporter];
  [v6 sendEvent:v7];
}

- (void)_postAdpUpsellCFUCustodianInviteSentEvent
{
  v3 = (void *)MEMORY[0x263F202A8];
  v4 = [(CDPContext *)self->_cdpContext altDSID];
  v5 = [(CDPContext *)self->_cdpContext telemetryFlowID];
  id v7 = [v3 analyticsEventWithName:@"com.apple.appleaccount.custodianInviteSent" altDSID:v4 flowID:v5];

  v6 = [MEMORY[0x263F25780] reporter];
  [v6 sendEvent:v7];
}

- (void)_invitationWasSent
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accountManager);
  v4 = [WeakRetained accounts];
  v5 = [v4 objectForKeyedSubscript:*MEMORY[0x263F26D28]];

  if (v5)
  {
    v6 = (void *)MEMORY[0x263F202A8];
    uint64_t v7 = *MEMORY[0x263F25A70];
    v8 = objc_msgSend(v5, "aida_alternateDSID");
    v9 = [(AAUIInviteMessageFlowController *)self telemetryFlowID];
    v10 = [v6 analyticsEventWithName:v7 altDSID:v8 flowID:v9];
  }
  else
  {
    v10 = 0;
  }
  id v11 = [(AAUIInviteMessageFlowController *)self delegate];
  char v12 = objc_opt_respondsToSelector();

  if (v12)
  {
    objc_initWeak(&location, self);
    id v13 = [(AAUIInviteMessageFlowController *)self delegate];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __53__AAUIInviteMessageFlowController__invitationWasSent__block_invoke;
    v14[3] = &unk_263F940C8;
    v14[4] = self;
    id v15 = v10;
    objc_copyWeak(&v16, &location);
    [v13 inviteMessageWasSent:self completion:v14];

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  else
  {
    [(AAUIInviteMessageFlowController *)self _showInvitationSent];
    [(AAUIInviteMessageFlowController *)self _sendTelemetryEventWithSuccess:v10 didSucceed:1 error:0];
  }
}

void __53__AAUIInviteMessageFlowController__invitationWasSent__block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = (id *)(a1 + 48);
  if (a2)
  {
    [v5 _sendTelemetryEventWithSuccess:v6 didSucceed:1 error:0];
    id WeakRetained = objc_loadWeakRetained(v7);
    [WeakRetained _showInvitationSent];
  }
  else
  {
    [v5 _sendTelemetryEventWithSuccess:v6 didSucceed:0 error:a3];
    id WeakRetained = objc_loadWeakRetained(v7);
    [WeakRetained _cancelMessageInvitationFlow];
  }
}

- (void)_sendTelemetryEventWithSuccess:(id)a3 didSucceed:(BOOL)a4 error:(id)a5
{
  if (a3)
  {
    BOOL v5 = a4;
    uint64_t v7 = NSNumber;
    id v8 = a5;
    id v9 = a3;
    v10 = [v7 numberWithBool:v5];
    [v9 setObject:v10 forKeyedSubscript:*MEMORY[0x263F20330]];

    [v9 populateUnderlyingErrorsStartingWithRootError:v8];
    id v11 = [MEMORY[0x263F25780] reporter];
    [v11 sendEvent:v9];
  }
}

- (void)_cancelMessageInvitationFlow
{
  v3 = _AAUILogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_209754000, v3, OS_LOG_TYPE_DEFAULT, "Cancelling invitation flow...", (uint8_t *)buf, 2u);
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
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __63__AAUIInviteMessageFlowController__cancelMessageInvitationFlow__block_invoke;
    block[3] = &unk_263F92AB8;
    objc_copyWeak(&v8, buf);
    dispatch_async(MEMORY[0x263EF83A0], block);
    objc_destroyWeak(&v8);
    objc_destroyWeak(buf);
  }
}

void __63__AAUIInviteMessageFlowController__cancelMessageInvitationFlow__block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained[11] dismissViewControllerAnimated:1 completion:0];
}

- (void)_finishMessageInvitationFlow
{
  v3 = _AAUILogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_209754000, v3, OS_LOG_TYPE_DEFAULT, "Finishing invitation flow...", (uint8_t *)buf, 2u);
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
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __63__AAUIInviteMessageFlowController__finishMessageInvitationFlow__block_invoke;
    block[3] = &unk_263F92AB8;
    objc_copyWeak(&v8, buf);
    dispatch_async(MEMORY[0x263EF83A0], block);
    objc_destroyWeak(&v8);
    objc_destroyWeak(buf);
  }
}

void __63__AAUIInviteMessageFlowController__finishMessageInvitationFlow__block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained[11] dismissViewControllerAnimated:1 completion:0];
}

- (void)_messageSentSecondaryActionTapped
{
  v3 = _AAUILogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_209754000, v3, OS_LOG_TYPE_DEFAULT, "Invite Message Completed - Secondary Button tapped", v7, 2u);
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
  v3 = _AAUILogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_209754000, v3, OS_LOG_TYPE_DEFAULT, "Sending default message...", (uint8_t *)buf, 2u);
  }

  v4 = [[AAUIInviteLinkMetadataProvider alloc] initWithContext:self->_context];
  char v5 = [(AAUIInviteMessageFlowController *)self _bubbleImageForFlow:self->_flow];
  objc_initWeak(buf, self);
  [(AAUIInviteMessageFlowController *)self _sendEscapeOfferSelectedEvent:@"com.apple.accountaccess.send"];
  [(AAUIInviteMessageFlowController *)self _showActivitySpinnerInNavigationBar];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __54__AAUIInviteMessageFlowController__sendDefaultMessage__block_invoke;
  v6[3] = &unk_263F940F0;
  objc_copyWeak(&v7, buf);
  [(AAUIInviteLinkMetadataProvider *)v4 loadMetadataWithImage:v5 completion:v6];
  objc_destroyWeak(&v7);
  objc_destroyWeak(buf);
}

void __54__AAUIInviteMessageFlowController__sendDefaultMessage__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _hideActivitySpinnerInNavigationBar];
    id v9 = _AAUILogSystem();
    v10 = v9;
    if (v5)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v21 = v5;
        _os_log_impl(&dword_209754000, v10, OS_LOG_TYPE_DEFAULT, "Sending message with linkmetadata: %@", buf, 0xCu);
      }

      v10 = objc_alloc_init(MEMORY[0x263F103E8]);
      id v11 = [v5 bubbleMetadata];
      [v10 setMetadata:v11];

      id v19 = 0;
      char v12 = [v10 dataRepresentationWithOutOfLineAttachments:&v19];
      id v13 = v19;
      id v14 = [v8[2] inviteURL];
      int v15 = IMSPISendRichLink();

      id v16 = [v8[2] messageBody];
      int v17 = IMSPISendMessageWithAttachments();

      if (v15 && v17)
      {
        [v8 _invitationWasSent];
      }
      else
      {
        id v18 = _AAUILogSystem();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          __54__AAUIInviteMessageFlowController__sendDefaultMessage__block_invoke_cold_3(v18);
        }
      }
    }
    else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      __54__AAUIInviteMessageFlowController__sendDefaultMessage__block_invoke_cold_2((uint64_t)v6, v10);
    }
  }
  else
  {
    v10 = _AAUILogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      __54__AAUIInviteMessageFlowController__sendDefaultMessage__block_invoke_cold_1(v10);
    }
  }
}

- (id)_bubbleImageForFlow:(unint64_t)a3
{
  if (a3 == 1)
  {
    v3 = (void *)MEMORY[0x263F827E8];
    v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v5 = @"beneficiary_message_bubble";
    goto LABEL_5;
  }
  if (!a3)
  {
    v3 = (void *)MEMORY[0x263F827E8];
    v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v5 = @"custodian_message_bubble";
LABEL_5:
    id v6 = [v3 imageNamed:v5 inBundle:v4];

    goto LABEL_7;
  }
  id v6 = 0;
LABEL_7:
  return v6;
}

- (void)_sendRecoveryContactSendMessageLandingEvent:(id)a3
{
  id v14 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accountManager);
  id v5 = [WeakRetained accounts];
  id v6 = [v5 objectForKeyedSubscript:*MEMORY[0x263F26D28]];

  if (v6)
  {
    id v7 = (void *)MEMORY[0x263F202A8];
    uint64_t v8 = *MEMORY[0x263F25A78];
    id v9 = objc_msgSend(v6, "aida_alternateDSID");
    v10 = [(AAUIInviteMessageFlowController *)self telemetryFlowID];
    id v11 = [v7 analyticsEventWithName:v8 altDSID:v9 flowID:v10];

    char v12 = objc_msgSend(v14, "aaf_arrayAsCommaSeperatedString");
    [v11 setObject:v12 forKeyedSubscript:*MEMORY[0x263F345E8]];

    id v13 = [MEMORY[0x263F25780] reporter];
    [v13 sendEvent:v11];
  }
}

- (void)_sendEscapeOfferSelectedEvent:(id)a3
{
  id v13 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accountManager);
  id v5 = [WeakRetained accounts];
  id v6 = [v5 objectForKeyedSubscript:*MEMORY[0x263F26D28]];

  if (v6)
  {
    id v7 = (void *)MEMORY[0x263F202A8];
    uint64_t v8 = *MEMORY[0x263F25A98];
    id v9 = objc_msgSend(v6, "aida_alternateDSID");
    v10 = [(AAUIInviteMessageFlowController *)self telemetryFlowID];
    id v11 = [v7 analyticsEventWithName:v8 altDSID:v9 flowID:v10];

    [v11 setObject:v13 forKeyedSubscript:*MEMORY[0x263F345F8]];
    char v12 = [MEMORY[0x263F25780] reporter];
    [v12 sendEvent:v11];
  }
}

- (void)inviteController:(id)a3 didFinishWithStatus:(unint64_t)a4 recipients:(id)a5 userInfo:(id)a6 error:(id)a7
{
  p_accountManager = &self->_accountManager;
  id v10 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_accountManager);
  char v12 = [WeakRetained accounts];
  id v13 = [v12 objectForKeyedSubscript:*MEMORY[0x263F26D28]];

  if (v13)
  {
    id v14 = (void *)MEMORY[0x263F202A8];
    uint64_t v15 = *MEMORY[0x263F25A70];
    id v16 = objc_msgSend(v13, "aida_alternateDSID");
    int v17 = [(AAUIInviteMessageFlowController *)self telemetryFlowID];
    id v18 = [v14 analyticsEventWithName:v15 altDSID:v16 flowID:v17];

    if (a4) {
      goto LABEL_3;
    }
LABEL_6:
    id v19 = _AAUILogSystem();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v24 = 0;
      _os_log_impl(&dword_209754000, v19, OS_LOG_TYPE_DEFAULT, "User cancelled", v24, 2u);
    }

    v20 = (void *)MEMORY[0x263F087E8];
    uint64_t v21 = -1;
    goto LABEL_12;
  }
  id v18 = 0;
  if (!a4) {
    goto LABEL_6;
  }
LABEL_3:
  if (a4 != 1)
  {
    uint64_t v22 = _AAUILogSystem();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      -[AAUIInviteMessageFlowController inviteController:didFinishWithStatus:recipients:userInfo:error:](v22);
    }

    v20 = (void *)MEMORY[0x263F087E8];
    uint64_t v21 = 0;
LABEL_12:
    v23 = objc_msgSend(v20, "aa_errorWithCode:", v21);
    [(AAUIInviteMessageFlowController *)self _sendTelemetryEventWithSuccess:v18 didSucceed:0 error:v23];

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

- (void)initWithContext:(os_log_t)log flow:navigationController:defaultMessageViewModel:messageSentViewModel:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_209754000, log, OS_LOG_TYPE_DEBUG, "Instantiating AAUIInviteMessageFlowController with nil cdpContext", v1, 2u);
}

void __54__AAUIInviteMessageFlowController__sendDefaultMessage__block_invoke_cold_1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  v2 = "-[AAUIInviteMessageFlowController _sendDefaultMessage]_block_invoke";
  _os_log_debug_impl(&dword_209754000, log, OS_LOG_TYPE_DEBUG, "%s failed to acquire strong ref.", (uint8_t *)&v1, 0xCu);
}

void __54__AAUIInviteMessageFlowController__sendDefaultMessage__block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_209754000, a2, OS_LOG_TYPE_ERROR, "Failed to fetch metadata for message with error %@", (uint8_t *)&v2, 0xCu);
}

void __54__AAUIInviteMessageFlowController__sendDefaultMessage__block_invoke_cold_3(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl(&dword_209754000, log, OS_LOG_TYPE_ERROR, "Message did not send!", v1, 2u);
}

- (void)inviteController:(os_log_t)log didFinishWithStatus:recipients:userInfo:error:.cold.1(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl(&dword_209754000, log, OS_LOG_TYPE_ERROR, "MFMessageComposeViewController failed with other error", v1, 2u);
}

@end
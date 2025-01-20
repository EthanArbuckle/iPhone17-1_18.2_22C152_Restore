@interface FAMessagesInviteConfigurationController
+ (BOOL)isAvailable;
- (FAInviteContext)context;
- (FAInviteControllerDelegate)delegate;
- (FAMessagesInviteConfigurationController)initWithInviteContext:(id)a3 presentingController:(id)a4;
- (FAMessagesInviteConfigurationController)initWithInviteContext:(id)a3 presentingController:(id)a4 familySuggestionHandle:(id)a5;
- (id)_messageComposeViewController;
- (void)_presentInviteControllerWithCompletion:(id)a3;
- (void)messageComposeViewController:(id)a3 didFinishWithResult:(int64_t)a4;
- (void)messageComposeViewController:(id)a3 shouldSendMessage:(id)a4 toRecipients:(id)a5 completion:(id)a6;
- (void)presentWhenReadyWithCompletion:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation FAMessagesInviteConfigurationController

- (FAMessagesInviteConfigurationController)initWithInviteContext:(id)a3 presentingController:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [(FAMessagesInviteConfigurationController *)self init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_context, a3);
    objc_storeStrong((id *)&v10->_presentationContext, a4);
    v11 = objc_alloc_init(FAInviteRecipientEvaluator);
    inviteRecipientEvaluator = v10->_inviteRecipientEvaluator;
    v10->_inviteRecipientEvaluator = v11;
  }
  return v10;
}

- (FAMessagesInviteConfigurationController)initWithInviteContext:(id)a3 presentingController:(id)a4 familySuggestionHandle:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = [(FAMessagesInviteConfigurationController *)self init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_context, a3);
    objc_storeStrong((id *)&v13->_presentationContext, a4);
    v14 = objc_alloc_init(FAInviteRecipientEvaluator);
    inviteRecipientEvaluator = v13->_inviteRecipientEvaluator;
    v13->_inviteRecipientEvaluator = v14;

    objc_storeStrong((id *)&v13->_familySuggestionHandle, a5);
  }

  return v13;
}

- (void)presentWhenReadyWithCompletion:(id)a3
{
  id v4 = a3;
  if (self->_linkMetadata)
  {
    [(FAMessagesInviteConfigurationController *)self _presentInviteControllerWithCompletion:v4];
  }
  else
  {
    v5 = [[FAInviteLinkMetadataProvider alloc] initWithContext:self->_context];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __74__FAMessagesInviteConfigurationController_presentWhenReadyWithCompletion___block_invoke;
    v6[3] = &unk_264348E98;
    v6[4] = self;
    id v7 = v4;
    [(FAInviteLinkMetadataProvider *)v5 loadMetatadataWithCompletion:v6];
  }
}

void __74__FAMessagesInviteConfigurationController_presentWhenReadyWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = *(void *)(a1 + 40);
    if (v6) {
      (*(void (**)(uint64_t, void, id))(v6 + 16))(v6, 0, v5);
    }
  }
  else
  {
    uint64_t v7 = [v10 bubbleMetadata];
    uint64_t v8 = *(void *)(a1 + 32);
    id v9 = *(void **)(v8 + 16);
    *(void *)(v8 + 16) = v7;

    [*(id *)(a1 + 32) _presentInviteControllerWithCompletion:*(void *)(a1 + 40)];
  }
}

- (id)_messageComposeViewController
{
  v25[1] = *MEMORY[0x263EF8340];
  messageComposeViewController = self->_messageComposeViewController;
  if (!messageComposeViewController)
  {
    id v4 = (MFMessageComposeViewController *)objc_alloc_init(MEMORY[0x263F12580]);
    id v5 = self->_messageComposeViewController;
    self->_messageComposeViewController = v4;

    [(MFMessageComposeViewController *)self->_messageComposeViewController setMessageComposeDelegate:self];
    uint64_t v6 = [(FAInviteContext *)self->_context messageBubbleTitle];

    if (v6)
    {
      uint64_t v7 = (void *)[objc_alloc(MEMORY[0x263F125A8]) initWithLinkMetadata:self->_linkMetadata];
      uint64_t v8 = (void *)[objc_alloc(MEMORY[0x263F125A0]) initWithAlternateLayout:v7];
      v25[0] = *MEMORY[0x263F4A180];
      id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:1];
      [v8 setRequiredCapabilities:v9];

      id v10 = objc_alloc(MEMORY[0x263F12598]);
      id v11 = objc_alloc_init(MEMORY[0x263F125C0]);
      v12 = (void *)[v10 initWithSession:v11];

      [v12 setLayout:v8];
      v13 = [(FAInviteContext *)self->_context buildInviteMessageBubbleURL:self->_familySuggestionHandle];
      [v12 setURL:v13];

      v14 = [(FAInviteContext *)self->_context messageBubbleSubTitle];
      [v12 setSummaryText:v14];

      [(MFMessageComposeViewController *)self->_messageComposeViewController setMessage:v12];
    }
    else
    {
      v15 = self->_messageComposeViewController;
      v16 = [(LPLinkMetadata *)self->_linkMetadata dataRepresentation];
      v17 = [(FAInviteContext *)self->_context inviteURL];
      [(MFMessageComposeViewController *)v15 addRichLinkData:v16 withWebpageURL:v17];
    }
    v18 = [(FAInviteContext *)self->_context invitees];
    uint64_t v19 = [v18 count];

    if (v19)
    {
      v20 = self->_messageComposeViewController;
      uint64_t v21 = [(FAInviteContext *)self->_context invitees];
    }
    else
    {
      if (!self->_familySuggestionHandle)
      {
LABEL_10:
        [(MFMessageComposeViewController *)self->_messageComposeViewController _setCanEditRecipients:[(FAInviteContext *)self->_context canEditRecipients]];
        messageComposeViewController = self->_messageComposeViewController;
        goto LABEL_11;
      }
      v20 = self->_messageComposeViewController;
      familySuggestionHandle = self->_familySuggestionHandle;
      uint64_t v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:&familySuggestionHandle count:1];
    }
    v22 = (void *)v21;
    [(MFMessageComposeViewController *)v20 setRecipients:v21];

    goto LABEL_10;
  }
LABEL_11:
  return messageComposeViewController;
}

+ (BOOL)isAvailable
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  v2 = _FALogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 67109120;
    v4[1] = [MEMORY[0x263F12580] canSendText];
    _os_log_impl(&dword_2189F0000, v2, OS_LOG_TYPE_DEFAULT, "can send text %d", (uint8_t *)v4, 8u);
  }

  return [MEMORY[0x263F12580] isiMessageEnabled];
}

- (void)_presentInviteControllerWithCompletion:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = _FALogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    BOOL v15 = +[FAMessagesInviteConfigurationController isAvailable];
    _os_log_impl(&dword_2189F0000, v5, OS_LOG_TYPE_DEFAULT, "_presentMessagesViewController - can send text: %d", buf, 8u);
  }

  uint64_t v6 = [(FAMessagesInviteConfigurationController *)self _messageComposeViewController];
  if (v6
    && (uint64_t v7 = (void *)v6,
        BOOL v8 = +[FAMessagesInviteConfigurationController isAvailable], v7, v8))
  {
    presentationContext = self->_presentationContext;
    id v10 = [(FAMessagesInviteConfigurationController *)self _messageComposeViewController];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __82__FAMessagesInviteConfigurationController__presentInviteControllerWithCompletion___block_invoke;
    v12[3] = &unk_264348EC0;
    id v13 = v4;
    [(UIViewController *)presentationContext presentViewController:v10 animated:1 completion:v12];
  }
  else
  {
    id v11 = _FALogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2189F0000, v11, OS_LOG_TYPE_DEFAULT, "Unable to present FAMessagesInViteConfigurationController", buf, 2u);
    }

    if (v4) {
      (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
    }
  }
}

uint64_t __82__FAMessagesInviteConfigurationController__presentInviteControllerWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, 1, 0);
  }
  return result;
}

- (void)messageComposeViewController:(id)a3 didFinishWithResult:(int64_t)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = _FALogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v8 = (objc_class *)objc_opt_class();
    id v9 = NSStringFromClass(v8);
    *(_DWORD *)buf = 138412546;
    uint64_t v21 = v9;
    __int16 v22 = 2048;
    int64_t v23 = a4;
    _os_log_impl(&dword_2189F0000, v7, OS_LOG_TYPE_DEFAULT, "%@ MFMessageComposeVC delegate callback - didFinishWithResult:%ld", buf, 0x16u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    if (a4 == 1)
    {
      v12 = @"0";
    }
    else if (a4)
    {
      v12 = @"0";
      a4 = 2;
    }
    else
    {
      v12 = @"1";
    }
    v18 = @"userCancelled";
    uint64_t v19 = v12;
    id v13 = [NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __92__FAMessagesInviteConfigurationController_messageComposeViewController_didFinishWithResult___block_invoke;
    v15[3] = &unk_264348EE8;
    id v16 = v13;
    int64_t v17 = a4;
    v15[4] = self;
    id v14 = v13;
    [v6 dismissViewControllerAnimated:1 completion:v15];
  }
  else
  {
    [v6 dismissViewControllerAnimated:1 completion:0];
  }
}

void __92__FAMessagesInviteConfigurationController_messageComposeViewController_didFinishWithResult___block_invoke(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 56));
  [WeakRetained inviteController:a1[4] didFinishWithStatus:a1[6] recipients:*(void *)(a1[4] + 32) userInfo:a1[5] error:0];
}

- (void)messageComposeViewController:(id)a3 shouldSendMessage:(id)a4 toRecipients:(id)a5 completion:(id)a6
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  BOOL v8 = (NSArray *)a5;
  id v9 = a6;
  id v10 = _FALogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    char v11 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v11);
    int v18 = 138412290;
    uint64_t v19 = v12;
    _os_log_impl(&dword_2189F0000, v10, OS_LOG_TYPE_DEFAULT, "%@ MFMessageComposeVC delegate callback - shouldSendMessage", (uint8_t *)&v18, 0xCu);
  }
  recipientAddresses = self->_recipientAddresses;
  self->_recipientAddresses = v8;
  id v14 = v8;

  inviteRecipientEvaluator = self->_inviteRecipientEvaluator;
  context = self->_context;
  int64_t v17 = [(MFMessageComposeViewController *)self->_messageComposeViewController visibleViewController];
  [(FAInviteRecipientEvaluator *)inviteRecipientEvaluator validateRecipients:v14 inviteContext:context presenter:v17 completion:v9];
}

- (FAInviteControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (FAInviteControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (FAInviteContext)context
{
  return self->_context;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_inviteRecipientEvaluator, 0);
  objc_storeStrong((id *)&self->_familySuggestionHandle, 0);
  objc_storeStrong((id *)&self->_recipientAddresses, 0);
  objc_storeStrong((id *)&self->_presentationContext, 0);
  objc_storeStrong((id *)&self->_linkMetadata, 0);
  objc_storeStrong((id *)&self->_messageComposeViewController, 0);
}

@end
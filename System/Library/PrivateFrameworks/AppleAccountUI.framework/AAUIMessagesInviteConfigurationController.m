@interface AAUIMessagesInviteConfigurationController
+ (BOOL)isAvailable;
- (AAMessagesInviteContext)context;
- (AAUIInviteControllerDelegate)delegate;
- (AAUIMessagesInviteConfigurationController)initWithInviteContext:(id)a3 flow:(unint64_t)a4 presentingController:(id)a5;
- (id)_bubbleImageForFlow:(unint64_t)a3;
- (id)_messageComposeViewController;
- (void)_presentInviteControllerWithCompletion:(id)a3;
- (void)messageComposeViewController:(id)a3 didFinishWithResult:(int64_t)a4;
- (void)messageComposeViewController:(id)a3 shouldSendMessage:(id)a4 toRecipients:(id)a5 completion:(id)a6;
- (void)presentWhenReadyWithCompletion:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation AAUIMessagesInviteConfigurationController

- (AAUIMessagesInviteConfigurationController)initWithInviteContext:(id)a3 flow:(unint64_t)a4 presentingController:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v11 = [(AAUIMessagesInviteConfigurationController *)self init];
  v12 = v11;
  if (v11)
  {
    v11->_flow = a4;
    objc_storeStrong((id *)&v11->_context, a3);
    objc_storeStrong((id *)&v12->_presentingViewController, a5);
  }

  return v12;
}

- (void)presentWhenReadyWithCompletion:(id)a3
{
  id v4 = a3;
  if (self->_linkMetadata)
  {
    [(AAUIMessagesInviteConfigurationController *)self _presentInviteControllerWithCompletion:v4];
  }
  else
  {
    v5 = [[AAUIInviteLinkMetadataProvider alloc] initWithContext:self->_context];
    v6 = [(AAUIMessagesInviteConfigurationController *)self _bubbleImageForFlow:self->_flow];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __76__AAUIMessagesInviteConfigurationController_presentWhenReadyWithCompletion___block_invoke;
    v7[3] = &unk_263F93030;
    v7[4] = self;
    id v8 = v4;
    [(AAUIInviteLinkMetadataProvider *)v5 loadMetadataWithImage:v6 completion:v7];
  }
}

void __76__AAUIMessagesInviteConfigurationController_presentWhenReadyWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
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
    id v9 = *(void **)(v8 + 24);
    *(void *)(v8 + 24) = v7;

    [*(id *)(a1 + 32) _presentInviteControllerWithCompletion:*(void *)(a1 + 40)];
  }
}

- (id)_bubbleImageForFlow:(unint64_t)a3
{
  if (a3 == 1)
  {
    v3 = (void *)MEMORY[0x263F827E8];
    id v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v5 = @"beneficiary_message_bubble";
    goto LABEL_5;
  }
  if (!a3)
  {
    v3 = (void *)MEMORY[0x263F827E8];
    id v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v5 = @"custodian_message_bubble";
LABEL_5:
    uint64_t v6 = [v3 imageNamed:v5 inBundle:v4];

    goto LABEL_7;
  }
  uint64_t v6 = 0;
LABEL_7:
  return v6;
}

- (id)_messageComposeViewController
{
  messageComposeViewController = self->_messageComposeViewController;
  if (!messageComposeViewController)
  {
    id v4 = (MFMessageComposeViewController *)objc_alloc_init(MEMORY[0x263F12580]);
    id v5 = self->_messageComposeViewController;
    self->_messageComposeViewController = v4;

    [(MFMessageComposeViewController *)self->_messageComposeViewController setMessageComposeDelegate:self];
    uint64_t v6 = self->_messageComposeViewController;
    uint64_t v7 = [(LPLinkMetadata *)self->_linkMetadata dataRepresentation];
    uint64_t v8 = [(AAMessagesInviteContext *)self->_context inviteURL];
    [(MFMessageComposeViewController *)v6 addRichLinkData:v7 withWebpageURL:v8];

    id v9 = self->_messageComposeViewController;
    id v10 = [(AAMessagesInviteContext *)self->_context recipients];
    [(MFMessageComposeViewController *)v9 setRecipients:v10];

    [(MFMessageComposeViewController *)self->_messageComposeViewController _setCanEditRecipients:0];
    v11 = self->_messageComposeViewController;
    v12 = [(AAMessagesInviteContext *)self->_context messageBody];
    [(MFMessageComposeViewController *)v11 setBody:v12];

    messageComposeViewController = self->_messageComposeViewController;
  }
  return messageComposeViewController;
}

+ (BOOL)isAvailable
{
  return [MEMORY[0x263F12580] isiMessageEnabled];
}

- (void)_presentInviteControllerWithCompletion:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  id v5 = _AAUILogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    BOOL v11 = +[AAUIMessagesInviteConfigurationController isAvailable];
    _os_log_impl(&dword_209754000, v5, OS_LOG_TYPE_DEFAULT, "_presentMessagesViewController - can send text: %d", buf, 8u);
  }

  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __84__AAUIMessagesInviteConfigurationController__presentInviteControllerWithCompletion___block_invoke;
  v8[3] = &unk_263F92048;
  v8[4] = self;
  id v9 = v4;
  id v6 = v4;
  uint64_t v7 = (void *)MEMORY[0x263EF83A0];
  dispatch_async(MEMORY[0x263EF83A0], v8);
}

void __84__AAUIMessagesInviteConfigurationController__presentInviteControllerWithCompletion___block_invoke(uint64_t a1)
{
  v2 = _AAUILogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_209754000, v2, OS_LOG_TYPE_DEFAULT, "Lets use the old flow...", buf, 2u);
  }

  v3 = [*(id *)(a1 + 32) _messageComposeViewController];
  if (v3
    && +[AAUIMessagesInviteConfigurationController isAvailable])
  {
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 32);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __84__AAUIMessagesInviteConfigurationController__presentInviteControllerWithCompletion___block_invoke_60;
    v8[3] = &unk_263F92048;
    v8[4] = v4;
    id v9 = *(id *)(a1 + 40);
    [v5 presentViewController:v3 animated:1 completion:v8];
  }
  else
  {
    id v6 = _AAUILogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_209754000, v6, OS_LOG_TYPE_DEFAULT, "Unable to present AAUIMessagesInViteConfigurationController", buf, 2u);
    }

    uint64_t v7 = *(void *)(a1 + 40);
    if (v7) {
      (*(void (**)(uint64_t, void, void))(v7 + 16))(v7, 0, 0);
    }
  }
}

uint64_t __84__AAUIMessagesInviteConfigurationController__presentInviteControllerWithCompletion___block_invoke_60(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v2 = _AAUILogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v3 = *(void *)(*(void *)(a1 + 32) + 16) != 0;
    v5[0] = 67109120;
    v5[1] = v3;
    _os_log_impl(&dword_209754000, v2, OS_LOG_TYPE_DEFAULT, "_presentMessagesViewController - has : _messageComposeViewController %d", (uint8_t *)v5, 8u);
  }

  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, 1, 0);
  }
  return result;
}

- (void)messageComposeViewController:(id)a3 didFinishWithResult:(int64_t)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v7 = a3;
  uint64_t v8 = _AAUILogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = (objc_class *)objc_opt_class();
    id v10 = NSStringFromClass(v9);
    *(_DWORD *)buf = 138412546;
    v25 = v10;
    __int16 v26 = 2048;
    int64_t v27 = a4;
    _os_log_impl(&dword_209754000, v8, OS_LOG_TYPE_DEFAULT, "%@ MFMessageComposeVC delegate callback - didFinishWithResult:%ld", buf, 0x16u);
  }
  objc_storeStrong((id *)&self->_presentingViewController, a3);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v12 = objc_opt_respondsToSelector();

  if (v12)
  {
    v13 = _AAUILogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_209754000, v13, OS_LOG_TYPE_DEFAULT, "Calling back to controller delegate", buf, 2u);
    }

    if (a4 == 1)
    {
      v14 = @"0";
    }
    else if (a4)
    {
      v14 = @"0";
      a4 = 2;
    }
    else
    {
      v14 = @"1";
    }
    v22 = @"userCancelled";
    v23 = v14;
    v16 = [NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __94__AAUIMessagesInviteConfigurationController_messageComposeViewController_didFinishWithResult___block_invoke;
    v18[3] = &unk_263F93058;
    v18[4] = self;
    id v20 = v16;
    int64_t v21 = a4;
    id v19 = v7;
    id v17 = v16;
    dispatch_async(MEMORY[0x263EF83A0], v18);
  }
  else
  {
    if (a4)
    {
      if (a4 == 1)
      {
        v15 = _AAUILogSystem();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_209754000, v15, OS_LOG_TYPE_DEFAULT, "Message sent successfully", buf, 2u);
        }
      }
      else
      {
        v15 = _AAUILogSystem();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          -[AAUIMessagesInviteConfigurationController messageComposeViewController:didFinishWithResult:](v15);
        }
      }
    }
    else
    {
      v15 = _AAUILogSystem();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        -[AAUIMessagesInviteConfigurationController messageComposeViewController:didFinishWithResult:](v15);
      }
    }

    [v7 dismissViewControllerAnimated:1 completion:0];
  }
}

void __94__AAUIMessagesInviteConfigurationController_messageComposeViewController_didFinishWithResult___block_invoke(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 48));
  [WeakRetained inviteController:a1[5] didFinishWithStatus:a1[7] recipients:*(void *)(a1[4] + 40) userInfo:a1[6] error:0];
}

- (void)messageComposeViewController:(id)a3 shouldSendMessage:(id)a4 toRecipients:(id)a5 completion:(id)a6
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v8 = (NSArray *)a5;
  id v9 = (void (**)(id, BOOL))a6;
  id v10 = _AAUILogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v11 = (objc_class *)objc_opt_class();
    char v12 = NSStringFromClass(v11);
    int v16 = 138412290;
    id v17 = v12;
    _os_log_impl(&dword_209754000, v10, OS_LOG_TYPE_DEFAULT, "%@ MFMessageComposeVC delegate callback - shouldSendMessage", (uint8_t *)&v16, 0xCu);
  }
  recipientAddresses = self->_recipientAddresses;
  self->_recipientAddresses = v8;
  v14 = v8;

  uint64_t v15 = [(NSArray *)v14 count];
  v9[2](v9, v15 != 0);
}

- (AAUIInviteControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AAUIInviteControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (AAMessagesInviteContext)context
{
  return self->_context;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_recipientAddresses, 0);
  objc_storeStrong((id *)&self->_presentingViewController, 0);
  objc_storeStrong((id *)&self->_linkMetadata, 0);
  objc_storeStrong((id *)&self->_messageComposeViewController, 0);
}

- (void)messageComposeViewController:(os_log_t)log didFinishWithResult:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_209754000, log, OS_LOG_TYPE_ERROR, "Message failure", v1, 2u);
}

- (void)messageComposeViewController:(os_log_t)log didFinishWithResult:.cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_209754000, log, OS_LOG_TYPE_ERROR, "Message cancelled", v1, 2u);
}

@end
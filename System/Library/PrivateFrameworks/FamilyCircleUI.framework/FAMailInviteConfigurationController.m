@interface FAMailInviteConfigurationController
+ (BOOL)isAvailable;
- (FAInviteContext)context;
- (FAInviteControllerDelegate)delegate;
- (FAMailInviteConfigurationController)initWithInviteContext:(id)a3 presentingController:(id)a4 email:(id)a5;
- (id)_mailComposeViewController;
- (void)_presentInviteControllerWithCompletion:(id)a3;
- (void)mailComposeController:(id)a3 didFinishWithResult:(int64_t)a4 error:(id)a5;
- (void)mailComposeController:(id)a3 shouldSendMail:(id)a4 toRecipients:(id)a5 completion:(id)a6;
- (void)presentWhenReadyWithCompletion:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation FAMailInviteConfigurationController

- (FAMailInviteConfigurationController)initWithInviteContext:(id)a3 presentingController:(id)a4 email:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = [(FAMailInviteConfigurationController *)self init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_context, a3);
    objc_storeStrong((id *)&v13->_presentationContext, a4);
    objc_storeStrong((id *)&v13->_familySuggestionEmailAddress, a5);
    v14 = objc_alloc_init(FAInviteRecipientEvaluator);
    inviteRecipientEvaluator = v13->_inviteRecipientEvaluator;
    v13->_inviteRecipientEvaluator = v14;
  }
  return v13;
}

- (void)presentWhenReadyWithCompletion:(id)a3
{
  id v4 = a3;
  if (self->_linkMetadata)
  {
    [(FAMailInviteConfigurationController *)self _presentInviteControllerWithCompletion:v4];
  }
  else
  {
    v5 = [[FAInviteLinkMetadataProvider alloc] initWithContext:self->_context];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __70__FAMailInviteConfigurationController_presentWhenReadyWithCompletion___block_invoke;
    v6[3] = &unk_264348E98;
    v6[4] = self;
    id v7 = v4;
    [(FAInviteLinkMetadataProvider *)v5 loadMetatadataWithCompletion:v6];
  }
}

void __70__FAMailInviteConfigurationController_presentWhenReadyWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
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
    uint64_t v7 = [v10 mailMetadata];
    uint64_t v8 = *(void *)(a1 + 32);
    id v9 = *(void **)(v8 + 24);
    *(void *)(v8 + 24) = v7;

    [*(id *)(a1 + 32) _presentInviteControllerWithCompletion:*(void *)(a1 + 40)];
  }
}

- (void)_presentInviteControllerWithCompletion:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = _FALogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    BOOL v15 = +[FAMailInviteConfigurationController isAvailable];
    _os_log_impl(&dword_2189F0000, v5, OS_LOG_TYPE_DEFAULT, "_presentMailViewController - can send Mail: %d", buf, 8u);
  }

  uint64_t v6 = [(FAMailInviteConfigurationController *)self _mailComposeViewController];
  if (v6
    && (uint64_t v7 = (void *)v6,
        BOOL v8 = +[FAMailInviteConfigurationController isAvailable], v7, v8))
  {
    presentationContext = self->_presentationContext;
    id v10 = [(FAMailInviteConfigurationController *)self _mailComposeViewController];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __78__FAMailInviteConfigurationController__presentInviteControllerWithCompletion___block_invoke;
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
      _os_log_impl(&dword_2189F0000, v11, OS_LOG_TYPE_DEFAULT, "Unable to present FAMailInviteConfigurationController", buf, 2u);
    }

    if (v4) {
      (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
    }
  }
}

uint64_t __78__FAMailInviteConfigurationController__presentInviteControllerWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, 1, 0);
  }
  return result;
}

+ (BOOL)isAvailable
{
  return [MEMORY[0x263F12578] canSendMail];
}

- (id)_mailComposeViewController
{
  v20[1] = *MEMORY[0x263EF8340];
  mailComposeViewController = self->_mailComposeViewController;
  if (!mailComposeViewController)
  {
    id v4 = objc_alloc(MEMORY[0x263F103D0]);
    id v5 = [(LPLinkMetadata *)self->_linkMetadata originalURL];
    uint64_t v6 = (void *)[v4 initWithURL:v5];

    [v6 setMetadata:self->_linkMetadata];
    uint64_t v7 = [v6 HTMLFragmentString];
    uint64_t v8 = [(FAInviteContext *)self->_context mailMessageBodyHTML];
    id v9 = (void *)v8;
    id v10 = &stru_26CA2C800;
    if (v8) {
      id v10 = (__CFString *)v8;
    }
    id v11 = v10;

    v12 = [(__CFString *)v11 stringByAppendingString:v7];

    id v13 = (MFMailComposeViewController *)objc_alloc_init(MEMORY[0x263F12578]);
    v14 = self->_mailComposeViewController;
    self->_mailComposeViewController = v13;

    [(MFMailComposeViewController *)self->_mailComposeViewController setMailComposeDelegate:self];
    [(MFMailComposeViewController *)self->_mailComposeViewController setMessageBody:v12 isHTML:1];
    BOOL v15 = self->_mailComposeViewController;
    uint64_t v16 = [(FAInviteContext *)self->_context mailMessageSubject];
    [(MFMailComposeViewController *)v15 setSubject:v16];

    v17 = self->_mailComposeViewController;
    v20[0] = self->_familySuggestionEmailAddress;
    v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:1];
    [(MFMailComposeViewController *)v17 setToRecipients:v18];

    mailComposeViewController = self->_mailComposeViewController;
  }
  return mailComposeViewController;
}

- (void)mailComposeController:(id)a3 shouldSendMail:(id)a4 toRecipients:(id)a5 completion:(id)a6
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v8 = a6;
  id v9 = a5;
  id v10 = _FALogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v18 = @"FAMailInviteConfigurationController.m";
    _os_log_impl(&dword_2189F0000, v10, OS_LOG_TYPE_DEFAULT, "%@ MFMessageComposeVC delegate callback - shouldSendMail", buf, 0xCu);
  }

  id v11 = [(FAInviteRecipientEvaluator *)self->_inviteRecipientEvaluator parseRecipientAddresses:v9];
  recipientAddresses = self->_recipientAddresses;
  self->_recipientAddresses = v11;

  uint64_t v13 = [v9 count];
  if (v13)
  {
    id v14 = objc_alloc_init(MEMORY[0x263F3BF48]);
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __100__FAMailInviteConfigurationController_mailComposeController_shouldSendMail_toRecipients_completion___block_invoke;
    v15[3] = &unk_2643492D8;
    v15[4] = self;
    id v16 = v8;
    [v14 startRequestWithCompletionHandler:v15];
  }
  else
  {
    (*((void (**)(id, void))v8 + 2))(v8, 0);
  }
}

void __100__FAMailInviteConfigurationController_mailComposeController_shouldSendMail_toRecipients_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  id v8 = [*(id *)(*(void *)(a1 + 32) + 40) recipientAlreadyInFamily:a2 emailOnly:1 recipients:*(void *)(*(void *)(a1 + 32) + 32)];
  uint64_t v3 = [v8 count];
  id v4 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  if (v3)
  {
    v4();
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void **)(v5 + 40);
    uint64_t v7 = [*(id *)(v5 + 8) visibleViewController];
    [v6 showAlreadyFamilyMember:v8 presenter:v7];
  }
  else
  {
    v4();
  }
}

- (void)mailComposeController:(id)a3 didFinishWithResult:(int64_t)a4 error:(id)a5
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = _FALogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v21 = @"FAMailInviteConfigurationController.m";
    __int16 v22 = 2048;
    int64_t v23 = a4;
    _os_log_impl(&dword_2189F0000, v8, OS_LOG_TYPE_DEFAULT, "%@ MFMailComposeVC delegate callback - didFinishWithResult:%ld", buf, 0x16u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    uint64_t v11 = 2 * (a4 != 0);
    uint64_t v14 = MEMORY[0x263EF8330];
    uint64_t v15 = 3221225472;
    id v16 = __87__FAMailInviteConfigurationController_mailComposeController_didFinishWithResult_error___block_invoke;
    v17 = &unk_264349300;
    if (a4 == 2) {
      uint64_t v11 = 1;
    }
    v18 = self;
    uint64_t v19 = v11;
    v12 = &v14;
    uint64_t v13 = v7;
  }
  else
  {
    uint64_t v13 = v7;
    v12 = 0;
  }
  objc_msgSend(v13, "dismissViewControllerAnimated:completion:", 1, v12, v14, v15, v16, v17, v18, v19);
}

void __87__FAMailInviteConfigurationController_mailComposeController_didFinishWithResult_error___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 56));
  [WeakRetained inviteController:*(void *)(a1 + 32) didFinishWithStatus:*(void *)(a1 + 40) recipients:*(void *)(*(void *)(a1 + 32) + 32) userInfo:0 error:0];
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
  objc_storeStrong((id *)&self->_familySuggestionEmailAddress, 0);
  objc_storeStrong((id *)&self->_inviteRecipientEvaluator, 0);
  objc_storeStrong((id *)&self->_recipientAddresses, 0);
  objc_storeStrong((id *)&self->_linkMetadata, 0);
  objc_storeStrong((id *)&self->_presentationContext, 0);
  objc_storeStrong((id *)&self->_mailComposeViewController, 0);
}

@end
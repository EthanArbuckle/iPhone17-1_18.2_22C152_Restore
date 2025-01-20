@interface FAShareSheetInviteConfigurationController
- (BOOL)alwaysNotifyServer;
- (FAInviteControllerDelegate)delegate;
- (FAShareSheetInviteConfigurationController)initWithInviteContext:(id)a3 presentingController:(id)a4;
- (id)_parameterForActivityType:(id)a3;
- (id)activityViewController:(id)a3 itemForActivityType:(id)a4;
- (id)activityViewControllerLinkMetadata:(id)a3;
- (id)activityViewControllerPlaceholderItem:(id)a3;
- (id)linkMetadataForActivityViewController:(id)a3;
- (void)_presentInviteControllerWithCompletion:(id)a3;
- (void)activityViewController:(id)a3 didCompleteActivityType:(id)a4;
- (void)activityViewController:(id)a3 willStartAsyncActivity:(id)a4;
- (void)presentWhenReadyWithCompletion:(id)a3;
- (void)setAlwaysNotifyServer:(BOOL)a3;
- (void)setDelegate:(id)a3;
@end

@implementation FAShareSheetInviteConfigurationController

- (FAShareSheetInviteConfigurationController)initWithInviteContext:(id)a3 presentingController:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [(FAShareSheetInviteConfigurationController *)self init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_context, a3);
    objc_storeStrong((id *)&v10->_presentationContext, a4);
  }

  return v10;
}

- (void)presentWhenReadyWithCompletion:(id)a3
{
  id v4 = a3;
  if (self->_linkMetadata)
  {
    [(FAShareSheetInviteConfigurationController *)self _presentInviteControllerWithCompletion:v4];
  }
  else
  {
    v5 = [[FAInviteLinkMetadataProvider alloc] initWithContext:self->_context];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __76__FAShareSheetInviteConfigurationController_presentWhenReadyWithCompletion___block_invoke;
    v6[3] = &unk_264348E98;
    v6[4] = self;
    id v7 = v4;
    [(FAInviteLinkMetadataProvider *)v5 loadMetatadataWithCompletion:v6];
  }
}

void __76__FAShareSheetInviteConfigurationController_presentWhenReadyWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = *(void *)(a1 + 40);
    if (v7) {
      (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, 1, v6);
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 16), a2);
    [*(id *)(a1 + 32) _presentInviteControllerWithCompletion:*(void *)(a1 + 40)];
  }
}

- (id)_parameterForActivityType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:*MEMORY[0x263F6BD00]])
  {
    id v4 = @"messages";
  }
  else if ([v3 isEqualToString:*MEMORY[0x263F6BCF0]])
  {
    id v4 = @"mail";
  }
  else if ([v3 isEqualToString:*MEMORY[0x263F6BCD8]])
  {
    id v4 = @"airdrop";
  }
  else if ([v3 isEqualToString:@"FAInviteInPersonActivity"])
  {
    id v4 = @"inPerson";
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (void)_presentInviteControllerWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [FAActivityViewController alloc];
  id v6 = [(FAInviteContext *)self->_context eventType];
  uint64_t v7 = [(FAActivityViewController *)v5 initWithItemSource:self eventType:v6];

  [(FAActivityViewController *)v7 setDelegate:self];
  objc_initWeak(&location, self);
  objc_initWeak(&from, v7);
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __84__FAShareSheetInviteConfigurationController__presentInviteControllerWithCompletion___block_invoke;
  aBlock[3] = &unk_264349768;
  objc_copyWeak(&v17, &location);
  objc_copyWeak(&v18, &from);
  id v8 = _Block_copy(aBlock);
  id activityControllerCompletionHandler = self->_activityControllerCompletionHandler;
  self->_id activityControllerCompletionHandler = v8;

  [(FAActivityViewController *)v7 setCompletionWithItemsHandler:self->_activityControllerCompletionHandler];
  v10 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v11 = [v10 userInterfaceIdiom];

  if (v11 == 1) {
    [(FAActivityViewController *)v7 setModalPresentationStyle:2];
  }
  presentationContext = self->_presentationContext;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __84__FAShareSheetInviteConfigurationController__presentInviteControllerWithCompletion___block_invoke_2;
  v14[3] = &unk_264348EC0;
  id v13 = v4;
  id v15 = v13;
  [(UIViewController *)presentationContext presentViewController:v7 animated:1 completion:v14];

  objc_destroyWeak(&v18);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

void __84__FAShareSheetInviteConfigurationController__presentInviteControllerWithCompletion___block_invoke(uint64_t a1, void *a2, int a3, void *a4, void *a5)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v9 = a2;
  id v10 = a4;
  id v11 = a5;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v13 = objc_loadWeakRetained((id *)(a1 + 40));
  v14 = _FALogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    v23 = @"NO";
    *(_DWORD *)buf = 138413058;
    id v28 = v9;
    if (a3) {
      v23 = @"YES";
    }
    __int16 v29 = 2112;
    v30 = v23;
    __int16 v31 = 2112;
    id v32 = v10;
    __int16 v33 = 2112;
    id v34 = v11;
    _os_log_debug_impl(&dword_2189F0000, v14, OS_LOG_TYPE_DEBUG, "_activityControllerCompletionHandler type: %@\ncompleted: %@\nreturnedItems: %@\nerror:%@", buf, 0x2Au);
  }

  if ([v9 isEqualToString:@"FAInviteInPersonActivity"])
  {
    [WeakRetained activityViewController:v13 didCompleteActivityType:v9];
    if (([WeakRetained alwaysNotifyServer] & 1) == 0)
    {
      if (!a3) {
        goto LABEL_17;
      }
      id v18 = [v13 activity];
      v21 = [WeakRetained delegate];
      v22 = [v18 response];
      [v21 dismissWithUserInfo:v22];

LABEL_16:
      goto LABEL_17;
    }
  }
  if ([v9 isEqualToString:*MEMORY[0x263F6BCD8]]
    && ([v13 didCompleteAirdropTransfer] & 1) == 0)
  {
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __84__FAShareSheetInviteConfigurationController__presentInviteControllerWithCompletion___block_invoke_30;
    v24[3] = &unk_264348AE0;
    id v25 = v13;
    v26 = WeakRetained;
    dispatch_async(MEMORY[0x263EF83A0], v24);

    id v18 = v25;
    goto LABEL_16;
  }
  if (v9 && (v11 || a3))
  {
    if (v11) {
      uint64_t v15 = 2;
    }
    else {
      uint64_t v15 = 1;
    }
    uint64_t v16 = [v13 recipientAddresses];
    id v17 = (void *)WeakRetained[4];
    WeakRetained[4] = v16;

    id v18 = [MEMORY[0x263EFF9A0] dictionary];
    v19 = [WeakRetained _parameterForActivityType:v9];
    [v18 setObject:v19 forKeyedSubscript:*MEMORY[0x263F3BDF8]];

    v20 = [WeakRetained delegate];
    [v20 inviteController:WeakRetained didFinishWithStatus:v15 recipients:WeakRetained[4] userInfo:v18 error:v11];

    goto LABEL_16;
  }
LABEL_17:
}

uint64_t __84__FAShareSheetInviteConfigurationController__presentInviteControllerWithCompletion___block_invoke_30(uint64_t a1)
{
  return [*(id *)(a1 + 32) setCompletionWithItemsHandler:*(void *)(*(void *)(a1 + 40) + 40)];
}

uint64_t __84__FAShareSheetInviteConfigurationController__presentInviteControllerWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, 1, 0);
  }
  return result;
}

- (id)activityViewControllerLinkMetadata:(id)a3
{
  return [(FAInviteLinkMetadata *)self->_linkMetadata bubbleMetadata];
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  id v5 = a4;
  if ([v5 isEqualToString:*MEMORY[0x263F6BCD8]])
  {
    id v6 = [(FAInviteLinkMetadata *)self->_linkMetadata bubbleMetadata];
    uint64_t v7 = [v6 originalURL];
    id v8 = objc_msgSend(v7, "fa_URLByAddingAirdropInviteParams");
  }
  else
  {
    if ([v5 isEqualToString:*MEMORY[0x263F6BD00]])
    {
      id v8 = 0;
      goto LABEL_7;
    }
    id v6 = [(FAInviteLinkMetadata *)self->_linkMetadata bubbleMetadata];
    id v8 = [v6 originalURL];
  }

LABEL_7:
  return v8;
}

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  id v3 = [(FAInviteLinkMetadata *)self->_linkMetadata bubbleMetadata];
  id v4 = [v3 title];

  return v4;
}

- (void)activityViewController:(id)a3 willStartAsyncActivity:(id)a4
{
  id v5 = [(FAShareSheetInviteConfigurationController *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(FAShareSheetInviteConfigurationController *)self delegate];
    [v7 inviteControllerDidStartAsyncLoading:self];
  }
}

- (void)activityViewController:(id)a3 didCompleteActivityType:(id)a4
{
  id v5 = [(FAShareSheetInviteConfigurationController *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(FAShareSheetInviteConfigurationController *)self delegate];
    [v7 inviteControllerDidEndAsyncLoading:self];
  }
}

- (id)linkMetadataForActivityViewController:(id)a3
{
  return self->_linkMetadata;
}

- (FAInviteControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (FAInviteControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)alwaysNotifyServer
{
  return self->_alwaysNotifyServer;
}

- (void)setAlwaysNotifyServer:(BOOL)a3
{
  self->_alwaysNotifyServer = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_activityControllerCompletionHandler, 0);
  objc_storeStrong((id *)&self->_recipientAddresses, 0);
  objc_storeStrong((id *)&self->_presentationContext, 0);
  objc_storeStrong((id *)&self->_linkMetadata, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

@end
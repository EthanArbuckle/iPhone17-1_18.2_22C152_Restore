@interface AAUIMyPendingCustodianActionHandler
- (void)displayMessagesInvitationFlowWithViewController:(id)a3;
- (void)doPrimaryAction:(id)a3 specifier:(id)a4;
@end

@implementation AAUIMyPendingCustodianActionHandler

- (void)doPrimaryAction:(id)a3 specifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x263F257E8]);
  objc_initWeak(&location, self);
  v9 = [(AAUIMyCustodianActionHandler *)self contact];
  v10 = [v9 custodianID];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __65__AAUIMyPendingCustodianActionHandler_doPrimaryAction_specifier___block_invoke;
  v12[3] = &unk_263F92BC8;
  objc_copyWeak(&v14, &location);
  id v11 = v6;
  id v13 = v11;
  [v8 reSendCustodianInvitationWithCustodianID:v10 completion:v12];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __65__AAUIMyPendingCustodianActionHandler_doPrimaryAction_specifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = _AAUILogSystem();
  id v6 = v5;
  if (WeakRetained)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      id v8 = v3;
      _os_log_impl(&dword_209754000, v6, OS_LOG_TYPE_DEFAULT, "Resending custodian IDS invitation completed with error: %@", (uint8_t *)&v7, 0xCu);
    }

    [WeakRetained displayMessagesInvitationFlowWithViewController:*(void *)(a1 + 32)];
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __65__AAUIMyPendingCustodianActionHandler_doPrimaryAction_specifier___block_invoke_cold_1(v6);
    }
  }
}

- (void)displayMessagesInvitationFlowWithViewController:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __87__AAUIMyPendingCustodianActionHandler_displayMessagesInvitationFlowWithViewController___block_invoke;
  block[3] = &unk_263F92668;
  objc_copyWeak(&v8, &location);
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __87__AAUIMyPendingCustodianActionHandler_displayMessagesInvitationFlowWithViewController___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = [WeakRetained contact];
    if ([v4 isFamilyMember]) {
      uint64_t v5 = 2;
    }
    else {
      uint64_t v5 = 1;
    }

    id v6 = objc_alloc(MEMORY[0x263F25900]);
    id v7 = [v3 contact];
    id v8 = [v7 handle];
    uint64_t v9 = (void *)[v6 initWithType:v5 recipientHandle:v8];

    v10 = [[AAUIOBTrustedContactInviteMessageModel alloc] initWithModel:v9];
    id v11 = [v3 contact];
    uint64_t v12 = [v11 isFamilyMember] ^ 1;

    id v13 = [AAUIOBInvitationSentViewModel alloc];
    id v14 = [v3 contact];
    v15 = [v14 handle];
    v16 = [(AAUIOBInvitationSentViewModel *)v13 initWithType:v12 recipientHandle:v15];

    id v17 = objc_alloc(MEMORY[0x263F257F0]);
    v18 = [v3 contact];
    v19 = [v3 contact];
    v20 = [v19 custodianID];
    v21 = (void *)[v17 initWithLocalContact:v18 custodianID:v20];

    v22 = [AAUIInviteMessageFlowController alloc];
    id v23 = objc_alloc_init(MEMORY[0x263F829B8]);
    uint64_t v24 = [(AAUIInviteMessageFlowController *)v22 initWithContext:v21 flow:0 navigationController:v23 defaultMessageViewModel:v10 messageSentViewModel:v16];
    id v25 = v3[8];
    v3[8] = (id)v24;

    [v3[8] start];
    v26 = [*(id *)(a1 + 32) navigationController];
    v27 = [v3[8] navigationController];
    [v26 presentViewController:v27 animated:1 completion:0];
  }
  else
  {
    v28 = _AAUILogSystem();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      __87__AAUIMyPendingCustodianActionHandler_displayMessagesInvitationFlowWithViewController___block_invoke_cold_1(v28);
    }
  }
}

- (void).cxx_destruct
{
}

void __65__AAUIMyPendingCustodianActionHandler_doPrimaryAction_specifier___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_209754000, log, OS_LOG_TYPE_ERROR, "Missing strong self for displaying our messages invitation controller.", v1, 2u);
}

void __87__AAUIMyPendingCustodianActionHandler_displayMessagesInvitationFlowWithViewController___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_209754000, log, OS_LOG_TYPE_ERROR, "Missing strong self for presenting our invitation flow controller.", v1, 2u);
}

@end
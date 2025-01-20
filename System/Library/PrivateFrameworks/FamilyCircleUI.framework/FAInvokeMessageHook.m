@interface FAInvokeMessageHook
- (BOOL)shouldMatchElement:(id)a3;
- (BOOL)shouldMatchModel:(id)a3;
- (FACircleRemoteUIDelegate)remoteUIDelegate;
- (RUIObjectModel)objectModel;
- (RUIServerHookDelegate)delegate;
- (RUIServerHookResponse)serverHookResponse;
- (id)_stringForCompletionStatus:(unint64_t)a3;
- (int64_t)transportWithActionString:(id)a3;
- (void)_presentMessagesInviteWithServerAttributes:(id)a3 transport:(int64_t)a4 sourceView:(id)a5 completion:(id)a6;
- (void)dismissWithUserInfo:(id)a3;
- (void)inviteController:(id)a3 didFinishWithStatus:(unint64_t)a4 recipients:(id)a5 userInfo:(id)a6 error:(id)a7;
- (void)inviteControllerDidEndAsyncLoading:(id)a3;
- (void)inviteControllerDidStartAsyncLoading:(id)a3;
- (void)processElement:(id)a3 attributes:(id)a4 objectModel:(id)a5 completion:(id)a6;
- (void)processObjectModel:(id)a3 completion:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setObjectModel:(id)a3;
- (void)setRemoteUIDelegate:(id)a3;
- (void)setServerHookResponse:(id)a3;
@end

@implementation FAInvokeMessageHook

- (BOOL)shouldMatchElement:(id)a3
{
  v4 = [a3 name];
  LOBYTE(self) = [(FAInvokeMessageHook *)self transportWithActionString:v4] != -1;

  return (char)self;
}

- (BOOL)shouldMatchModel:(id)a3
{
  v4 = [a3 clientInfo];
  v5 = [v4 objectForKeyedSubscript:*MEMORY[0x263F25C10]];

  LOBYTE(self) = [(FAInvokeMessageHook *)self transportWithActionString:v5] != -1;
  return (char)self;
}

- (int64_t)transportWithActionString:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"family:iMessageInvite"])
  {
    int64_t v4 = 0;
  }
  else if ([v3 isEqualToString:@"family:shareSheetInvite"])
  {
    int64_t v4 = 1;
  }
  else
  {
    int64_t v4 = -1;
  }

  return v4;
}

- (void)processElement:(id)a3 attributes:(id)a4 objectModel:(id)a5 completion:(id)a6
{
  id v16 = a3;
  id v9 = a5;
  id v10 = a6;
  [v9 startActivityIndicator];
  v11 = [v16 identifier];

  if (v11)
  {
    v12 = [v9 visiblePage];
    v13 = [v16 identifier];
    v11 = [v12 viewForElementIdentifier:v13];
  }
  v14 = [v9 clientInfo];
  v15 = [v16 name];
  [(FAInvokeMessageHook *)self _presentMessagesInviteWithServerAttributes:v14 transport:[(FAInvokeMessageHook *)self transportWithActionString:v15] sourceView:v11 completion:v10];
}

- (void)processObjectModel:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__FAInvokeMessageHook_processObjectModel_completion___block_invoke;
  block[3] = &unk_264349B20;
  id v11 = v6;
  v12 = self;
  id v13 = v7;
  id v8 = v7;
  id v9 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __53__FAInvokeMessageHook_processObjectModel_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) startActivityIndicator];
  v2 = [*(id *)(a1 + 32) clientInfo];
  id v3 = [v2 objectForKeyedSubscript:@"sourceElement"];

  if (v3)
  {
    int64_t v4 = [*(id *)(a1 + 32) visiblePage];
    id v10 = [v4 viewForElementIdentifier:v3];
  }
  else
  {
    id v10 = 0;
  }
  v5 = *(void **)(a1 + 40);
  id v6 = [*(id *)(a1 + 32) clientInfo];
  id v7 = *(void **)(a1 + 40);
  id v8 = [*(id *)(a1 + 32) clientInfo];
  id v9 = [v8 objectForKeyedSubscript:*MEMORY[0x263F25C10]];
  objc_msgSend(v5, "_presentMessagesInviteWithServerAttributes:transport:sourceView:completion:", v6, objc_msgSend(v7, "transportWithActionString:", v9), v10, *(void *)(a1 + 48));
}

- (void)_presentMessagesInviteWithServerAttributes:(id)a3 transport:(int64_t)a4 sourceView:(id)a5 completion:(id)a6
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a6;
  id v11 = _FALogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2189F0000, v11, OS_LOG_TYPE_DEFAULT, "Present messsage invite triggered", buf, 2u);
  }

  v12 = _FALogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v26 = v9;
    _os_log_impl(&dword_2189F0000, v12, OS_LOG_TYPE_DEFAULT, "Attributes - %@", buf, 0xCu);
  }

  id v13 = (void *)[objc_alloc(MEMORY[0x263F3BF70]) initWithResults:v9];
  v14 = (void *)[v10 copy];
  id completion = self->_completion;
  self->_id completion = v14;

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __98__FAInvokeMessageHook__presentMessagesInviteWithServerAttributes_transport_sourceView_completion___block_invoke;
  block[3] = &unk_26434A060;
  id v23 = v10;
  int64_t v24 = a4;
  id v20 = v13;
  v21 = self;
  id v22 = v9;
  id v16 = v10;
  id v17 = v9;
  id v18 = v13;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __98__FAInvokeMessageHook__presentMessagesInviteWithServerAttributes_transport_sourceView_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 64);
  switch(v2)
  {
    case -1:
      v12 = _FALogSystem();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        id v13 = "Device unknown transport messages";
LABEL_11:
        _os_log_impl(&dword_2189F0000, v12, OS_LOG_TYPE_DEFAULT, v13, buf, 2u);
      }
LABEL_12:

      uint64_t v21 = *(void *)(a1 + 56);
      id v22 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F3BDB8] code:-1000 userInfo:0];
      (*(void (**)(uint64_t, void, void *))(v21 + 16))(v21, 0, v22);

      break;
    case 0:
      if (+[FAMessagesInviteConfigurationController isAvailable])
      {
        v14 = [FAMessagesInviteConfigurationController alloc];
        uint64_t v15 = *(void *)(a1 + 32);
        id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 40));
        id v17 = [WeakRetained presentationContextForHook:*(void *)(a1 + 40)];
        uint64_t v18 = [(FAMessagesInviteConfigurationController *)v14 initWithInviteContext:v15 presentingController:v17];
        uint64_t v19 = *(void *)(a1 + 40);
        id v20 = *(void **)(v19 + 8);
        *(void *)(v19 + 8) = v18;

        break;
      }
      v12 = _FALogSystem();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        id v13 = "Device cannot send messages";
        goto LABEL_11;
      }
      goto LABEL_12;
    case 1:
      id v3 = +[FamilyInviteAnalytics shared];
      [v3 sendTapInviteOthersEvent];

      int64_t v4 = [FAShareSheetInviteConfigurationController alloc];
      uint64_t v5 = *(void *)(a1 + 32);
      id v6 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 40));
      id v7 = [v6 presentationContextForHook:*(void *)(a1 + 40)];
      id v8 = [(FAShareSheetInviteConfigurationController *)v4 initWithInviteContext:v5 presentingController:v7];

      id v9 = [*(id *)(a1 + 48) objectForKeyedSubscript:@"alwaysNotifyServer"];
      -[FAShareSheetInviteConfigurationController setAlwaysNotifyServer:](v8, "setAlwaysNotifyServer:", [v9 BOOLValue]);

      uint64_t v10 = *(void *)(a1 + 40);
      id v11 = *(void **)(v10 + 8);
      *(void *)(v10 + 8) = v8;

      break;
  }
  objc_msgSend(*(id *)(*(void *)(a1 + 40) + 8), "setDelegate:");
  uint64_t v23 = *(void *)(a1 + 40);
  int64_t v24 = *(void **)(v23 + 8);
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __98__FAInvokeMessageHook__presentMessagesInviteWithServerAttributes_transport_sourceView_completion___block_invoke_39;
  v25[3] = &unk_26434A038;
  v25[4] = v23;
  id v26 = *(id *)(a1 + 56);
  [v24 presentWhenReadyWithCompletion:v25];
}

void __98__FAInvokeMessageHook__presentMessagesInviteWithServerAttributes_transport_sourceView_completion___block_invoke_39(uint64_t a1, char a2, void *a3)
{
  id v6 = a3;
  uint64_t v5 = [*(id *)(a1 + 32) objectModel];
  [v5 stopActivityIndicator];

  if ((a2 & 1) == 0) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (id)_stringForCompletionStatus:(unint64_t)a3
{
  if (a3 > 2) {
    return 0;
  }
  else {
    return off_26434A080[a3];
  }
}

- (void)inviteController:(id)a3 didFinishWithStatus:(unint64_t)a4 recipients:(id)a5 userInfo:(id)a6 error:(id)a7
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v11 = a5;
  id v12 = a6;
  id v13 = a7;
  v14 = _FALogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v26 = 134217984;
    unint64_t v27 = a4;
    _os_log_impl(&dword_2189F0000, v14, OS_LOG_TYPE_DEFAULT, "Message Invite Controller did finish with status: %lu", (uint8_t *)&v26, 0xCu);
  }

  uint64_t v15 = _FALogSystem();
  BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
  if (v11)
  {
    if (v16)
    {
      int v26 = 138412290;
      unint64_t v27 = (unint64_t)v11;
      _os_log_impl(&dword_2189F0000, v15, OS_LOG_TYPE_DEFAULT, "Recipient key is not nil %@", (uint8_t *)&v26, 0xCu);
    }

    id v17 = +[FamilyInviteAnalytics shared];
    uint64_t v18 = [v12 objectForKeyedSubscript:*MEMORY[0x263F3BDF8]];
    [v17 sendOtherContactInvitedEventWithInviteTransport:v18 inviteCompletionStatus:a4];

    uint64_t v19 = [MEMORY[0x263EFF9A0] dictionary];
    uint64_t v15 = v19;
    if (v12) {
      [v19 addEntriesFromDictionary:v12];
    }
    id v20 = [(FAInvokeMessageHook *)self _stringForCompletionStatus:a4];
    [v15 setObject:v20 forKeyedSubscript:*MEMORY[0x263F3BDF0]];

    [v15 setObject:v11 forKeyedSubscript:*MEMORY[0x263F3BDE8]];
    uint64_t v21 = (RUIServerHookResponse *)objc_alloc_init(MEMORY[0x263F637C8]);
    serverHookResponse = self->_serverHookResponse;
    self->_serverHookResponse = v21;

    id v23 = [v15 copy];
    [(RUIServerHookResponse *)self->_serverHookResponse setAdditionalPayload:v23];

    id completion = (void (**)(id, BOOL, id))self->_completion;
    if (completion)
    {
      completion[2](completion, a4 == 1, v13);
      id v25 = self->_completion;
      self->_id completion = 0;
    }
  }
  else if (v16)
  {
    LOWORD(v26) = 0;
    _os_log_impl(&dword_2189F0000, v15, OS_LOG_TYPE_DEFAULT, "Recipient key is nil, not sending the invite details to the server", (uint8_t *)&v26, 2u);
  }
}

- (void)inviteControllerDidStartAsyncLoading:(id)a3
{
  id v3 = [(FAInvokeMessageHook *)self objectModel];
  [v3 startActivityIndicator];
}

- (void)inviteControllerDidEndAsyncLoading:(id)a3
{
  id v3 = [(FAInvokeMessageHook *)self objectModel];
  [v3 stopActivityIndicator];
}

- (void)dismissWithUserInfo:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(FAInvokeMessageHook *)self remoteUIDelegate];
  [v5 setDismissInfo:v4];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v6 = [WeakRetained presentationContextForHook:self];
  [v6 dismissViewControllerAnimated:1 completion:0];
}

- (RUIObjectModel)objectModel
{
  return self->_objectModel;
}

- (void)setObjectModel:(id)a3
{
}

- (RUIServerHookDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (RUIServerHookDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (RUIServerHookResponse)serverHookResponse
{
  return self->_serverHookResponse;
}

- (void)setServerHookResponse:(id)a3
{
}

- (FACircleRemoteUIDelegate)remoteUIDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_remoteUIDelegate);
  return (FACircleRemoteUIDelegate *)WeakRetained;
}

- (void)setRemoteUIDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_remoteUIDelegate);
  objc_storeStrong((id *)&self->_serverHookResponse, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_objectModel, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_testContext, 0);
  objc_storeStrong((id *)&self->_messageConfigurationController, 0);
}

@end
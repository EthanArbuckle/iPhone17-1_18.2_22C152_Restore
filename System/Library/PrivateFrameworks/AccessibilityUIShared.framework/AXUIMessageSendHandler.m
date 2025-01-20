@interface AXUIMessageSendHandler
- (AXUIMessageSendHandler)initWithMessageSender:(id)a3 delegate:(id)a4;
- (AXUIMessageSender)messageSender;
- (AXUIMessageSenderDelegate)delegate;
- (id)completion;
- (unint64_t)remainingAttempts;
- (void)_sendMessage:(id)a3 context:(void *)a4 previousError:(id)a5;
- (void)sendXPCMessage:(id)a3 context:(void *)a4 completion:(id)a5;
- (void)setCompletion:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setMessageSender:(id)a3;
- (void)setRemainingAttempts:(unint64_t)a3;
- (void)stopSendingXPCMessage;
@end

@implementation AXUIMessageSendHandler

- (AXUIMessageSendHandler)initWithMessageSender:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)AXUIMessageSendHandler;
  v8 = [(AXUIMessageSendHandler *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_messageSender, v6);
    objc_storeWeak((id *)&v9->_delegate, v7);
  }

  return v9;
}

- (void)sendXPCMessage:(id)a3 context:(void *)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  [(AXUIMessageSendHandler *)self setRemainingAttempts:10];
  [(AXUIMessageSendHandler *)self setCompletion:v8];

  [(AXUIMessageSendHandler *)self _sendMessage:v9 context:a4 previousError:0];
}

- (void)stopSendingXPCMessage
{
  [(AXUIMessageSendHandler *)self setRemainingAttempts:0];
  [(AXUIMessageSendHandler *)self setCompletion:0];
  [(AXUIMessageSendHandler *)self setMessageSender:0];

  [(AXUIMessageSendHandler *)self setDelegate:0];
}

- (void)_sendMessage:(id)a3 context:(void *)a4 previousError:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if ([(AXUIMessageSendHandler *)self remainingAttempts])
  {
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __61__AXUIMessageSendHandler__sendMessage_context_previousError___block_invoke;
    v27[3] = &unk_2644B9870;
    v27[4] = self;
    id v10 = v8;
    id v28 = v10;
    v29 = a4;
    objc_super v11 = (void (**)(void, void))MEMORY[0x223C2DC00](v27);
    v12 = [(AXUIMessageSendHandler *)self delegate];
    if (objc_opt_respondsToSelector())
    {
      v13 = [(AXUIMessageSendHandler *)self messageSender];
      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      v21[2] = __61__AXUIMessageSendHandler__sendMessage_context_previousError___block_invoke_6;
      v21[3] = &unk_2644B98C0;
      v26 = v11;
      id v22 = v10;
      id v23 = v12;
      v24 = self;
      id v25 = v9;
      [v23 messageSender:v13 accessLaunchAngelConnectionForMessageWithContext:a4 usingBlock:v21];

      v14 = v26;
    }
    else
    {
      v14 = objc_msgSend(MEMORY[0x263F087E8], "ax_errorWithDomain:description:", @"AXUIErrorDomainCommunication", @"Failed to establish connection to the %@.", @"Accessibility UI Server");
      ((void (**)(void, void *))v11)[2](v11, v14);
    }
  }
  else
  {
    v15 = [MEMORY[0x263F21408] dictionaryFromXPCMessage:v8 error:0];
    v16 = (void *)MEMORY[0x263F087E8];
    v17 = objc_msgSend(v9, "ax_nonRedundantDescription");
    v18 = objc_msgSend(v16, "ax_errorWithDomain:description:", @"AXUIErrorDomainCommunication", @"Failed to send message %@ to the %@. Last encountered error: %@.", v15, @"Accessibility UI Server", v17);

    v19 = [(AXUIMessageSendHandler *)self completion];

    if (v19)
    {
      v20 = [(AXUIMessageSendHandler *)self completion];
      ((void (**)(void, void, void, void *))v20)[2](v20, 0, 0, v18);
    }
  }
}

void __61__AXUIMessageSendHandler__sendMessage_context_previousError___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  v4 = AXLogIPC();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __61__AXUIMessageSendHandler__sendMessage_context_previousError___block_invoke_cold_1(v4);
  }

  v5 = [MEMORY[0x263F21380] backgroundAccessQueue];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __61__AXUIMessageSendHandler__sendMessage_context_previousError___block_invoke_1;
  v10[3] = &unk_2644B9848;
  id v6 = (void *)a1[5];
  v10[4] = a1[4];
  id v7 = v6;
  uint64_t v8 = a1[6];
  id v12 = v3;
  uint64_t v13 = v8;
  id v11 = v7;
  id v9 = v3;
  [v5 afterDelay:v10 processReadingBlock:0.05];
}

uint64_t __61__AXUIMessageSendHandler__sendMessage_context_previousError___block_invoke_1(uint64_t a1)
{
  v2 = AXLogIPC();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __61__AXUIMessageSendHandler__sendMessage_context_previousError___block_invoke_1_cold_1(a1, v2);
  }

  if ([*(id *)(a1 + 32) remainingAttempts]) {
    objc_msgSend(*(id *)(a1 + 32), "setRemainingAttempts:", objc_msgSend(*(id *)(a1 + 32), "remainingAttempts") - 1);
  }
  return [*(id *)(a1 + 32) _sendMessage:*(void *)(a1 + 40) context:*(void *)(a1 + 56) previousError:*(void *)(a1 + 48)];
}

void __61__AXUIMessageSendHandler__sendMessage_context_previousError___block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!v3)
  {
    v4 = AXLogIPC();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __96__AXUIMessageSender__sendLaunchAngelMessage_context_remainingAttempts_previousError_completion___block_invoke_3_cold_1(v4);
    }

    v5 = objc_msgSend(MEMORY[0x263F087E8], "ax_errorWithDomain:description:", @"AXUIErrorDomainCommunication", @"Received nil connection when trying to send board services message.");
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __61__AXUIMessageSendHandler__sendMessage_context_previousError___block_invoke_9;
  v10[3] = &unk_2644B9898;
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 48);
  id v9 = *(void **)(a1 + 56);
  id v11 = v7;
  uint64_t v12 = v8;
  id v13 = v9;
  id v14 = *(id *)(a1 + 64);
  [v3 sendBoardServiceMessage:v6 callback:v10];
}

void __61__AXUIMessageSendHandler__sendMessage_context_previousError___block_invoke_9(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!v5 || MEMORY[0x223C2DE20](v5) != MEMORY[0x263EF8708]) {
    goto LABEL_3;
  }
  size_t count = xpc_dictionary_get_count(v5);
  if (!count)
  {
    uint64_t v13 = 0;
    goto LABEL_22;
  }
  size_t v10 = count;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v25 = 0;
    id v11 = *(void **)(a1 + 32);
    uint64_t v12 = [*(id *)(a1 + 40) messageSender];
    uint64_t v13 = [v11 messageSender:v12 extractCustomDataFromXPCReply:v5 numberOfKeyValuePairsForCustomData:&v25];

    v10 -= v25;
  }
  else
  {
    uint64_t v13 = 0;
  }
  if (v10 == 2)
  {
    string = xpc_dictionary_get_string(v5, _AXUIMessageReplyKeyErrorDomain[0]);
    v16 = xpc_dictionary_get_string(v5, _AXUIMessageReplyKeyErrorDescription[0]);
    if (string)
    {
      v17 = v16;
      if (v16)
      {
        v18 = [*(id *)(a1 + 40) completion];

        if (!v18) {
          goto LABEL_7;
        }
        id v7 = (id)[[NSString alloc] initWithUTF8String:string];
        uint64_t v8 = (void *)[[NSString alloc] initWithUTF8String:v17];
        v19 = objc_msgSend(MEMORY[0x263F087E8], "ax_errorWithDomain:description:", v7, @"%@", v8);
        v20 = [*(id *)(a1 + 40) completion];
        ((void (**)(void, uint64_t, void, void *))v20)[2](v20, v13, 0, v19);

        goto LABEL_5;
      }
    }
LABEL_22:
    id v24 = 0;
    uint64_t v8 = [MEMORY[0x263F21408] dictionaryFromXPCMessage:v5 error:&v24];
    id v21 = v24;
    id v7 = v21;
    if (v8)
    {
      id v22 = [*(id *)(a1 + 40) completion];

      if (v22)
      {
        id v23 = [*(id *)(a1 + 40) completion];
        ((void (**)(void, uint64_t, void *, void))v23)[2](v23, v13, v8, 0);
      }
      goto LABEL_5;
    }
    if (v21)
    {
LABEL_4:
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
      uint64_t v8 = 0;
LABEL_5:

      goto LABEL_6;
    }
LABEL_3:
    id v7 = *(id *)(a1 + 48);
    goto LABEL_4;
  }
  if (v10 != 1 || !xpc_dictionary_get_BOOL(v5, _AXUIMessageReplyKeyDidSucceed[0])) {
    goto LABEL_22;
  }
  id v14 = [*(id *)(a1 + 40) completion];

  if (!v14) {
    goto LABEL_7;
  }
  id v7 = [*(id *)(a1 + 40) completion];
  (*((void (**)(id, uint64_t, void, void))v7 + 2))(v7, v13, 0, 0);
LABEL_6:

LABEL_7:
}

- (AXUIMessageSenderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AXUIMessageSenderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (AXUIMessageSender)messageSender
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_messageSender);

  return (AXUIMessageSender *)WeakRetained;
}

- (void)setMessageSender:(id)a3
{
}

- (unint64_t)remainingAttempts
{
  return self->_remainingAttempts;
}

- (void)setRemainingAttempts:(unint64_t)a3
{
  self->_remainingAttempts = a3;
}

- (id)completion
{
  return objc_getProperty(self, a2, 32, 1);
}

- (void)setCompletion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_destroyWeak((id *)&self->_messageSender);

  objc_destroyWeak((id *)&self->_delegate);
}

void __61__AXUIMessageSendHandler__sendMessage_context_previousError___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_21E675000, log, OS_LOG_TYPE_DEBUG, "AXUIMessageSendHandler will re-try sending a message", v1, 2u);
}

void __61__AXUIMessageSendHandler__sendMessage_context_previousError___block_invoke_1_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v3 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "remainingAttempts"));
  int v4 = 138412290;
  id v5 = v3;
  _os_log_debug_impl(&dword_21E675000, a2, OS_LOG_TYPE_DEBUG, "AXUIMessageSendHandler remainingAttempts: %@", (uint8_t *)&v4, 0xCu);
}

@end
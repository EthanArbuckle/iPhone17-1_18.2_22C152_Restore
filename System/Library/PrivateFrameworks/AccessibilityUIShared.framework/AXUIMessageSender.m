@interface AXUIMessageSender
- (AXAccessQueue)messageSchedulingSerializationQueue;
- (AXDispatchTimer)sendingTimer;
- (AXUIMessageSender)init;
- (AXUIMessageSenderDelegate)delegate;
- (BOOL)isSendingMessage;
- (NSMutableArray)messageQueue;
- (id)sendSynchronousMessage:(id)a3 withIdentifier:(unint64_t)a4 context:(void *)a5 error:(id *)a6;
- (os_unfair_lock_s)delegateAccessLock;
- (void)_didFinishSendingXPCMessage:(id)a3 replyCustomData:(void *)a4;
- (void)_performBlock:(id)a3 inAccessQueue:(id)a4 treatAsWritingBlock:(BOOL)a5;
- (void)_sendLaunchAngelMessage:(id)a3 context:(void *)a4 remainingAttempts:(unint64_t)a5 previousError:(id)a6 completion:(id)a7;
- (void)_sendXPCMessage:(id)a3 context:(void *)a4 completionBlock:(id)a5 completionRequiresWritingBlock:(BOOL)a6 targetAccessQueue:(id)a7 timeout:(double)a8;
- (void)sendAsynchronousMessage:(id)a3 withIdentifier:(unint64_t)a4 context:(void *)a5 targetAccessQueue:(id)a6 completionRequiresWritingBlock:(BOOL)a7 completion:(id)a8;
- (void)sendAsynchronousMessage:(id)a3 withIdentifier:(unint64_t)a4 context:(void *)a5 targetAccessQueue:(id)a6 completionRequiresWritingBlock:(BOOL)a7 completion:(id)a8 timeout:(double)a9;
- (void)setDelegate:(id)a3;
- (void)setDelegateAccessLock:(os_unfair_lock_s)a3;
- (void)setMessageQueue:(id)a3;
- (void)setMessageSchedulingSerializationQueue:(id)a3;
- (void)setSendingMessage:(BOOL)a3;
- (void)setSendingTimer:(id)a3;
@end

@implementation AXUIMessageSender

- (AXUIMessageSender)init
{
  v6.receiver = self;
  v6.super_class = (Class)AXUIMessageSender;
  v2 = [(AXUIMessageSender *)&v6 init];
  v3 = v2;
  if (v2)
  {
    [(AXUIMessageSender *)v2 setDelegateAccessLock:0];
    v4 = (void *)[objc_alloc(MEMORY[0x263F21380]) initWithParentClass:objc_opt_class() description:@"MessageSchedulingSerializationQueue" appendUUIDToLabel:1];
    if (v4)
    {
      [(AXUIMessageSender *)v3 setMessageSchedulingSerializationQueue:v4];
    }
    else
    {

      v3 = 0;
    }
  }
  return v3;
}

- (AXUIMessageSenderDelegate)delegate
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x3032000000;
  v7 = __Block_byref_object_copy_;
  v8 = __Block_byref_object_dispose_;
  id v9 = 0;
  AX_PERFORM_WITH_LOCK();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (AXUIMessageSenderDelegate *)v2;
}

uint64_t __29__AXUIMessageSender_delegate__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));

  return MEMORY[0x270F9A758]();
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  AX_PERFORM_WITH_LOCK();
}

id __33__AXUIMessageSender_setDelegate___block_invoke(uint64_t a1)
{
  return objc_storeWeak((id *)(*(void *)(a1 + 32) + 16), *(id *)(a1 + 40));
}

- (void)_sendLaunchAngelMessage:(id)a3 context:(void *)a4 remainingAttempts:(unint64_t)a5 previousError:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  if (a5)
  {
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = __96__AXUIMessageSender__sendLaunchAngelMessage_context_remainingAttempts_previousError_completion___block_invoke;
    v31[3] = &unk_2644B9690;
    v31[4] = self;
    id v15 = v12;
    id v32 = v15;
    v34 = a4;
    unint64_t v35 = a5;
    id v16 = v14;
    id v33 = v16;
    v17 = (void (**)(void, void))MEMORY[0x223C2DC00](v31);
    v18 = [(AXUIMessageSender *)self delegate];
    if (objc_opt_respondsToSelector())
    {
      v24[0] = MEMORY[0x263EF8330];
      v24[1] = 3221225472;
      v24[2] = __96__AXUIMessageSender__sendLaunchAngelMessage_context_remainingAttempts_previousError_completion___block_invoke_3;
      v24[3] = &unk_2644B96E0;
      v29 = v17;
      id v25 = v15;
      id v26 = v18;
      v27 = self;
      id v30 = v16;
      id v28 = v13;
      [v26 messageSender:self accessLaunchAngelConnectionForMessageWithContext:a4 usingBlock:v24];

      v19 = v29;
    }
    else
    {
      v19 = objc_msgSend(MEMORY[0x263F087E8], "ax_errorWithDomain:description:", @"AXUIErrorDomainCommunication", @"Failed to establish connection to the %@.", @"Accessibility UI Server");
      ((void (**)(void, void *))v17)[2](v17, v19);
    }
  }
  else
  {
    v20 = [MEMORY[0x263F21408] dictionaryFromXPCMessage:v12 error:0];
    v21 = (void *)MEMORY[0x263F087E8];
    v22 = objc_msgSend(v13, "ax_nonRedundantDescription");
    v23 = objc_msgSend(v21, "ax_errorWithDomain:description:", @"AXUIErrorDomainCommunication", @"Failed to send message %@ to the %@. Last encountered error: %@.", v20, @"Accessibility UI Server", v22);

    (*((void (**)(id, void, void, void *))v14 + 2))(v14, 0, 0, v23);
  }
}

void __96__AXUIMessageSender__sendLaunchAngelMessage_context_remainingAttempts_previousError_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [MEMORY[0x263F21380] backgroundAccessQueue];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __96__AXUIMessageSender__sendLaunchAngelMessage_context_remainingAttempts_previousError_completion___block_invoke_2;
  v10[3] = &unk_2644B9668;
  v5 = *(void **)(a1 + 40);
  v10[4] = *(void *)(a1 + 32);
  id v6 = v5;
  uint64_t v14 = *(void *)(a1 + 64);
  id v11 = v6;
  id v12 = v3;
  long long v9 = *(_OWORD *)(a1 + 48);
  id v7 = (id)v9;
  long long v13 = v9;
  id v8 = v3;
  [v4 afterDelay:v10 processReadingBlock:0.05];
}

uint64_t __96__AXUIMessageSender__sendLaunchAngelMessage_context_remainingAttempts_previousError_completion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendLaunchAngelMessage:*(void *)(a1 + 40) context:*(void *)(a1 + 64) remainingAttempts:*(void *)(a1 + 72) - 1 previousError:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
}

void __96__AXUIMessageSender__sendLaunchAngelMessage_context_remainingAttempts_previousError_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!v3)
  {
    id v4 = AXLogIPC();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __96__AXUIMessageSender__sendLaunchAngelMessage_context_remainingAttempts_previousError_completion___block_invoke_3_cold_1(v4);
    }

    v5 = objc_msgSend(MEMORY[0x263F087E8], "ax_errorWithDomain:description:", @"AXUIErrorDomainCommunication", @"Received nil connection when trying to send board services message.");
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __96__AXUIMessageSender__sendLaunchAngelMessage_context_remainingAttempts_previousError_completion___block_invoke_9;
  v9[3] = &unk_2644B96B8;
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 48);
  id v10 = v7;
  uint64_t v11 = v8;
  id v13 = *(id *)(a1 + 72);
  id v12 = *(id *)(a1 + 56);
  id v14 = *(id *)(a1 + 64);
  [v3 sendBoardServiceMessage:v6 callback:v9];
}

void __96__AXUIMessageSender__sendLaunchAngelMessage_context_remainingAttempts_previousError_completion___block_invoke_9(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!v5 || MEMORY[0x223C2DE20](v5) != MEMORY[0x263EF8708]) {
    goto LABEL_3;
  }
  size_t count = xpc_dictionary_get_count(v5);
  if (!count)
  {
    uint64_t v11 = 0;
    goto LABEL_21;
  }
  size_t v10 = count;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v22 = 0;
    uint64_t v11 = [*(id *)(a1 + 32) messageSender:*(void *)(a1 + 40) extractCustomDataFromXPCReply:v5 numberOfKeyValuePairsForCustomData:&v22];
    v10 -= v22;
  }
  else
  {
    uint64_t v11 = 0;
  }
  if (v10 != 2)
  {
    if (v10 == 1 && xpc_dictionary_get_BOOL(v5, _AXUIMessageReplyKeyDidSucceed[0]))
    {
      uint64_t v12 = *(void *)(a1 + 56);
      if (v12) {
        (*(void (**)(uint64_t, uint64_t, void, void))(v12 + 16))(v12, v11, 0, 0);
      }
      goto LABEL_6;
    }
LABEL_21:
    id v21 = 0;
    uint64_t v8 = [MEMORY[0x263F21408] dictionaryFromXPCMessage:v5 error:&v21];
    id v19 = v21;
    id v7 = v19;
    if (v8)
    {
      uint64_t v20 = *(void *)(a1 + 56);
      if (v20) {
        (*(void (**)(uint64_t, uint64_t, void *, void))(v20 + 16))(v20, v11, v8, 0);
      }
      goto LABEL_5;
    }
    if (v19)
    {
LABEL_4:
      (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
      uint64_t v8 = 0;
LABEL_5:

      goto LABEL_6;
    }
LABEL_3:
    id v7 = *(id *)(a1 + 48);
    goto LABEL_4;
  }
  string = xpc_dictionary_get_string(v5, _AXUIMessageReplyKeyErrorDomain[0]);
  id v14 = xpc_dictionary_get_string(v5, _AXUIMessageReplyKeyErrorDescription[0]);
  if (!string) {
    goto LABEL_21;
  }
  id v15 = v14;
  if (!v14) {
    goto LABEL_21;
  }
  if (*(void *)(a1 + 56))
  {
    id v16 = (void *)[[NSString alloc] initWithUTF8String:string];
    v17 = (void *)[[NSString alloc] initWithUTF8String:v15];
    v18 = objc_msgSend(MEMORY[0x263F087E8], "ax_errorWithDomain:description:", v16, @"%@", v17);
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
LABEL_6:
}

- (void)_didFinishSendingXPCMessage:(id)a3 replyCustomData:(void *)a4
{
  id v6 = a3;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy_;
  id v19 = __Block_byref_object_dispose_;
  id v20 = 0;
  id v7 = [(AXUIMessageSender *)self messageSchedulingSerializationQueue];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __65__AXUIMessageSender__didFinishSendingXPCMessage_replyCustomData___block_invoke;
  v14[3] = &unk_2644B9708;
  v14[5] = &v15;
  v14[6] = a4;
  v14[4] = self;
  [v7 performSynchronousWritingBlock:v14];

  uint64_t v8 = (void *)v16[5];
  if (v8)
  {
    long long v9 = [v8 xpcMessage];
    uint64_t v10 = [(id)v16[5] context];
    uint64_t v11 = [(id)v16[5] completion];
    uint64_t v12 = [(id)v16[5] completionRequiresWritingBlock];
    id v13 = [(id)v16[5] targetAccessQueue];
    [(id)v16[5] timeout];
    -[AXUIMessageSender _sendXPCMessage:context:completionBlock:completionRequiresWritingBlock:targetAccessQueue:timeout:](self, "_sendXPCMessage:context:completionBlock:completionRequiresWritingBlock:targetAccessQueue:timeout:", v9, v10, v11, v12, v13);
  }
  _Block_object_dispose(&v15, 8);
}

void __65__AXUIMessageSender__didFinishSendingXPCMessage_replyCustomData___block_invoke(uint64_t a1)
{
  id v11 = [*(id *)(a1 + 32) delegate];
  if (objc_opt_respondsToSelector()) {
    [v11 messageSender:*(void *)(a1 + 32) processCustomDataFromXPCReply:*(void *)(a1 + 48)];
  }
  id v2 = [*(id *)(a1 + 32) messageQueue];
  uint64_t v3 = [v2 count];
  if (v3)
  {
    uint64_t v4 = v3;
    id v5 = (void *)MEMORY[0x223C2DA50]();
    uint64_t v6 = objc_msgSend(v2, "ax_dequeueObject");
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    if (objc_opt_respondsToSelector())
    {
      uint64_t v9 = *(void *)(a1 + 32);
      uint64_t v10 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) xpcMessage];
      objc_msgSend(v11, "messageSender:willSendXPCMessage:context:", v9, v10, objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "context"));
    }
    if (v4 == 1) {
      [*(id *)(a1 + 32) setMessageQueue:0];
    }
  }
  else
  {
    [*(id *)(a1 + 32) setSendingMessage:0];
  }
}

- (void)_sendXPCMessage:(id)a3 context:(void *)a4 completionBlock:(id)a5 completionRequiresWritingBlock:(BOOL)a6 targetAccessQueue:(id)a7 timeout:(double)a8
{
  id v14 = a3;
  id v15 = a5;
  id v16 = a7;
  v44[0] = MEMORY[0x263EF8330];
  v44[1] = 3221225472;
  v44[2] = __118__AXUIMessageSender__sendXPCMessage_context_completionBlock_completionRequiresWritingBlock_targetAccessQueue_timeout___block_invoke;
  v44[3] = &unk_2644B9758;
  v44[4] = self;
  id v17 = v14;
  id v45 = v17;
  id v18 = v15;
  id v47 = v18;
  id v19 = v16;
  id v46 = v19;
  BOOL v48 = a6;
  id v20 = (void *)MEMORY[0x223C2DC00](v44);
  sendingTimer = self->_sendingTimer;
  if (a8 <= 0.0)
  {
    if (sendingTimer)
    {
      v34 = AXLogIPC();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21E675000, v34, OS_LOG_TYPE_DEFAULT, "Error: sendingTimer should be nil", buf, 2u);
      }

      [(AXDispatchTimer *)self->_sendingTimer cancel];
      unint64_t v35 = self->_sendingTimer;
      self->_sendingTimer = 0;
    }
    v36[0] = MEMORY[0x263EF8330];
    v36[1] = 3221225472;
    v36[2] = __118__AXUIMessageSender__sendXPCMessage_context_completionBlock_completionRequiresWritingBlock_targetAccessQueue_timeout___block_invoke_43;
    v36[3] = &unk_2644B97D0;
    v37 = v20;
    id v33 = v20;
    [(AXUIMessageSender *)self _sendXPCMessage:v17 context:a4 remainingAttempts:10 previousError:0 completion:v36];
    id v32 = v37;
  }
  else
  {
    if (sendingTimer)
    {
      uint64_t v22 = AXLogIPC();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21E675000, v22, OS_LOG_TYPE_DEFAULT, "Error: sendingTimer should be nil", buf, 2u);
      }

      [(AXDispatchTimer *)self->_sendingTimer cancel];
      v23 = self->_sendingTimer;
      self->_sendingTimer = 0;
    }
    id v24 = objc_alloc(MEMORY[0x263F21398]);
    id v25 = (void *)[v24 initWithTargetSerialQueue:MEMORY[0x263EF83A0]];
    [(AXUIMessageSender *)self setSendingTimer:v25];

    id v26 = AXLogIPC();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
      -[AXUIMessageSender _sendXPCMessage:context:completionBlock:completionRequiresWritingBlock:targetAccessQueue:timeout:](v26);
    }

    v27 = [AXUIMessageSendHandler alloc];
    id v28 = [(AXUIMessageSender *)self delegate];
    v29 = [(AXUIMessageSendHandler *)v27 initWithMessageSender:self delegate:v28];

    v41[0] = MEMORY[0x263EF8330];
    v41[1] = 3221225472;
    v41[2] = __118__AXUIMessageSender__sendXPCMessage_context_completionBlock_completionRequiresWritingBlock_targetAccessQueue_timeout___block_invoke_34;
    v41[3] = &unk_2644B9780;
    v41[4] = self;
    id v30 = v20;
    id v42 = v30;
    [(AXUIMessageSendHandler *)v29 sendXPCMessage:v17 context:a4 completion:v41];
    v31 = [(AXUIMessageSender *)self sendingTimer];
    v38[0] = MEMORY[0x263EF8330];
    v38[1] = 3221225472;
    v38[2] = __118__AXUIMessageSender__sendXPCMessage_context_completionBlock_completionRequiresWritingBlock_targetAccessQueue_timeout___block_invoke_35;
    v38[3] = &unk_2644B97A8;
    v38[4] = self;
    v39 = v29;
    id v40 = v30;
    id v32 = v30;
    id v33 = v29;
    [v31 afterDelay:v38 processBlock:a8];
  }
}

void __118__AXUIMessageSender__sendXPCMessage_context_completionBlock_completionRequiresWritingBlock_targetAccessQueue_timeout___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    uint64_t v9 = AXLogIPC();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __118__AXUIMessageSender__sendXPCMessage_context_completionBlock_completionRequiresWritingBlock_targetAccessQueue_timeout___block_invoke_cold_1();
    }
  }
  [*(id *)(a1 + 32) _didFinishSendingXPCMessage:*(void *)(a1 + 40) replyCustomData:a2];
  uint64_t v10 = *(void **)(a1 + 56);
  if (v10)
  {
    id v11 = *(void **)(a1 + 32);
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __118__AXUIMessageSender__sendXPCMessage_context_completionBlock_completionRequiresWritingBlock_targetAccessQueue_timeout___block_invoke_29;
    v12[3] = &unk_2644B9730;
    id v15 = v10;
    id v13 = v7;
    id v14 = v8;
    [v11 _performBlock:v12 inAccessQueue:*(void *)(a1 + 48) treatAsWritingBlock:*(unsigned __int8 *)(a1 + 64)];
  }
}

uint64_t __118__AXUIMessageSender__sendXPCMessage_context_completionBlock_completionRequiresWritingBlock_targetAccessQueue_timeout___block_invoke_29(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __118__AXUIMessageSender__sendXPCMessage_context_completionBlock_completionRequiresWritingBlock_targetAccessQueue_timeout___block_invoke_34(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a4;
  id v7 = a3;
  id v8 = AXLogIPC();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    __118__AXUIMessageSender__sendXPCMessage_context_completionBlock_completionRequiresWritingBlock_targetAccessQueue_timeout___block_invoke_34_cold_1();
  }

  uint64_t v9 = [*(id *)(a1 + 32) sendingTimer];
  [v9 cancel];

  [*(id *)(a1 + 32) setSendingTimer:0];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __118__AXUIMessageSender__sendXPCMessage_context_completionBlock_completionRequiresWritingBlock_targetAccessQueue_timeout___block_invoke_35(uint64_t a1)
{
  v8[1] = *MEMORY[0x263EF8340];
  id v2 = AXLogIPC();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_21E675000, v2, OS_LOG_TYPE_DEFAULT, "Error: Sending message timeout, timer fired", v6, 2u);
  }

  [*(id *)(a1 + 32) setSendingTimer:0];
  uint64_t v3 = (void *)MEMORY[0x263F087E8];
  uint64_t v7 = *MEMORY[0x263F08320];
  v8[0] = @"Sending message timeout";
  uint64_t v4 = [NSDictionary dictionaryWithObjects:v8 forKeys:&v7 count:1];
  id v5 = [v3 errorWithDomain:@"AXUIMessageSenderXPC" code:0 userInfo:v4];

  [*(id *)(a1 + 40) stopSendingXPCMessage];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

uint64_t __118__AXUIMessageSender__sendXPCMessage_context_completionBlock_completionRequiresWritingBlock_targetAccessQueue_timeout___block_invoke_43(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_performBlock:(id)a3 inAccessQueue:(id)a4 treatAsWritingBlock:(BOOL)a5
{
  if (a5) {
    [a4 performAsynchronousWritingBlock:a3];
  }
  else {
    [a4 performAsynchronousReadingBlock:a3];
  }
}

- (void)sendAsynchronousMessage:(id)a3 withIdentifier:(unint64_t)a4 context:(void *)a5 targetAccessQueue:(id)a6 completionRequiresWritingBlock:(BOOL)a7 completion:(id)a8
{
}

- (void)sendAsynchronousMessage:(id)a3 withIdentifier:(unint64_t)a4 context:(void *)a5 targetAccessQueue:(id)a6 completionRequiresWritingBlock:(BOOL)a7 completion:(id)a8 timeout:(double)a9
{
  BOOL v27 = a7;
  id v14 = a3;
  id v15 = a6;
  id v16 = a8;
  id v17 = (void (**)(void, void, void))v16;
  if (!v15 && v16)
  {
    id v18 = AXLogUI();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
      -[AXUIMessageSender sendAsynchronousMessage:withIdentifier:context:targetAccessQueue:completionRequiresWritingBlock:completion:timeout:](v18);
    }
  }
  if (v14)
  {
    v40[0] = 0;
    xpc_object_t v19 = (xpc_object_t)[MEMORY[0x263F21408] copyXPCMessageFromDictionary:v14 inReplyToXPCMessage:0 error:v40];
    id v20 = v40[0];
    if (v20)
    {
      id v21 = AXLogUI();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
        -[AXUIMessageSender sendAsynchronousMessage:withIdentifier:context:targetAccessQueue:completionRequiresWritingBlock:completion:timeout:]();
      }
    }
    if (v19) {
      goto LABEL_12;
    }
  }
  else
  {
    xpc_object_t v19 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_BOOL(v19, _AXUIServiceMessageKeyMessageWasEmpty[0], 1);
    id v20 = 0;
    if (v19)
    {
LABEL_12:
      xpc_dictionary_set_uint64(v19, _AXUIServiceMessageKeyMessageIdentifier[0], a4);
      uint64_t v36 = 0;
      v37 = &v36;
      uint64_t v38 = 0x2020000000;
      char v39 = 0;
      uint64_t v22 = [(AXUIMessageSender *)self messageSchedulingSerializationQueue];
      v28[0] = MEMORY[0x263EF8330];
      v28[1] = 3221225472;
      v28[2] = __136__AXUIMessageSender_sendAsynchronousMessage_withIdentifier_context_targetAccessQueue_completionRequiresWritingBlock_completion_timeout___block_invoke;
      v28[3] = &unk_2644B97F8;
      id v32 = &v36;
      v28[4] = self;
      id v23 = v19;
      id v29 = v23;
      id v33 = a5;
      id v24 = v15;
      id v30 = v24;
      BOOL v35 = v27;
      id v25 = v17;
      id v31 = v25;
      double v34 = a9;
      [v22 performSynchronousWritingBlock:v28];

      if (*((unsigned char *)v37 + 24)) {
        [(AXUIMessageSender *)self _sendXPCMessage:v23 context:a5 completionBlock:v25 completionRequiresWritingBlock:v27 targetAccessQueue:v24 timeout:a9];
      }

      _Block_object_dispose(&v36, 8);
      goto LABEL_20;
    }
  }
  if (v17)
  {
    if (!v20)
    {
      objc_msgSend(MEMORY[0x263F087E8], "ax_errorWithDomain:description:", @"AXUIErrorDomainCommunication", @"Failed to convert message %@ to its XPC representation.", v14);
      id v20 = (id)objc_claimAutoreleasedReturnValue();
    }
    ((void (**)(void, void, id))v17)[2](v17, 0, v20);
  }
LABEL_20:
}

void __136__AXUIMessageSender_sendAsynchronousMessage_withIdentifier_context_targetAccessQueue_completionRequiresWritingBlock_completion_timeout___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [*(id *)(a1 + 32) isSendingMessage] ^ 1;
  id v2 = *(void **)(a1 + 32);
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
  {
    id v4 = [v2 delegate];
    if (objc_opt_respondsToSelector()) {
      [v4 messageSender:*(void *)(a1 + 32) willSendXPCMessage:*(void *)(a1 + 40) context:*(void *)(a1 + 72)];
    }
    [*(id *)(a1 + 32) setSendingMessage:1];
  }
  else
  {
    id v4 = [v2 messageQueue];
    if (!v4)
    {
      id v4 = (id)objc_opt_new();
      objc_msgSend(*(id *)(a1 + 32), "setMessageQueue:");
    }
    uint64_t v3 = objc_opt_new();
    [v3 setXpcMessage:*(void *)(a1 + 40)];
    [v3 setContext:*(void *)(a1 + 72)];
    [v3 setTargetAccessQueue:*(void *)(a1 + 48)];
    [v3 setCompletionRequiresWritingBlock:*(unsigned __int8 *)(a1 + 88)];
    [v3 setCompletion:*(void *)(a1 + 56)];
    [v3 setTimeout:*(double *)(a1 + 80)];
    objc_msgSend(v4, "ax_enqueueObject:", v3);
  }
}

- (id)sendSynchronousMessage:(id)a3 withIdentifier:(unint64_t)a4 context:(void *)a5 error:(id *)a6
{
  id v10 = a3;
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x3032000000;
  id v25 = __Block_byref_object_copy_;
  id v26 = __Block_byref_object_dispose_;
  id v27 = 0;
  id v11 = (void *)[objc_alloc(MEMORY[0x263F21380]) initWithParentClass:objc_opt_class() description:@"SynchronousMessageSendTargetAccessQueue" appendUUIDToLabel:1];
  dispatch_semaphore_t v12 = dispatch_semaphore_create(0);
  dispatch_semaphore_t v13 = v12;
  if (v11) {
    BOOL v14 = v12 == 0;
  }
  else {
    BOOL v14 = 1;
  }
  if (v14)
  {
    if (a6)
    {
      objc_msgSend(MEMORY[0x263F087E8], "ax_errorWithDomain:description:", @"AXUIErrorDomainCommunication", @"Failed to initialize structures necessary for synchronous message send.");
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __73__AXUIMessageSender_sendSynchronousMessage_withIdentifier_context_error___block_invoke;
    v18[3] = &unk_2644B9820;
    id v20 = &v22;
    id v21 = a6;
    id v15 = v12;
    xpc_object_t v19 = v15;
    [(AXUIMessageSender *)self sendAsynchronousMessage:v10 withIdentifier:a4 context:a5 targetAccessQueue:v11 completionRequiresWritingBlock:1 completion:v18];
    dispatch_semaphore_wait(v15, 0xFFFFFFFFFFFFFFFFLL);
  }
  id v16 = (id)v23[5];

  _Block_object_dispose(&v22, 8);

  return v16;
}

void __73__AXUIMessageSender_sendSynchronousMessage_withIdentifier_context_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v6 = a3;
  uint64_t v7 = v6;
  if (*(void *)(a1 + 48)) {
    **(void **)(a1 + 48) = v6;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (NSMutableArray)messageQueue
{
  return self->_messageQueue;
}

- (void)setMessageQueue:(id)a3
{
}

- (AXAccessQueue)messageSchedulingSerializationQueue
{
  return self->_messageSchedulingSerializationQueue;
}

- (void)setMessageSchedulingSerializationQueue:(id)a3
{
}

- (BOOL)isSendingMessage
{
  return self->_sendingMessage;
}

- (void)setSendingMessage:(BOOL)a3
{
  self->_sendingMessage = a3;
}

- (AXDispatchTimer)sendingTimer
{
  return (AXDispatchTimer *)objc_getProperty(self, a2, 40, 1);
}

- (void)setSendingTimer:(id)a3
{
}

- (os_unfair_lock_s)delegateAccessLock
{
  return self->_delegateAccessLock;
}

- (void)setDelegateAccessLock:(os_unfair_lock_s)a3
{
  self->_delegateAccessLock = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sendingTimer, 0);
  objc_storeStrong((id *)&self->_messageSchedulingSerializationQueue, 0);
  objc_storeStrong((id *)&self->_messageQueue, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

void __96__AXUIMessageSender__sendLaunchAngelMessage_context_remainingAttempts_previousError_completion___block_invoke_3_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21E675000, log, OS_LOG_TYPE_ERROR, "Tried to send a launch angel message but the connection was nil", v1, 2u);
}

- (void)_sendXPCMessage:(NSObject *)a1 context:completionBlock:completionRequiresWritingBlock:targetAccessQueue:timeout:.cold.1(NSObject *a1)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  id v2 = [MEMORY[0x263F08B88] currentThread];
  OUTLINED_FUNCTION_0();
  _os_log_debug_impl(&dword_21E675000, a1, OS_LOG_TYPE_DEBUG, "AXUIMessageSender created timeout timer in thread: %@", v3, 0xCu);
}

void __118__AXUIMessageSender__sendXPCMessage_context_completionBlock_completionRequiresWritingBlock_targetAccessQueue_timeout___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_21E675000, v0, OS_LOG_TYPE_ERROR, "Error sending XPC message: %@", v1, 0xCu);
}

void __118__AXUIMessageSender__sendXPCMessage_context_completionBlock_completionRequiresWritingBlock_targetAccessQueue_timeout___block_invoke_34_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  _os_log_debug_impl(&dword_21E675000, v0, OS_LOG_TYPE_DEBUG, "Completed: Sending message, error: %@", v1, 0xCu);
}

- (void)sendAsynchronousMessage:withIdentifier:context:targetAccessQueue:completionRequiresWritingBlock:completion:timeout:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  _os_log_fault_impl(&dword_21E675000, v0, OS_LOG_TYPE_FAULT, "Problem making xpcMessage to send: %@", v1, 0xCu);
}

- (void)sendAsynchronousMessage:(os_log_t)log withIdentifier:context:targetAccessQueue:completionRequiresWritingBlock:completion:timeout:.cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_21E675000, log, OS_LOG_TYPE_FAULT, "A target access queue is required for sending an asynchronous message with a completion handler.", v1, 2u);
}

@end
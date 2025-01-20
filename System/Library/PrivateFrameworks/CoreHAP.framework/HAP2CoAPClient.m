@interface HAP2CoAPClient
- (BOOL)connected;
- (HAP2CoAPClient)initWithIPAddress:(id)a3;
- (HAP2CoAPClient)initWithIPAddress:(id)a3 port:(unsigned __int16)a4;
- (HAP2CoAPClient)initWithIPAddress:(id)a3 port:(unsigned __int16)a4 maxTransmitAttempts:(unint64_t)a5 initialACKTimeout:(double)a6;
- (HAP2CoAPClient)initWithIPAddress:(id)a3 port:(unsigned __int16)a4 maxTransmitAttempts:(unint64_t)a5 initialACKTimeout:(double)a6 workQueue:(id)a7;
- (HAP2CoAPClient)initWithSocketAddress:(const sockaddr *)a3;
- (HAP2CoAPClient)initWithSocketAddress:(const sockaddr *)a3 withAccessoryName:(id)a4 maxTransmitAttempts:(unint64_t)a5 initialACKTimeout:(double)a6;
- (HAP2CoAPClientDelegate)delegate;
- (char)_initWithIPAddress:(unsigned int)a3 port:(uint64_t)a4 maxTransmitAttempts:(void *)a5 initialACKTimeout:(double)a6 workQueue:;
- (char)initWithSocketAddress:(void *)a3 withAccessoryName:(void *)a4 workQueue:(uint64_t)a5 maxTransmitAttempts:(double)a6 initialACKTimeout:;
- (coap_session_t)shouldOpenSessionWithContext:(coap_context_t *)a3;
- (double)initialACKTimeout;
- (id)openCompletion;
- (id)responseCompletionsByToken;
- (uint64_t)_queueSessionCompletion;
- (unint64_t)maxTransmitAttempts;
- (void)_callResponseCompletion:(void *)a3 response:(void *)a4 error:;
- (void)_didOpenWithError:(uint64_t)a1;
- (void)_ioThreadDidReceivePongInSession:(uint64_t)a1 messageID:(uint64_t)a2;
- (void)_ioThreadRequestFailed:(uint64_t)a1;
- (void)_queueSessionBlock:(uint64_t)a3 withTimeout:(double)a4 requiresCompletion:;
- (void)alterMaxTransmitAttempts:(unint64_t)a3 initialACKTimeout:(double)a4;
- (void)closeWithError:(id)a3 completion:(id)a4;
- (void)didCloseSession;
- (void)didFailToSendMessageInSession:(coap_session_t *)a3 messageID:(unint64_t)a4 message:(coap_pdu_t *)a5 reason:(unint64_t)a6;
- (void)didReceivePongInSession:(coap_session_t *)a3 messageID:(unint64_t)a4;
- (void)didReceiveRequestInSession:(coap_session_t *)a3 messageID:(unint64_t)a4 request:(coap_pdu_t *)a5 response:(coap_pdu_t *)a6;
- (void)didReceiveResponseInSession:(coap_session_t *)a3 messageID:(unint64_t)a4 response:(coap_pdu_t *)a5;
- (void)didRegister;
- (void)didUnregister;
- (void)openWithCompletion:(id)a3;
- (void)sendRequestWithMethod:(unsigned __int8)a3 path:(id)a4 payload:(id)a5 completion:(id)a6;
- (void)setCloseCompletion:(uint64_t)a1;
- (void)setConnected:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setInitialACKTimeout:(double)a3;
- (void)setMaxTransmitAttempts:(unint64_t)a3;
- (void)setOpenCompletion:(uint64_t)a1;
@end

@implementation HAP2CoAPClient

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_ioThread);
  objc_storeStrong((id *)&self->_accessoryName, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_propertyLock, 0);
  objc_storeStrong((id *)&self->_previousEventMessageIDs, 0);
  objc_storeStrong((id *)&self->_previousResponseMessageIDs, 0);
  objc_storeStrong((id *)&self->_activeTokens, 0);
  objc_storeStrong((id *)&self->_closeError, 0);
  objc_storeStrong((id *)&self->_responseCompletionsByToken, 0);
  objc_storeStrong(&self->_closeCompletion, 0);
  objc_storeStrong(&self->_openCompletion, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)didUnregister
{
  v2 = self;
  if (self) {
    self = (HAP2CoAPClient *)self->_workQueue;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__HAP2CoAPClient_didUnregister__block_invoke;
  block[3] = &unk_1E69F4330;
  block[4] = v2;
  dispatch_async(&self->super.super, block);
  if (v2) {
    objc_storeWeak((id *)&v2->_ioThread, 0);
  }
}

void __31__HAP2CoAPClient_didUnregister__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  if (objc_opt_respondsToSelector()) {
    [v2 clientDidGetUnregistered:*(void *)(a1 + 32)];
  }
}

- (void)didRegister
{
  v3 = [MEMORY[0x1E4F29060] currentThread];
  v4 = v3;
  if (self)
  {
    objc_storeWeak((id *)&self->_ioThread, v3);

    workQueue = self->_workQueue;
  }
  else
  {

    workQueue = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __29__HAP2CoAPClient_didRegister__block_invoke;
  block[3] = &unk_1E69F4330;
  block[4] = self;
  dispatch_async(workQueue, block);
}

void __29__HAP2CoAPClient_didRegister__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  if (objc_opt_respondsToSelector()) {
    [v2 clientDidGetRegistered:*(void *)(a1 + 32)];
  }
}

- (void)didReceivePongInSession:(coap_session_t *)a3 messageID:(unint64_t)a4
{
}

- (void)_ioThreadDidReceivePongInSession:(uint64_t)a1 messageID:(uint64_t)a2
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    v3 = hap2Log_coap;
    if (os_log_type_enabled((os_log_t)hap2Log_coap, OS_LOG_TYPE_DEBUG))
    {
      int v4 = 134217984;
      uint64_t v5 = a2;
      _os_log_debug_impl(&dword_1D4758000, v3, OS_LOG_TYPE_DEBUG, "<Pong id=%lu> received", (uint8_t *)&v4, 0xCu);
    }
  }
}

- (void)didFailToSendMessageInSession:(coap_session_t *)a3 messageID:(unint64_t)a4 message:(coap_pdu_t *)a5 reason:(unint64_t)a6
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (self)
  {
    if (*(_WORD *)&a5->var0 || a5->var4 || a6 != 2 || a5->var11)
    {
      if (hap2LogInitialize_onceToken != -1) {
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
      }
      v9 = (id)hap2Log_coap;
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v15 = self->_accessoryName;
        _stringForMessage((uint64_t)a5, 0);
        id v16 = (id)objc_claimAutoreleasedReturnValue();
        if (a6 >= 5)
        {
          objc_msgSend(NSString, "stringWithFormat:", @"Unknown (%lu)", a6);
          v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v17 = off_1E69F25E0[a6];
        }
        *(_DWORD *)block = 138478339;
        *(void *)&block[4] = v15;
        *(_WORD *)&block[12] = 2112;
        *(void *)&block[14] = v16;
        *(_WORD *)&block[22] = 2112;
        v20 = v17;
        _os_log_error_impl(&dword_1D4758000, v9, OS_LOG_TYPE_ERROR, "[%{private}@] %@ failed to send with reason: %@", block, 0x20u);
      }
      if (a6 > 4
        || ([MEMORY[0x1E4F28C58] hapErrorWithCode:qword_1D4912C90[a6]],
            (v10 = objc_claimAutoreleasedReturnValue()) == 0))
      {
        if (hap2LogInitialize_onceToken != -1) {
          dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
        }
        v11 = hap2Log_coap;
        if (os_log_type_enabled((os_log_t)hap2Log_coap, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)block = 134217984;
          *(void *)&block[4] = a6;
          _os_log_error_impl(&dword_1D4758000, v11, OS_LOG_TYPE_ERROR, "Unhandled failure reason: %lu", block, 0xCu);
        }
        v10 = [MEMORY[0x1E4F28C58] hapErrorWithCode:1];
      }
      if (a5->var4 == 4) {
        int v12 = *(_DWORD *)a5->var10;
      }
      else {
        int v12 = 0;
      }
      workQueue = self->_workQueue;
      *(void *)block = MEMORY[0x1E4F143A8];
      *(void *)&block[8] = 3221225472;
      *(void *)&block[16] = __72__HAP2CoAPClient__ioThreadDidFailToSendMessageInSession_message_reason___block_invoke_74;
      v20 = (__CFString *)&unk_1E69F25C0;
      int v23 = v12;
      v21 = self;
      id v22 = v10;
      id v14 = v10;
      dispatch_async(workQueue, block);
    }
    else
    {
      -[HAP2CoAPClient _ioThreadDidReceivePongInSession:messageID:]((uint64_t)self, a5->var5);
      v18 = self->_workQueue;
      *(void *)block = MEMORY[0x1E4F143A8];
      *(void *)&block[8] = 3221225472;
      *(void *)&block[16] = __72__HAP2CoAPClient__ioThreadDidFailToSendMessageInSession_message_reason___block_invoke;
      v20 = (__CFString *)&unk_1E69F4330;
      v21 = self;
      dispatch_async(v18, block);
    }
  }
}

uint64_t __72__HAP2CoAPClient__ioThreadDidFailToSendMessageInSession_message_reason___block_invoke(uint64_t a1)
{
  return -[HAP2CoAPClient _queueSessionCompletion](*(void *)(a1 + 32));
}

void __72__HAP2CoAPClient__ioThreadDidFailToSendMessageInSession_message_reason___block_invoke_74(uint64_t a1)
{
  -[HAP2CoAPClient _queueSessionCompletion](*(void *)(a1 + 32));
  uint64_t v2 = *(unsigned int *)(a1 + 48);
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = *(void **)(a1 + 40);

  -[HAP2CoAPClient _callResponseCompletion:response:error:](v3, v2, 0, v4);
}

- (uint64_t)_queueSessionCompletion
{
  if (result)
  {
    uint64_t v1 = result;
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(result + 136));
    return +[HAP2CoAPIO queueSessionCompletionForConsumer:v1];
  }
  return result;
}

- (void)_callResponseCompletion:(void *)a3 response:(void *)a4 error:
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 136));
    v9 = [NSNumber numberWithUnsignedInt:a2];
    v10 = -[HAP2CoAPClient responseCompletionsByToken](a1);
    v11 = [v10 objectForKeyedSubscript:v9];

    if (v11)
    {
      int v12 = -[HAP2CoAPClient responseCompletionsByToken](a1);
      [v12 setObject:0 forKeyedSubscript:v9];

      ((void (**)(void, id, id))v11)[2](v11, v7, v8);
    }
    else
    {
      if (hap2LogInitialize_onceToken != -1) {
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
      }
      v13 = (void *)hap2Log_coap;
      if (os_log_type_enabled((os_log_t)hap2Log_coap, OS_LOG_TYPE_ERROR))
      {
        id v14 = v13;
        v15 = stringForToken(a2);
        int v16 = 138412546;
        v17 = v15;
        __int16 v18 = 2112;
        id v19 = v8;
        _os_log_error_impl(&dword_1D4758000, v14, OS_LOG_TYPE_ERROR, "<Response token=%@> received after we already called its completion handler: %@", (uint8_t *)&v16, 0x16u);
      }
    }
  }
}

- (id)responseCompletionsByToken
{
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 136));
  uint64_t v2 = *(void **)(a1 + 88);

  return v2;
}

- (void)didReceiveRequestInSession:(coap_session_t *)a3 messageID:(unint64_t)a4 request:(coap_pdu_t *)a5 response:(coap_pdu_t *)a6
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  if (self)
  {
    v10 = NSString;
    v11 = (objc_class *)objc_opt_class();
    int v12 = NSStringFromClass(v11);
    v13 = [v10 stringWithFormat:@"%@ Received Request", v12];

    id v32 = (id)[objc_alloc(MEMORY[0x1E4F653F0]) initWithName:v13];
    objc_msgSend(v32, "markWithFormat:", @"Message id: %lu", a4);
    id v14 = [NSNumber numberWithUnsignedInteger:a4];
    v15 = self->_previousEventMessageIDs;
    int v16 = [(NSMutableOrderedSet *)v15 containsObject:v14];

    if (v16)
    {
      if (hap2LogInitialize_onceToken != -1) {
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
      }
      v17 = (id)hap2Log_coap;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        __int16 v18 = _stringForMessage((uint64_t)a6, 0);
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v18;
        _os_log_impl(&dword_1D4758000, v17, OS_LOG_TYPE_INFO, "%@ received more than once", buf, 0xCu);
      }
      a6->var1 = 67;
    }
    else
    {
      uint64_t v30 = 0;
      uint64_t v31 = 0;
      if (coap_get_data(a5, &v31, &v30))
      {
        if (hap2LogInitialize_onceToken != -1) {
          dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
        }
        id v19 = (id)hap2Log_coap;
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          uint64_t v20 = _stringForMessage((uint64_t)a5, 0);
          *(_DWORD *)buf = 138412546;
          *(void *)&buf[4] = v20;
          *(_WORD *)&buf[12] = 2048;
          *(void *)&buf[14] = v31;
          _os_log_impl(&dword_1D4758000, v19, OS_LOG_TYPE_INFO, "%@ received with %lu bytes of data", buf, 0x16u);
        }
        v21 = self->_previousEventMessageIDs;
        BOOL v22 = (unint64_t)[(NSMutableOrderedSet *)v21 count] > 5;

        if (v22)
        {
          int v23 = self->_previousEventMessageIDs;
          [(NSMutableOrderedSet *)v23 removeObjectAtIndex:0];
        }
        uint64_t v24 = self->_previousEventMessageIDs;
        [(NSMutableOrderedSet *)v24 addObject:v14];

        a6->var1 = 67;
        v25 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v30 length:v31];
        workQueue = self->_workQueue;
        *(void *)buf = MEMORY[0x1E4F143A8];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __81__HAP2CoAPClient__ioThreadDidReceiveRequestInSession_messageID_request_response___block_invoke;
        v34 = &unk_1E69F4708;
        id v35 = v32;
        v36 = self;
        id v37 = v25;
        id v27 = v25;
        dispatch_async(workQueue, buf);
      }
      else
      {
        if (hap2LogInitialize_onceToken != -1) {
          dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
        }
        v28 = (id)hap2Log_coap;
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          v29 = _stringForMessage((uint64_t)a5, 0);
          *(_DWORD *)buf = 138412290;
          *(void *)&buf[4] = v29;
          _os_log_impl(&dword_1D4758000, v28, OS_LOG_TYPE_INFO, "%@ received, but contains no data", buf, 0xCu);
        }
        a6->var0 = 3;
      }
    }

    __HMFActivityScopeLeave();
  }
}

void __81__HAP2CoAPClient__ioThreadDidReceiveRequestInSession_messageID_request_response___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) begin];
  id v6 = *(id *)(a1 + 32);
  uint64_t v2 = *(dispatch_queue_t **)(a1 + 40);
  id v3 = *(id *)(a1 + 48);
  if (v2)
  {
    dispatch_assert_queue_V2(v2[17]);
    int v4 = [(dispatch_queue_t *)v2 delegate];
    uint64_t v5 = v4;
    if (v4) {
      [v4 client:v2 didReceiveEvent:v3];
    }
  }
  [*(id *)(a1 + 32) invalidate];
  __HMFActivityScopeLeave();
}

- (void)didReceiveResponseInSession:(coap_session_t *)a3 messageID:(unint64_t)a4 response:(coap_pdu_t *)a5
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  if (self)
  {
    v9 = NSString;
    v10 = (objc_class *)objc_opt_class();
    v11 = NSStringFromClass(v10);
    int v12 = [v9 stringWithFormat:@"%@ Received Response", v11];

    v55 = (void *)[objc_alloc(MEMORY[0x1E4F653F0]) initWithName:v12];
    objc_msgSend(v55, "markWithFormat:", @"Message id: %lu", a4);
    if (a5->var4 == 4) {
      uint64_t v13 = *(unsigned int *)a5->var10;
    }
    else {
      uint64_t v13 = 0;
    }
    id v14 = [NSNumber numberWithUnsignedInteger:a4];
    id v15 = [NSNumber numberWithUnsignedInt:v13];
    unsigned int var0 = a5->var0;
    if (!v13 || ([(NSMutableSet *)self->_activeTokens containsObject:v15] & 1) == 0)
    {
      if (var0 <= 1)
      {
        int v20 = [(NSMutableOrderedSet *)self->_previousResponseMessageIDs containsObject:v14];
        if (hap2LogInitialize_onceToken != -1) {
          dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
        }
        v21 = (void *)hap2Log_coap;
        BOOL v22 = os_log_type_enabled((os_log_t)hap2Log_coap, OS_LOG_TYPE_INFO);
        if (v20)
        {
          if (v22)
          {
            int v23 = v21;
            uint64_t v24 = _stringForMessage((uint64_t)a5, 0);
            *(_DWORD *)buf = 138412290;
            *(void *)&buf[4] = v24;
            _os_log_impl(&dword_1D4758000, v23, OS_LOG_TYPE_INFO, "%@ received more than once", buf, 0xCu);
          }
        }
        else
        {
          if (v22)
          {
            v25 = v21;
            v26 = _stringForMessage((uint64_t)a5, 0);
            *(_DWORD *)buf = 138412290;
            *(void *)&buf[4] = v26;
            _os_log_impl(&dword_1D4758000, v25, OS_LOG_TYPE_INFO, "%@ received unexpectedly", buf, 0xCu);
          }
          coap_send_message_type(&a3->var0, (uint64_t)a5);
        }
      }
      goto LABEL_62;
    }
    [(NSMutableSet *)self->_activeTokens removeObject:v15];
    if ((unint64_t)[(NSMutableOrderedSet *)self->_previousResponseMessageIDs count] >= 0xB) {
      [(NSMutableOrderedSet *)self->_previousResponseMessageIDs removeObjectAtIndex:0];
    }
    [(NSMutableOrderedSet *)self->_previousResponseMessageIDs addObject:v14];

    v17 = stringForToken(v13);
    [v55 markWithFormat:@"Token: %@", v17];

    if (a5->var0 == 3)
    {
      if (hap2LogInitialize_onceToken != -1) {
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
      }
      __int16 v18 = (id)hap2Log_coap;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v39 = _stringForMessage((uint64_t)a5, 1);
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v39;
        _os_log_error_impl(&dword_1D4758000, v18, OS_LOG_TYPE_ERROR, "%@ received RST", buf, 0xCu);
      }
      id v19 = [MEMORY[0x1E4F28C58] hapErrorWithCode:8];
      goto LABEL_60;
    }
    if ((a5->var1 & 0xE0) == 0x40)
    {
      if (hap2LogInitialize_onceToken != -1) {
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
      }
      id v27 = (id)hap2Log_coap;
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        v28 = self->_accessoryName;
        v29 = _stringForMessage((uint64_t)a5, 1);
        *(_DWORD *)buf = 138478083;
        *(void *)&buf[4] = v28;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v29;
        _os_log_impl(&dword_1D4758000, v27, OS_LOG_TYPE_DEFAULT, "[%{private}@] %@ succeeded", buf, 0x16u);
      }
      var11 = a5->var11;
      if (var11 && (uint64_t v31 = &a5->var10[a5->var8 - (void)var11]) != 0)
      {
        if (hap2LogInitialize_onceToken != -1) {
          dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
        }
        id v32 = (id)hap2Log_coap;
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
        {
          v53 = _stringForMessage((uint64_t)a5, 1);
          v54 = "s";
          *(_DWORD *)buf = 138412802;
          *(void *)&buf[4] = v53;
          if (v31 == (char *)1) {
            v54 = "";
          }
          *(_WORD *)&buf[12] = 2048;
          *(void *)&buf[14] = v31;
          *(_WORD *)&buf[22] = 2080;
          v57 = v54;
          _os_log_debug_impl(&dword_1D4758000, v32, OS_LOG_TYPE_DEBUG, "%@ carries %lu byte%s of payload", buf, 0x20u);
        }
        uint64_t v33 = [MEMORY[0x1E4F1C9B8] dataWithBytes:var11 length:v31];
      }
      else
      {
        if (hap2LogInitialize_onceToken != -1) {
          dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
        }
        id v37 = (id)hap2Log_coap;
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
        {
          v52 = _stringForMessage((uint64_t)a5, 1);
          *(_DWORD *)buf = 138412290;
          *(void *)&buf[4] = v52;
          _os_log_debug_impl(&dword_1D4758000, v37, OS_LOG_TYPE_DEBUG, "%@ carries no payload", buf, 0xCu);
        }
        uint64_t v33 = [MEMORY[0x1E4F1C9B8] data];
      }
      uint64_t v38 = (void *)v33;
      id v19 = 0;
      goto LABEL_61;
    }
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    v34 = (id)hap2Log_coap;
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      _stringForMessage((uint64_t)a5, 1);
      id v45 = (id)objc_claimAutoreleasedReturnValue();
      v46 = v45;
      uint64_t v47 = 0;
      int v48 = 65;
      v49 = &byte_1E69F4B40;
      while (v48 != a5->var1)
      {
        ++v47;
        int v50 = *v49;
        v49 += 16;
        int v48 = v50;
        if (v47 == 23)
        {
          uint64_t v51 = 0;
          goto LABEL_69;
        }
      }
      uint64_t v51 = coap_error[2 * v47 + 1];
LABEL_69:
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = v45;
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = v51;
      _os_log_error_impl(&dword_1D4758000, v34, OS_LOG_TYPE_ERROR, "%@ failed: %s", buf, 0x16u);
    }
    unsigned int var1 = a5->var1;
    if (var1 <= 0x8E)
    {
      uint64_t v36 = 9;
      switch(var1)
      {
        case 0x80u:
          goto LABEL_59;
        case 0x81u:
        case 0x83u:
          goto LABEL_57;
        case 0x82u:
        case 0x85u:
          goto LABEL_50;
        case 0x84u:
          uint64_t v36 = 14;
          goto LABEL_59;
        default:
          if (var1 - 64 > 3 || var1 == 66) {
            goto LABEL_57;
          }
          id v19 = 0;
          break;
      }
      goto LABEL_60;
    }
    if (a5->var1 > 0xA2u)
    {
      if (var1 == 163)
      {
        uint64_t v36 = 19;
        goto LABEL_59;
      }
      if (var1 == 164)
      {
        uint64_t v36 = 24;
        goto LABEL_59;
      }
    }
    else if (var1 == 143 || var1 == 161)
    {
LABEL_50:
      uint64_t v36 = 3;
LABEL_59:
      v40 = NSString;
      v41 = objc_msgSend(NSString, "stringWithFormat:", @"%u.%02u", var1 >> 5, var1 & 0x1F);
      v42 = [v40 stringWithFormat:@"CoAP responded with a failure code: %@", v41];

      v43 = [MEMORY[0x1E4F28C58] hapErrorWithCode:v36 description:v42 reason:0 suggestion:0 underlyingError:0];
      id v19 = [MEMORY[0x1E4F28C58] hapErrorWithCode:8 description:@"Failed to communicate using CoAP" reason:0 suggestion:0 underlyingError:v43];

LABEL_60:
      uint64_t v38 = 0;
LABEL_61:
      workQueue = self->_workQueue;
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __74__HAP2CoAPClient__ioThreadDidReceiveResponseInSession_messageID_response___block_invoke;
      v57 = (const char *)&unk_1E69F2598;
      id v58 = v55;
      v59 = self;
      int v62 = v13;
      id v60 = v38;
      id v61 = v19;
      id v15 = v19;
      id v14 = v38;
      dispatch_async(workQueue, buf);

LABEL_62:
      __HMFActivityScopeLeave();

      return;
    }
LABEL_57:
    uint64_t v36 = 15;
    goto LABEL_59;
  }
}

void __74__HAP2CoAPClient__ioThreadDidReceiveResponseInSession_messageID_response___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) begin];
  id v2 = *(id *)(a1 + 32);
  -[HAP2CoAPClient _queueSessionCompletion](*(void *)(a1 + 40));
  -[HAP2CoAPClient _callResponseCompletion:response:error:](*(void *)(a1 + 40), *(unsigned int *)(a1 + 64), *(void **)(a1 + 48), *(void **)(a1 + 56));
  [*(id *)(a1 + 32) invalidate];
  __HMFActivityScopeLeave();
}

- (void)didCloseSession
{
  if (self)
  {
    id v3 = NSString;
    int v4 = (objc_class *)objc_opt_class();
    uint64_t v5 = NSStringFromClass(v4);
    id v6 = [v3 stringWithFormat:@"%@ Close Session", v5];

    id v12 = (id)[objc_alloc(MEMORY[0x1E4F653F0]) initWithName:v6];
    [(NSMutableSet *)self->_activeTokens removeAllObjects];
    [(NSMutableOrderedSet *)self->_previousResponseMessageIDs removeAllObjects];
    notificationResource = self->_notificationResource;
    if (notificationResource)
    {
      self->_notificationResource = 0;
      notificationResource->var12 = 0;
    }
    workQueue = self->_workQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __42__HAP2CoAPClient__ioThreadDidCloseSession__block_invoke;
    block[3] = &unk_1E69F46E0;
    id v10 = v12;
    v11 = self;
    dispatch_async(workQueue, block);

    __HMFActivityScopeLeave();
  }
}

void __42__HAP2CoAPClient__ioThreadDidCloseSession__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) begin];
  id v14 = *(id *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v2 + 136));
    id v3 = -[HAP2CoAPClient openCompletion](v2);

    if (v3)
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "hapErrorWithCode:", 2, v14);
      int v4 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
      -[HAP2CoAPClient _didOpenWithError:](v2, v4);
    }
    else
    {
      int v5 = objc_msgSend((id)v2, "connected", v14);
      [(id)v2 setConnected:0];
      dispatch_assert_queue_V2(*(dispatch_queue_t *)(v2 + 136));
      if (*(unsigned char *)(v2 + 41))
      {
        dispatch_assert_queue_V2(*(dispatch_queue_t *)(v2 + 136));
        *(unsigned char *)(v2 + 41) = 0;
        +[HAP2CoAPIO unregisterConsumer:v2];
      }
      if (v5)
      {
        id v6 = [MEMORY[0x1E4F28C58] hapErrorWithCode:2];
        id v7 = -[HAP2CoAPClient responseCompletionsByToken](v2);
        uint64_t v8 = [v7 count];

        if (v8)
        {
          v9 = -[HAP2CoAPClient responseCompletionsByToken](v2);
          id v10 = [v9 allValues];

          v11 = -[HAP2CoAPClient responseCompletionsByToken](v2);
          [v11 removeAllObjects];

          uint64_t v16 = MEMORY[0x1E4F143A8];
          uint64_t v17 = 3221225472;
          __int16 v18 = __32__HAP2CoAPClient__didDisconnect__block_invoke;
          id v19 = &unk_1E69F2500;
          id v20 = v6;
          [v10 enumerateObjectsUsingBlock:&v16];
        }
        id v12 = [(id)v2 delegate];
        uint64_t v13 = v12;
        if (v12) {
          [v12 clientDidDisconnect:v2 error:v6];
        }
      }
      dispatch_assert_queue_V2(*(dispatch_queue_t *)(v2 + 136));
      int v4 = (void (**)(void, void))MEMORY[0x1D944E2D0](*(void *)(v2 + 80));
      if (v4)
      {
        -[HAP2CoAPClient setCloseCompletion:](v2, 0);
        v4[2](v4, 0);
      }
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "invalidate", v14, v16, v17, v18, v19);
  __HMFActivityScopeLeave();
}

- (id)openCompletion
{
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 136));
  uint64_t v2 = (void *)MEMORY[0x1D944E2D0](*(void *)(a1 + 72));

  return v2;
}

- (void)_didOpenWithError:(uint64_t)a1
{
  id v5 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 136));
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 136));
    if (*(unsigned char *)(a1 + 41))
    {
      -[HAP2CoAPClient openCompletion](a1);
      id v3 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
      -[HAP2CoAPClient setOpenCompletion:](a1, 0);
      if (v5)
      {
        [(id)a1 setConnected:0];
        dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 136));
        *(unsigned char *)(a1 + 41) = 0;
        +[HAP2CoAPIO unregisterConsumer:a1];
      }
      else
      {
        [(id)a1 setConnected:1];
        int v4 = [MEMORY[0x1E4F654C0] sharedManager];
        [v4 registerWoWAssertionForObject:a1];
      }
      ((void (**)(void, id))v3)[2](v3, v5);
    }
  }
}

uint64_t __32__HAP2CoAPClient__didDisconnect__block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, void, void))(a2 + 16))(a2, 0, *(void *)(a1 + 32));
}

- (void)setCloseCompletion:(uint64_t)a1
{
  id v3 = *(NSObject **)(a1 + 136);
  id v4 = a2;
  dispatch_assert_queue_V2(v3);
  uint64_t v5 = MEMORY[0x1D944E2D0](v4);

  id v6 = *(void **)(a1 + 80);
  *(void *)(a1 + 80) = v5;
}

- (void)setOpenCompletion:(uint64_t)a1
{
  id v3 = *(NSObject **)(a1 + 136);
  id v4 = a2;
  dispatch_assert_queue_V2(v3);
  uint64_t v5 = MEMORY[0x1D944E2D0](v4);

  id v6 = *(void **)(a1 + 72);
  *(void *)(a1 + 72) = v5;
}

- (coap_session_t)shouldOpenSessionWithContext:(coap_context_t *)a3
{
  uint64_t v106 = *MEMORY[0x1E4F143B8];
  if (!self) {
    return 0;
  }
  uint64_t v5 = NSString;
  id v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  uint64_t v8 = [v5 stringWithFormat:@"%@ Open Session", v7];

  v99 = (void *)[objc_alloc(MEMORY[0x1E4F653F0]) initWithName:v8];
  p_address = &self->_address;
  session = coap_make_session(1, 1, 0, 0, &self->_address.size, 0, (uint64_t)a3, 0);
  v11 = session;
  if (!session) {
    goto LABEL_55;
  }
  ++*((_DWORD *)session + 1);
  int v100 = 0;
  int v101 = 1;
  int sa_family = self->_address.addr.sa.sa_family;
  if (sa_family == 30)
  {
    BOOL v13 = self->_address.addr.sin6.sin6_addr.__u6_addr8[0] == 255;
    memset(&block[4], 0, 24);
    *(_DWORD *)block = p_address->size;
    void block[5] = 30;
    *(in6_addr *)&block[12] = self->_address.addr.sin6.sin6_addr;
    *(_WORD *)&block[6] = self->_address.addr.sin.sin_port;
    *(_DWORD *)&block[28] = self->_address.addr.sin6.sin6_scope_id;
  }
  else if (sa_family == 2)
  {
    BOOL v13 = (self->_address.addr.sin.sin_addr.s_addr & 0xF0) == 224;
    memset(&block[4], 0, 28);
    *(_DWORD *)block = p_address->size;
    *(sockaddr *)&void block[4] = self->_address.addr.sa;
  }
  else
  {
    memset(&block[4], 0, 28);
    *(_DWORD *)block = p_address->size;
    __memcpy_chk();
    BOOL v13 = 0;
  }
  *((_WORD *)v11 + 90) &= 0xEFFBu;
  int v14 = socket(block[5], 2, 0);
  *((_DWORD *)v11 + 44) = v14;
  if (v14 == -1)
  {
    if (maxlog <= 3)
    {
LABEL_54:
      *((_WORD *)v11 + 90) = 0;
LABEL_55:
      coap_session_release((uint64_t)v11);
      if (hap2LogInitialize_onceToken != -1) {
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
      }
      id v35 = hap2Log_coap;
      if (os_log_type_enabled((os_log_t)hap2Log_coap, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)block = 138412290;
        *(void *)&void block[4] = self;
        _os_log_error_impl(&dword_1D4758000, v35, OS_LOG_TYPE_ERROR, "%@ Failed to create coap session", block, 0xCu);
      }
      uint64_t v36 = [MEMORY[0x1E4F28C58] hapErrorWithCode:1];
      v11 = 0;
      goto LABEL_60;
    }
    uint64_t v17 = "coap_socket_connect_udp: socket: %s\n";
    goto LABEL_51;
  }
  if (ioctl(v14, 0x8004667EuLL, &v101) == -1 && maxlog >= 4)
  {
    id v15 = __error();
    uint64_t v16 = strerror(*v15);
    coap_log_impl(4, "coap_socket_connect_udp: ioctl FIONBIO: %s\n", v16);
  }
  if (block[5] == 30)
  {
    if (!*(_WORD *)&block[6]) {
      *(_WORD *)&block[6] = 13078;
    }
    if (setsockopt(*((_DWORD *)v11 + 44), 41, 27, &v100, 4u) == -1 && maxlog >= 4)
    {
      __int16 v18 = __error();
      strerror(*v18);
      coap_log_impl(4, "coap_socket_connect_udp: setsockopt IPV6_V6ONLY: %s\n");
    }
  }
  else if (block[5] == 2)
  {
    if (!*(_WORD *)&block[6]) {
      *(_WORD *)&block[6] = 13078;
    }
  }
  else if (maxlog >= 1)
  {
    coap_log_impl(1, "coap_socket_connect_udp: unsupported sa_family\n");
  }
  if (v11[21])
  {
    if (setsockopt(*((_DWORD *)v11 + 44), 0xFFFF, 4, &v101, 4u) == -1 && maxlog >= 4)
    {
      id v19 = __error();
      id v20 = strerror(*v19);
      coap_log_impl(4, "coap_socket_connect_udp: setsockopt SO_REUSEADDR: %s\n", v20);
    }
    socklen_t v21 = v11[21] == 2 ? 16 : *((_DWORD *)v11 + 4);
    if (bind(*((_DWORD *)v11 + 44), (const sockaddr *)(v11 + 20), v21) == -1)
    {
      if (maxlog <= 3) {
        goto LABEL_52;
      }
      uint64_t v17 = "coap_socket_connect_udp: bind: %s\n";
      goto LABEL_51;
    }
  }
  int v22 = *((_DWORD *)v11 + 44);
  if (v13)
  {
    if (getsockname(v22, (sockaddr *)(v11 + 140), (socklen_t *)v11 + 34) == -1 && maxlog >= 4)
    {
      int v23 = __error();
      uint64_t v24 = strerror(*v23);
      coap_log_impl(4, "coap_socket_connect_udp: getsockname for multicast socket: %s\n", v24);
    }
    *(void *)(v11 + 108) = 0;
    v25 = v11 + 108;
    *((_DWORD *)v11 + 33) = 0;
    *(void *)(v11 + 116) = 0;
    *(void *)(v11 + 124) = 0;
    size_t v26 = *(unsigned int *)block;
    *((_DWORD *)v11 + 26) = *(_DWORD *)block;
    if (block[5] == 2)
    {
      _OWORD *v25 = *(_OWORD *)&block[4];
    }
    else if (block[5] == 30)
    {
      v11[109] = 30;
      *(_OWORD *)(v11 + 116) = *(_OWORD *)&block[12];
      *((_WORD *)v11 + 55) = *(_WORD *)&block[6];
      *((_DWORD *)v11 + 33) = *(_DWORD *)&block[28];
    }
    else
    {
      memcpy(v25, &block[4], v26);
    }
    __int16 v29 = 4096;
    goto LABEL_65;
  }
  if (connect(v22, (const sockaddr *)&block[4], *(socklen_t *)block) == -1)
  {
    if (maxlog <= 3) {
      goto LABEL_52;
    }
    uint64_t v17 = "coap_socket_connect_udp: connect: %s\n";
LABEL_51:
    id v32 = __error();
    uint64_t v33 = strerror(*v32);
    coap_log_impl(4, v17, v33);
LABEL_52:
    int v34 = *((_DWORD *)v11 + 44);
    if (v34 != -1)
    {
      *((void *)v11 + 23) = 0;
      *((void *)v11 + 24) = 0;
      close(v34);
      *((_DWORD *)v11 + 44) = -1;
    }
    goto LABEL_54;
  }
  if (getsockname(*((_DWORD *)v11 + 44), (sockaddr *)(v11 + 140), (socklen_t *)v11 + 34) == -1 && maxlog >= 4)
  {
    id v27 = __error();
    v28 = strerror(*v27);
    coap_log_impl(4, "coap_socket_connect_udp: getsockname: %s\n", v28);
  }
  __int16 v29 = 4;
  if (getpeername(*((_DWORD *)v11 + 44), (sockaddr *)(v11 + 108), (socklen_t *)v11 + 26) == -1 && maxlog >= 4)
  {
    uint64_t v30 = __error();
    uint64_t v31 = strerror(*v30);
    coap_log_impl(4, "coap_socket_connect_udp: getpeername: %s\n", v31);
  }
LABEL_65:
  unsigned int v40 = -1640531527;
  __int16 v41 = *((_WORD *)v11 + 90) | v29 | 0x11;
  *((void *)v11 + 23) = v11;
  *((_WORD *)v11 + 90) = v41;
  int v42 = -17973521;
  unsigned int v43 = 64;
  uint64_t v44 = 104;
  int v45 = -1640531527;
  do
  {
    unsigned int v46 = *(_DWORD *)&v11[v44 + 4] + v40;
    unsigned int v47 = *(_DWORD *)&v11[v44 + 8] + v42;
    int v48 = (*(_DWORD *)&v11[v44] + v45 - (v46 + v47)) ^ (v47 >> 13);
    unsigned int v49 = (v46 - v47 - v48) ^ (v48 << 8);
    unsigned int v50 = (v47 - v48 - v49) ^ (v49 >> 13);
    int v51 = (v48 - v49 - v50) ^ (v50 >> 12);
    unsigned int v52 = (v49 - v50 - v51) ^ (v51 << 16);
    unsigned int v53 = (v50 - v51 - v52) ^ (v52 >> 5);
    int v45 = (v51 - v52 - v53) ^ (v53 >> 3);
    unsigned int v40 = (v52 - v53 - v45) ^ (v45 << 10);
    int v42 = (v53 - v45 - v40) ^ (v40 >> 15);
    v43 -= 12;
    v44 += 12;
  }
  while (v43 > 0xB);
  unsigned int v54 = (v45
       + (v11[167] << 24)
       + (v11[166] << 16)
       + (v11[165] << 8)
       + v11[164]
       + -64
       - v42
       - v40) ^ ((v42 + 64) >> 13);
  unsigned int v55 = (v40 + -64 - v42 - v54) ^ (v54 << 8);
  unsigned int v56 = (v42 + 64 - v54 - v55) ^ (v55 >> 13);
  int v57 = (v54 - v55 - v56) ^ (v56 >> 12);
  unsigned int v58 = (v55 - v56 - v57) ^ (v57 << 16);
  unsigned int v59 = (v56 - v57 - v58) ^ (v58 >> 5);
  int v60 = (v57 - v58 - v59) ^ (v59 >> 3);
  unsigned int v61 = (v59 - v60 - ((v58 - v59 - v60) ^ (v60 << 10))) ^ (((v58 - v59 - v60) ^ (v60 << 10)) >> 15);
  int v62 = (int32x2_t **)(v11 + 48);
  *((void *)v11 + 11) = v11 + 104;
  *((_DWORD *)v11 + 24) = 64;
  *((_DWORD *)v11 + 25) = v61;
  var7 = a3->var7;
  if (var7)
  {
    *((void *)v11 + 6) = var7->var7.var0;
    *((void *)v11 + 8) = 0;
    unsigned int var0 = var7->var7.var0;
    uint64_t v65 = *((void *)var0 + 3);
    *((void *)v11 + 7) = v65 - *((void *)var0 + 4);
    *(void *)(v65 + 16) = v11;
    *((void *)var0 + 3) = v62;
  }
  else
  {
    *((void *)v11 + 7) = 0;
    *((void *)v11 + 8) = 0;
    a3->var7 = (coap_session_t *)v11;
    v66 = (UT_hash_table *)malloc_type_malloc(0x40uLL, 0x10200405F856B24uLL);
    a3->var7->var7.unsigned int var0 = v66;
    if (!v66) {
      goto LABEL_116;
    }
    *((_OWORD *)v66 + 2) = 0u;
    *((_OWORD *)v66 + 3) = 0u;
    *(_OWORD *)v66 = 0u;
    *((_OWORD *)v66 + 1) = 0u;
    v67 = a3->var7;
    v68 = v67->var7.var0;
    *((void *)v68 + 1) = 0x500000020;
    *((void *)v68 + 3) = &v67->var7;
    *((void *)v68 + 4) = 48;
    v69 = malloc_type_malloc(0x200uLL, 0x1020040EDED9539uLL);
    *(void *)a3->var7->var7.unsigned int var0 = v69;
    if (!v69) {
      goto LABEL_116;
    }
    v69[30] = 0u;
    v69[31] = 0u;
    v69[28] = 0u;
    v69[29] = 0u;
    v69[26] = 0u;
    v69[27] = 0u;
    v69[24] = 0u;
    v69[25] = 0u;
    v69[22] = 0u;
    v69[23] = 0u;
    v69[20] = 0u;
    v69[21] = 0u;
    v69[18] = 0u;
    v69[19] = 0u;
    v69[16] = 0u;
    v69[17] = 0u;
    v69[14] = 0u;
    v69[15] = 0u;
    v69[12] = 0u;
    v69[13] = 0u;
    v69[10] = 0u;
    v69[11] = 0u;
    v69[8] = 0u;
    v69[9] = 0u;
    v69[6] = 0u;
    v69[7] = 0u;
    v69[4] = 0u;
    v69[5] = 0u;
    v69[2] = 0u;
    v69[3] = 0u;
    _OWORD *v69 = 0u;
    v69[1] = 0u;
    unsigned int var0 = a3->var7->var7.var0;
    *((_DWORD *)var0 + 14) = -1609490463;
  }
  ++*((_DWORD *)var0 + 4);
  uint64_t v70 = (*((_DWORD *)var0 + 2) - 1) & v61;
  uint64_t v71 = *(void *)var0;
  v72 = (int32x2_t ***)(v71 + 16 * v70);
  unsigned int v73 = *((_DWORD *)v72 + 2) + 1;
  *((_DWORD *)v72 + 2) = v73;
  v74 = *v72;
  *((void *)v11 + 9) = 0;
  *((void *)v11 + 10) = v74;
  if (v74) {
    v74[3] = (int32x2_t *)v62;
  }
  *v72 = v62;
  if (v73 >= 10 * *(_DWORD *)(v71 + 16 * v70 + 12) + 10 && !(*v62)[6].i32[1])
  {
    v75 = malloc_type_malloc(32 * (*v62)[1].u32[0], 0x1020040EDED9539uLL);
    if (v75)
    {
      v76 = v75;
      bzero(v75, 32 * (*v62)[1].u32[0]);
      v77 = *v62;
      unsigned __int32 v78 = (*v62)[2].u32[0];
      uint64_t v79 = (*v62)[1].u32[0];
      unsigned int v80 = 2 * v79 - 1;
      if ((v80 & v78) != 0) {
        unsigned int v81 = (v78 >> ((*v62)[1].i32[1] + 1)) + 1;
      }
      else {
        unsigned int v81 = v78 >> ((*v62)[1].i32[1] + 1);
      }
      v77[5].i32[0] = v81;
      v77[5].i32[1] = 0;
      v82 = (void *)*v77;
      if (v79)
      {
        int v83 = 0;
        for (uint64_t i = 0; i != v79; ++i)
        {
          uint64_t v85 = v82[2 * i];
          if (v85)
          {
            do
            {
              uint64_t v86 = *(void *)(v85 + 32);
              uint64_t v87 = *(_DWORD *)(v85 + 52) & v80;
              v88 = (char *)&v76[4 * v87];
              unsigned int v89 = *((_DWORD *)v88 + 2) + 1;
              *((_DWORD *)v88 + 2) = v89;
              if (v89 > v81)
              {
                v77[5].i32[1] = ++v83;
                v76[4 * v87 + 3] = v89 / v81;
              }
              *(void *)(v85 + 24) = 0;
              uint64_t v90 = *(void *)v88;
              *(void *)(v85 + 32) = *(void *)v88;
              if (v90) {
                *(void *)(v90 + 24) = v85;
              }
              *(void *)v88 = v85;
              uint64_t v85 = v86;
            }
            while (v86);
          }
        }
      }
      free(v82);
      v91 = *v62;
      int32x2_t v92 = (*v62)[1];
      v93.i32[0] = vadd_s32(v92, v92).u32[0];
      v93.i32[1] = vadd_s32(v92, (int32x2_t)0x100000001).i32[1];
      v91[1] = v93;
      int32x2_t *v91 = (int32x2_t)v76;
      if (v91[5].i32[1] <= (unsigned __int32)v91[2].i32[0] >> 1)
      {
        v91[6].i32[0] = 0;
      }
      else
      {
        unsigned int v94 = v91[6].i32[0] + 1;
        v91[6].i32[0] = v94;
        if (v94 >= 2) {
          v91[6].i32[1] = 1;
        }
      }
      goto LABEL_93;
    }
LABEL_116:
    exit(-1);
  }
LABEL_93:
  if (maxlog >= 7)
  {
    coap_session_str((uint64_t)v11);
    coap_log_impl(7, "***%s: new outgoing session\n", (const char *)&coap_session_str_szSession);
  }
  int v95 = *v11;
  if ((v95 - 3) < 2)
  {
    if ((*((_WORD *)v11 + 90) & 0x80) != 0)
    {
      char v96 = 1;
      goto LABEL_103;
    }
    if (v95 != 4)
    {
      coap_session_send_csm((unsigned __int8 *)v11);
      goto LABEL_105;
    }
    goto LABEL_101;
  }
  if (v95 == 2)
  {
LABEL_101:
    *((void *)v11 + 27) = 0;
    ++*((_DWORD *)v11 + 1);
    goto LABEL_55;
  }
  if (v95 == 1)
  {
    char v96 = 4;
LABEL_103:
    v11[2] = v96;
  }
LABEL_105:
  *(void *)block = 0;
  *(void *)&block[8] = 0;
  gettimeofday((timeval *)block, 0);
  *((void *)v11 + 34) = 1000 * (*(void *)block - coap_clock_offset)
                        + ((unint64_t)((double)*(int *)&block[8] * 1.024 + 512.0) >> 10);
  if (hap2LogInitialize_onceToken != -1) {
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
  }
  v97 = hap2Log_coap;
  if (os_log_type_enabled((os_log_t)hap2Log_coap, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)block = 138412290;
    *(void *)&void block[4] = self;
    _os_log_impl(&dword_1D4758000, v97, OS_LOG_TYPE_INFO, "%@ Created CoAP client session", block, 0xCu);
  }
  *((_DWORD *)v11 + 88) = [(HAP2CoAPClient *)self maxTransmitAttempts] - 1;
  [(HAP2CoAPClient *)self initialACKTimeout];
  *((_WORD *)v11 + 178) = (int)v98;
  *((_WORD *)v11 + 179) = (int)(v98 * 1000.0);
  *((_DWORD *)v11 + 90) = 6553601;
  if (maxlog >= 7)
  {
    coap_session_str((uint64_t)v11);
    coap_log_impl(7, "***%s: session ack_random_factor set to %d.%03d\n", (const char *)&coap_session_str_szSession, *((unsigned __int16 *)v11 + 180), *((unsigned __int16 *)v11 + 181));
  }
  *((_DWORD *)v11 + 3) = 65532;
  if (*((_DWORD *)v11 + 2) >= 0xFFFCu)
  {
    *((_DWORD *)v11 + 2) = 65532;
    if (maxlog >= 3) {
      coap_log_impl(3, "DTLS overhead exceeds MTU\n");
    }
  }
  uint64_t v36 = 0;
LABEL_60:
  workQueue = self->_workQueue;
  *(void *)block = MEMORY[0x1E4F143A8];
  *(void *)&block[8] = 3221225472;
  *(void *)&block[16] = __50__HAP2CoAPClient__ioThreadOpenSessionWithContext___block_invoke;
  *(void *)&unsigned char block[24] = &unk_1E69F4708;
  id v103 = v99;
  v104 = self;
  id v105 = v36;
  id v38 = v36;
  dispatch_async(workQueue, block);

  __HMFActivityScopeLeave();
  return (coap_session_t *)v11;
}

void __50__HAP2CoAPClient__ioThreadOpenSessionWithContext___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) begin];
  id v2 = *(id *)(a1 + 32);
  -[HAP2CoAPClient _didOpenWithError:](*(void *)(a1 + 40), *(void **)(a1 + 48));
  [*(id *)(a1 + 32) invalidate];
  __HMFActivityScopeLeave();
}

- (void)closeWithError:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = NSString;
  v9 = (objc_class *)objc_opt_class();
  id v10 = NSStringFromClass(v9);
  v11 = [v8 stringWithFormat:@"%@ Close", v10];

  id v12 = (void *)[objc_alloc(MEMORY[0x1E4F653F0]) initWithName:v11];
  id v21 = v12;
  if (self) {
    workQueue = self->_workQueue;
  }
  else {
    workQueue = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__HAP2CoAPClient_closeWithError_completion___block_invoke;
  block[3] = &unk_1E69F3D58;
  id v17 = v12;
  __int16 v18 = self;
  id v19 = v6;
  id v20 = v7;
  id v14 = v7;
  id v15 = v6;
  dispatch_async(workQueue, block);

  __HMFActivityScopeLeave();
}

void __44__HAP2CoAPClient_closeWithError_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) begin];
  id v22 = *(id *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = *(void **)(a1 + 48);
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  __int16 v18 = __44__HAP2CoAPClient_closeWithError_completion___block_invoke_2;
  id v19 = &unk_1E69F3E20;
  id v21 = *(id *)(a1 + 56);
  id v20 = *(id *)(a1 + 32);
  id v4 = v3;
  uint64_t v5 = &v16;
  if (v2)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v2 + 136));
    objc_msgSend((id)v2, "setConnected:", 0, v16, v17);
    id v6 = [MEMORY[0x1E4F654C0] sharedManager];
    [v6 deregisterWoWAssertionForObject:v2];

    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v2 + 136));
    if (*(unsigned char *)(v2 + 41))
    {
      -[HAP2CoAPClient setCloseCompletion:](v2, v5);
      id v7 = v4;
      dispatch_assert_queue_V2(*(dispatch_queue_t *)(v2 + 136));
      objc_storeStrong((id *)(v2 + 96), v3);

      dispatch_assert_queue_V2(*(dispatch_queue_t *)(v2 + 136));
      *(unsigned char *)(v2 + 41) = 0;
      +[HAP2CoAPIO unregisterConsumer:v2];
      if (v7)
      {
        id v8 = v7;
      }
      else
      {
        id v8 = [MEMORY[0x1E4F28C58] hapErrorWithCode:2];
      }
      v9 = v8;
      id v10 = -[HAP2CoAPClient responseCompletionsByToken](v2);
      uint64_t v11 = [v10 count];

      if (v11)
      {
        id v12 = -[HAP2CoAPClient responseCompletionsByToken](v2);
        BOOL v13 = [v12 allValues];

        id v14 = -[HAP2CoAPClient responseCompletionsByToken](v2);
        [v14 removeAllObjects];

        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __45__HAP2CoAPClient__closeWithError_completion___block_invoke;
        v23[3] = &unk_1E69F2500;
        id v24 = v9;
        [v13 enumerateObjectsUsingBlock:v23];
      }
      -[HAP2CoAPClient openCompletion](v2);
      id v15 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        -[HAP2CoAPClient setOpenCompletion:](v2, 0);
        ((void (**)(void, void *))v15)[2](v15, v9);
      }
    }
    else
    {
      ((void (*)(uint64_t *, void))v18)(v5, 0);
    }
  }

  __HMFActivityScopeLeave();
}

uint64_t __44__HAP2CoAPClient_closeWithError_completion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 invalidate];
}

uint64_t __45__HAP2CoAPClient__closeWithError_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, void, void))(a2 + 16))(a2, 0, *(void *)(a1 + 32));
}

- (void)alterMaxTransmitAttempts:(unint64_t)a3 initialACKTimeout:(double)a4
{
  id v4 = self;
  if (fabs(a4) >= 2.22044605e-16) {
    double v5 = a4;
  }
  else {
    double v5 = 1.428;
  }
  if (a3) {
    unint64_t v6 = a3;
  }
  else {
    unint64_t v6 = 3;
  }
  if (self) {
    self = (HAP2CoAPClient *)self->_propertyLock;
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __61__HAP2CoAPClient_alterMaxTransmitAttempts_initialACKTimeout___block_invoke;
  v9[3] = &unk_1E69F24B0;
  v9[4] = v4;
  v9[5] = v6;
  *(double *)&v9[6] = v5;
  [(HAP2CoAPClient *)self performWritingBlock:v9];
  if (v4) {
    workQueue = v4->_workQueue;
  }
  else {
    workQueue = 0;
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __61__HAP2CoAPClient_alterMaxTransmitAttempts_initialACKTimeout___block_invoke_2;
  v8[3] = &unk_1E69F24B0;
  v8[4] = v4;
  v8[5] = v6;
  *(double *)&v8[6] = v5;
  dispatch_async(workQueue, v8);
}

uint64_t __61__HAP2CoAPClient_alterMaxTransmitAttempts_initialACKTimeout___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setMaxTransmitAttempts:*(void *)(a1 + 40)];
  double v2 = *(double *)(a1 + 48);
  id v3 = *(void **)(a1 + 32);

  return [v3 setInitialACKTimeout:v2];
}

void __61__HAP2CoAPClient_alterMaxTransmitAttempts_initialACKTimeout___block_invoke_2(void *a1)
{
  uint64_t v1 = (dispatch_queue_t *)a1[4];
  if (v1)
  {
    uint64_t v2 = a1[5];
    uint64_t v3 = a1[6];
    dispatch_assert_queue_V2(v1[17]);
    if ([(dispatch_queue_t *)v1 connected])
    {
      [(dispatch_queue_t *)v1 initialACKTimeout];
      -[HAP2CoAPClient _queueSessionBlock:withTimeout:requiresCompletion:](v1, &v6, 0, v4);
    }
    else
    {
      if (hap2LogInitialize_onceToken != -1) {
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
      }
      double v5 = hap2Log_coap;
      if (os_log_type_enabled((os_log_t)hap2Log_coap, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v6) = 0;
        _os_log_error_impl(&dword_1D4758000, v5, OS_LOG_TYPE_ERROR, "Cannot alter timing values when not connected", (uint8_t *)&v6, 2u);
      }
    }
  }
}

void __62__HAP2CoAPClient__alterMaxTransmitAttempts_initialACKTimeout___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (hap2LogInitialize_onceToken != -1) {
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
  }
  double v5 = hap2Log_coap;
  if (a3)
  {
    if (os_log_type_enabled((os_log_t)hap2Log_coap, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      uint64_t v7 = *(void *)(a1 + 40);
      int v9 = 134218240;
      uint64_t v10 = v6;
      __int16 v11 = 2048;
      uint64_t v12 = v7;
      _os_log_impl(&dword_1D4758000, v5, OS_LOG_TYPE_INFO, "Altering timing values: maxTransmitAttempts = %lu, initialACKTimeout = %f", (uint8_t *)&v9, 0x16u);
    }
    *(_DWORD *)(a3 + 352) = *(_DWORD *)(a1 + 32) - 1;
    double v8 = *(double *)(a1 + 40);
    *(_WORD *)(a3 + 356) = (int)v8;
    *(_WORD *)(a3 + 358) = (int)(v8 * 1000.0);
  }
  else if (os_log_type_enabled((os_log_t)hap2Log_coap, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v9) = 0;
    _os_log_error_impl(&dword_1D4758000, v5, OS_LOG_TYPE_ERROR, "Cannot alter timing values without a session", (uint8_t *)&v9, 2u);
  }
}

- (void)_queueSessionBlock:(uint64_t)a3 withTimeout:(double)a4 requiresCompletion:
{
  id v7 = a2;
  dispatch_assert_queue_V2(a1[17]);
  objc_initWeak(&location, a1);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __68__HAP2CoAPClient__queueSessionBlock_withTimeout_requiresCompletion___block_invoke;
  v9[3] = &unk_1E69F24D8;
  objc_copyWeak(&v11, &location);
  id v8 = v7;
  id v10 = v8;
  +[HAP2CoAPIO queueSessionBlockForConsumer:a1 sessionBlock:v9 withTimeout:a3 requiresCompletion:a4];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

uint64_t __68__HAP2CoAPClient__queueSessionBlock_withTimeout_requiresCompletion___block_invoke(uint64_t a1)
{
  if (objc_loadWeakRetained((id *)(a1 + 40))) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }

  return MEMORY[0x1F41817F8]();
}

- (void)sendRequestWithMethod:(unsigned __int8)a3 path:(id)a4 payload:(id)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = NSString;
  id v14 = (objc_class *)objc_opt_class();
  id v15 = NSStringFromClass(v14);
  uint64_t v16 = [v13 stringWithFormat:@"%@ Send Request", v15];

  uint64_t v17 = (void *)[objc_alloc(MEMORY[0x1E4F653F0]) initWithName:v16];
  id v29 = v17;
  if (self) {
    workQueue = self->_workQueue;
  }
  else {
    workQueue = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__HAP2CoAPClient_sendRequestWithMethod_path_payload_completion___block_invoke;
  block[3] = &unk_1E69F3C18;
  id v23 = v17;
  id v24 = self;
  unsigned __int8 v28 = a3;
  id v25 = v10;
  id v26 = v11;
  id v27 = v12;
  id v19 = v12;
  id v20 = v11;
  id v21 = v10;
  dispatch_async(workQueue, block);

  __HMFActivityScopeLeave();
}

void __64__HAP2CoAPClient_sendRequestWithMethod_path_payload_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) begin];
  id v28 = *(id *)(a1 + 32);
  char v21 = *(unsigned char *)(a1 + 72);
  uint64_t v2 = *(void **)(a1 + 48);
  uint64_t v3 = *(void **)(a1 + 56);
  double v4 = *(void **)(a1 + 32);
  double v5 = *(dispatch_queue_t **)(a1 + 40);
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  id v24 = __64__HAP2CoAPClient_sendRequestWithMethod_path_payload_completion___block_invoke_2;
  id v25 = &unk_1E69F2528;
  id v27 = *(id *)(a1 + 64);
  id v26 = *(id *)(a1 + 32);
  id v22 = v2;
  id v6 = v3;
  id v7 = v4;
  id v8 = v23;
  if (v5)
  {
    dispatch_assert_queue_V2(v5[17]);
    if ([(dispatch_queue_t *)v5 connected])
    {
      dispatch_assert_queue_V2(v5[17]);
      int v9 = (const __SecRandom *)*MEMORY[0x1E4F3BC60];
      while (1)
      {
        while (1)
        {
          LODWORD(bytes[0]) = 0;
          if (SecRandomCopyBytes(v9, 4uLL, bytes)) {
            break;
          }
          uint64_t v10 = LODWORD(bytes[0]);
          if (LODWORD(bytes[0])) {
            goto LABEL_8;
          }
        }
        uint64_t v10 = arc4random();
        if (v10)
        {
LABEL_8:
          id v11 = -[HAP2CoAPClient responseCompletionsByToken]((uint64_t)v5);
          id v12 = [NSNumber numberWithUnsignedInt:v10];
          uint64_t v13 = [v11 objectForKeyedSubscript:v12];

          if (!v13)
          {
            id v14 = stringForToken(v10);
            [v7 markWithFormat:@"Token: %@", v14];

            v35[0] = MEMORY[0x1E4F143A8];
            v35[1] = 3221225472;
            v35[2] = __74__HAP2CoAPClient__sendRequestWithMethod_path_payload_activity_completion___block_invoke;
            v35[3] = &unk_1E69F2528;
            id v15 = v7;
            id v36 = v15;
            id v37 = v8;
            uint64_t v16 = (void *)MEMORY[0x1D944E2D0](v35);
            uint64_t v17 = -[HAP2CoAPClient responseCompletionsByToken]((uint64_t)v5);
            __int16 v18 = [NSNumber numberWithUnsignedInt:v10];
            [v17 setObject:v16 forKeyedSubscript:v18];

            bytes[0] = MEMORY[0x1E4F143A8];
            bytes[1] = 3221225472;
            bytes[2] = __74__HAP2CoAPClient__sendRequestWithMethod_path_payload_activity_completion___block_invoke_2;
            bytes[3] = &unk_1E69F2550;
            char v34 = v21;
            id v30 = v22;
            id v31 = v6;
            int v33 = v10;
            id v32 = v15;
            [(dispatch_queue_t *)v5 initialACKTimeout];
            -[HAP2CoAPClient _queueSessionBlock:withTimeout:requiresCompletion:](v5, bytes, 1, v19);

            id v20 = v36;
            goto LABEL_11;
          }
        }
      }
    }
    id v20 = [MEMORY[0x1E4F28C58] hapErrorWithCode:2];
    ((void (*)(void *, void, void *))v24)(v8, 0, v20);
LABEL_11:
  }
  __HMFActivityScopeLeave();
}

uint64_t __64__HAP2CoAPClient_sendRequestWithMethod_path_payload_completion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 invalidate];
}

void __74__HAP2CoAPClient__sendRequestWithMethod_path_payload_activity_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  [*(id *)(a1 + 32) begin];
  id v9 = *(id *)(a1 + 32);
  id v7 = *(void **)(a1 + 32);
  if (v6) {
    [v7 markWithFormat:@"Failed to receive response: %@", v6, v9];
  }
  else {
    [v7 markWithReason:@"Received response"];
  }
  id v8 = *(id *)(a1 + 32);
  [v5 length];
  [v6 domain];

  [v6 code];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __HMFActivityScopeLeave();
}

void __74__HAP2CoAPClient__sendRequestWithMethod_path_payload_activity_completion___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  unsigned __int8 v5 = *(unsigned char *)(a1 + 60);
  id v6 = *(void **)(a1 + 40);
  uint64_t v7 = *(unsigned int *)(a1 + 56);
  id v8 = *(void **)(a1 + 48);
  id v9 = *(id *)(a1 + 32);
  id v10 = v6;
  int v63 = v7;
  id v11 = v8;
  id v12 = v11;
  if (!a2) {
    goto LABEL_42;
  }
  if (a3)
  {
    unsigned __int16 v13 = *(_WORD *)(a3 + 224) + 1;
    *(_WORD *)(a3 + 224) = v13;
    id v14 = (int *)v13;
    objc_msgSend(v11, "markWithFormat:", @"Message id: %lu", v13);
    unint64_t v15 = coap_session_max_pdu_size((unsigned __int8 *)a3);
    uint64_t v16 = coap_pdu_init(0, v5, v13, v15);
    if (!v16)
    {
      if (hap2LogInitialize_onceToken != -1) {
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
      }
      id v38 = (void *)hap2Log_coap;
      if (os_log_type_enabled((os_log_t)hap2Log_coap, OS_LOG_TYPE_ERROR))
      {
        v39 = v38;
        stringForToken(v7);
        unsigned int v40 = (int *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218242;
        uint64_t v65 = v14;
        __int16 v66 = 2112;
        v67 = v40;
        _os_log_error_impl(&dword_1D4758000, v39, OS_LOG_TYPE_ERROR, "<Request id=%lu, token=%@> failed to allocate pdu", buf, 0x16u);
      }
      goto LABEL_30;
    }
    uint64_t v17 = v16;
    __int16 v18 = v10;
    if (coap_add_token((uint64_t)v16, 4uLL, &v63))
    {
      uint64_t v62 = a2;
      if (![v9 length]) {
        goto LABEL_8;
      }
      id v19 = v9;
      id v20 = (const void *)[v19 UTF8String];
      if (!v20)
      {
        if (hap2LogInitialize_onceToken != -1) {
          dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
        }
        unsigned int v43 = (int *)v19;
        uint64_t v44 = (void *)hap2Log_coap;
        id v10 = v18;
        uint64_t v27 = a2;
        if (os_log_type_enabled((os_log_t)hap2Log_coap, OS_LOG_TYPE_ERROR))
        {
          unsigned int v52 = v44;
          _stringForMessage((uint64_t)v17, 0);
          unsigned int v53 = (int *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          uint64_t v65 = v53;
          __int16 v66 = 2112;
          v67 = v43;
          _os_log_error_impl(&dword_1D4758000, v52, OS_LOG_TYPE_ERROR, "%@ failed to get utf8 for path '%@'", buf, 0x16u);
        }
        coap_delete_pdu(v17);
LABEL_40:
        uint64_t v42 = v27;
        goto LABEL_41;
      }
      if (coap_add_option((uint64_t)v17, 0xBu, [v19 lengthOfBytesUsingEncoding:4], v20))
      {
LABEL_8:
        id v61 = v9;
        id v10 = v18;
        if ([v18 length])
        {
          uint64_t v21 = [v18 length];
          id v22 = v18;
          uint64_t v23 = [v22 bytes];
          if (v21)
          {
            id v24 = (const void *)v23;
            id v25 = (void *)coap_add_data_after(v17, v21);
            if (!v25)
            {
              if (hap2LogInitialize_onceToken != -1) {
                dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
              }
              id v9 = v61;
              int v51 = (void *)hap2Log_coap;
              if (os_log_type_enabled((os_log_t)hap2Log_coap, OS_LOG_TYPE_ERROR))
              {
                unsigned int v58 = v51;
                _stringForMessage((uint64_t)v17, 0);
                unsigned int v59 = (int *)objc_claimAutoreleasedReturnValue();
                uint64_t v60 = [v22 length];
                *(_DWORD *)buf = 138412546;
                uint64_t v65 = v59;
                __int16 v66 = 2048;
                v67 = (int *)v60;
                _os_log_error_impl(&dword_1D4758000, v58, OS_LOG_TYPE_ERROR, "%@ failed to attach payload (%lu bytes)", buf, 0x16u);
              }
              coap_delete_pdu(v17);
              uint64_t v42 = v62;
              goto LABEL_41;
            }
            memcpy(v25, v24, v21);
          }
        }
        [v12 markWithReason:@"Sending request"];
        id v26 = (id)objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v10, "length"));
        uint64_t v27 = v62;
        if (coap_send((unsigned __int8 *)a3, (uint64_t)v17) != -1)
        {
          if (hap2LogInitialize_onceToken != -1) {
            dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
          }
          id v28 = (void *)hap2Log_coap;
          if (os_log_type_enabled((os_log_t)hap2Log_coap, OS_LOG_TYPE_DEFAULT))
          {
            id v29 = *(void **)(v62 + 144);
            id v30 = v29;
            id v31 = v28;
            coap_session_str(a3);
            id v32 = _stringForMessage((uint64_t)v17, 0);
            *(_DWORD *)buf = 138478339;
            uint64_t v65 = (int *)v29;
            __int16 v66 = 2081;
            v67 = &coap_session_str_szSession;
            __int16 v68 = 2112;
            v69 = v32;
            _os_log_impl(&dword_1D4758000, v31, OS_LOG_TYPE_DEFAULT, "[%{private}@] %{private}s: %@ sent", buf, 0x20u);

            uint64_t v27 = v62;
          }
          [v12 markWithReason:@"Sent Request"];
          int v33 = *(void **)(v27 + 104);
          char v34 = NSNumber;
          id v35 = v33;
          id v36 = [v34 numberWithUnsignedInt:v7];
          [v35 addObject:v36];

          id v9 = v61;
          goto LABEL_42;
        }
        [v12 markWithReason:@"Send Request Failed"];
        if (hap2LogInitialize_onceToken != -1) {
          dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
        }
        id v9 = v61;
        int v45 = (void *)hap2Log_coap;
        if (os_log_type_enabled((os_log_t)hap2Log_coap, OS_LOG_TYPE_ERROR))
        {
          unsigned int v54 = *(void **)(v62 + 144);
          id v55 = v54;
          unsigned int v56 = v45;
          int v57 = stringForToken(v7);
          *(_DWORD *)buf = 138478339;
          uint64_t v65 = (int *)v54;
          uint64_t v27 = v62;
          __int16 v66 = 2048;
          v67 = v14;
          __int16 v68 = 2112;
          v69 = v57;
          _os_log_error_impl(&dword_1D4758000, v56, OS_LOG_TYPE_ERROR, "[%{private}@] <Request id=%lu, token=%@> failed to send", buf, 0x20u);
        }
        goto LABEL_40;
      }
      if (hap2LogInitialize_onceToken != -1) {
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
      }
      unsigned int v46 = (int *)v19;
      unsigned int v47 = (void *)hap2Log_coap;
      id v10 = v18;
      if (!os_log_type_enabled((os_log_t)hap2Log_coap, OS_LOG_TYPE_ERROR)) {
        goto LABEL_29;
      }
      int v48 = v47;
      _stringForMessage((uint64_t)v17, 0);
      unsigned int v49 = (int *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      uint64_t v65 = v49;
      __int16 v66 = 2112;
      v67 = v46;
      unsigned int v50 = "%@ failed to attach path '%@'";
    }
    else
    {
      if (hap2LogInitialize_onceToken != -1) {
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
      }
      __int16 v41 = (void *)hap2Log_coap;
      if (!os_log_type_enabled((os_log_t)hap2Log_coap, OS_LOG_TYPE_ERROR)) {
        goto LABEL_29;
      }
      int v48 = v41;
      stringForToken(v7);
      unsigned int v49 = (int *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      uint64_t v65 = v14;
      __int16 v66 = 2112;
      v67 = v49;
      unsigned int v50 = "<Request id=%lu, token=%@> failed to attach token";
    }
    _os_log_error_impl(&dword_1D4758000, v48, OS_LOG_TYPE_ERROR, v50, buf, 0x16u);

LABEL_29:
    coap_delete_pdu(v17);
LABEL_30:
    uint64_t v42 = a2;
LABEL_41:
    -[HAP2CoAPClient _ioThreadRequestFailed:](v42, v7);
    goto LABEL_42;
  }
  if (hap2LogInitialize_onceToken != -1) {
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
  }
  id v37 = hap2Log_coap;
  if (os_log_type_enabled((os_log_t)hap2Log_coap, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v65 = (int *)a2;
    _os_log_error_impl(&dword_1D4758000, v37, OS_LOG_TYPE_ERROR, "%@ Failed to retrieve session", buf, 0xCu);
  }
LABEL_42:
}

- (void)_ioThreadRequestFailed:(uint64_t)a1
{
  uint64_t v2 = *(NSObject **)(a1 + 136);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __41__HAP2CoAPClient__ioThreadRequestFailed___block_invoke;
  v3[3] = &unk_1E69F3DD0;
  v3[4] = a1;
  int v4 = a2;
  dispatch_async(v2, v3);
}

void __41__HAP2CoAPClient__ioThreadRequestFailed___block_invoke(uint64_t a1)
{
  -[HAP2CoAPClient _queueSessionCompletion](*(void *)(a1 + 32));
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(unsigned int *)(a1 + 40);
  id v4 = [MEMORY[0x1E4F28C58] hapErrorWithCode:1];
  -[HAP2CoAPClient _callResponseCompletion:response:error:](v2, v3, 0, v4);
}

- (void)openWithCompletion:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = NSString;
  id v6 = (objc_class *)objc_opt_class();
  uint64_t v7 = NSStringFromClass(v6);
  id v8 = [v5 stringWithFormat:@"%@ Open", v7];

  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F653F0]) initWithName:v8];
  id v16 = v9;
  if (self) {
    workQueue = self->_workQueue;
  }
  else {
    workQueue = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__HAP2CoAPClient_openWithCompletion___block_invoke;
  block[3] = &unk_1E69F4070;
  id v13 = v9;
  id v14 = self;
  id v15 = v4;
  id v11 = v4;
  dispatch_async(workQueue, block);

  __HMFActivityScopeLeave();
}

void __37__HAP2CoAPClient_openWithCompletion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) begin];
  id v9 = *(id *)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  unsigned __int8 v5 = __37__HAP2CoAPClient_openWithCompletion___block_invoke_2;
  id v6 = &unk_1E69F3E20;
  uint64_t v2 = *(void *)(a1 + 40);
  id v8 = *(id *)(a1 + 48);
  id v7 = *(id *)(a1 + 32);
  uint64_t v3 = v4;
  if (v2)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v2 + 136));
    if ([(id)v2 connected])
    {
      ((void (*)(void *, void))v5)(v3, 0);
    }
    else
    {
      -[HAP2CoAPClient setOpenCompletion:](v2, v3);
      dispatch_assert_queue_V2(*(dispatch_queue_t *)(v2 + 136));
      if (!*(unsigned char *)(v2 + 41))
      {
        dispatch_assert_queue_V2(*(dispatch_queue_t *)(v2 + 136));
        *(unsigned char *)(v2 + 41) = 1;
        +[HAP2CoAPIO registerConsumer:v2];
      }
    }
  }

  __HMFActivityScopeLeave();
}

uint64_t __37__HAP2CoAPClient_openWithCompletion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 invalidate];
}

- (void)setInitialACKTimeout:(double)a3
{
  id v4 = self;
  if (self) {
    self = (HAP2CoAPClient *)self->_propertyLock;
  }
  [(HAP2CoAPClient *)self assertOwner];
  v4->_initialACKTimeout = a3;
}

- (double)initialACKTimeout
{
  uint64_t v8 = 0;
  id v9 = (double *)&v8;
  uint64_t v10 = 0x2020000000;
  if (self) {
    propertyLock = self->_propertyLock;
  }
  else {
    propertyLock = 0;
  }
  uint64_t v11 = 0;
  id v4 = propertyLock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __35__HAP2CoAPClient_initialACKTimeout__block_invoke;
  v7[3] = &unk_1E69F44F0;
  v7[4] = self;
  v7[5] = &v8;
  [(HAP2PropertyLock *)v4 performReadingBlock:v7];

  double v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

double __35__HAP2CoAPClient_initialACKTimeout__block_invoke(uint64_t a1)
{
  double result = *(double *)(*(void *)(a1 + 32) + 64);
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setMaxTransmitAttempts:(unint64_t)a3
{
  id v4 = self;
  if (self) {
    self = (HAP2CoAPClient *)self->_propertyLock;
  }
  [(HAP2CoAPClient *)self assertOwner];
  v4->_maxTransmitAttempts = a3;
}

- (unint64_t)maxTransmitAttempts
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  if (self) {
    propertyLock = self->_propertyLock;
  }
  else {
    propertyLock = 0;
  }
  uint64_t v11 = 0;
  id v4 = propertyLock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __37__HAP2CoAPClient_maxTransmitAttempts__block_invoke;
  v7[3] = &unk_1E69F44F0;
  v7[4] = self;
  v7[5] = &v8;
  [(HAP2PropertyLock *)v4 performReadingBlock:v7];

  unint64_t v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __37__HAP2CoAPClient_maxTransmitAttempts__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 56);
  return result;
}

- (void)setConnected:(BOOL)a3
{
  if (self) {
    propertyLock = self->_propertyLock;
  }
  else {
    propertyLock = 0;
  }
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  void v4[2] = __31__HAP2CoAPClient_setConnected___block_invoke;
  v4[3] = &unk_1E69F3DF8;
  v4[4] = self;
  BOOL v5 = a3;
  [(HAP2PropertyLock *)propertyLock performWritingBlock:v4];
}

uint64_t __31__HAP2CoAPClient_setConnected___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 40) = *(unsigned char *)(result + 40);
  return result;
}

- (BOOL)connected
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  if (self) {
    propertyLock = self->_propertyLock;
  }
  else {
    propertyLock = 0;
  }
  char v11 = 0;
  id v4 = propertyLock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __27__HAP2CoAPClient_connected__block_invoke;
  v7[3] = &unk_1E69F44F0;
  v7[4] = self;
  v7[5] = &v8;
  [(HAP2PropertyLock *)v4 performReadingBlock:v7];

  char v5 = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __27__HAP2CoAPClient_connected__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 40);
  return result;
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  if (self) {
    propertyLock = self->_propertyLock;
  }
  else {
    propertyLock = 0;
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __30__HAP2CoAPClient_setDelegate___block_invoke;
  v7[3] = &unk_1E69F46E0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(HAP2PropertyLock *)propertyLock performWritingBlock:v7];
}

id __30__HAP2CoAPClient_setDelegate___block_invoke(uint64_t a1)
{
  return objc_storeWeak((id *)(*(void *)(a1 + 32) + 48), *(id *)(a1 + 40));
}

- (HAP2CoAPClientDelegate)delegate
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  char v11 = __Block_byref_object_copy__13675;
  id v12 = __Block_byref_object_dispose__13676;
  id v13 = 0;
  if (self) {
    propertyLock = self->_propertyLock;
  }
  else {
    propertyLock = 0;
  }
  id v4 = propertyLock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __26__HAP2CoAPClient_delegate__block_invoke;
  v7[3] = &unk_1E69F44F0;
  v7[4] = self;
  void v7[5] = &v8;
  [(HAP2PropertyLock *)v4 performReadingBlock:v7];

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (HAP2CoAPClientDelegate *)v5;
}

uint64_t __26__HAP2CoAPClient_delegate__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 48));

  return MEMORY[0x1F41817F8]();
}

- (HAP2CoAPClient)initWithIPAddress:(id)a3
{
  return [(HAP2CoAPClient *)self initWithIPAddress:a3 port:0];
}

- (HAP2CoAPClient)initWithIPAddress:(id)a3 port:(unsigned __int16)a4
{
  return [(HAP2CoAPClient *)self initWithIPAddress:a3 port:a4 maxTransmitAttempts:0 initialACKTimeout:0.0];
}

- (HAP2CoAPClient)initWithIPAddress:(id)a3 port:(unsigned __int16)a4 maxTransmitAttempts:(unint64_t)a5 initialACKTimeout:(double)a6
{
  return (HAP2CoAPClient *)-[HAP2CoAPClient _initWithIPAddress:port:maxTransmitAttempts:initialACKTimeout:workQueue:]((char *)self, a3, a4, a5, 0, a6);
}

- (char)_initWithIPAddress:(unsigned int)a3 port:(uint64_t)a4 maxTransmitAttempts:(void *)a5 initialACKTimeout:(double)a6 workQueue:
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v11 = a2;
  id v12 = a5;
  if (a1)
  {
    if (a3) {
      uint64_t v13 = a3;
    }
    else {
      uint64_t v13 = 5683;
    }
    memset(v17, 0, sizeof(v17));
    if (+[HAP2CoAPIO setCoapAddressFromString:v11 port:v13 coapAddress:v17])
    {
      a1 = -[HAP2CoAPClient initWithSocketAddress:withAccessoryName:workQueue:maxTransmitAttempts:initialACKTimeout:](a1, (unsigned __int8 *)v17 + 4, 0, v12, a4, a6);
      id v14 = a1;
    }
    else
    {
      if (hap2LogInitialize_onceToken != -1) {
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
      }
      id v15 = hap2Log_coap;
      if (os_log_type_enabled((os_log_t)hap2Log_coap, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v19 = v11;
        _os_log_error_impl(&dword_1D4758000, v15, OS_LOG_TYPE_ERROR, "Failed to parse address from string: %@", buf, 0xCu);
      }
      id v14 = 0;
    }
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

- (char)initWithSocketAddress:(void *)a3 withAccessoryName:(void *)a4 workQueue:(uint64_t)a5 maxTransmitAttempts:(double)a6 initialACKTimeout:
{
  id v11 = a3;
  id v12 = a4;
  int v13 = a2[1];
  if (v12)
  {
    dispatch_queue_t v14 = v12;
  }
  else
  {
    id v15 = (const char *)HAPDispatchQueueName(a1, @"workQueue");
    id v16 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    uint64_t v17 = dispatch_get_global_queue(17, 0);
    dispatch_queue_t v14 = dispatch_queue_create_with_target_V2(v15, v16, v17);
  }
  v35.receiver = a1;
  v35.super_class = (Class)HAP2CoAPClient;
  __int16 v18 = (char *)objc_msgSendSuper2(&v35, sel_init);
  id v19 = v18;
  if (v18)
  {
    if (v13 == 30) {
      unsigned int v20 = 28;
    }
    else {
      unsigned int v20 = 16;
    }
    if (*a2) {
      size_t v21 = *a2;
    }
    else {
      size_t v21 = v20;
    }
    if (!a5) {
      a5 = 3;
    }
    if (a6 <= 0.0) {
      a6 = 1.428;
    }
    *(void *)(v18 + 12) = 0;
    *(void *)(v18 + 28) = 0;
    *(void *)(v18 + 20) = 0;
    *((_DWORD *)v18 + 9) = 0;
    *((_DWORD *)v18 + 2) = 28;
    *((_DWORD *)v18 + 2) = v21;
    memcpy(v18 + 12, a2, v21);
    uint64_t v22 = +[HAP2PropertyLock lockWithName:@"HAP2CoAPClient.propertyLock"];
    uint64_t v23 = (void *)*((void *)v19 + 16);
    *((void *)v19 + 16) = v22;

    if (v11) {
      id v24 = v11;
    }
    else {
      id v24 = &stru_1F2C4E778;
    }
    objc_storeStrong((id *)v19 + 18, v24);
    objc_storeStrong((id *)v19 + 17, v14);
    *((void *)v19 + 7) = a5;
    *((double *)v19 + 8) = a6;
    uint64_t v25 = [MEMORY[0x1E4F1CA60] dictionary];
    id v26 = (void *)*((void *)v19 + 11);
    *((void *)v19 + 11) = v25;

    uint64_t v27 = (void *)*((void *)v19 + 12);
    *((void *)v19 + 12) = 0;

    uint64_t v28 = [MEMORY[0x1E4F1CA80] set];
    id v29 = (void *)*((void *)v19 + 13);
    *((void *)v19 + 13) = v28;

    uint64_t v30 = [MEMORY[0x1E4F1CA70] orderedSet];
    id v31 = (void *)*((void *)v19 + 14);
    *((void *)v19 + 14) = v30;

    uint64_t v32 = [MEMORY[0x1E4F1CA70] orderedSet];
    int v33 = (void *)*((void *)v19 + 15);
    *((void *)v19 + 15) = v32;
  }
  return v19;
}

- (HAP2CoAPClient)initWithIPAddress:(id)a3 port:(unsigned __int16)a4 maxTransmitAttempts:(unint64_t)a5 initialACKTimeout:(double)a6 workQueue:(id)a7
{
  return (HAP2CoAPClient *)-[HAP2CoAPClient _initWithIPAddress:port:maxTransmitAttempts:initialACKTimeout:workQueue:]((char *)self, a3, a4, a5, a7, a6);
}

- (HAP2CoAPClient)initWithSocketAddress:(const sockaddr *)a3
{
  return [(HAP2CoAPClient *)self initWithSocketAddress:a3 withAccessoryName:0 maxTransmitAttempts:0 initialACKTimeout:0.0];
}

- (HAP2CoAPClient)initWithSocketAddress:(const sockaddr *)a3 withAccessoryName:(id)a4 maxTransmitAttempts:(unint64_t)a5 initialACKTimeout:(double)a6
{
  if (self) {
    return (HAP2CoAPClient *)-[HAP2CoAPClient initWithSocketAddress:withAccessoryName:workQueue:maxTransmitAttempts:initialACKTimeout:](self, &a3->sa_len, a4, 0, a5, a6);
  }
  return self;
}

@end
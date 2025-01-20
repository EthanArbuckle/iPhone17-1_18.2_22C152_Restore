@interface NSURLSessionWebSocketTask
- (NSData)closeReason;
- (NSInteger)maximumMessageSize;
- (NSURLSessionWebSocketCloseCode)closeCode;
- (void)setMaximumMessageSize:(NSInteger)maximumMessageSize;
@end

@implementation NSURLSessionWebSocketTask

uint64_t __58____NSURLSessionWebSocketTask__onqueue_checkForCompletion__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(**(void **)(a1 + 32) + 152))(*(void *)(a1 + 32), 0);
}

void __70____NSURLSessionWebSocketTask__onqueue_didReceiveResponse_completion___block_invoke(uint64_t a1, const char *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id Property = objc_getProperty(*(id *)(a1 + 32), a2, 1016, 1);
    uint64_t v4 = v2;
  }
  else
  {
    uint64_t v4 = 0;
    id Property = 0;
  }

  -[__NSURLSessionWebSocketTask _onqueue_enableWebSocketFraming:](v4, Property);
}

id __63____NSURLSessionWebSocketTask__onqueue_enableWebSocketFraming___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _DWORD *a4)
{
  if (_ConnectionProtocolIdentifier::onceToken != -1) {
    dispatch_once(&_ConnectionProtocolIdentifier::onceToken, &__block_literal_global_19627);
  }
  if (nw_protocols_are_equal() && (uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8), !*(unsigned char *)(v7 + 24)))
  {
    *(unsigned char *)(v7 + 24) = 1;
    *a4 = 3;
    id Property = *(id *)(a1 + 32);
    if (Property) {
      id Property = objc_getProperty(Property, v6, 1024, 1);
    }
    id v8 = Property;
  }
  else
  {
    id v8 = 0;
    *a4 = 0;
  }

  return v8;
}

void __63____NSURLSessionWebSocketTask__onqueue_enableWebSocketFraming___block_invoke_2(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v5 = webSocketLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    int v12 = a3;
    _os_log_debug_impl(&dword_184085000, v5, OS_LOG_TYPE_DEBUG, "viable %d", buf, 8u);
  }

  if (!a3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    if (WeakRetained)
    {
      uint64_t v7 = webSocketLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_184085000, v7, OS_LOG_TYPE_DEFAULT, "Cancelling websocket task because connection is no longer viable", buf, 2u);
      }

      id v8 = [WeakRetained workQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __63____NSURLSessionWebSocketTask__onqueue_enableWebSocketFraming___block_invoke_13;
      block[3] = &unk_1E5258228;
      id v10 = WeakRetained;
      dispatch_async(v8, block);
    }
  }
}

void __63____NSURLSessionWebSocketTask__onqueue_enableWebSocketFraming___block_invoke_13(uint64_t a1)
{
}

void __68____NSURLSessionWebSocketTask__onqueue_sendCloseCode_reason_cancel___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = webSocketLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v3 = [*(id *)(a1 + 32) _loggableDescription];
    uint64_t v4 = *(void *)(a1 + 40);
    int v5 = 138543618;
    v6 = v3;
    __int16 v7 = 2048;
    uint64_t v8 = v4;
    _os_log_debug_impl(&dword_184085000, v2, OS_LOG_TYPE_DEBUG, "%{public}@ closed with code %ld", (uint8_t *)&v5, 0x16u);
  }
}

void __37____NSURLSessionWebSocketTask_cancel__block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) state] != 3)
  {
    uint64_t v2 = *(unsigned char **)(a1 + 32);
    if (v2 && (v2[939] & 1) != 0)
    {
      [v2 setState:2];
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __37____NSURLSessionWebSocketTask_cancel__block_invoke_7;
      aBlock[3] = &unk_1E5258228;
      aBlock[4] = *(void *)(a1 + 32);
      uint64_t v8 = _Block_copy(aBlock);
      uint64_t v9 = *(void **)(*(void *)(a1 + 32) + 976);
      id v10 = _Block_copy(v8);
      [v9 addObject:v10];

      -[__NSURLSessionWebSocketTask _onqueue_ioTick](*(void *)(a1 + 32));
    }
    else
    {
      v3 = webSocketLog();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      {
        v11 = [*(id *)(a1 + 32) _loggableDescription];
        *(_DWORD *)buf = 138543362;
        v15 = v11;
        _os_log_debug_impl(&dword_184085000, v3, OS_LOG_TYPE_DEBUG, "%{public}@ Cancelling task immediately without sending a close frame", buf, 0xCu);
      }
      uint64_t v4 = *(void **)(a1 + 32);
      if (v4) {
        uint64_t v4 = (void *)[v4 error:*MEMORY[0x1E4F289A0] code:-999];
      }
      id v6 = v4;
      __int16 v7 = *(void **)(a1 + 32);
      if (v7) {
        objc_setProperty_atomic(v7, v5, v6, 1008);
      }

      v13.receiver = *(id *)(a1 + 32);
      v13.super_class = (Class)__NSURLSessionWebSocketTask;
      objc_msgSendSuper2(&v13, sel__onqueue_cancel);
    }
  }
}

uint64_t __37____NSURLSessionWebSocketTask_cancel__block_invoke_7(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_cancel");
}

void __58____NSURLSessionWebSocketTask_cancelWithCloseCode_reason___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) state] != 3)
  {
    [*(id *)(a1 + 32) setState:2];
    uint64_t v2 = *(void *)(a1 + 32);
    if (v2 && (*(unsigned char *)(v2 + 939) & 1) != 0)
    {
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __58____NSURLSessionWebSocketTask_cancelWithCloseCode_reason___block_invoke_6;
      aBlock[3] = &unk_1E5257B78;
      uint64_t v9 = *(void **)(a1 + 40);
      uint64_t v8 = *(void *)(a1 + 48);
      aBlock[4] = v2;
      uint64_t v16 = v8;
      id v15 = v9;
      id v10 = _Block_copy(aBlock);
      v11 = *(void **)(*(void *)(a1 + 32) + 976);
      int v12 = _Block_copy(v10);
      [v11 addObject:v12];

      -[__NSURLSessionWebSocketTask _onqueue_ioTick](*(void *)(a1 + 32));
    }
    else
    {
      v3 = webSocketLog();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      {
        objc_super v13 = [*(id *)(a1 + 32) _loggableDescription];
        *(_DWORD *)buf = 138543362;
        v19 = v13;
        _os_log_debug_impl(&dword_184085000, v3, OS_LOG_TYPE_DEBUG, "%{public}@ Cancelling task immediately without sending a close frame", buf, 0xCu);
      }
      uint64_t v4 = *(void **)(a1 + 32);
      if (v4) {
        uint64_t v4 = (void *)[v4 error:*MEMORY[0x1E4F289A0] code:-999];
      }
      id v6 = v4;
      __int16 v7 = *(void **)(a1 + 32);
      if (v7) {
        objc_setProperty_atomic(v7, v5, v6, 1008);
      }

      v17.receiver = *(id *)(a1 + 32);
      v17.super_class = (Class)__NSURLSessionWebSocketTask;
      objc_msgSendSuper2(&v17, sel__onqueue_cancel);
    }
  }
}

void __58____NSURLSessionWebSocketTask_cancelWithCloseCode_reason___block_invoke_6(uint64_t a1)
{
}

void __53____NSURLSessionWebSocketTask__sendCloseCode_reason___block_invoke(uint64_t *a1)
{
  if ([(id)a1[4] state] != 3)
  {
    v3 = (void *)a1[4];
    if (v3)
    {
      if (objc_getProperty(v3, v2, 1008, 1)) {
        return;
      }
      uint64_t v4 = a1[4];
    }
    else
    {
      uint64_t v4 = 0;
    }
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __53____NSURLSessionWebSocketTask__sendCloseCode_reason___block_invoke_2;
    aBlock[3] = &unk_1E5257B78;
    id v6 = (void *)a1[5];
    uint64_t v5 = a1[6];
    aBlock[4] = v4;
    uint64_t v12 = v5;
    id v11 = v6;
    __int16 v7 = _Block_copy(aBlock);
    uint64_t v8 = *(void **)(a1[4] + 976);
    uint64_t v9 = _Block_copy(v7);
    [v8 addObject:v9];

    -[__NSURLSessionWebSocketTask _onqueue_ioTick](a1[4]);
  }
}

void __53____NSURLSessionWebSocketTask__sendCloseCode_reason___block_invoke_2(uint64_t a1)
{
}

void __62____NSURLSessionWebSocketTask_sendPingWithPongReceiveHandler___block_invoke(uint64_t a1, const char *a2)
{
  v3 = *(void **)(a1 + 32);
  if (v3 && (id v4 = objc_getProperty(v3, a2, 1008, 1), v3 = *(void **)(a1 + 32), v4))
  {
    uint64_t v5 = *(void *)(a1 + 40);
    if (v3) {
      id Property = objc_getProperty(v3, (SEL)(v5 + 16), 1008, 1);
    }
    else {
      id Property = 0;
    }
    __int16 v7 = *(void (**)(uint64_t, id))(v5 + 16);
    v7(v5, Property);
  }
  else
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __62____NSURLSessionWebSocketTask_sendPingWithPongReceiveHandler___block_invoke_2;
    aBlock[3] = &unk_1E5258028;
    aBlock[4] = v3;
    id v12 = *(id *)(a1 + 40);
    uint64_t v8 = _Block_copy(aBlock);
    uint64_t v9 = *(void **)(*(void *)(a1 + 32) + 992);
    id v10 = _Block_copy(v8);
    [v9 addObject:v10];

    -[__NSURLSessionWebSocketTask _onqueue_ioTick](*(void *)(a1 + 32));
  }
}

void __62____NSURLSessionWebSocketTask_sendPingWithPongReceiveHandler___block_invoke_2(uint64_t a1)
{
  v1 = *(void ***)(a1 + 32);
  id v2 = *(id *)(a1 + 40);
  if (v1)
  {
    v3 = [v1 workQueue];
    dispatch_assert_queue_V2(v3);

    id v5 = objc_getProperty(v1, v4, 1008, 1);
    if (v5)
    {
      id v6 = [v1 session];
      uint64_t aBlock = MEMORY[0x1E4F143A8];
      uint64_t v15 = 3221225472;
      uint64_t v16 = __60____NSURLSessionWebSocketTask__onqueue_pingWithPongHandler___block_invoke;
      objc_super v17 = &unk_1E5258028;
      id v19 = v2;
      id v18 = v5;
      -[NSURLSession runDelegateBlock:]((uint64_t)v6, &aBlock);
    }
    else
    {
      uint64_t aBlock = MEMORY[0x1E4F143A8];
      uint64_t v15 = 3221225472;
      uint64_t v16 = __60____NSURLSessionWebSocketTask__onqueue_pingWithPongHandler___block_invoke_2;
      objc_super v17 = &unk_1E5257100;
      id v18 = v1;
      id v19 = v2;
      __int16 v7 = _Block_copy(&aBlock);
      uint64_t v8 = nw_content_context_create("websocketPing");
      metadata = nw_ws_create_metadata(nw_ws_opcode_ping);
      id v10 = [v1 workQueue];
      nw_ws_metadata_set_pong_handler(metadata, v10, v7);

      nw_content_context_set_metadata_for_protocol(v8, metadata);
      id v11 = (*(uint64_t (**)(void *))(*v1[111] + 424))(v1[111]);
      id v12 = dispatch_data_create(v1 + 118, 4uLL, 0, 0);
      ++*((_DWORD *)v1 + 236);
      completion[0] = MEMORY[0x1E4F143A8];
      completion[1] = 3221225472;
      completion[2] = __60____NSURLSessionWebSocketTask__onqueue_pingWithPongHandler___block_invoke_5;
      completion[3] = &unk_1E5257128;
      completion[4] = v1;
      nw_connection_send(v11, v12, v8, 1, completion);
    }
  }
}

uint64_t __60____NSURLSessionWebSocketTask__onqueue_pingWithPongHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __60____NSURLSessionWebSocketTask__onqueue_pingWithPongHandler___block_invoke_2(uint64_t a1, void *a2)
{
  v3 = a2;
  SEL v4 = v3;
  if (v3) {
    CFErrorRef v5 = nw_error_copy_cf_error(v3);
  }
  else {
    CFErrorRef v5 = 0;
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __60____NSURLSessionWebSocketTask__onqueue_pingWithPongHandler___block_invoke_3;
  aBlock[3] = &unk_1E52581A0;
  id v6 = *(void **)(a1 + 40);
  aBlock[4] = *(void *)(a1 + 32);
  id v13 = v6;
  __int16 v7 = v5;
  id v12 = v7;
  uint64_t v8 = _Block_copy(aBlock);
  uint64_t v9 = *(void **)(*(void *)(a1 + 32) + 1000);
  id v10 = _Block_copy(v8);
  [v9 addObject:v10];

  -[__NSURLSessionWebSocketTask _onqueue_ioTick](*(void *)(a1 + 32));
}

void __60____NSURLSessionWebSocketTask__onqueue_pingWithPongHandler___block_invoke_5(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60____NSURLSessionWebSocketTask__onqueue_pingWithPongHandler___block_invoke_6;
  block[3] = &unk_1E5258228;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async(v2, block);
}

void __60____NSURLSessionWebSocketTask__onqueue_pingWithPongHandler___block_invoke_6(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = webSocketLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v3 = [*(id *)(a1 + 32) _loggableDescription];
    int v4 = *(_DWORD *)(*(void *)(a1 + 32) + 944);
    int v5 = 138412546;
    id v6 = v3;
    __int16 v7 = 1024;
    int v8 = v4;
    _os_log_debug_impl(&dword_184085000, v2, OS_LOG_TYPE_DEBUG, "%@ Sent ping %d", (uint8_t *)&v5, 0x12u);
  }
}

void __60____NSURLSessionWebSocketTask__onqueue_pingWithPongHandler___block_invoke_3(id *a1)
{
  id v2 = [a1[4] session];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __60____NSURLSessionWebSocketTask__onqueue_pingWithPongHandler___block_invoke_4;
  v3[3] = &unk_1E5258028;
  id v5 = a1[6];
  id v4 = a1[5];
  -[NSURLSession runDelegateBlock:]((uint64_t)v2, v3);
}

uint64_t __60____NSURLSessionWebSocketTask__onqueue_pingWithPongHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __67____NSURLSessionWebSocketTask_receiveMessageWithCompletionHandler___block_invoke(uint64_t a1, const char *a2)
{
  v3 = *(void **)(a1 + 32);
  if (v3
    && (id v4 = objc_getProperty(v3, a2, 1008, 1), v3 = *(void **)(a1 + 32), v4))
  {
    id v5 = [v3 session];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __67____NSURLSessionWebSocketTask_receiveMessageWithCompletionHandler___block_invoke_3;
    v11[3] = &unk_1E5258028;
    id v6 = *(id *)(a1 + 40);
    id v12 = v4;
    id v13 = v6;
    id v7 = v4;
    -[NSURLSession runDelegateBlock:]((uint64_t)v5, v11);
  }
  else
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __67____NSURLSessionWebSocketTask_receiveMessageWithCompletionHandler___block_invoke_2;
    aBlock[3] = &unk_1E5258028;
    aBlock[4] = v3;
    id v15 = *(id *)(a1 + 40);
    int v8 = _Block_copy(aBlock);
    uint64_t v9 = *(void **)(*(void *)(a1 + 32) + 984);
    id v10 = _Block_copy(v8);
    [v9 addObject:v10];

    -[__NSURLSessionWebSocketTask _onqueue_ioTick](*(void *)(a1 + 32));
  }
}

void __67____NSURLSessionWebSocketTask_receiveMessageWithCompletionHandler___block_invoke_2(uint64_t a1)
{
}

uint64_t __67____NSURLSessionWebSocketTask_receiveMessageWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t __76____NSURLSessionWebSocketTask__onqueue_receiveMessageWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __76____NSURLSessionWebSocketTask__onqueue_receiveMessageWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3, char a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a5;
  id v12 = [*(id *)(a1 + 32) workQueue];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __76____NSURLSessionWebSocketTask__onqueue_receiveMessageWithCompletionHandler___block_invoke_3;
  v17[3] = &unk_1E5257150;
  id v18 = v10;
  id v19 = v11;
  char v23 = a4;
  id v13 = *(void **)(a1 + 40);
  uint64_t v20 = *(void *)(a1 + 32);
  id v21 = v9;
  id v22 = v13;
  id v14 = v9;
  id v15 = v11;
  id v16 = v10;
  dispatch_async(v12, v17);
}

void __76____NSURLSessionWebSocketTask__onqueue_receiveMessageWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v2 = *(NSObject **)(a1 + 32);
  if (!v2)
  {
    id v5 = (nw_error_t *)(a1 + 40);
    if (*(void *)(a1 + 40))
    {
      id v4 = 0;
      goto LABEL_8;
    }
    goto LABEL_14;
  }
  v3 = nw_protocol_copy_ws_definition();
  id v4 = nw_content_context_copy_protocol_metadata(v2, v3);

  id v5 = (nw_error_t *)(a1 + 40);
  if (!*(void *)(a1 + 40))
  {
    if (v4)
    {
LABEL_13:
      nw_ws_opcode_t opcode = nw_ws_metadata_get_opcode(v4);
      goto LABEL_20;
    }
LABEL_14:
    if (*(unsigned char *)(a1 + 72))
    {
      id v11 = *(void **)(a1 + 48);
      if (v11) {
        id v12 = (void *)[v11 error:*MEMORY[0x1E4F28798] code:57];
      }
      else {
        id v12 = 0;
      }
      objc_storeStrong((id *)(*(void *)(a1 + 48) + 1008), v12);
    }
    id v4 = 0;
    goto LABEL_19;
  }
  if (v4 && *(unsigned char *)(a1 + 72)) {
    goto LABEL_13;
  }
LABEL_8:
  id v6 = webSocketLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    nw_error_t v24 = *v5;
    *(_DWORD *)buf = 138412290;
    nw_error_t v36 = v24;
    _os_log_error_impl(&dword_184085000, v6, OS_LOG_TYPE_ERROR, "Read completed with an error %@", buf, 0xCu);
  }

  CFErrorRef v7 = nw_error_copy_cf_error(*v5);
  uint64_t v8 = *(void *)(a1 + 48);
  id v9 = *(void **)(v8 + 1008);
  *(void *)(v8 + 1008) = v7;

  if (v4) {
    goto LABEL_13;
  }
LABEL_19:
  nw_ws_opcode_t opcode = nw_ws_opcode_invalid;
LABEL_20:
  if (*(void *)(*(void *)(a1 + 48) + 1008))
  {
    id v13 = 0;
  }
  else
  {
    switch(opcode)
    {
      case nw_ws_opcode_text:
        id v14 = [NSString alloc];
        if (*(void *)(a1 + 56)) {
          uint64_t v15 = *(void *)(a1 + 56);
        }
        else {
          uint64_t v15 = MEMORY[0x1E4F14410];
        }
        id v16 = [v14 initWithData:v15 encoding:4];
        if (v16)
        {
          id v13 = [[NSURLSessionWebSocketMessage alloc] initWithString:v16];
        }
        else
        {
          v25 = webSocketLog();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_184085000, v25, OS_LOG_TYPE_ERROR, "String data is not UTF-8 encoded", buf, 2u);
          }

          v26 = *(void **)(a1 + 48);
          if (v26) {
            v27 = (void *)[v26 error:*MEMORY[0x1E4F289A0] code:-1016];
          }
          else {
            v27 = 0;
          }
          objc_storeStrong((id *)(*(void *)(a1 + 48) + 1008), v27);
          id v16 = 0;
LABEL_46:
          id v13 = 0;
        }
LABEL_47:

        break;
      case nw_ws_opcode_binary:
        objc_super v17 = [NSURLSessionWebSocketMessage alloc];
        if (*(void *)(a1 + 56)) {
          uint64_t v18 = *(void *)(a1 + 56);
        }
        else {
          uint64_t v18 = MEMORY[0x1E4F14410];
        }
        id v13 = [(NSURLSessionWebSocketMessage *)v17 initWithData:v18];
        break;
      case nw_ws_opcode_close:
        id v19 = (void **)(a1 + 48);
        *(void *)(*(void *)(a1 + 48) + 960) = nw_ws_metadata_get_close_code(v4);
        if (*(void *)(a1 + 56)) {
          uint64_t v20 = *(void **)(a1 + 56);
        }
        else {
          uint64_t v20 = (void *)MEMORY[0x1E4F14410];
        }
        objc_storeStrong((id *)(*(void *)(a1 + 48) + 968), v20);
        id v21 = *v19;
        if (*v19) {
          id v21 = (void *)[v21 error:*MEMORY[0x1E4F28798] code:57];
        }
        id v22 = v21;
        id v13 = 0;
        uint64_t v23 = *(void *)(a1 + 48);
        id v16 = *(NSObject **)(v23 + 1008);
        *(void *)(v23 + 1008) = v22;
        goto LABEL_47;
      case nw_ws_opcode_ping:
      case nw_ws_opcode_pong:
        -[__NSURLSessionWebSocketTask _onqueue_receiveMessageWithCompletionHandler:]();
        goto LABEL_49;
      default:
        id v16 = webSocketLog();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v36) = opcode;
          _os_log_fault_impl(&dword_184085000, v16, OS_LOG_TYPE_FAULT, "Read unkown opcode %d", buf, 8u);
        }
        goto LABEL_46;
    }
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __76____NSURLSessionWebSocketTask__onqueue_receiveMessageWithCompletionHandler___block_invoke_20;
  aBlock[3] = &unk_1E52581A0;
  aBlock[4] = *(void *)(a1 + 48);
  id v34 = *(id *)(a1 + 64);
  v28 = v13;
  v33 = v28;
  v29 = _Block_copy(aBlock);
  v30 = *(void **)(*(void *)(a1 + 48) + 1000);
  v31 = _Block_copy(v29);
  [v30 addObject:v31];

  *(unsigned char *)(*(void *)(a1 + 48) + 940) = 0;
  -[__NSURLSessionWebSocketTask _onqueue_ioTick](*(void *)(a1 + 48));

LABEL_49:
}

void __76____NSURLSessionWebSocketTask__onqueue_receiveMessageWithCompletionHandler___block_invoke_20(id *a1, const char *a2)
{
  id Property = a1[4];
  if (Property) {
    id Property = objc_getProperty(Property, a2, 1008, 1);
  }
  id v4 = Property;
  id v5 = [a1[4] session];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __76____NSURLSessionWebSocketTask__onqueue_receiveMessageWithCompletionHandler___block_invoke_2_21;
  v7[3] = &unk_1E52581A0;
  id v10 = a1[6];
  id v8 = a1[5];
  id v6 = v4;
  id v9 = v6;
  -[NSURLSession runDelegateBlock:]((uint64_t)v5, v7);
}

uint64_t __76____NSURLSessionWebSocketTask__onqueue_receiveMessageWithCompletionHandler___block_invoke_2_21(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __61____NSURLSessionWebSocketTask_sendMessage_completionHandler___block_invoke(uint64_t a1, const char *a2)
{
  v3 = *(void **)(a1 + 32);
  if (v3
    && (id v4 = objc_getProperty(v3, a2, 1008, 1), v3 = *(void **)(a1 + 32), v4))
  {
    id v5 = [v3 session];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __61____NSURLSessionWebSocketTask_sendMessage_completionHandler___block_invoke_3;
    v11[3] = &unk_1E5258028;
    id v6 = *(id *)(a1 + 48);
    id v12 = v4;
    id v13 = v6;
    id v7 = v4;
    -[NSURLSession runDelegateBlock:]((uint64_t)v5, v11);
  }
  else
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __61____NSURLSessionWebSocketTask_sendMessage_completionHandler___block_invoke_2;
    aBlock[3] = &unk_1E52581A0;
    aBlock[4] = v3;
    id v15 = *(id *)(a1 + 40);
    id v16 = *(id *)(a1 + 48);
    id v8 = _Block_copy(aBlock);
    id v9 = *(void **)(*(void *)(a1 + 32) + 976);
    id v10 = _Block_copy(v8);
    [v9 addObject:v10];

    -[__NSURLSessionWebSocketTask _onqueue_ioTick](*(void *)(a1 + 32));
  }
}

void __61____NSURLSessionWebSocketTask_sendMessage_completionHandler___block_invoke_2(uint64_t a1)
{
  v1 = *(void ***)(a1 + 32);
  id v2 = *(void **)(a1 + 48);
  id v3 = *(id *)(a1 + 40);
  id v4 = v2;
  if (v1)
  {
    id v5 = [v1 workQueue];
    dispatch_assert_queue_V2(v5);

    id v7 = objc_getProperty(v1, v6, 1008, 1);
    if (v7)
    {
      id v8 = [v1 session];
      uint64_t v16 = MEMORY[0x1E4F143A8];
      uint64_t v17 = 3221225472;
      uint64_t v18 = __70____NSURLSessionWebSocketTask__onqueue_sendMessage_completionHandler___block_invoke;
      id v19 = &unk_1E5258028;
      id v21 = v4;
      id v20 = v7;
      -[NSURLSession runDelegateBlock:]((uint64_t)v8, &v16);

      id v9 = v21;
    }
    else
    {
      id v9 = nw_content_context_create("websocketSend");
      if ([v3 type])
      {
        metadata = nw_ws_create_metadata(nw_ws_opcode_text);
        id v11 = [v3 string];
        id v12 = [v11 dataUsingEncoding:4];
      }
      else
      {
        metadata = nw_ws_create_metadata(nw_ws_opcode_binary);
        id v12 = [v3 data];
      }
      id v13 = [v12 _createDispatchData];
      id v14 = metadata;

      nw_content_context_set_metadata_for_protocol(v9, metadata);
      id v15 = (*(uint64_t (**)(void *))(*v1[111] + 424))(v1[111]);
      uint64_t v16 = MEMORY[0x1E4F143A8];
      uint64_t v17 = 3221225472;
      uint64_t v18 = __70____NSURLSessionWebSocketTask__onqueue_sendMessage_completionHandler___block_invoke_2;
      id v19 = &unk_1E5257100;
      id v20 = v1;
      id v21 = v4;
      nw_connection_send(v15, v13, v9, 1, &v16);
    }
  }
}

uint64_t __61____NSURLSessionWebSocketTask_sendMessage_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __70____NSURLSessionWebSocketTask__onqueue_sendMessage_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __70____NSURLSessionWebSocketTask__onqueue_sendMessage_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70____NSURLSessionWebSocketTask__onqueue_sendMessage_completionHandler___block_invoke_3;
  block[3] = &unk_1E52581A0;
  uint64_t v5 = *(void *)(a1 + 32);
  SEL v6 = *(void **)(a1 + 40);
  id v9 = v3;
  uint64_t v10 = v5;
  id v11 = v6;
  id v7 = v3;
  dispatch_async(v4, block);
}

void __70____NSURLSessionWebSocketTask__onqueue_sendMessage_completionHandler___block_invoke_3(void *a1)
{
  id v2 = a1[4];
  if (v2)
  {
    CFErrorRef v3 = nw_error_copy_cf_error(v2);
    objc_storeStrong((id *)(a1[5] + 1008), v3);
  }
  else
  {
    CFErrorRef v3 = 0;
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __70____NSURLSessionWebSocketTask__onqueue_sendMessage_completionHandler___block_invoke_4;
  aBlock[3] = &unk_1E52581A0;
  id v4 = (void *)a1[6];
  aBlock[4] = a1[5];
  id v11 = v4;
  uint64_t v5 = v3;
  uint64_t v10 = v5;
  SEL v6 = _Block_copy(aBlock);
  id v7 = *(void **)(a1[5] + 1000);
  id v8 = _Block_copy(v6);
  [v7 addObject:v8];

  -[__NSURLSessionWebSocketTask _onqueue_ioTick](a1[5]);
}

void __70____NSURLSessionWebSocketTask__onqueue_sendMessage_completionHandler___block_invoke_4(id *a1)
{
  id v2 = [a1[4] session];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __70____NSURLSessionWebSocketTask__onqueue_sendMessage_completionHandler___block_invoke_5;
  v3[3] = &unk_1E5258028;
  id v5 = a1[6];
  id v4 = a1[5];
  -[NSURLSession runDelegateBlock:]((uint64_t)v2, v3);
}

uint64_t __70____NSURLSessionWebSocketTask__onqueue_sendMessage_completionHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void).cxx_destruct
{
}

- (NSData)closeReason
{
  return (NSData *)objc_getProperty(self, a2, 776, 1);
}

- (NSURLSessionWebSocketCloseCode)closeCode
{
  return self->_closeCode;
}

- (void)setMaximumMessageSize:(NSInteger)maximumMessageSize
{
  self->_maximumMessageSize = maximumMessageSize;
}

- (NSInteger)maximumMessageSize
{
  return self->_maximumMessageSize;
}

@end
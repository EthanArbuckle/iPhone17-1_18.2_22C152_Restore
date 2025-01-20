void OUTLINED_FUNCTION_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;
  uint64_t v10;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

uint64_t ICFRegisterCallFilterBlockWithIdentifier(void *a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v4 = ICFDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v10 = a1;
    __int16 v11 = 2112;
    v12 = a2;
    _os_log_impl(&dword_2129E5000, v4, OS_LOG_TYPE_DEFAULT, "Registering filter block %@ with identifier %@", buf, 0x16u);
  }
  if (a1)
  {
    uint64_t v5 = [a1 copy];
    v6 = v8;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __ICFRegisterCallFilterBlockWithIdentifier_block_invoke;
    v8[3] = &unk_264197E10;
    v8[4] = v5;
  }
  else
  {
    v6 = 0;
  }
  return ICFRegisterCallFilterResultBlockWithIdentifier(v6, a2);
}

BOOL __ICFRegisterCallFilterBlockWithIdentifier_block_invoke(uint64_t a1)
{
  return (*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))() == 0;
}

uint64_t ICFRegisterCallFilterResultBlockWithIdentifier(void *a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v4 = ICFDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412546;
    v9 = a1;
    __int16 v10 = 2112;
    __int16 v11 = a2;
    _os_log_impl(&dword_2129E5000, v4, OS_LOG_TYPE_DEFAULT, "Registering filter result block %@ with identifier %@", (uint8_t *)&v8, 0x16u);
  }
  _ICFConfigureGlobals();
  [(id)sFilterLock lock];
  if (a1 && [a2 length])
  {
    if (!sFilterBlocks) {
      sFilterBlocks = (uint64_t)CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    }
    uint64_t v5 = (void *)[a1 copy];
    [(id)sFilterBlocks setObject:v5 forKey:a2];
    ICFPrintFilters();

    _ICFConnectToServer();
  }
  else
  {
    v6 = ICFDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_2129E5000, v6, OS_LOG_TYPE_DEFAULT, "No block or block id - we're done", (uint8_t *)&v8, 2u);
    }
  }
  return [(id)sFilterLock unlock];
}

void _ICFConfigureGlobals()
{
  v0 = ICFDefaultLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_2129E5000, v0, OS_LOG_TYPE_DEFAULT, "Configuring globals", v1, 2u);
  }
  if (_ICFConfigureGlobals_onceToken != -1) {
    dispatch_once(&_ICFConfigureGlobals_onceToken, &__block_literal_global);
  }
}

void ICFPrintFilters()
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v0 = ICFDefaultLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2129E5000, v0, OS_LOG_TYPE_DEFAULT, "*** Current filters ***", buf, 2u);
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v1 = (void *)[(id)sFilterBlocks allKeys];
  uint64_t v2 = [v1 countByEnumeratingWithState:&v10 objects:v18 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v11 != v4) {
          objc_enumerationMutation(v1);
        }
        uint64_t v6 = *(void *)(*((void *)&v10 + 1) + 8 * i);
        v7 = ICFDefaultLog();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v8 = [(id)sFilterBlocks objectForKey:v6];
          *(_DWORD *)buf = 138412546;
          uint64_t v15 = v6;
          __int16 v16 = 2048;
          uint64_t v17 = v8;
          _os_log_impl(&dword_2129E5000, v7, OS_LOG_TYPE_DEFAULT, "* %@ -> %p", buf, 0x16u);
        }
      }
      uint64_t v3 = [v1 countByEnumeratingWithState:&v10 objects:v18 count:16];
    }
    while (v3);
  }
  v9 = ICFDefaultLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2129E5000, v9, OS_LOG_TYPE_DEFAULT, "***********************", buf, 2u);
  }
}

void _ICFConnectToServer()
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v0 = ICFDefaultLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2129E5000, v0, OS_LOG_TYPE_DEFAULT, "Connect to server", buf, 2u);
  }
  if (sServerConnection)
  {
    v1 = (_xpc_connection_s *)xpc_retain((xpc_object_t)sServerConnection);
  }
  else
  {
    uint64_t v5 = (_xpc_connection_s *)IMXPCCreateConnectionForServiceWithQueue();
    sServerConnection = (uint64_t)v5;
    if (v5)
    {
      handler[0] = MEMORY[0x263EF8330];
      handler[1] = 3221225472;
      handler[2] = ___ICFConnectToServer_block_invoke_13;
      handler[3] = &unk_264197E98;
      handler[4] = &__block_literal_global_11;
      xpc_connection_set_event_handler(v5, handler);
      v1 = (_xpc_connection_s *)xpc_retain((xpc_object_t)sServerConnection);
      xpc_connection_resume((xpc_connection_t)sServerConnection);
      uint64_t v6 = ICFDefaultLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v10 = sServerConnection;
        _os_log_impl(&dword_2129E5000, v6, OS_LOG_TYPE_DEFAULT, "Creating server connection %p", buf, 0xCu);
      }
    }
    else
    {
      v7 = ICFDefaultLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        _ICFConnectToServer_cold_1(v7);
      }
      v1 = 0;
    }
  }
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  uint64_t v3 = v2;
  if (v2 && v1)
  {
    IMInsertBoolsToXPCDictionary();
    uint64_t v4 = ICFDefaultLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2129E5000, v4, OS_LOG_TYPE_DEFAULT, "Sending setup-request to server", buf, 2u);
    }
    xpc_connection_send_message(v1, v3);
    xpc_release(v3);
LABEL_13:
    xpc_release(v1);
    return;
  }
  if (v2) {
    xpc_release(v2);
  }
  if (v1) {
    goto LABEL_13;
  }
}

uint64_t ICFUnregisterCallFilterResultBlockWithIdentifier(void *a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  xpc_object_t v2 = ICFDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint64_t v8 = 138412290;
    *(void *)&v8[4] = a1;
    _os_log_impl(&dword_2129E5000, v2, OS_LOG_TYPE_DEFAULT, "Unregistering filter block with identifier %@", v8, 0xCu);
  }
  _ICFConfigureGlobals();
  [(id)sFilterLock lock];
  if (![a1 length])
  {
    uint64_t v5 = ICFDefaultLog();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
      return objc_msgSend((id)sFilterLock, "unlock", *(void *)v8);
    }
    *(_WORD *)uint64_t v8 = 0;
    uint64_t v6 = "No block id - we're done";
LABEL_19:
    _os_log_impl(&dword_2129E5000, v5, OS_LOG_TYPE_DEFAULT, v6, v8, 2u);
    return objc_msgSend((id)sFilterLock, "unlock", *(void *)v8);
  }
  if (!sFilterBlocks)
  {
    uint64_t v5 = ICFDefaultLog();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
      return objc_msgSend((id)sFilterLock, "unlock", *(void *)v8);
    }
    *(_WORD *)uint64_t v8 = 0;
    uint64_t v6 = "No filter blocks registered - we're done";
    goto LABEL_19;
  }
  if (![(id)sFilterBlocks objectForKey:a1])
  {
    uint64_t v5 = ICFDefaultLog();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
      return objc_msgSend((id)sFilterLock, "unlock", *(void *)v8);
    }
    *(_WORD *)uint64_t v8 = 0;
    uint64_t v6 = "We're not keeping track of this filter - we're done";
    goto LABEL_19;
  }
  [(id)sFilterBlocks removeObjectForKey:a1];
  ICFPrintFilters();
  if (![(id)sFilterBlocks count])
  {

    sFilterBlocks = 0;
    uint64_t v3 = ICFDefaultLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl(&dword_2129E5000, v3, OS_LOG_TYPE_DEFAULT, "No more filter blocks registered", v8, 2u);
    }
    if (sServerConnection)
    {
      uint64_t v4 = ICFDefaultLog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v8 = 0;
        _os_log_impl(&dword_2129E5000, v4, OS_LOG_TYPE_DEFAULT, "Disconnecting from server", v8, 2u);
      }
      xpc_connection_cancel((xpc_connection_t)sServerConnection);
    }
  }
  return objc_msgSend((id)sFilterLock, "unlock", *(void *)v8);
}

void __ICFXPCServer_peer_event_handler(_xpc_connection_s *a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t v4 = ICFDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    pid_t pid = xpc_connection_get_pid(a1);
    _os_log_impl(&dword_2129E5000, v4, OS_LOG_TYPE_DEFAULT, "Receiving message from peer (%d)", buf, 8u);
  }
  uint64_t v5 = MEMORY[0x21668A6F0](a2);
  if (v5 == MEMORY[0x263EF8720])
  {
    if (a2 == (void *)MEMORY[0x263EF86A8])
    {
      long long v12 = ICFDefaultLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        ___ICFConnectToServer_block_invoke_8_cold_1(a1);
      }
      [+[ICFCallServer sharedInstance] _cleanupClient:a1];
      xpc_connection_cancel(a1);
    }
    else if (a2 == (void *)MEMORY[0x263EF86A0])
    {
      uint64_t v19 = ICFDefaultLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        ___ICFConnectToServer_block_invoke_8_cold_2(a1);
      }
      [+[ICFCallServer sharedInstance] _cleanupClient:a1];
    }
    else if (a2 == (void *)MEMORY[0x263EF86C0])
    {
      uint64_t v11 = ICFDefaultLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        ___ICFConnectToServer_block_invoke_8_cold_3(a1);
      }
    }
  }
  else if (v5 == MEMORY[0x263EF8708])
  {
    uint64_t v6 = (void *)MEMORY[0x21668A690](a2);
    v7 = ICFDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      pid_t v8 = xpc_connection_get_pid(a1);
      *(_DWORD *)buf = 67109378;
      pid_t pid = v8;
      __int16 v23 = 2080;
      v24 = v6;
      _os_log_impl(&dword_2129E5000, v7, OS_LOG_TYPE_DEFAULT, "Received message from peer(%d): %s", buf, 0x12u);
    }
    free(v6);
    if (xpc_dictionary_get_BOOL(a2, "setup-request"))
    {
      uint64_t v9 = ICFDefaultLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        pid_t v10 = xpc_connection_get_pid(a1);
        *(_DWORD *)buf = 67109120;
        pid_t pid = v10;
        _os_log_impl(&dword_2129E5000, v9, OS_LOG_TYPE_DEFAULT, "Received setup-request from (%d)", buf, 8u);
      }
      [+[ICFCallServer sharedInstance] _configureWithClient:a1];
    }
    else if (xpc_dictionary_get_BOOL(a2, "call-request"))
    {
      long long v13 = ICFDefaultLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        pid_t v14 = xpc_connection_get_pid(a1);
        *(_DWORD *)buf = 67109120;
        pid_t pid = v14;
        _os_log_impl(&dword_2129E5000, v13, OS_LOG_TYPE_DEFAULT, "Received call-request from (%d)", buf, 8u);
      }
      xpc_object_t reply = xpc_dictionary_create_reply(a2);
      uint64_t v16 = IMGetXPCStringFromDictionary();
      uint64_t v17 = IMGetXPCStringFromDictionary();
      v18 = +[ICFCallServer sharedInstance];
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = ____ICFXPCServer_peer_event_handler_block_invoke;
      v20[3] = &unk_264197EC0;
      v20[4] = reply;
      v20[5] = a1;
      [(ICFCallServer *)v18 shouldAllowIncomingCallForNumber:v16 forProviderIdentifier:v17 response:v20];
    }
  }
}

uint64_t ICFCallServerCTServerConnection()
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t result = ICFCallServerCTServerConnection_sConnection;
  if (!ICFCallServerCTServerConnection_sConnection)
  {
    if (ICFCallServerCTServerConnection__pred__CTServerConnectionCreateWithIdentifierCoreTelephony != -1) {
      dispatch_once(&ICFCallServerCTServerConnection__pred__CTServerConnectionCreateWithIdentifierCoreTelephony, &__block_literal_global_9);
    }
    if (ICFCallServerCTServerConnection__pred__CTServerConnectionSetTargetQueueCoreTelephony != -1) {
      dispatch_once(&ICFCallServerCTServerConnection__pred__CTServerConnectionSetTargetQueueCoreTelephony, &__block_literal_global_13);
    }
    uint64_t v6 = 0;
    memset(v5, 0, sizeof(v5));
    uint64_t v1 = ICFCallServerCTServerConnection___CTServerConnectionCreateWithIdentifier(*MEMORY[0x263EFFB08], @"ICFCallServer", _ServerConnectionCallback, v5);
    ICFCallServerCTServerConnection_sConnection = v1;
    xpc_object_t v2 = (void (*)(uint64_t, dispatch_queue_global_t))ICFCallServerCTServerConnection___CTServerConnectionSetTargetQueue;
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0, 0);
    v2(v1, global_queue);
    uint64_t v4 = ICFDefaultLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v8 = ICFCallServerCTServerConnection_sConnection;
      _os_log_impl(&dword_2129E5000, v4, OS_LOG_TYPE_DEFAULT, "Setup CTServerConnection %p", buf, 0xCu);
    }
    return ICFCallServerCTServerConnection_sConnection;
  }
  return result;
}

void *__ICFCallServerCTServerConnection_block_invoke()
{
  uint64_t result = (void *)MEMORY[0x21668A420]("_CTServerConnectionCreateWithIdentifier", @"CoreTelephony");
  ICFCallServerCTServerConnection___CTServerConnectionCreateWithIdentifier = result;
  return result;
}

void *__ICFCallServerCTServerConnection_block_invoke_2()
{
  uint64_t result = (void *)MEMORY[0x21668A420]("_CTServerConnectionSetTargetQueue", @"CoreTelephony");
  ICFCallServerCTServerConnection___CTServerConnectionSetTargetQueue = result;
  return result;
}

void sub_2129E8150(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,char a46,uint64_t a47,uint64_t a48,uint64_t a49,char a50)
{
  _Block_object_dispose(&a46, 8);
  _Block_object_dispose(&a50, 8);
  _Block_object_dispose((const void *)(v50 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_2129E8780(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void ICFCallProviderShouldAllowIncomingCall(uint64_t a1, uint64_t a2, void *a3)
{
}

void ICFCallProviderShouldAllowIncomingCallWithQueue(uint64_t a1, uint64_t a2, NSObject *global_queue, void *a4)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t v8 = ICFDefaultLog();
  uint64_t v9 = v8;
  if (a4)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = a1;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = a2;
      _os_log_impl(&dword_2129E5000, v9, OS_LOG_TYPE_DEFAULT, "number %@,   providerIdentifier %@", buf, 0x16u);
    }
    pid_t v10 = (void (**)(void, void, void))[a4 copy];
    if (ICFCallProviderShouldAllowIncomingCallWithQueue_onceToken != -1) {
      dispatch_once(&ICFCallProviderShouldAllowIncomingCallWithQueue_onceToken, &__block_literal_global_1);
    }
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3052000000;
    v20 = __Block_byref_object_copy_;
    v21 = __Block_byref_object_dispose_;
    uint64_t v22 = 0;
    uint64_t v22 = IMXPCCreateConnectionForServiceWithQueue();
    if (*(void *)(*(void *)&buf[8] + 40))
    {
      uint64_t v11 = ICFDefaultLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v17 = 0;
        _os_log_impl(&dword_2129E5000, v11, OS_LOG_TYPE_DEFAULT, "We have a remote connection let's build a request message", v17, 2u);
      }
      xpc_object_t v12 = xpc_dictionary_create(0, 0, 0);
      if (v12)
      {
        IMInsertNSStringsToXPCDictionary();
        IMInsertNSStringsToXPCDictionary();
        xpc_dictionary_set_BOOL(v12, "call-request", 1);
        long long v13 = ICFDefaultLog();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)uint64_t v17 = 138412290;
          xpc_object_t v18 = v12;
          _os_log_impl(&dword_2129E5000, v13, OS_LOG_TYPE_DEFAULT, "Sending request message %@", v17, 0xCu);
        }
        if (!global_queue) {
          dispatch_queue_global_t global_queue = dispatch_get_global_queue(2, 0);
        }
        pid_t v14 = *(_xpc_connection_s **)(*(void *)&buf[8] + 40);
        handler[0] = MEMORY[0x263EF8330];
        handler[1] = 3221225472;
        handler[2] = __ICFCallProviderShouldAllowIncomingCallWithQueue_block_invoke_9;
        handler[3] = &unk_264198028;
        handler[4] = v10;
        void handler[5] = buf;
        xpc_connection_send_message_with_reply(v14, v12, global_queue, handler);
        xpc_release(v12);
      }
      else
      {
        xpc_connection_cancel(*(xpc_connection_t *)(*(void *)&buf[8] + 40));
        xpc_release(*(xpc_object_t *)(*(void *)&buf[8] + 40));
      }
    }
    else
    {
      uint64_t v15 = ICFDefaultLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v17 = 0;
        _os_log_impl(&dword_2129E5000, v15, OS_LOG_TYPE_DEFAULT, "[WARN] No Connection !!", v17, 2u);
      }
      if (v10) {
        v10[2](v10, 1, 1);
      }
    }

    _Block_object_dispose(buf, 8);
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    ICFCallProviderShouldAllowIncomingCallWithQueue_cold_1(v9);
  }
}

void sub_2129E903C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

dispatch_queue_t __ICFCallProviderShouldAllowIncomingCallWithQueue_block_invoke()
{
  dispatch_queue_t result = dispatch_queue_create("com.apple.ICFCallProviderMessageQueue", 0);
  ICFCallProviderShouldAllowIncomingCallWithQueue_connectionRequestQueue = (uint64_t)result;
  return result;
}

void __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void __ICFCallProviderShouldAllowIncomingCallWithQueue_block_invoke_3()
{
  v0 = ICFDefaultLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v1 = 0;
    _os_log_impl(&dword_2129E5000, v0, OS_LOG_TYPE_DEFAULT, "[WARN] RemoteConnection died", v1, 2u);
  }
}

void __ICFCallProviderShouldAllowIncomingCallWithQueue_block_invoke_9(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (MEMORY[0x21668A6F0](a2) == MEMORY[0x263EF8720])
  {
    v7 = ICFDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __ICFCallProviderShouldAllowIncomingCallWithQueue_block_invoke_9_cold_1(a2, v7);
    }
  }
  else
  {
    BOOL v4 = xpc_dictionary_get_BOOL(a2, "response");
    xpc_dictionary_get_BOOL(a2, "isBlocked");
    uint64_t v5 = ICFDefaultLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = @"NO";
      if (v4) {
        uint64_t v6 = @"YES";
      }
      int v8 = 138412290;
      uint64_t v9 = v6;
      _os_log_impl(&dword_2129E5000, v5, OS_LOG_TYPE_DEFAULT, "Got result: %@", (uint8_t *)&v8, 0xCu);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  xpc_connection_cancel(*(xpc_connection_t *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
  xpc_release(*(xpc_object_t *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

uint64_t ICFDefaultLog()
{
  if (ICFDefaultLog_onceToken != -1) {
    dispatch_once(&ICFDefaultLog_onceToken, &__block_literal_global_2);
  }
  return ICFDefaultLog_ICFDefaultLog;
}

os_log_t __ICFDefaultLog_block_invoke()
{
  os_log_t result = os_log_create("com.apple.calls.incomingcallfilter", "Default");
  ICFDefaultLog_ICFDefaultLog = (uint64_t)result;
  return result;
}

void _ICFConnectToServer_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_2129E5000, log, OS_LOG_TYPE_ERROR, "Failed to create server connection", v1, 2u);
}

void ICFCallProviderShouldAllowIncomingCallWithQueue_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_2129E5000, log, OS_LOG_TYPE_ERROR, "No response provided to ICFCallProviderShouldAllowIncomingCall", v1, 2u);
}

void __ICFCallProviderShouldAllowIncomingCallWithQueue_block_invoke_9_cold_1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  string = xpc_dictionary_get_string(a1, (const char *)*MEMORY[0x263EF86B0]);
  int v4 = 136315138;
  uint64_t v5 = string;
  _os_log_error_impl(&dword_2129E5000, a2, OS_LOG_TYPE_ERROR, "Error requesting client: %s", (uint8_t *)&v4, 0xCu);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4920](allocator, capacity, keyCallBacks, valueCallBacks);
}

void CFRelease(CFTypeRef cf)
{
}

uint64_t CMFBlockListIsItemBlocked()
{
  return MEMORY[0x270F183E8]();
}

uint64_t CMFItemCreateWithEmailAddress()
{
  return MEMORY[0x270F183F0]();
}

uint64_t CMFItemCreateWithPhoneNumber()
{
  return MEMORY[0x270F183F8]();
}

uint64_t IMDAuditTokenTaskHasEntitlement()
{
  return MEMORY[0x270F3CCE8]();
}

uint64_t IMGetXPCStringFromDictionary()
{
  return MEMORY[0x270F3CD78]();
}

uint64_t IMInsertBoolsToXPCDictionary()
{
  return MEMORY[0x270F3CD90]();
}

uint64_t IMInsertNSStringsToXPCDictionary()
{
  return MEMORY[0x270F3CDC0]();
}

uint64_t IMPhoneNumberRefCopyForPhoneNumber()
{
  return MEMORY[0x270F3CE18]();
}

uint64_t IMProcessNameForPid()
{
  return MEMORY[0x270F3CE20]();
}

uint64_t IMWeakLinkSymbol()
{
  return MEMORY[0x270F3CEB0]();
}

uint64_t IMXPCCreateConnectionForServiceWithQueue()
{
  return MEMORY[0x270F3CEC0]();
}

uint64_t IMXPCCreateServerConnection()
{
  return MEMORY[0x270F3CEC8]();
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x270ED9340]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
}

void free(void *a1)
{
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x270EDA760](name);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

void objc_enumerationMutation(id obj)
{
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

uint64_t xpc_connection_get_audit_token()
{
  return MEMORY[0x270EDBE70]();
}

pid_t xpc_connection_get_pid(xpc_connection_t connection)
{
  return MEMORY[0x270EDBEA0](connection);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x270EDBED0](connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return (char *)MEMORY[0x270EDBF40](object);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x270EDC008](keys, values, count);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x270EDC020](original);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x270EDC050](xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x270EDC0A8](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x270EDC200](object);
}

void xpc_release(xpc_object_t object)
{
}

xpc_object_t xpc_retain(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x270EDC2B8](object);
}
@interface ICFConnectToServer
@end

@implementation ICFConnectToServer

void ___ICFConnectToServer_block_invoke()
{
  v0 = ICFDefaultLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_2129E5000, v0, OS_LOG_TYPE_DEFAULT, "[WARN] Connection went invalid, exiting", v1, 2u);
  }
  xpc_release((xpc_object_t)sServerConnection);
  sServerConnection = 0;
}

void ___ICFConnectToServer_block_invoke_8(uint64_t a1, _xpc_connection_s *a2, void *a3)
{
  v3 = a3;
  uint64_t v46 = *MEMORY[0x263EF8340];
  uint64_t v5 = MEMORY[0x21668A6F0](a3);
  uint64_t v6 = MEMORY[0x263EF8720];
  if (v5 == MEMORY[0x263EF8720])
  {
    if (v3 == (void *)MEMORY[0x263EF86A8])
    {
      v29 = ICFDefaultLog();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        ___ICFConnectToServer_block_invoke_8_cold_1(a2);
      }
      xpc_connection_cancel(a2);
      v30 = ICFDefaultLog();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2129E5000, v30, OS_LOG_TYPE_DEFAULT, "Cleaning up connection", buf, 2u);
      }
      xpc_release((xpc_object_t)sServerConnection);
      sServerConnection = 0;
    }
    else if (v3 == (void *)MEMORY[0x263EF86A0])
    {
      v31 = ICFDefaultLog();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
        ___ICFConnectToServer_block_invoke_8_cold_2(a2);
      }
    }
    else if (v3 == (void *)MEMORY[0x263EF86C0])
    {
      v24 = ICFDefaultLog();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        ___ICFConnectToServer_block_invoke_8_cold_3(a2);
      }
    }
  }
  v7 = (void *)MEMORY[0x21668A690](v3);
  v8 = ICFDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    pid_t pid = xpc_connection_get_pid(a2);
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v45 = pid;
    *(_WORD *)&v45[4] = 2080;
    *(void *)&v45[6] = v7;
    _os_log_impl(&dword_2129E5000, v8, OS_LOG_TYPE_DEFAULT, "received message from peer(%d): %s", buf, 0x12u);
  }
  free(v7);
  if (v5 != v6)
  {
    uint64_t v10 = IMGetXPCStringFromDictionary();
    uint64_t v11 = IMGetXPCStringFromDictionary();
    v12 = ICFDefaultLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)v45 = v10;
      *(_WORD *)&v45[8] = 2112;
      *(void *)&v45[10] = v11;
      _os_log_impl(&dword_2129E5000, v12, OS_LOG_TYPE_DEFAULT, "Incoming call filtering query for number %@ and provider identifier %@", buf, 0x16u);
    }
    unint64_t v13 = 0x26AB33000uLL;
    [(id)sFilterLock lock];
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    v14 = (void *)[(id)sFilterBlocks allValues];
    uint64_t v15 = [v14 countByEnumeratingWithState:&v34 objects:buf count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      v32 = v3;
      v33 = a2;
      uint64_t v17 = *(void *)v35;
LABEL_9:
      uint64_t v18 = 0;
      while (1)
      {
        if (*(void *)v35 != v17) {
          objc_enumerationMutation(v14);
        }
        v19 = *(uint64_t (***)(void, uint64_t, uint64_t))(*((void *)&v34 + 1) + 8 * v18);
        uint64_t v20 = v19[2](v19, v10, v11);
        v21 = ICFDefaultLog();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          v22 = @"deny";
          if (!v20) {
            v22 = @"allow";
          }
          *(_DWORD *)v38 = 138412802;
          v39 = v19;
          v23 = @"not blocked";
          if (v20 == 2) {
            v23 = @"blocked";
          }
          __int16 v40 = 2112;
          v41 = v22;
          __int16 v42 = 2112;
          v43 = v23;
          _os_log_impl(&dword_2129E5000, v21, OS_LOG_TYPE_DEFAULT, "We asked the filter %@ and it's telling us to %@ the call, and that the call was %@", v38, 0x20u);
        }
        if (v20) {
          break;
        }
        if (v16 == ++v18)
        {
          uint64_t v16 = [v14 countByEnumeratingWithState:&v34 objects:buf count:16];
          if (v16) {
            goto LABEL_9;
          }
          break;
        }
      }
      v3 = v32;
      a2 = v33;
      unint64_t v13 = 0x26AB33000;
    }
    [*(id *)(v13 + 1944) unlock];
    xpc_object_t reply = xpc_dictionary_create_reply(v3);
    if (reply)
    {
      v26 = reply;
      IMInsertBoolsToXPCDictionary();
      IMInsertBoolsToXPCDictionary();
      v27 = (void *)MEMORY[0x21668A690](v26);
      v28 = ICFDefaultLog();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v38 = 136315394;
        v39 = v27;
        __int16 v40 = 2048;
        v41 = a2;
        _os_log_impl(&dword_2129E5000, v28, OS_LOG_TYPE_DEFAULT, "Forwarding reply %s to connection %p", v38, 0x16u);
      }
      free(v27);
      xpc_connection_send_message(a2, v26);
      xpc_release(v26);
    }
  }
}

uint64_t ___ICFConnectToServer_block_invoke_13(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void ___ICFConnectToServer_block_invoke_8_cold_1(_xpc_connection_s *a1)
{
  xpc_connection_get_pid(a1);
  OUTLINED_FUNCTION_0(&dword_2129E5000, v1, v2, "peer(%d) received XPC_ERROR_CONNECTION_INVALID", v3, v4, v5, v6, 0);
}

void ___ICFConnectToServer_block_invoke_8_cold_2(_xpc_connection_s *a1)
{
  xpc_connection_get_pid(a1);
  OUTLINED_FUNCTION_0(&dword_2129E5000, v1, v2, "peer(%d) received XPC_ERROR_CONNECTION_INTERRUPTED", v3, v4, v5, v6, 0);
}

void ___ICFConnectToServer_block_invoke_8_cold_3(_xpc_connection_s *a1)
{
  xpc_connection_get_pid(a1);
  OUTLINED_FUNCTION_0(&dword_2129E5000, v1, v2, "peer(%d) received XPC_ERROR_TERMINATION_IMMINENT", v3, v4, v5, v6, 0);
}

@end
@interface ICFCallServer
+ (id)sharedInstance;
- (ICFCallServer)init;
- (void)_cleanup;
- (void)_cleanupClient:(id)a3;
- (void)_clientConnected;
- (void)_configureWithClient:(id)a3;
- (void)_requestCallGrantForIdentifier:(id)a3 forProviderIdentifier:(id)a4 waitForResponse:(BOOL)a5 completionBlock:(id)a6;
- (void)dealloc;
- (void)init;
- (void)shouldAllowIncomingCallForNumber:(id)a3 forProviderIdentifier:(id)a4 response:(id)a5;
@end

@implementation ICFCallServer

+ (id)sharedInstance
{
  if (sharedInstance_creation != -1) {
    dispatch_once(&sharedInstance_creation, &__block_literal_global_0);
  }
  return (id)sharedInstance_sInstance;
}

ICFCallServer *__31__ICFCallServer_sharedInstance__block_invoke()
{
  result = objc_alloc_init(ICFCallServer);
  sharedInstance_sInstance = (uint64_t)result;
  return result;
}

- (ICFCallServer)init
{
  v19.receiver = self;
  v19.super_class = (Class)ICFCallServer;
  v2 = [(ICFCallServer *)&v19 init];
  v3 = v2;
  if (v2)
  {
    uint64_t v14 = MEMORY[0x263EF8330];
    uint64_t v15 = 3221225472;
    v16 = __21__ICFCallServer_init__block_invoke;
    v17 = &unk_264197EE8;
    v18 = v2;
    uint64_t v9 = MEMORY[0x263EF8330];
    uint64_t v10 = 3221225472;
    v11 = __21__ICFCallServer_init__block_invoke_18;
    v12 = &unk_264197F10;
    v13 = v2;
    v4 = (_xpc_connection_s *)IMXPCCreateServerConnection();
    v3->_connection = v4;
    if (v4)
    {
      xpc_connection_resume(v4);
      notify_post("com.apple.incoming-call-filter-server-started");
    }
    else
    {
      v5 = ICFDefaultLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        -[ICFCallServer init](v5);
      }
    }
    v6 = ICFDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_2129E5000, v6, OS_LOG_TYPE_DEFAULT, "Setup ICFCallServer", v8, 2u);
    }
  }
  return v3;
}

uint64_t __21__ICFCallServer_init__block_invoke(uint64_t a1)
{
  v2 = ICFDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __21__ICFCallServer_init__block_invoke_cold_1(v2);
  }
  return [*(id *)(a1 + 32) _cleanup];
}

void __21__ICFCallServer_init__block_invoke_18(uint64_t a1, _xpc_connection_s *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  xpc_connection_get_audit_token();
  if (IMDAuditTokenTaskHasEntitlement()) {
    goto LABEL_5;
  }
  pid_t pid = xpc_connection_get_pid(a2);
  uint64_t v7 = IMProcessNameForPid();
  int v8 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "containsObject:", a2, 0, 0, 0, 0);
  uint64_t v9 = ICFDefaultLog();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v10)
    {
      *(_DWORD *)buf = 138412802;
      v12 = (__CFString *)v7;
      __int16 v13 = 1024;
      *(_DWORD *)uint64_t v14 = pid;
      *(_WORD *)&v14[4] = 2112;
      *(void *)&v14[6] = @"com.apple.private.icfcallserver";
      _os_log_impl(&dword_2129E5000, v9, OS_LOG_TYPE_DEFAULT, "Handling xpc event for previously configured peer(%@:%d) that does not have entitlement (%@).", buf, 0x1Cu);
    }
LABEL_5:
    __ICFXPCServer_peer_event_handler(a2, a3);
    return;
  }
  if (v10)
  {
    *(_DWORD *)buf = 138412802;
    v12 = @"com.apple.private.icfcallserver";
    __int16 v13 = 2112;
    *(void *)uint64_t v14 = v7;
    *(_WORD *)&v14[8] = 1024;
    *(_DWORD *)&v14[10] = pid;
    _os_log_impl(&dword_2129E5000, v9, OS_LOG_TYPE_DEFAULT, "[WARN] Denying xpc connection, task does not have entitlement: %@  (%@:%d)", buf, 0x1Cu);
  }
  xpc_connection_cancel(a2);
}

- (void)_requestCallGrantForIdentifier:(id)a3 forProviderIdentifier:(id)a4 waitForResponse:(BOOL)a5 completionBlock:(id)a6
{
  BOOL v34 = a5;
  uint64_t v68 = *MEMORY[0x263EF8340];
  uint64_t v7 = ICFDefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = @"NO";
    *(_DWORD *)buf = 138413058;
    *(void *)&uint8_t buf[4] = a3;
    if (v34) {
      int v8 = @"YES";
    }
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = a4;
    *(_WORD *)&buf[22] = 2112;
    v65 = v8;
    __int16 v66 = 2112;
    id v67 = a6;
    _os_log_impl(&dword_2129E5000, v7, OS_LOG_TYPE_DEFAULT, "Requesting call grant for identifier %@ providerIdentifier %@ waitForResponse %@ completionBlock %@", buf, 0x2Au);
  }
  uint64_t v9 = (void (**)(void, void, void))[a6 copy];
  BOOL v10 = (const void *)CMFItemCreateWithEmailAddress();
  v11 = (const void *)IMPhoneNumberRefCopyForPhoneNumber();
  v12 = (const void *)CMFItemCreateWithPhoneNumber();
  if (!CMFBlockListIsItemBlocked())
  {
    BOOL v13 = CMFBlockListIsItemBlocked() != 0;
    if (!v10) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  BOOL v13 = 1;
  if (v10) {
LABEL_9:
  }
    CFRelease(v10);
LABEL_10:
  if (v12) {
    CFRelease(v12);
  }
  if (v11) {
    CFRelease(v11);
  }
  uint64_t v14 = ICFDefaultLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = @"NO";
    if (v13) {
      uint64_t v15 = @"YES";
    }
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = a3;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v15;
    _os_log_impl(&dword_2129E5000, v14, OS_LOG_TYPE_DEFAULT, "%@ returning %@", buf, 0x16u);
  }
  if (v13)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __102__ICFCallServer__requestCallGrantForIdentifier_forProviderIdentifier_waitForResponse_completionBlock___block_invoke;
    block[3] = &unk_264197F38;
    block[4] = v9;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  else if ([(NSMutableArray *)self->_clients count])
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    LOBYTE(v65) = 0;
    uint64_t v56 = 0;
    v57 = &v56;
    uint64_t v58 = 0x2020000000;
    char v59 = 0;
    uint64_t v52 = 0;
    v53 = &v52;
    uint64_t v54 = 0x2020000000;
    int v55 = 0;
    v16 = dispatch_group_create();
    id v17 = objc_alloc_init(MEMORY[0x263F08958]);
    [v17 lock];
    for (unint64_t i = 0; [(NSMutableArray *)self->_clients count] > i; ++i)
    {
      dispatch_group_enter(v16);
      ++*((_DWORD *)v53 + 6);
    }
    [v17 unlock];
    v33 = v9;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    clients = self->_clients;
    uint64_t v20 = [(NSMutableArray *)clients countByEnumeratingWithState:&v48 objects:v63 count:16];
    if (v20)
    {
      uint64_t v21 = *(void *)v49;
      do
      {
        for (uint64_t j = 0; j != v20; ++j)
        {
          if (*(void *)v49 != v21) {
            objc_enumerationMutation(clients);
          }
          v23 = *(_xpc_connection_s **)(*((void *)&v48 + 1) + 8 * j);
          xpc_object_t v24 = xpc_dictionary_create(0, 0, 0);
          if (v24)
          {
            IMInsertNSStringsToXPCDictionary();
            id v31 = a4;
            uint64_t v32 = 0;
            IMInsertNSStringsToXPCDictionary();
            handler[0] = MEMORY[0x263EF8330];
            handler[1] = 3221225472;
            v40 = __102__ICFCallServer__requestCallGrantForIdentifier_forProviderIdentifier_waitForResponse_completionBlock___block_invoke_33;
            v41 = &unk_264197F60;
            v42 = self;
            v43 = v16;
            id v44 = v17;
            v45 = buf;
            v46 = &v56;
            v47 = &v52;
            v25 = ICFDefaultLog();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v61 = 134217984;
              v62 = v23;
              _os_log_impl(&dword_2129E5000, v25, OS_LOG_TYPE_DEFAULT, "Asking peer %p if we should allow the call", v61, 0xCu);
            }
            if (v34)
            {
              xpc_object_t v26 = xpc_connection_send_message_with_reply_sync(v23, v24);
              if (v26)
              {
                v40((uint64_t)handler, v26);
                xpc_release(v26);
              }
            }
            else
            {
              xpc_connection_send_message_with_reply(v23, v24, MEMORY[0x263EF83A0], handler);
            }
            xpc_release(v24);
          }
          else
          {
            dispatch_group_leave(v16);
            [v17 lock];
            --*((_DWORD *)v53 + 6);
            [v17 unlock];
          }
        }
        uint64_t v20 = [(NSMutableArray *)clients countByEnumeratingWithState:&v48 objects:v63 count:16];
      }
      while (v20);
    }
    objc_msgSend(v17, "lock", v31, v32);
    int v27 = *((_DWORD *)v53 + 6);
    [v17 unlock];
    if (v27 < 1)
    {
      v29 = ICFDefaultLog();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        if (*(unsigned char *)(*(void *)&buf[8] + 24)) {
          v30 = @"NO";
        }
        else {
          v30 = @"YES";
        }
        *(_DWORD *)v61 = 138412290;
        v62 = v30;
        _os_log_impl(&dword_2129E5000, v29, OS_LOG_TYPE_DEFAULT, "Sync - All done with group, overall result was: %@", v61, 0xCu);
      }
      ((void (**)(void, BOOL, void))v33)[2](v33, *(unsigned char *)(*(void *)&buf[8] + 24) == 0, *((unsigned __int8 *)v57 + 24));
      dispatch_release(v16);
    }
    else
    {
      v38[0] = MEMORY[0x263EF8330];
      v38[1] = 3221225472;
      v38[2] = __102__ICFCallServer__requestCallGrantForIdentifier_forProviderIdentifier_waitForResponse_completionBlock___block_invoke_35;
      v38[3] = &unk_264197F88;
      v38[6] = buf;
      v38[7] = &v56;
      v38[4] = v16;
      v38[5] = v33;
      dispatch_group_notify(v16, MEMORY[0x263EF83A0], v38);
    }

    _Block_object_dispose(&v52, 8);
    _Block_object_dispose(&v56, 8);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    v28 = ICFDefaultLog();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = a3;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = a4;
      _os_log_impl(&dword_2129E5000, v28, OS_LOG_TYPE_DEFAULT, "No client, but we're asking for %@ on %@", buf, 0x16u);
    }
    v9[2](v9, 1, 0);
  }
}

uint64_t __102__ICFCallServer__requestCallGrantForIdentifier_forProviderIdentifier_waitForResponse_completionBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __102__ICFCallServer__requestCallGrantForIdentifier_forProviderIdentifier_waitForResponse_completionBlock___block_invoke_33(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (MEMORY[0x21668A6F0](a2) == MEMORY[0x263EF8720])
  {
    BOOL v10 = ICFDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __102__ICFCallServer__requestCallGrantForIdentifier_forProviderIdentifier_waitForResponse_completionBlock___block_invoke_33_cold_1((uint64_t)a2, a1, v10);
    }
    BOOL v9 = 0;
    LOBYTE(v5) = 0;
  }
  else
  {
    BOOL v4 = xpc_dictionary_get_BOOL(a2, "response");
    BOOL v5 = xpc_dictionary_get_BOOL(a2, "isBlocked");
    v6 = ICFDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = @"NO";
      if (v4) {
        int v8 = @"YES";
      }
      else {
        int v8 = @"NO";
      }
      if (v5) {
        uint64_t v7 = @"YES";
      }
      int v12 = 138412546;
      BOOL v13 = v8;
      __int16 v14 = 2112;
      uint64_t v15 = v7;
      _os_log_impl(&dword_2129E5000, v6, OS_LOG_TYPE_DEFAULT, "Got allowCall: %@, blocked: %@", (uint8_t *)&v12, 0x16u);
    }
    BOOL v9 = !v4;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) |= v9;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) |= v5;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  [*(id *)(a1 + 48) lock];
  --*(_DWORD *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
  return [*(id *)(a1 + 48) unlock];
}

void __102__ICFCallServer__requestCallGrantForIdentifier_forProviderIdentifier_waitForResponse_completionBlock___block_invoke_35(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v2 = ICFDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
      v3 = @"NO";
    }
    else {
      v3 = @"YES";
    }
    int v4 = 138412290;
    BOOL v5 = v3;
    _os_log_impl(&dword_2129E5000, v2, OS_LOG_TYPE_DEFAULT, "Async - All done with group, overall result was: %@", (uint8_t *)&v4, 0xCu);
  }
  (*(void (**)(void, BOOL, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) == 0, *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 56) + 8) + 24));
  dispatch_release(*(dispatch_object_t *)(a1 + 32));
}

- (void)_clientConnected
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2129E5000, log, OS_LOG_TYPE_ERROR, "Failed registering silent hours callback", v1, 2u);
}

void *__33__ICFCallServer__clientConnected__block_invoke()
{
  result = (void *)MEMORY[0x21668A420]("_CTServerConnectionRegisterSilentHoursCallback", @"CoreTelephony");
  _clientConnected___CTServerConnectionRegisterSilentHoursCallback = result;
  return result;
}

uint64_t __33__ICFCallServer__clientConnected__block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v8 = 0;
  BOOL v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  v2 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __33__ICFCallServer__clientConnected__block_invoke_3;
  v7[3] = &unk_264197FB0;
  v7[4] = &v8;
  [v2 _requestCallGrantForIdentifier:a2 forProviderIdentifier:"com.apple.coretelephony" waitForResponse:1 completionBlock:v7];
  v3 = ICFDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    if (*((unsigned char *)v9 + 24)) {
      int v4 = @"allowed";
    }
    else {
      int v4 = @"not allowed";
    }
    *(_DWORD *)buf = 138412290;
    BOOL v13 = v4;
    _os_log_impl(&dword_2129E5000, v3, OS_LOG_TYPE_DEFAULT, "Telling CT that this call is %@", buf, 0xCu);
  }
  uint64_t v5 = *((unsigned __int8 *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __33__ICFCallServer__clientConnected__block_invoke_3(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)_cleanup
{
  if (self->_hasRegistered)
  {
    self->_hasRegistered = 0;
    v2 = ICFDefaultLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl(&dword_2129E5000, v2, OS_LOG_TYPE_DEFAULT, "Client Disconnected, unregistering", v5, 2u);
    }
    uint64_t v3 = ICFCallServerCTServerConnection();
    if (v3)
    {
      uint64_t v4 = v3;
      if (_cleanup__pred__CTServerConnectionUnregisterSilentHoursCallbackCoreTelephony != -1) {
        dispatch_once(&_cleanup__pred__CTServerConnectionUnregisterSilentHoursCallbackCoreTelephony, &__block_literal_global_48);
      }
      _cleanup___CTServerConnectionUnregisterSilentHoursCallback(v4);
    }
  }
}

void *__25__ICFCallServer__cleanup__block_invoke()
{
  result = (void *)MEMORY[0x21668A420]("_CTServerConnectionUnregisterSilentHoursCallback", @"CoreTelephony");
  _cleanup___CTServerConnectionUnregisterSilentHoursCallback = result;
  return result;
}

- (void)_cleanupClient:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (a3)
  {
    uint64_t v5 = ICFDefaultLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 67109120;
      pid_t pid = xpc_connection_get_pid((xpc_connection_t)a3);
      _os_log_impl(&dword_2129E5000, v5, OS_LOG_TYPE_DEFAULT, "Removing client %d", (uint8_t *)&v8, 8u);
    }
    [(NSMutableArray *)self->_clients removeObject:a3];
    uint64_t v6 = ICFDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      pid_t v7 = [(NSMutableArray *)self->_clients count];
      int v8 = 67109120;
      pid_t pid = v7;
      _os_log_impl(&dword_2129E5000, v6, OS_LOG_TYPE_DEFAULT, "We have %d clients left", (uint8_t *)&v8, 8u);
    }
    if (![(NSMutableArray *)self->_clients count])
    {
      [(ICFCallServer *)self _cleanup];

      self->_clients = 0;
    }
  }
}

- (void)_configureWithClient:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v5 = ICFDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = a3;
    _os_log_impl(&dword_2129E5000, v5, OS_LOG_TYPE_DEFAULT, "Configuring with client: %@", (uint8_t *)&v8, 0xCu);
  }
  if (a3 && ([(NSMutableArray *)self->_clients containsObject:a3] & 1) == 0)
  {
    if (!self->_clients) {
      self->_clients = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    }
    uint64_t v6 = ICFDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      pid_t pid = xpc_connection_get_pid((xpc_connection_t)a3);
      int v8 = 67109120;
      LODWORD(v9) = pid;
      _os_log_impl(&dword_2129E5000, v6, OS_LOG_TYPE_DEFAULT, "Adding client %d", (uint8_t *)&v8, 8u);
    }
    [(NSMutableArray *)self->_clients addObject:a3];
    [(ICFCallServer *)self _clientConnected];
  }
}

- (void)shouldAllowIncomingCallForNumber:(id)a3 forProviderIdentifier:(id)a4 response:(id)a5
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v9 = ICFDefaultLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v13 = a3;
    __int16 v14 = 2112;
    id v15 = a4;
    _os_log_impl(&dword_2129E5000, v9, OS_LOG_TYPE_DEFAULT, "Should allow incoming call for number %@ providerIdentifier %@", buf, 0x16u);
  }
  if (a5)
  {
    uint64_t v10 = (void *)[a5 copy];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __81__ICFCallServer_shouldAllowIncomingCallForNumber_forProviderIdentifier_response___block_invoke;
    v11[3] = &unk_264198000;
    v11[4] = v10;
    [(ICFCallServer *)self _requestCallGrantForIdentifier:a3 forProviderIdentifier:a4 waitForResponse:0 completionBlock:v11];
  }
}

uint64_t __81__ICFCallServer_shouldAllowIncomingCallForNumber_forProviderIdentifier_response___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)dealloc
{
  uint64_t v3 = ICFDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2129E5000, v3, OS_LOG_TYPE_DEFAULT, "Deallocing server", buf, 2u);
  }
  [(ICFCallServer *)self _cleanup];
  v4.receiver = self;
  v4.super_class = (Class)ICFCallServer;
  [(ICFCallServer *)&v4 dealloc];
}

- (void)init
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 138412290;
  v2 = @"com.apple.incoming-call-filter-server";
  _os_log_error_impl(&dword_2129E5000, log, OS_LOG_TYPE_ERROR, "Could not configure server: %@", (uint8_t *)&v1, 0xCu);
}

void __21__ICFCallServer_init__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl(&dword_2129E5000, log, OS_LOG_TYPE_ERROR, "port invalidated", v1, 2u);
}

void __102__ICFCallServer__requestCallGrantForIdentifier_forProviderIdentifier_waitForResponse_completionBlock___block_invoke_33_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a2 + 32);
  int v4 = 138412546;
  uint64_t v5 = a1;
  __int16 v6 = 1024;
  int v7 = v3;
  _os_log_error_impl(&dword_2129E5000, log, OS_LOG_TYPE_ERROR, "Error requesting client: %@  (0x%X)", (uint8_t *)&v4, 0x12u);
}

@end
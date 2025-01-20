@interface DNDSIDSSyncService
- (BOOL)_queue_sendMessage:(id)a3 withVersionNumber:(unint64_t)a4 messageType:(id)a5 toDestinations:(id)a6 requestIdentifier:(id *)a7 error:(id *)a8;
- (DNDSIDSSyncService)initWithIDSService:(id)a3;
- (DNDSSyncServiceDelegate)delegate;
- (void)_queue_handleIncomingMessage:(id)a3 deviceIdentifier:(id)a4;
- (void)_queue_resume;
- (void)resume;
- (void)sendMessage:(id)a3 withVersionNumber:(unint64_t)a4 messageType:(id)a5 toDestinations:(id)a6 completionHandler:(id)a7;
- (void)sendMessage:(id)a3 withVersionNumber:(unint64_t)a4 messageType:(id)a5 toDestinations:(id)a6 identifyingCompletionHandler:(id)a7;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7;
- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)setDelegate:(id)a3;
@end

@implementation DNDSIDSSyncService

- (DNDSIDSSyncService)initWithIDSService:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DNDSIDSSyncService;
  v6 = [(DNDSIDSSyncService *)&v11 init];
  if (v6)
  {
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("com.donotdisturb.server.IdentityServicesSync", v7);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v8;

    objc_storeStrong((id *)&v6->_syncService, a3);
  }

  return v6;
}

- (void)resume
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __28__DNDSIDSSyncService_resume__block_invoke;
  block[3] = &unk_1E6973540;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __28__DNDSIDSSyncService_resume__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_resume");
}

- (void)sendMessage:(id)a3 withVersionNumber:(unint64_t)a4 messageType:(id)a5 toDestinations:(id)a6 completionHandler:(id)a7
{
  id v12 = a7;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __97__DNDSIDSSyncService_sendMessage_withVersionNumber_messageType_toDestinations_completionHandler___block_invoke;
  v14[3] = &unk_1E6974C80;
  id v15 = v12;
  id v13 = v12;
  [(DNDSIDSSyncService *)self sendMessage:a3 withVersionNumber:a4 messageType:a5 toDestinations:a6 identifyingCompletionHandler:v14];
}

uint64_t __97__DNDSIDSSyncService_sendMessage_withVersionNumber_messageType_toDestinations_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)sendMessage:(id)a3 withVersionNumber:(unint64_t)a4 messageType:(id)a5 toDestinations:(id)a6 identifyingCompletionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  queue = self->_queue;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __108__DNDSIDSSyncService_sendMessage_withVersionNumber_messageType_toDestinations_identifyingCompletionHandler___block_invoke;
  v21[3] = &unk_1E6974CA8;
  v21[4] = self;
  id v22 = v12;
  id v23 = v13;
  id v24 = v14;
  id v25 = v15;
  unint64_t v26 = a4;
  id v17 = v15;
  id v18 = v14;
  id v19 = v13;
  id v20 = v12;
  dispatch_async(queue, v21);
}

void __108__DNDSIDSSyncService_sendMessage_withVersionNumber_messageType_toDestinations_identifyingCompletionHandler___block_invoke(void *a1)
{
  v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  uint64_t v5 = a1[9];
  uint64_t v6 = a1[7];
  id v11 = 0;
  id v12 = 0;
  uint64_t v7 = objc_msgSend(v2, "_queue_sendMessage:withVersionNumber:messageType:toDestinations:requestIdentifier:error:", v3, v5, v4, v6, &v12, &v11);
  id v8 = v12;
  id v9 = v11;
  uint64_t v10 = a1[8];
  if (v10) {
    (*(void (**)(uint64_t, uint64_t, id, id))(v10 + 16))(v10, v7, v8, v9);
  }
}

- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v34 = _os_activity_create(&dword_1D3052000, "com.apple.donotdisturb.DNDSIDSSyncService.incomingMessage", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v34, &state);
  id v16 = v14;
  id v17 = v13;
  id v18 = v16;
  id v19 = [v11 deviceForFromID:v16];
  id v20 = v19;
  if (v19)
  {
    v21 = [v19 uniqueIDOverride];
    id v22 = v18;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDSLogIDSTransport, OS_LOG_TYPE_ERROR)) {
      -[DNDSIDSSyncService service:account:incomingMessage:fromID:context:]();
    }
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v22 = [v11 devices];
    uint64_t v23 = [v22 countByEnumeratingWithState:&v35 objects:v52 count:16];
    if (v23)
    {
      id v31 = v12;
      id v32 = v11;
      uint64_t v24 = *(void *)v36;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v36 != v24) {
            objc_enumerationMutation(v22);
          }
          unint64_t v26 = DNDSLogIDSTransport;
          if (os_log_type_enabled((os_log_t)DNDSLogIDSTransport, OS_LOG_TYPE_ERROR))
          {
            v27 = *(void **)(*((void *)&v35 + 1) + 8 * i);
            *(_DWORD *)buf = 138412290;
            id v41 = v27;
            _os_log_error_impl(&dword_1D3052000, v26, OS_LOG_TYPE_ERROR, "\t%@", buf, 0xCu);
          }
        }
        uint64_t v23 = [v22 countByEnumeratingWithState:&v35 objects:v52 count:16];
      }
      while (v23);
      v21 = v18;
      id v12 = v31;
      id v11 = v32;
      id v17 = v13;
    }
    else
    {
      v21 = v18;
    }
  }

  v28 = (id)DNDSLogIDSTransport;
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
  {
    [v15 outgoingResponseIdentifier];
    v30 = id v29 = v15;
    *(_DWORD *)buf = 138544642;
    id v41 = v11;
    __int16 v42 = 2114;
    id v43 = v12;
    __int16 v44 = 2114;
    v45 = v30;
    __int16 v46 = 2114;
    v47 = v17;
    __int16 v48 = 2112;
    v49 = v21;
    __int16 v50 = 2114;
    id v51 = v29;
    _os_log_debug_impl(&dword_1D3052000, v28, OS_LOG_TYPE_DEBUG, "Received sync data: service=%{public}@, account=%{public}@, identifier=%{public}@, message=%{public}@, deviceIdentifier=%@, context=%{public}@", buf, 0x3Eu);

    id v15 = v29;
  }

  if (v21)
  {
    [(DNDSIDSSyncService *)self _queue_handleIncomingMessage:v17 deviceIdentifier:v21];
  }
  else if (os_log_type_enabled((os_log_t)DNDSLogIDSTransport, OS_LOG_TYPE_ERROR))
  {
    -[DNDSIDSSyncService service:account:incomingMessage:fromID:context:]();
  }

  os_activity_scope_leave(&state);
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  BOOL v8 = a6;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  id v16 = DNDSLogIDSTransport;
  if (os_log_type_enabled((os_log_t)DNDSLogIDSTransport, OS_LOG_TYPE_DEBUG))
  {
    int v18 = 138543874;
    id v19 = v14;
    __int16 v20 = 1024;
    BOOL v21 = v8;
    __int16 v22 = 2114;
    id v23 = v15;
    _os_log_debug_impl(&dword_1D3052000, v16, OS_LOG_TYPE_DEBUG, "Sync data send has finished: identifier=%{public}@, success=%{BOOL}d, error=%{public}@", (uint8_t *)&v18, 0x1Cu);
  }
  id v17 = [(DNDSIDSSyncService *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v17 syncService:self didSendWithRequestIdentifier:v14 withSuccess:v8 error:v15];
  }
}

- (void)_queue_resume
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  queue = self->_queue;
  syncService = self->_syncService;
  [(IDSService *)syncService addDelegate:self queue:queue];
}

- (BOOL)_queue_sendMessage:(id)a3 withVersionNumber:(unint64_t)a4 messageType:(id)a5 toDestinations:(id)a6 requestIdentifier:(id *)a7 error:(id *)a8
{
  v47[2] = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v16 = [MEMORY[0x1E4F1CA60] dictionary];
  [v16 setObject:&unk_1F2A5D9A0 forKeyedSubscript:@"v"];
  id v17 = NSNumber;
  int v18 = [MEMORY[0x1E4F1C9C8] date];
  [v18 timeIntervalSinceReferenceDate];
  id v19 = objc_msgSend(v17, "numberWithDouble:");
  [v16 setObject:v19 forKeyedSubscript:@"t"];

  __int16 v20 = [NSNumber numberWithUnsignedInteger:a4];
  [v16 setObject:v20 forKeyedSubscript:@"r"];

  if (v14) {
    [v16 setObject:v14 forKeyedSubscript:@"y"];
  }
  if (v13)
  {
    id v32 = a8;
    v46[0] = @"h";
    v46[1] = @"d";
    v47[0] = v16;
    v47[1] = v13;
    long long v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v47 forKeys:v46 count:2];
    if (v14)
    {
      BOOL v21 = 0;
    }
    else
    {
      uint64_t v44 = *MEMORY[0x1E4F6A9E8];
      v45 = @"sr";
      BOOL v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v45 forKeys:&v44 count:1];
    }
    id v23 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v24 = [(IDSService *)self->_syncService devices];
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __110__DNDSIDSSyncService__queue_sendMessage_withVersionNumber_messageType_toDestinations_requestIdentifier_error___block_invoke;
    v38[3] = &unk_1E6974CD0;
    id v33 = v15;
    id v39 = v15;
    id v25 = objc_msgSend(v24, "bs_compactMap:", v38);
    unint64_t v26 = [v23 setWithArray:v25];

    if ([v26 count])
    {
      syncService = self->_syncService;
      id v36 = 0;
      id v37 = 0;
      int v22 = [(IDSService *)syncService sendMessage:v35 toDestinations:v26 priority:300 options:v21 identifier:&v37 error:&v36];
      id v28 = v37;
      id v29 = v36;
      if (a7) {
        *a7 = v28;
      }
      v30 = DNDSLogIDSTransport;
      if (v22)
      {
        if (os_log_type_enabled((os_log_t)DNDSLogIDSTransport, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          id v41 = v28;
          __int16 v42 = 2112;
          id v43 = v26;
          _os_log_impl(&dword_1D3052000, v30, OS_LOG_TYPE_DEFAULT, "Send sync data: identifier=%{public}@; Destinations: %@",
            buf,
            0x16u);
        }
      }
      else
      {
        if (os_log_type_enabled((os_log_t)DNDSLogIDSTransport, OS_LOG_TYPE_ERROR)) {
          -[DNDSIDSSyncService _queue_sendMessage:withVersionNumber:messageType:toDestinations:requestIdentifier:error:]();
        }
        if (v32) {
          *id v32 = v29;
        }
      }
    }
    else
    {
      if (os_log_type_enabled((os_log_t)DNDSLogIDSTransport, OS_LOG_TYPE_ERROR)) {
        -[DNDSIDSSyncService _queue_sendMessage:withVersionNumber:messageType:toDestinations:requestIdentifier:error:]();
      }
      LOBYTE(v22) = 0;
    }

    id v15 = v33;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDSLogIDSTransport, OS_LOG_TYPE_ERROR)) {
      -[DNDSIDSSyncService _queue_sendMessage:withVersionNumber:messageType:toDestinations:requestIdentifier:error:]();
    }
    LOBYTE(v22) = 0;
  }

  return v22;
}

id __110__DNDSIDSSyncService__queue_sendMessage_withVersionNumber_messageType_toDestinations_requestIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = [v3 uniqueIDOverride];
  LODWORD(v4) = [v4 containsObject:v5];

  if (v4) {
    uint64_t v6 = (void *)IDSCopyIDForDevice();
  }
  else {
    uint64_t v6 = 0;
  }

  return v6;
}

- (void)_queue_handleIncomingMessage:(id)a3 deviceIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  BOOL v8 = objc_msgSend(v6, "bs_safeDictionaryForKey:", @"h");
  id v9 = objc_msgSend(v8, "bs_safeNumberForKey:", @"v");
  if ([v9 unsignedIntegerValue] == 1)
  {
    uint64_t v10 = objc_msgSend(v8, "bs_safeNumberForKey:", @"r");
    if (v10)
    {
      id v11 = objc_msgSend(v6, "bs_safeDictionaryForKey:", @"d");
      if (v11)
      {
        id v12 = [(DNDSIDSSyncService *)self delegate];
        uint64_t v13 = [v10 unsignedIntegerValue];
        id v14 = objc_msgSend(v8, "bs_safeStringForKey:", @"y");
        if ((objc_opt_respondsToSelector() & 1) != 0
          && ![v12 syncService:self shouldAcceptIncomingMessage:v11 withVersionNumber:v13 messageType:v14 fromDeviceIdentifier:v7])
        {
          id v15 = DNDSLogIDSTransport;
          if (os_log_type_enabled((os_log_t)DNDSLogIDSTransport, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)id v16 = 0;
            _os_log_impl(&dword_1D3052000, v15, OS_LOG_TYPE_DEFAULT, "Discarding data because delegate did not allow the message", v16, 2u);
          }
        }
        else
        {
          [v12 syncService:self didReceiveMessage:v11 withVersionNumber:v13 messageType:v14 fromDeviceIdentifier:v7];
        }
      }
      else if (os_log_type_enabled((os_log_t)DNDSLogIDSTransport, OS_LOG_TYPE_ERROR))
      {
        -[DNDSIDSSyncService _queue_handleIncomingMessage:deviceIdentifier:]();
      }
    }
    else if (os_log_type_enabled((os_log_t)DNDSLogIDSTransport, OS_LOG_TYPE_ERROR))
    {
      -[DNDSIDSSyncService _queue_handleIncomingMessage:deviceIdentifier:]();
    }
  }
  else if (os_log_type_enabled((os_log_t)DNDSLogIDSTransport, OS_LOG_TYPE_ERROR))
  {
    -[DNDSIDSSyncService _queue_handleIncomingMessage:deviceIdentifier:]();
  }
}

- (DNDSSyncServiceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (DNDSSyncServiceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_syncService, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)service:account:incomingMessage:fromID:context:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3(&dword_1D3052000, v0, v1, "Unable to resolve the device identifier from the IDS ID", v2, v3, v4, v5, v6);
}

- (void)service:account:incomingMessage:fromID:context:.cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1D3052000, v0, v1, "Unable to find IDS device for fromID %@", v2, v3, v4, v5, v6);
}

- (void)_queue_sendMessage:withVersionNumber:messageType:toDestinations:requestIdentifier:error:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3(&dword_1D3052000, v0, v1, "Failed to migrate message", v2, v3, v4, v5, v6);
}

- (void)_queue_sendMessage:withVersionNumber:messageType:toDestinations:requestIdentifier:error:.cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1D3052000, v0, v1, "Unable to find matching IDS identifier for devices %@", v2, v3, v4, v5, v6);
}

- (void)_queue_sendMessage:withVersionNumber:messageType:toDestinations:requestIdentifier:error:.cold.3()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  __int16 v3 = 2114;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_1D3052000, v1, OS_LOG_TYPE_ERROR, "Failed to send sync data: identifier=%{public}@, error=%{public}@", v2, 0x16u);
}

- (void)_queue_handleIncomingMessage:deviceIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3(&dword_1D3052000, v0, v1, "Missing record version number, will skip message", v2, v3, v4, v5, v6);
}

- (void)_queue_handleIncomingMessage:deviceIdentifier:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3(&dword_1D3052000, v0, v1, "Missing data, will skip message", v2, v3, v4, v5, v6);
}

- (void)_queue_handleIncomingMessage:deviceIdentifier:.cold.3()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1D3052000, v0, v1, "Invalid version number, will skip message: versionNumber=%{public}@", v2, v3, v4, v5, v6);
}

@end
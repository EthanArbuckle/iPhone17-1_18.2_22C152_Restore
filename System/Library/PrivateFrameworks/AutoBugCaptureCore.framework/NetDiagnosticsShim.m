@interface NetDiagnosticsShim
- (BOOL)netDiagnosticTaskStatusWithReply:(id)a3;
- (BOOL)startNetDiagnosticTaskWithOptions:(id)a3 reply:(id)a4;
- (BOOL)stopNetDiagnosticTaskWithReply:(id)a3;
- (NSString)taskName;
- (NetDiagnosticsShim)initWithTaskName:(id)a3 queue:(id)a4;
- (NetDiagnosticsShimDelegate)delegate;
- (id)_connectionForServiceNamed:(const char *)a3 queue:(id)a4 connectionInvalidHandler:(id)a5;
- (id)createNotificationListener;
- (void)connectToNetDiagnosticsd;
- (void)dealloc;
- (void)invalidateConnections;
- (void)sendNotificationListener;
- (void)setDelegate:(id)a3;
- (void)setTaskName:(id)a3;
@end

@implementation NetDiagnosticsShim

- (NetDiagnosticsShim)initWithTaskName:(id)a3 queue:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  v27.receiver = self;
  v27.super_class = (Class)NetDiagnosticsShim;
  v9 = [(NetDiagnosticsShim *)&v27 init];
  v10 = v9;
  if (!v9) {
    goto LABEL_24;
  }
  objc_storeStrong((id *)&v9->_taskName, a3);
  if (!v8)
  {
    v13 = symptomsLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_209DBA000, v13, OS_LOG_TYPE_ERROR, "Passing in a nil queue to NetDiagnosticsShim is NOT recommended!!!", buf, 2u);
    }

    v14 = [NSString stringWithFormat:@"com.apple.symptoms.%@.netdiag.msg.queue", v7];
    v11 = [NSString stringWithFormat:@"com.apple.symptoms.%@.netdiag.msg.queue", v7];
    v15 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    v16 = v14;
    dispatch_queue_t v17 = dispatch_queue_create((const char *)[(NetDiagnosticsShim *)v16 UTF8String], v15);
    netDiagMsgQueue = v10->_netDiagMsgQueue;
    v10->_netDiagMsgQueue = (OS_dispatch_queue *)v17;

    if (v10->_netDiagMsgQueue)
    {
      v19 = v11;
      dispatch_queue_t v20 = dispatch_queue_create((const char *)[v19 UTF8String], v15);
      netDiagConnQueue = v10->_netDiagConnQueue;
      v10->_netDiagConnQueue = (OS_dispatch_queue *)v20;

      if (v10->_netDiagConnQueue)
      {

        v11 = v19;
LABEL_23:

        goto LABEL_24;
      }
      v22 = symptomsLogHandle();
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        goto LABEL_21;
      }
      uint64_t v25 = [v19 UTF8String];
      *(_DWORD *)buf = 136315138;
      uint64_t v29 = v25;
      v24 = "Couldn't create _netDiagConnQueue %s";
    }
    else
    {
      v22 = symptomsLogHandle();
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
LABEL_21:

        goto LABEL_22;
      }
      uint64_t v23 = [(NetDiagnosticsShim *)v16 UTF8String];
      *(_DWORD *)buf = 136315138;
      uint64_t v29 = v23;
      v24 = "Couldn't create _netDiagMsgQueue for %s";
    }
    _os_log_impl(&dword_209DBA000, v22, OS_LOG_TYPE_ERROR, v24, buf, 0xCu);
    goto LABEL_21;
  }
  objc_storeStrong((id *)&v10->_netDiagMsgQueue, a4);
  if (!v10->_netDiagMsgQueue)
  {
    v11 = symptomsLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v12 = "require non-nil _netDiagMsgQueue";
      goto LABEL_14;
    }
LABEL_15:
    v16 = v10;
LABEL_22:
    v10 = 0;
    goto LABEL_23;
  }
  objc_storeStrong((id *)&v10->_netDiagConnQueue, a4);
  if (!v10->_netDiagConnQueue)
  {
    v11 = symptomsLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v12 = "require non-nil _netDiagConnQueue";
LABEL_14:
      _os_log_impl(&dword_209DBA000, v11, OS_LOG_TYPE_ERROR, v12, buf, 2u);
      goto LABEL_15;
    }
    goto LABEL_15;
  }
LABEL_24:

  return v10;
}

- (void)connectToNetDiagnosticsd
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (!self->_netDiagServiceConnection)
  {
    if (self->_netDiagMsgQueue)
    {
      netDiagConnQueue = self->_netDiagConnQueue;
      if (netDiagConnQueue)
      {
        v11[0] = MEMORY[0x263EF8330];
        v11[1] = 3221225472;
        v11[2] = __46__NetDiagnosticsShim_connectToNetDiagnosticsd__block_invoke;
        v11[3] = &unk_263FC2DC0;
        v11[4] = self;
        v4 = [(NetDiagnosticsShim *)self _connectionForServiceNamed:kNetDiagXPCService[0] queue:netDiagConnQueue connectionInvalidHandler:v11];
        netDiagServiceConnection = self->_netDiagServiceConnection;
        self->_netDiagServiceConnection = v4;

        if (self->_netDiagServiceConnection)
        {
          v6 = [(NetDiagnosticsShim *)self createNotificationListener];
          netDiagNotificationListener = self->_netDiagNotificationListener;
          self->_netDiagNotificationListener = v6;

          if (self->_netDiagNotificationListener)
          {
            [(NetDiagnosticsShim *)self sendNotificationListener];
            return;
          }
          id v8 = symptomsLogHandle();
          if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
            goto LABEL_13;
          }
          v9 = [(NetDiagnosticsShim *)self taskName];
          *(_DWORD *)buf = 138412290;
          v13 = v9;
          v10 = "Can't create a listener for notifications for %@";
        }
        else
        {
          id v8 = symptomsLogHandle();
          if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          {
LABEL_13:

            return;
          }
          v9 = [(NetDiagnosticsShim *)self taskName];
          *(_DWORD *)buf = 138412290;
          v13 = v9;
          v10 = "Can't connect to XPC service for %@";
        }
        _os_log_impl(&dword_209DBA000, v8, OS_LOG_TYPE_ERROR, v10, buf, 0xCu);

        goto LABEL_13;
      }
    }
  }
}

void __46__NetDiagnosticsShim_connectToNetDiagnosticsd__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(void **)(v1 + 8);
  *(void *)(v1 + 8) = 0;
}

- (void)dealloc
{
  [(NetDiagnosticsShim *)self invalidateConnections];
  v3.receiver = self;
  v3.super_class = (Class)NetDiagnosticsShim;
  [(NetDiagnosticsShim *)&v3 dealloc];
}

- (void)invalidateConnections
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  objc_super v3 = symptomsLogHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = [(NetDiagnosticsShim *)self taskName];
    int v11 = 138412290;
    v12 = v4;
    _os_log_impl(&dword_209DBA000, v3, OS_LOG_TYPE_INFO, "Invalidating connections (%@)", (uint8_t *)&v11, 0xCu);
  }
  netDiagServiceConnection = self->_netDiagServiceConnection;
  if (netDiagServiceConnection)
  {
    xpc_connection_cancel(netDiagServiceConnection);
    v6 = self->_netDiagServiceConnection;
    self->_netDiagServiceConnection = 0;
  }
  netDiagNotificationConnection = self->_netDiagNotificationConnection;
  if (netDiagNotificationConnection)
  {
    xpc_connection_cancel(netDiagNotificationConnection);
    id v8 = self->_netDiagNotificationConnection;
    self->_netDiagNotificationConnection = 0;
  }
  netDiagNotificationListener = self->_netDiagNotificationListener;
  if (netDiagNotificationListener)
  {
    xpc_connection_cancel(netDiagNotificationListener);
    v10 = self->_netDiagNotificationListener;
    self->_netDiagNotificationListener = 0;
  }
}

- (BOOL)startNetDiagnosticTaskWithOptions:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  xpc_object_t v8 = xpc_dictionary_create(0, 0, 0);
  if (v8)
  {
    id v9 = [v6 objectForKeyedSubscript:@"taskName"];
    if ([v9 UTF8String] && (id v10 = v9, *(unsigned char *)objc_msgSend(v10, "UTF8String")))
    {
      xpc_dictionary_set_string(v8, kNetDiagCommand[0], kNetDiagCmdTaskRun[0]);
      int v11 = kNetDiagKey[0];
      id v47 = v10;
      xpc_dictionary_set_string(v8, v11, (const char *)[v47 UTF8String]);
      v12 = [v6 objectForKeyedSubscript:@"taskFileAge"];
      uint64_t v13 = v12;
      if (v12) {
        xpc_dictionary_set_uint64(v8, kNetDiagTaskFileAge[0], [v12 unsignedLongLongValue]);
      }
      v49 = v13;
      id v14 = [v6 objectForKeyedSubscript:@"filename"];
      if ([v14 UTF8String])
      {
        id v15 = v14;
        if (*(unsigned char *)[v15 UTF8String]) {
          xpc_dictionary_set_string(v8, kNetDiagTaskFilePath[0], (const char *)[v15 UTF8String]);
        }
      }
      v16 = [v6 objectForKeyedSubscript:@"taskFileUserID"];
      dispatch_queue_t v17 = v16;
      if (v16) {
        xpc_dictionary_set_int64(v8, kNetDiagTaskFileUserID[0], [v16 longLongValue]);
      }
      v18 = [v6 objectForKeyedSubscript:@"taskFileGroupID"];
      v19 = v18;
      if (v18) {
        xpc_dictionary_set_int64(v8, kNetDiagTaskFileGroupID[0], [v18 longLongValue]);
      }
      dispatch_queue_t v20 = [v6 objectForKeyedSubscript:@"taskFileMode"];
      v21 = v20;
      if (v20) {
        xpc_dictionary_set_int64(v8, kNetDiagTaskFileMode[0], [v20 longLongValue]);
      }
      v44 = v21;
      v22 = [v6 objectForKeyedSubscript:@"taskFileDicts"];
      uint64_t v23 = v22;
      if (v22 && [v22 count])
      {
        v24 = (void *)_CFXPCCreateXPCObjectFromCFObject();
        if (v24) {
          xpc_dictionary_set_value(v8, kNetDiagTaskFilePaths[0], v24);
        }
      }
      v48 = v14;
      uint64_t v25 = [v6 objectForKeyedSubscript:@"taskGNISensitive"];
      v26 = v25;
      if (v25) {
        xpc_dictionary_set_BOOL(v8, kNetDiagTaskGNISensitive[0], [v25 BOOLValue]);
      }
      v45 = v19;
      objc_super v27 = objc_msgSend(v6, "objectForKeyedSubscript:", @"taskGNISysConfig", v26);
      v28 = v27;
      if (v27) {
        xpc_dictionary_set_BOOL(v8, kNetDiagTaskGNISysConfig[0], [v27 BOOLValue]);
      }
      v46 = v17;
      uint64_t v29 = [v6 objectForKeyedSubscript:@"taskGNINDFInfo"];
      uint64_t v30 = v29;
      if (v29) {
        xpc_dictionary_set_BOOL(v8, kNetDiagTaskGNINDFInfo[0], [v29 BOOLValue]);
      }
      v31 = [v6 objectForKeyedSubscript:@"taskArchiveBaseSize"];
      v32 = v31;
      if (v31) {
        xpc_dictionary_set_uint64(v8, kNetDiagTaskLogArchiveBaseSize[0], [v31 unsignedIntegerValue]);
      }
      v43 = v23;
      v33 = [v6 objectForKeyedSubscript:@"taskArchiveBaseDuration"];

      if (v33) {
        xpc_dictionary_set_uint64(v8, kNetDiagTaskLogArchiveBaseDuration[0], [v33 unsignedIntegerValue]);
      }
      v34 = [v6 objectForKeyedSubscript:@"taskArchiveTTLSize"];

      if (v34) {
        xpc_dictionary_set_uint64(v8, kNetDiagTaskLogArchiveTTLSize[0], [v34 unsignedIntegerValue]);
      }
      v35 = [v6 objectForKeyedSubscript:@"taskArchiveTTLDuration"];

      if (v35) {
        xpc_dictionary_set_uint64(v8, kNetDiagTaskLogArchiveTTLDuration[0], [v35 unsignedIntegerValue]);
      }
      v36 = [v6 objectForKeyedSubscript:@"taskArchiveHVSize"];

      if (v36) {
        xpc_dictionary_set_uint64(v8, kNetDiagTaskLogArchiveHVSize[0], [v36 unsignedIntegerValue]);
      }
      v37 = [v6 objectForKeyedSubscript:@"taskArchiveHVDuration"];

      if (v37) {
        xpc_dictionary_set_uint64(v8, kNetDiagTaskLogArchiveHVDuration[0], [v37 integerValue]);
      }
      [(NetDiagnosticsShim *)self connectToNetDiagnosticsd];
      netDiagServiceConnection = self->_netDiagServiceConnection;
      netDiagMsgQueue = self->_netDiagMsgQueue;
      handler[0] = MEMORY[0x263EF8330];
      handler[1] = 3221225472;
      handler[2] = __62__NetDiagnosticsShim_startNetDiagnosticTaskWithOptions_reply___block_invoke;
      handler[3] = &unk_263FC43A0;
      id v52 = v7;
      id v51 = v47;
      xpc_connection_send_message_with_reply(netDiagServiceConnection, v8, netDiagMsgQueue, handler);

      BOOL v40 = 1;
    }
    else
    {
      BOOL v40 = 0;
    }
  }
  else
  {
    BOOL v40 = 0;
  }

  return v40;
}

void __62__NetDiagnosticsShim_startNetDiagnosticTaskWithOptions_reply___block_invoke(uint64_t a1, void *a2)
{
  v15[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = MEMORY[0x21050D5D0]();
  if (v4 == MEMORY[0x263EF8720])
  {
    id v6 = symptomsLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_209DBA000, v6, OS_LOG_TYPE_INFO, "kNetDiagCmdTaskRun failed!", buf, 2u);
    }

    uint64_t v7 = *(void *)(a1 + 40);
    if (v7)
    {
      xpc_object_t v8 = (void *)MEMORY[0x263F087E8];
      uint64_t v9 = *MEMORY[0x263F08438];
      id v14 = @"error";
      id v10 = [NSString stringWithFormat:@"An XPC error occurred while processing task: %@. (kNetDiagCmdTaskRun failure)", *(void *)(a1 + 32)];
      v15[0] = v10;
      int v11 = [NSDictionary dictionaryWithObjects:v15 forKeys:&v14 count:1];
      v12 = [v8 errorWithDomain:v9 code:5 userInfo:v11];
      (*(void (**)(uint64_t, void, void *))(v7 + 16))(v7, 0, v12);
    }
  }
  else if (v4 == MEMORY[0x263EF8708] && *(void *)(a1 + 40))
  {
    v5 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (BOOL)stopNetDiagnosticTaskWithReply:(id)a3
{
  id v4 = a3;
  xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
  id v6 = v5;
  if (v5)
  {
    xpc_dictionary_set_string(v5, kNetDiagCommand[0], kNetDiagCmdTaskStop[0]);
    xpc_dictionary_set_string(v6, kNetDiagKey[0], [(NSString *)self->_taskName UTF8String]);
    [(NetDiagnosticsShim *)self connectToNetDiagnosticsd];
    netDiagServiceConnection = self->_netDiagServiceConnection;
    netDiagMsgQueue = self->_netDiagMsgQueue;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __53__NetDiagnosticsShim_stopNetDiagnosticTaskWithReply___block_invoke;
    v10[3] = &unk_263FC43A0;
    v10[4] = self;
    id v11 = v4;
    xpc_connection_send_message_with_reply(netDiagServiceConnection, v6, netDiagMsgQueue, v10);
  }
  return v6 != 0;
}

void __53__NetDiagnosticsShim_stopNetDiagnosticTaskWithReply___block_invoke(uint64_t a1, void *a2)
{
  v15[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = MEMORY[0x21050D5D0]();
  if (v4 == MEMORY[0x263EF8720])
  {
    id v6 = symptomsLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_209DBA000, v6, OS_LOG_TYPE_INFO, "kNetDiagCmdTaskStop failed!", buf, 2u);
    }

    uint64_t v7 = *(void *)(a1 + 40);
    if (v7)
    {
      xpc_object_t v8 = (void *)MEMORY[0x263F087E8];
      uint64_t v9 = *MEMORY[0x263F08438];
      id v14 = @"error";
      id v10 = [NSString stringWithFormat:@"Stopping %@ failed!", *(void *)(*(void *)(a1 + 32) + 56)];
      v15[0] = v10;
      id v11 = [NSDictionary dictionaryWithObjects:v15 forKeys:&v14 count:1];
      v12 = [v8 errorWithDomain:v9 code:5 userInfo:v11];
      (*(void (**)(uint64_t, void, void *))(v7 + 16))(v7, 0, v12);
    }
  }
  else if (v4 == MEMORY[0x263EF8708] && *(void *)(a1 + 40))
  {
    xpc_object_t v5 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (BOOL)netDiagnosticTaskStatusWithReply:(id)a3
{
  id v4 = a3;
  xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
  if (v5)
  {
    xpc_object_t v6 = xpc_array_create(0, 0);
    if (v6)
    {
      xpc_object_t v7 = xpc_string_create([(NSString *)self->_taskName UTF8String]);
      BOOL v8 = v7 != 0;
      if (v7)
      {
        xpc_array_append_value(v6, v7);
        xpc_dictionary_set_value(v5, kNetDiagKeyArray[0], v6);
        xpc_dictionary_set_string(v5, kNetDiagCommand[0], kNetDiagCmdTasksStatus[0]);
        [(NetDiagnosticsShim *)self connectToNetDiagnosticsd];
        netDiagServiceConnection = self->_netDiagServiceConnection;
        netDiagMsgQueue = self->_netDiagMsgQueue;
        v12[0] = MEMORY[0x263EF8330];
        v12[1] = 3221225472;
        v12[2] = __55__NetDiagnosticsShim_netDiagnosticTaskStatusWithReply___block_invoke;
        v12[3] = &unk_263FC43A0;
        v12[4] = self;
        id v13 = v4;
        xpc_connection_send_message_with_reply(netDiagServiceConnection, v5, netDiagMsgQueue, v12);
      }
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

void __55__NetDiagnosticsShim_netDiagnosticTaskStatusWithReply___block_invoke(uint64_t a1, void *a2)
{
  v15[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = MEMORY[0x21050D5D0]();
  if (v4 == MEMORY[0x263EF8720])
  {
    xpc_object_t v6 = symptomsLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_209DBA000, v6, OS_LOG_TYPE_INFO, "kNetDiagCmdTasksStatus failed!", buf, 2u);
    }

    uint64_t v7 = *(void *)(a1 + 40);
    if (v7)
    {
      BOOL v8 = (void *)MEMORY[0x263F087E8];
      uint64_t v9 = *MEMORY[0x263F08438];
      id v14 = @"error";
      id v10 = [NSString stringWithFormat:@"Stopping %@ failed!", *(void *)(*(void *)(a1 + 32) + 56)];
      v15[0] = v10;
      id v11 = [NSDictionary dictionaryWithObjects:v15 forKeys:&v14 count:1];
      v12 = [v8 errorWithDomain:v9 code:5 userInfo:v11];
      (*(void (**)(uint64_t, void, void *))(v7 + 16))(v7, 0, v12);
    }
  }
  else if (v4 == MEMORY[0x263EF8708] && *(void *)(a1 + 40))
  {
    xpc_object_t v5 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (id)createNotificationListener
{
  id v3 = xpc_connection_create(0, (dispatch_queue_t)self->_netDiagConnQueue);
  uint64_t v4 = v3;
  if (v3)
  {
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __48__NetDiagnosticsShim_createNotificationListener__block_invoke;
    handler[3] = &unk_263FC43C8;
    void handler[4] = self;
    xpc_connection_set_event_handler(v3, handler);
    xpc_connection_resume(v4);
    xpc_object_t v5 = v4;
  }
  else
  {
    xpc_object_t v6 = symptomsLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_209DBA000, v6, OS_LOG_TYPE_ERROR, "Couldn't create progress connection", buf, 2u);
    }
  }

  return v4;
}

void __48__NetDiagnosticsShim_createNotificationListener__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a2;
  uint64_t v5 = MEMORY[0x21050D5D0]();
  xpc_object_t v6 = (void *)MEMORY[0x21050D510](v4);
  if (v6) {
    free(v6);
  }
  if (v5 == MEMORY[0x263EF8720])
  {
    if (v4 == (id)MEMORY[0x263EF86C0])
    {
      uint64_t v7 = symptomsLogHandle();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_18;
      }
      BOOL v8 = [*(id *)(a1 + 32) taskName];
      *(_DWORD *)buf = 138412290;
      dispatch_queue_t v20 = v8;
      uint64_t v9 = "received XPC_ERROR_TERMINATION_IMMINENT for %@";
    }
    else
    {
      if (v4 != (id)MEMORY[0x263EF86A8]) {
        goto LABEL_19;
      }
      uint64_t v7 = symptomsLogHandle();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_18;
      }
      BOOL v8 = [*(id *)(a1 + 32) taskName];
      *(_DWORD *)buf = 138412290;
      dispatch_queue_t v20 = v8;
      uint64_t v9 = "progress connection is closed for %@";
    }
    id v10 = v7;
    os_log_type_t v11 = OS_LOG_TYPE_DEBUG;
    goto LABEL_17;
  }
  if (v5 != MEMORY[0x263EF86F0])
  {
    uint64_t v7 = symptomsLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      BOOL v8 = [*(id *)(a1 + 32) taskName];
      *(_DWORD *)buf = 138412290;
      dispatch_queue_t v20 = v8;
      uint64_t v9 = "unknown xpc_type_t for %@";
      id v10 = v7;
      os_log_type_t v11 = OS_LOG_TYPE_INFO;
LABEL_17:
      _os_log_impl(&dword_209DBA000, v10, v11, v9, buf, 0xCu);
    }
LABEL_18:

    goto LABEL_19;
  }
  uint64_t v12 = *(void *)(a1 + 32);
  id v13 = *(_xpc_connection_s **)(v12 + 24);
  if (v13)
  {
    xpc_connection_cancel(v13);
    uint64_t v14 = *(void *)(a1 + 32);
    id v15 = *(void **)(v14 + 24);
    *(void *)(v14 + 24) = 0;

    uint64_t v12 = *(void *)(a1 + 32);
  }
  objc_storeStrong((id *)(v12 + 24), a2);
  xpc_connection_set_target_queue(*(xpc_connection_t *)(*(void *)(a1 + 32) + 24), *(dispatch_queue_t *)(*(void *)(a1 + 32) + 40));
  uint64_t v16 = *(void *)(a1 + 32);
  dispatch_queue_t v17 = *(_xpc_connection_s **)(v16 + 24);
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __48__NetDiagnosticsShim_createNotificationListener__block_invoke_64;
  handler[3] = &unk_263FC43C8;
  void handler[4] = v16;
  xpc_connection_set_event_handler(v17, handler);
  xpc_connection_resume(*(xpc_connection_t *)(*(void *)(a1 + 32) + 24));
LABEL_19:
}

void __48__NetDiagnosticsShim_createNotificationListener__block_invoke_64(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = MEMORY[0x21050D5D0]();
  if (v4 == MEMORY[0x263EF8708])
  {
    string = xpc_dictionary_get_string(v3, kNetDiagNotifTaskStatusChanged[0]);
    int64_t int64 = xpc_dictionary_get_int64(v3, kNetDiagValue[0]);
    if (!string)
    {
      uint64_t v11 = MEMORY[0x21050D510](v3);
      if (v11)
      {
        uint64_t v12 = (void *)v11;
        id v13 = symptomsLogHandle();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          int v14 = 136315138;
          id v15 = v12;
          _os_log_impl(&dword_209DBA000, v13, OS_LOG_TYPE_INFO, "task_name seems to be NULL. dict: %s", (uint8_t *)&v14, 0xCu);
        }

        free(v12);
      }
      uint64_t v5 = *(id *)(*(void *)(a1 + 32) + 48);
      goto LABEL_22;
    }
    int64_t v8 = int64;
    uint64_t v5 = *(id *)(*(void *)(a1 + 32) + 48);
    if (objc_opt_respondsToSelector())
    {
      uint64_t v9 = [NSString stringWithUTF8String:string];
      [v5 netDiagnosticTaskStatusChangedFor:v9 toStatus:v8];
LABEL_21:

      goto LABEL_22;
    }
    goto LABEL_22;
  }
  if (v4 != MEMORY[0x263EF8720])
  {
    uint64_t v5 = symptomsLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      LOWORD(v14) = 0;
      _os_log_impl(&dword_209DBA000, v5, OS_LOG_TYPE_INFO, "unknown message type", (uint8_t *)&v14, 2u);
    }
    goto LABEL_22;
  }
  if (*(void *)(*(void *)(a1 + 32) + 24))
  {
    if (v3 == (id)MEMORY[0x263EF86A0])
    {
      uint64_t v5 = symptomsLogHandle();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v9 = [*(id *)(a1 + 32) taskName];
        int v14 = 138412290;
        id v15 = v9;
        id v10 = "Interrupted connection to XPC service (%@)";
        goto LABEL_20;
      }
LABEL_22:

      goto LABEL_23;
    }
    if (v3 == (id)MEMORY[0x263EF86A8])
    {
      uint64_t v5 = symptomsLogHandle();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v9 = [*(id *)(a1 + 32) taskName];
        int v14 = 138412290;
        id v15 = v9;
        id v10 = "Connection Invalid error for XPC service (%@)";
LABEL_20:
        _os_log_impl(&dword_209DBA000, v5, OS_LOG_TYPE_DEBUG, v10, (uint8_t *)&v14, 0xCu);
        goto LABEL_21;
      }
      goto LABEL_22;
    }
  }
LABEL_23:
}

- (void)sendNotificationListener
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  uint64_t v4 = v3;
  if (v3)
  {
    xpc_dictionary_set_string(v3, kNetDiagCommand[0], kNetDiagCmdNotifier[0]);
    xpc_dictionary_set_connection(v4, kNetDiagConnection[0], self->_netDiagNotificationListener);
    xpc_connection_send_message_with_reply(self->_netDiagServiceConnection, v4, (dispatch_queue_t)self->_netDiagMsgQueue, &__block_literal_global_14);
  }
  else
  {
    uint64_t v5 = symptomsLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)xpc_object_t v6 = 0;
      _os_log_impl(&dword_209DBA000, v5, OS_LOG_TYPE_ERROR, "xpc_dictionary_create", v6, 2u);
    }
  }
}

BOOL __46__NetDiagnosticsShim_sendNotificationListener__block_invoke(int a1, xpc_object_t xdict)
{
  return xpc_dictionary_apply(xdict, &__block_literal_global_69);
}

uint64_t __46__NetDiagnosticsShim_sendNotificationListener__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  xpc_object_t v3 = (void *)MEMORY[0x21050D510](a3);
  if (v3) {
    free(v3);
  }
  return 1;
}

- (id)_connectionForServiceNamed:(const char *)a3 queue:(id)a4 connectionInvalidHandler:(id)a5
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v8 = a5;
  mach_service = xpc_connection_create_mach_service(a3, (dispatch_queue_t)a4, 2uLL);
  if (mach_service)
  {
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __80__NetDiagnosticsShim__connectionForServiceNamed_queue_connectionInvalidHandler___block_invoke;
    handler[3] = &unk_263FC4430;
    void handler[4] = self;
    id v15 = a3;
    id v14 = v8;
    xpc_connection_set_event_handler(mach_service, handler);
    xpc_connection_resume(mach_service);
    id v10 = mach_service;
  }
  else
  {
    uint64_t v11 = symptomsLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      dispatch_queue_t v17 = a3;
      _os_log_impl(&dword_209DBA000, v11, OS_LOG_TYPE_ERROR, "Can't connect to XPC service: %s", buf, 0xCu);
    }
  }

  return mach_service;
}

void __80__NetDiagnosticsShim__connectionForServiceNamed_queue_connectionInvalidHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = MEMORY[0x21050D5D0]();
  uint64_t v5 = (void *)MEMORY[0x21050D510](v3);

  if (v5) {
    free(v5);
  }
  if (v4 != MEMORY[0x263EF8720])
  {
    uint64_t v6 = MEMORY[0x263EF8708];
    uint64_t v7 = symptomsLogHandle();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
    if (v4 == v6)
    {
      if (v8)
      {
        LOWORD(v21) = 0;
        _os_log_impl(&dword_209DBA000, v7, OS_LOG_TYPE_INFO, "Received XPC_TYPE_DICTIONARY", (uint8_t *)&v21, 2u);
      }
      goto LABEL_17;
    }
    if (!v8)
    {
LABEL_17:

      return;
    }
    uint64_t v9 = *(void *)(a1 + 48);
    id v10 = [*(id *)(a1 + 32) taskName];
    int v21 = 136315394;
    uint64_t v22 = v9;
    __int16 v23 = 2112;
    v24 = v10;
    uint64_t v11 = "Received unexpected event for XPC service %s (%@)";
    uint64_t v12 = v7;
    os_log_type_t v13 = OS_LOG_TYPE_INFO;
LABEL_7:
    _os_log_impl(&dword_209DBA000, v12, v13, v11, (uint8_t *)&v21, 0x16u);

    goto LABEL_17;
  }
  if (!*(void *)(*(void *)(a1 + 32) + 8)) {
    return;
  }
  if (v3 == (id)MEMORY[0x263EF86A0])
  {
    uint64_t v7 = symptomsLogHandle();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_17;
    }
    uint64_t v17 = *(void *)(a1 + 48);
    id v10 = [*(id *)(a1 + 32) taskName];
    int v21 = 136315394;
    uint64_t v22 = v17;
    __int16 v23 = 2112;
    v24 = v10;
    uint64_t v11 = "Interrupted connection to XPC service %s (%@)";
    uint64_t v12 = v7;
    os_log_type_t v13 = OS_LOG_TYPE_DEBUG;
    goto LABEL_7;
  }
  id v14 = (id)MEMORY[0x263EF86A8];
  id v15 = symptomsLogHandle();
  uint64_t v7 = v15;
  if (v3 != v14)
  {
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      goto LABEL_17;
    }
    uint64_t v16 = *(void *)(a1 + 48);
    id v10 = [*(id *)(a1 + 32) taskName];
    int v21 = 136315394;
    uint64_t v22 = v16;
    __int16 v23 = 2112;
    v24 = v10;
    uint64_t v11 = "Unexpected error for XPC service %s (%@)";
    uint64_t v12 = v7;
    os_log_type_t v13 = OS_LOG_TYPE_ERROR;
    goto LABEL_7;
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v18 = *(void *)(a1 + 48);
    v19 = [*(id *)(a1 + 32) taskName];
    int v21 = 136315394;
    uint64_t v22 = v18;
    __int16 v23 = 2112;
    v24 = v19;
    _os_log_impl(&dword_209DBA000, v7, OS_LOG_TYPE_DEBUG, "Connection Invalid error for XPC service %s (%@)", (uint8_t *)&v21, 0x16u);
  }
  uint64_t v20 = *(void *)(a1 + 40);
  if (v20) {
    (*(void (**)(void))(v20 + 16))();
  }
}

- (NetDiagnosticsShimDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)taskName
{
  return self->_taskName;
}

- (void)setTaskName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskName, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_netDiagMsgQueue, 0);
  objc_storeStrong((id *)&self->_netDiagConnQueue, 0);
  objc_storeStrong((id *)&self->_netDiagNotificationConnection, 0);
  objc_storeStrong((id *)&self->_netDiagNotificationListener, 0);

  objc_storeStrong((id *)&self->_netDiagServiceConnection, 0);
}

@end
@interface DSXPCConnection
- (DSKappaSession)kappaSession;
- (DSMotionSession)motionSession;
- (DSXPCServer)xpcDaemonServer;
- (OS_dispatch_queue)dispatchQueue;
- (OS_xpc_object)xpcConnection;
- (int)pid;
- (void)_activateKappaSessionMessage:(id)a3;
- (void)_activateMotionSessionMessage:(id)a3;
- (void)_checkEntitlement:(const char *)a3 error:(id *)a4;
- (void)_deviceChangedHandler:(id)a3;
- (void)_deviceFoundHandler:(id)a3;
- (void)_deviceLostHandler:(id)a3;
- (void)_handleXPCMessage:(id)a3;
- (void)_printCohortMessage:(id)a3;
- (void)_updateCoordinationStatusMessage:(id)a3;
- (void)_updateVehicleStateMessage:(id)a3;
- (void)_xpcCohortDeviceMessage:(id)a3 type:(const char *)a4;
- (void)_xpcConnectionSendEvent:(id)a3;
- (void)_xpcEventHandler:(id)a3;
- (void)_xpcSendReplyForMessage:(id)a3 error:(id)a4;
- (void)activate;
- (void)invalidate;
- (void)setDispatchQueue:(id)a3;
- (void)setKappaSession:(id)a3;
- (void)setMotionSession:(id)a3;
- (void)setPid:(int)a3;
- (void)setXpcConnection:(id)a3;
- (void)setXpcDaemonServer:(id)a3;
@end

@implementation DSXPCConnection

- (void)activate
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  xpcConnection = self->_xpcConnection;
  if (xpcConnection)
  {
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __27__DSXPCConnection_activate__block_invoke;
    handler[3] = &unk_2646D4E40;
    handler[4] = self;
    xpc_connection_set_event_handler(xpcConnection, handler);
    xpc_connection_set_target_queue(self->_xpcConnection, (dispatch_queue_t)self->_dispatchQueue);
    xpc_connection_activate(self->_xpcConnection);
    if (onceTokenDSXPCConnection != -1) {
      dispatch_once(&onceTokenDSXPCConnection, &__block_literal_global_7);
    }
    uint64_t v4 = logObjDSXPCConnection;
    if (os_log_type_enabled((os_log_t)logObjDSXPCConnection, OS_LOG_TYPE_DEFAULT))
    {
      int pid = self->_pid;
      *(_DWORD *)buf = 67109120;
      int v13 = pid;
      v6 = "DSXPCConnection activated for PID: %d";
      v7 = v4;
      os_log_type_t v8 = OS_LOG_TYPE_DEFAULT;
      uint32_t v9 = 8;
LABEL_10:
      _os_log_impl(&dword_223BD6000, v7, v8, v6, buf, v9);
    }
  }
  else
  {
    if (onceTokenDSXPCConnection != -1) {
      dispatch_once(&onceTokenDSXPCConnection, &__block_literal_global_7);
    }
    uint64_t v10 = logObjDSXPCConnection;
    if (os_log_type_enabled((os_log_t)logObjDSXPCConnection, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v6 = "xpc connection not set";
      v7 = v10;
      os_log_type_t v8 = OS_LOG_TYPE_ERROR;
      uint32_t v9 = 2;
      goto LABEL_10;
    }
  }
}

uint64_t __27__DSXPCConnection_activate__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _xpcEventHandler:a2];
}

- (void)invalidate
{
  xpcConnection = self->_xpcConnection;
  if (xpcConnection)
  {
    uint64_t v4 = xpcConnection;
    xpc_connection_cancel(v4);
    v5 = self->_xpcConnection;
    self->_xpcConnection = 0;
  }
  kappaSession = self->_kappaSession;
  if (kappaSession)
  {
    self->_isEntitledForKappa = 0;
    self->_kappaSession = 0;
  }
  motionSession = self->_motionSession;
  if (motionSession)
  {
    self->_isEntitledForMotion = 0;
    self->_motionSession = 0;
  }
  xpcDaemonServer = self->_xpcDaemonServer;
  [(DSXPCServer *)xpcDaemonServer removeXPCConnection:self];
}

- (void)_xpcEventHandler:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = v4;
  if (v4 == (id)MEMORY[0x263EF86A8])
  {
    if (onceTokenDSXPCConnection != -1) {
      dispatch_once(&onceTokenDSXPCConnection, &__block_literal_global_7);
    }
    os_log_type_t v8 = logObjDSXPCConnection;
    if (os_log_type_enabled((os_log_t)logObjDSXPCConnection, OS_LOG_TYPE_DEFAULT))
    {
      int pid = self->_pid;
      int v11 = 67109120;
      LODWORD(v12) = pid;
      _os_log_impl(&dword_223BD6000, v8, OS_LOG_TYPE_DEFAULT, "XPC Connection Invalidated for pid: %d", (uint8_t *)&v11, 8u);
    }
    xpcConnection = self->_xpcConnection;
    self->_xpcConnection = 0;

    [(DSXPCConnection *)self invalidate];
  }
  else if (MEMORY[0x223CBE6A0](v4) == MEMORY[0x263EF8708])
  {
    [(DSXPCConnection *)self _handleXPCMessage:v5];
  }
  else
  {
    if (onceTokenDSXPCConnection != -1) {
      dispatch_once(&onceTokenDSXPCConnection, &__block_literal_global_7);
    }
    v6 = (void *)logObjDSXPCConnection;
    if (os_log_type_enabled((os_log_t)logObjDSXPCConnection, OS_LOG_TYPE_DEFAULT))
    {
      v7 = v6;
      int v11 = 136315138;
      uint64_t v12 = MEMORY[0x223CBE5A0](v5);
      _os_log_impl(&dword_223BD6000, v7, OS_LOG_TYPE_DEFAULT, "Invalid XPC Message :%s", (uint8_t *)&v11, 0xCu);
    }
  }
}

- (void)_handleXPCMessage:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  string = xpc_dictionary_get_string(v4, "kDSXPCMsg");
  if (!string)
  {
    if (onceTokenDSXPCConnection != -1) {
      dispatch_once(&onceTokenDSXPCConnection, &__block_literal_global_7);
    }
    uint64_t v11 = logObjDSXPCConnection;
    if (!os_log_type_enabled((os_log_t)logObjDSXPCConnection, OS_LOG_TYPE_ERROR)) {
      goto LABEL_16;
    }
    *(_WORD *)uint64_t v13 = 0;
    os_log_type_t v8 = "No message type in XPC";
    uint32_t v9 = v11;
    uint32_t v10 = 2;
    goto LABEL_15;
  }
  v6 = string;
  if (!strcmp(string, "kDSKappaActivate"))
  {
    [(DSXPCConnection *)self _activateKappaSessionMessage:v4];
    goto LABEL_22;
  }
  if (!strcmp(v6, "kDSKappaUpdate"))
  {
    [(DSXPCConnection *)self _updateCoordinationStatusMessage:v4];
    goto LABEL_22;
  }
  if (!strcmp(v6, "kDSMotionActivate"))
  {
    [(DSXPCConnection *)self _activateMotionSessionMessage:v4];
    goto LABEL_22;
  }
  if (!strcmp(v6, "kDSMotionUpdate"))
  {
    [(DSXPCConnection *)self _updateVehicleStateMessage:v4];
    goto LABEL_22;
  }
  if (!strcmp(v6, "kDSCohortPrint"))
  {
    [(DSXPCConnection *)self _printCohortMessage:v4];
    goto LABEL_22;
  }
  if (onceTokenDSXPCConnection != -1) {
    dispatch_once(&onceTokenDSXPCConnection, &__block_literal_global_7);
  }
  uint64_t v7 = logObjDSXPCConnection;
  if (os_log_type_enabled((os_log_t)logObjDSXPCConnection, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)uint64_t v13 = 136315138;
    *(void *)&v13[4] = v6;
    os_log_type_t v8 = "Unknown message type in XPC: %s";
    uint32_t v9 = v7;
    uint32_t v10 = 12;
LABEL_15:
    _os_log_impl(&dword_223BD6000, v9, OS_LOG_TYPE_ERROR, v8, v13, v10);
  }
LABEL_16:
  uint64_t v12 = objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", @"DSErrorDomain", 1, 0, *(_OWORD *)v13);
  [(DSXPCConnection *)self _xpcSendReplyForMessage:v4 error:v12];

LABEL_22:
}

- (void)_xpcSendReplyForMessage:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (xpc_dictionary_expects_reply())
  {
    if (self->_xpcConnection)
    {
      xpc_object_t reply = xpc_dictionary_create_reply(v6);
      uint32_t v9 = reply;
      if (reply)
      {
        if (v7)
        {
          id v21 = v7;
          uint32_t v10 = [MEMORY[0x263F08910] archivedDataWithRootObject:v7 requiringSecureCoding:1 error:&v21];
          id v11 = v21;

          if (v10)
          {
            id v12 = v10;
            xpc_object_t v13 = xpc_data_create((const void *)[v12 bytes], objc_msgSend(v12, "length"));
            xpc_dictionary_set_value(v9, "kDSXPCErrorData", v13);
          }
          xpc_dictionary_set_string(v9, "kDSXPCMsg", "kDSXPCError");
        }
        else
        {
          xpc_dictionary_set_string(reply, "kDSXPCMsg", "kDSXPCSuccess");
          id v11 = 0;
        }
        xpc_connection_send_message(self->_xpcConnection, v9);
        id v7 = v11;
      }
      else
      {
        if (onceTokenDSXPCConnection != -1) {
          dispatch_once(&onceTokenDSXPCConnection, &__block_literal_global_7);
        }
        v20 = logObjDSXPCConnection;
        if (os_log_type_enabled((os_log_t)logObjDSXPCConnection, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v22 = 0;
          _os_log_impl(&dword_223BD6000, v20, OS_LOG_TYPE_ERROR, "Send reply error: reply creation error", v22, 2u);
        }
      }

      goto LABEL_24;
    }
    if (onceTokenDSXPCConnection != -1) {
      dispatch_once(&onceTokenDSXPCConnection, &__block_literal_global_7);
    }
    uint64_t v19 = logObjDSXPCConnection;
    if (os_log_type_enabled((os_log_t)logObjDSXPCConnection, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v15 = "Send reply error: no connection";
      v16 = buf;
      v17 = v19;
      os_log_type_t v18 = OS_LOG_TYPE_ERROR;
      goto LABEL_16;
    }
  }
  else
  {
    if (onceTokenDSXPCConnection != -1) {
      dispatch_once(&onceTokenDSXPCConnection, &__block_literal_global_7);
    }
    uint64_t v14 = logObjDSXPCConnection;
    if (os_log_type_enabled((os_log_t)logObjDSXPCConnection, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v24 = 0;
      v15 = "XPC message does not expect reply";
      v16 = (uint8_t *)&v24;
      v17 = v14;
      os_log_type_t v18 = OS_LOG_TYPE_DEFAULT;
LABEL_16:
      _os_log_impl(&dword_223BD6000, v17, v18, v15, v16, 2u);
    }
  }
LABEL_24:
}

- (void)_xpcConnectionSendEvent:(id)a3
{
  xpcConnection = self->_xpcConnection;
  if (xpcConnection)
  {
    xpc_connection_send_message(xpcConnection, a3);
  }
  else
  {
    id v4 = DSLogObjectForCategory_DSXPCConnection();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_223BD6000, v4, OS_LOG_TYPE_ERROR, "Send reply error: no connection", v5, 2u);
    }
  }
}

- (void)_checkEntitlement:(const char *)a3 error:(id *)a4
{
  v16[1] = *MEMORY[0x263EF8340];
  *(void *)&long long v7 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v13 = v7;
  long long v14 = v7;
  xpc_connection_get_audit_token();
  os_log_type_t v8 = (void *)xpc_copy_entitlement_for_token();
  uint32_t v9 = v8;
  if (v8 && xpc_dictionary_get_BOOL(v8, a3))
  {
    if (!strcmp(a3, "com.apple.distributedsensingd-kappa"))
    {
      self->_isEntitledForKappa = 1;
    }
    else if (!strcmp(a3, "com.apple.distributedsensingd-motionState"))
    {
      self->_isEntitledForMotion = 1;
    }
  }
  else
  {
    uint32_t v10 = (void *)MEMORY[0x263F087E8];
    uint64_t v15 = *MEMORY[0x263F08320];
    v16[0] = @"Entitlement Missing";
    id v11 = objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v16, &v15, 1, v13, v14);
    id v12 = [v10 errorWithDomain:@"DSErrorDomain" code:3 userInfo:v11];

    if (a4) {
      *a4 = v12;
    }
  }
}

- (void)_activateKappaSessionMessage:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __48__DSXPCConnection__activateKappaSessionMessage___block_invoke;
  v22[3] = &unk_2646D5260;
  v22[4] = self;
  v5 = (void *)MEMORY[0x223CBE3A0](v22);
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __48__DSXPCConnection__activateKappaSessionMessage___block_invoke_2;
  v21[3] = &unk_2646D5260;
  v21[4] = self;
  id v6 = (void *)MEMORY[0x223CBE3A0](v21);
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __48__DSXPCConnection__activateKappaSessionMessage___block_invoke_3;
  v20[3] = &unk_2646D5260;
  v20[4] = self;
  long long v7 = (void *)MEMORY[0x223CBE3A0](v20);
  id v19 = 0;
  [(DSXPCConnection *)self _checkEntitlement:"com.apple.distributedsensingd-kappa" error:&v19];
  id v8 = v19;
  if (self->_isEntitledForKappa)
  {
    id v18 = v8;
    uint32_t v9 = [[DSKappaSession alloc] initWithXPCObject:v4 error:&v18];
    id v10 = v18;

    if (v9)
    {
      [(DSKappaSession *)v9 setDeviceFoundHandler:v5];
      [(DSKappaSession *)v9 setDeviceLostHandler:v6];
      [(DSKappaSession *)v9 setDeviceChangedHandler:v7];
      objc_storeStrong((id *)&self->_kappaSession, v9);
      uint64_t v11 = [(DSKappaSession *)v9 coordinationStatus];
      id v12 = [(DSXPCServer *)self->_xpcDaemonServer myDeviceContext];
      [v12 setCoordinationStatus:v11];

      uint64_t v13 = [(DSKappaSession *)v9 tiebreaker];
      long long v14 = [(DSXPCServer *)self->_xpcDaemonServer myDeviceContext];
      [v14 setTiebreaker:v13];

      [(DSXPCServer *)self->_xpcDaemonServer updateAdvertiser];
      [(DSXPCServer *)self->_xpcDaemonServer updateScanner];
    }
    else
    {
      v16 = DSLogObjectForCategory_DSXPCConnection();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        int pid = self->_pid;
        *(_DWORD *)buf = 67109120;
        LODWORD(v24) = pid;
        _os_log_impl(&dword_223BD6000, v16, OS_LOG_TYPE_ERROR, "Error creating Kappa Session for pid %d", buf, 8u);
      }

      uint32_t v9 = 0;
    }
    id v8 = v10;
  }
  else
  {
    uint64_t v15 = DSLogObjectForCategory_DSXPCConnection();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      __int16 v24 = "com.apple.distributedsensingd-kappa";
      _os_log_impl(&dword_223BD6000, v15, OS_LOG_TYPE_DEFAULT, "Missing entitlement :%s", buf, 0xCu);
    }

    uint32_t v9 = 0;
  }
  [(DSXPCConnection *)self _xpcSendReplyForMessage:v4 error:v8];
}

uint64_t __48__DSXPCConnection__activateKappaSessionMessage___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _deviceFoundHandler:a2];
}

uint64_t __48__DSXPCConnection__activateKappaSessionMessage___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _deviceLostHandler:a2];
}

uint64_t __48__DSXPCConnection__activateKappaSessionMessage___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _deviceChangedHandler:a2];
}

- (void)_updateCoordinationStatusMessage:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!self->_isEntitledForKappa)
  {
    p_super = DSLogObjectForCategory_DSXPCConnection();
    if (!os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_4;
    }
    int v14 = 136315138;
    uint64_t v15 = "com.apple.distributedsensingd-kappa";
    uint32_t v9 = "Missing entitlement :%s";
    id v10 = p_super;
    os_log_type_t v11 = OS_LOG_TYPE_DEFAULT;
    uint32_t v12 = 12;
LABEL_9:
    _os_log_impl(&dword_223BD6000, v10, v11, v9, (uint8_t *)&v14, v12);
    goto LABEL_4;
  }
  v5 = [[DSKappaSession alloc] initWithXPCObject:v4 error:0];
  if (!v5)
  {
    p_super = DSLogObjectForCategory_DSXPCConnection();
    if (!os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR)) {
      goto LABEL_4;
    }
    int pid = self->_pid;
    int v14 = 67109120;
    LODWORD(v15) = pid;
    uint32_t v9 = "Error creating Kappa Session for pid %d";
    id v10 = p_super;
    os_log_type_t v11 = OS_LOG_TYPE_ERROR;
    uint32_t v12 = 8;
    goto LABEL_9;
  }
  p_super = &v5->super;
  [(DSKappaSession *)self->_kappaSession setCoordinationStatus:[(DSKappaSession *)v5 coordinationStatus]];
  uint64_t v7 = [p_super coordinationStatus];
  id v8 = [(DSXPCServer *)self->_xpcDaemonServer myDeviceContext];
  [v8 setCoordinationStatus:v7];

  [(DSXPCServer *)self->_xpcDaemonServer updateAdvertiser];
LABEL_4:
}

- (void)_activateMotionSessionMessage:(id)a3
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v40[0] = MEMORY[0x263EF8330];
  v40[1] = 3221225472;
  v40[2] = __49__DSXPCConnection__activateMotionSessionMessage___block_invoke;
  v40[3] = &unk_2646D5260;
  v40[4] = self;
  v5 = (void *)MEMORY[0x223CBE3A0](v40);
  v39[0] = MEMORY[0x263EF8330];
  v39[1] = 3221225472;
  v39[2] = __49__DSXPCConnection__activateMotionSessionMessage___block_invoke_2;
  v39[3] = &unk_2646D5260;
  v39[4] = self;
  id v6 = (void *)MEMORY[0x223CBE3A0](v39);
  v38[0] = MEMORY[0x263EF8330];
  v38[1] = 3221225472;
  v38[2] = __49__DSXPCConnection__activateMotionSessionMessage___block_invoke_3;
  v38[3] = &unk_2646D5260;
  v38[4] = self;
  uint64_t v7 = (void *)MEMORY[0x223CBE3A0](v38);
  id v37 = 0;
  [(DSXPCConnection *)self _checkEntitlement:"com.apple.distributedsensingd-motionState" error:&v37];
  id v8 = v37;
  if (self->_isEntitledForMotion)
  {
    id v36 = v8;
    uint32_t v9 = [[DSMotionSession alloc] initWithXPCObject:v4 error:&v36];
    id v10 = v36;

    if (v9)
    {
      [(DSMotionSession *)v9 setDeviceFoundHandler:v5];
      [(DSMotionSession *)v9 setDeviceLostHandler:v7];
      [(DSMotionSession *)v9 setDeviceChangedHandler:v6];
      objc_storeStrong((id *)&self->_motionSession, v9);
      uint64_t v11 = [(DSMotionSession *)v9 vehicleState];
      uint32_t v12 = [(DSXPCServer *)self->_xpcDaemonServer myDeviceContext];
      [v12 setVehicleState:v11];

      uint64_t v13 = [(DSMotionSession *)v9 vehicleConfidence];
      int v14 = [(DSXPCServer *)self->_xpcDaemonServer myDeviceContext];
      [v14 setVehicleConfidence:v13];

      [(DSXPCServer *)self->_xpcDaemonServer updateAdvertiser];
      [(DSXPCServer *)self->_xpcDaemonServer updateScanner];
    }
    else
    {
      v26 = DSLogObjectForCategory_DSXPCConnection();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        int pid = self->_pid;
        *(_DWORD *)buf = 67109120;
        LODWORD(v43) = pid;
        _os_log_impl(&dword_223BD6000, v26, OS_LOG_TYPE_ERROR, "Error creating Motion Session for pid %d", buf, 8u);
      }

      uint32_t v9 = 0;
    }
    id v8 = v10;
  }
  else
  {
    uint64_t v25 = DSLogObjectForCategory_DSXPCConnection();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v43 = "com.apple.distributedsensingd-motionState";
      _os_log_impl(&dword_223BD6000, v25, OS_LOG_TYPE_DEFAULT, "Missing entitlement :%s", buf, 0xCu);
    }

    uint32_t v9 = 0;
  }
  [(DSXPCConnection *)self _xpcSendReplyForMessage:v4 error:v8];
  if (!v8)
  {
    v28 = v7;
    v29 = v6;
    v30 = v5;
    id v31 = v4;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    uint64_t v15 = [(DSXPCServer *)self->_xpcDaemonServer cohortManager];
    uint64_t v16 = [v15 devices];

    uint64_t v17 = [v16 countByEnumeratingWithState:&v32 objects:v41 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v33;
      do
      {
        uint64_t v20 = 0;
        do
        {
          if (*(void *)v33 != v19) {
            objc_enumerationMutation(v16);
          }
          uint64_t v21 = *(void *)(*((void *)&v32 + 1) + 8 * v20);
          v22 = [(DSXPCServer *)self->_xpcDaemonServer cohortManager];
          v23 = [v22 devices];
          __int16 v24 = [v23 objectForKeyedSubscript:v21];
          [(DSXPCConnection *)self _deviceFoundHandler:v24];

          ++v20;
        }
        while (v18 != v20);
        uint64_t v18 = [v16 countByEnumeratingWithState:&v32 objects:v41 count:16];
      }
      while (v18);
    }

    v5 = v30;
    id v4 = v31;
    uint64_t v7 = v28;
    id v6 = v29;
  }
}

uint64_t __49__DSXPCConnection__activateMotionSessionMessage___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _deviceFoundHandler:a2];
}

uint64_t __49__DSXPCConnection__activateMotionSessionMessage___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _deviceChangedHandler:a2];
}

uint64_t __49__DSXPCConnection__activateMotionSessionMessage___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _deviceLostHandler:a2];
}

- (void)_updateVehicleStateMessage:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!self->_isEntitledForMotion)
  {
    p_super = DSLogObjectForCategory_DSXPCConnection();
    if (!os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_4;
    }
    int v16 = 136315138;
    uint64_t v17 = "com.apple.distributedsensingd-motionState";
    uint64_t v11 = "Missing entitlement :%s";
    uint32_t v12 = p_super;
    os_log_type_t v13 = OS_LOG_TYPE_DEFAULT;
    uint32_t v14 = 12;
LABEL_9:
    _os_log_impl(&dword_223BD6000, v12, v13, v11, (uint8_t *)&v16, v14);
    goto LABEL_4;
  }
  v5 = [[DSMotionSession alloc] initWithXPCObject:v4 error:0];
  if (!v5)
  {
    p_super = DSLogObjectForCategory_DSXPCConnection();
    if (!os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR)) {
      goto LABEL_4;
    }
    int pid = self->_pid;
    int v16 = 67109120;
    LODWORD(v17) = pid;
    uint64_t v11 = "Error creating Motion Session for pid %d";
    uint32_t v12 = p_super;
    os_log_type_t v13 = OS_LOG_TYPE_ERROR;
    uint32_t v14 = 8;
    goto LABEL_9;
  }
  p_super = &v5->super;
  uint64_t v7 = [(DSMotionSession *)v5 vehicleState];
  id v8 = [(DSXPCServer *)self->_xpcDaemonServer myDeviceContext];
  [v8 setVehicleState:v7];

  uint64_t v9 = [p_super vehicleConfidence];
  id v10 = [(DSXPCServer *)self->_xpcDaemonServer myDeviceContext];
  [v10 setVehicleConfidence:v9];

  [(DSXPCServer *)self->_xpcDaemonServer updateAdvertiser];
LABEL_4:
}

- (void)_printCohortMessage:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (onceTokenDSXPCConnection != -1) {
    dispatch_once(&onceTokenDSXPCConnection, &__block_literal_global_7);
  }
  v5 = logObjDSXPCConnection;
  if (os_log_type_enabled((os_log_t)logObjDSXPCConnection, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v7) = 0;
    _os_log_impl(&dword_223BD6000, v5, OS_LOG_TYPE_DEFAULT, "print cohort message", (uint8_t *)&v7, 2u);
  }
  if (self->_isEntitledForMotion)
  {
    id v6 = [(DSXPCServer *)self->_xpcDaemonServer cohortManager];
    [v6 printConsensusData];
  }
  else
  {
    id v6 = DSLogObjectForCategory_DSXPCConnection();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315138;
      id v8 = "com.apple.distributedsensingd-motionState";
      _os_log_impl(&dword_223BD6000, v6, OS_LOG_TYPE_DEFAULT, "Missing entitlement :%s", (uint8_t *)&v7, 0xCu);
    }
  }
}

- (void)_xpcCohortDeviceMessage:(id)a3 type:(const char *)a4
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (onceTokenDSXPCConnection != -1) {
    dispatch_once(&onceTokenDSXPCConnection, &__block_literal_global_7);
  }
  int v7 = logObjDSXPCConnection;
  if (os_log_type_enabled((os_log_t)logObjDSXPCConnection, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315138;
    id v10 = a4;
    _os_log_impl(&dword_223BD6000, v7, OS_LOG_TYPE_DEFAULT, "xpc send message: %s", (uint8_t *)&v9, 0xCu);
  }
  xpc_object_t v8 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v8, "kDSXPCMsg", a4);
  [v6 encodeSelf:v8];
  [(DSXPCConnection *)self _xpcConnectionSendEvent:v8];
}

- (void)_deviceFoundHandler:(id)a3
{
  id v4 = a3;
  v5 = [v4 identifier];
  if (v5)
  {
    deviceDictionary = self->_deviceDictionary;
    if (!deviceDictionary)
    {
      int v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
      xpc_object_t v8 = self->_deviceDictionary;
      self->_deviceDictionary = v7;

      deviceDictionary = self->_deviceDictionary;
    }
    [(NSMutableDictionary *)deviceDictionary setObject:v4 forKeyedSubscript:v5];
    [(DSXPCConnection *)self _xpcCohortDeviceMessage:v4 type:"kDSXPCDeviceFound"];
  }
  else
  {
    if (onceTokenDSXPCConnection != -1) {
      dispatch_once(&onceTokenDSXPCConnection, &__block_literal_global_7);
    }
    int v9 = logObjDSXPCConnection;
    if (os_log_type_enabled((os_log_t)logObjDSXPCConnection, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl(&dword_223BD6000, v9, OS_LOG_TYPE_ERROR, "missing identifier in Device Found", v10, 2u);
    }
  }
}

- (void)_deviceChangedHandler:(id)a3
{
  id v4 = a3;
  v5 = [v4 identifier];
  if (v5)
  {
    id v6 = [(NSMutableDictionary *)self->_deviceDictionary objectForKeyedSubscript:v5];

    deviceDictionary = self->_deviceDictionary;
    if (v6)
    {
      [(NSMutableDictionary *)deviceDictionary setObject:v4 forKeyedSubscript:v5];
      xpc_object_t v8 = "kDSXPCDeviceChanged";
    }
    else
    {
      if (!deviceDictionary)
      {
        id v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
        uint64_t v11 = self->_deviceDictionary;
        self->_deviceDictionary = v10;

        deviceDictionary = self->_deviceDictionary;
      }
      [(NSMutableDictionary *)deviceDictionary setObject:v4 forKeyedSubscript:v5];
      xpc_object_t v8 = "kDSXPCDeviceFound";
    }
    [(DSXPCConnection *)self _xpcCohortDeviceMessage:v4 type:v8];
  }
  else
  {
    if (onceTokenDSXPCConnection != -1) {
      dispatch_once(&onceTokenDSXPCConnection, &__block_literal_global_7);
    }
    int v9 = logObjDSXPCConnection;
    if (os_log_type_enabled((os_log_t)logObjDSXPCConnection, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint32_t v12 = 0;
      _os_log_impl(&dword_223BD6000, v9, OS_LOG_TYPE_ERROR, "missing identifier in Device Changed", v12, 2u);
    }
  }
}

- (void)_deviceLostHandler:(id)a3
{
  id v4 = a3;
  v5 = [v4 identifier];
  if (v5)
  {
    id v6 = [(NSMutableDictionary *)self->_deviceDictionary objectForKeyedSubscript:v5];

    if (v6)
    {
      [(NSMutableDictionary *)self->_deviceDictionary setObject:0 forKeyedSubscript:v5];
      [(DSXPCConnection *)self _xpcCohortDeviceMessage:v4 type:"kDSXPCDeviceLost"];
    }
  }
  else
  {
    if (onceTokenDSXPCConnection != -1) {
      dispatch_once(&onceTokenDSXPCConnection, &__block_literal_global_7);
    }
    int v7 = logObjDSXPCConnection;
    if (os_log_type_enabled((os_log_t)logObjDSXPCConnection, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)xpc_object_t v8 = 0;
      _os_log_impl(&dword_223BD6000, v7, OS_LOG_TYPE_ERROR, "missing identifier in Device Lost", v8, 2u);
    }
  }
}

- (DSXPCServer)xpcDaemonServer
{
  return self->_xpcDaemonServer;
}

- (void)setXpcDaemonServer:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (OS_xpc_object)xpcConnection
{
  return self->_xpcConnection;
}

- (void)setXpcConnection:(id)a3
{
}

- (DSKappaSession)kappaSession
{
  return self->_kappaSession;
}

- (void)setKappaSession:(id)a3
{
}

- (DSMotionSession)motionSession
{
  return self->_motionSession;
}

- (void)setMotionSession:(id)a3
{
}

- (int)pid
{
  return self->_pid;
}

- (void)setPid:(int)a3
{
  self->_int pid = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_motionSession, 0);
  objc_storeStrong((id *)&self->_kappaSession, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_xpcDaemonServer, 0);
  objc_storeStrong((id *)&self->_deviceDictionary, 0);
}

@end
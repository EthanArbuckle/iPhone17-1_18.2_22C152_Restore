@interface DRSClientConnectionState
- (BOOL)hasAdminEntitlement;
- (DRSClientConnectionState)initWithConnection:(id)a3 service:(id)a4;
- (NSString)procName;
- (NSString)stateDescription;
- (int)pid;
- (void)dealloc;
@end

@implementation DRSClientConnectionState

- (DRSClientConnectionState)initWithConnection:(id)a3 service:(id)a4
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  v6 = (_xpc_connection_s *)a3;
  id v7 = a4;
  v29.receiver = self;
  v29.super_class = (Class)DRSClientConnectionState;
  v8 = [(DRSClientConnectionState *)&v29 init];
  if (v8)
  {
    pid_t pid = xpc_connection_get_pid(v6);
    v8->_pid_t pid = pid;
    uint64_t v10 = DRSPidToProcessName(pid);
    procName = v8->_procName;
    v8->_procName = (NSString *)v10;

    uint64_t v12 = xpc_connection_copy_entitlement_value();
    v13 = (void *)v12;
    if (v12) {
      LOBYTE(v12) = MEMORY[0x21050E4F0](v12) == MEMORY[0x263EF86E0] && xpc_BOOL_get_value(v13);
    }
    v8->_hasAdminEntitlement = v12;
    v14 = DPLogHandle_ServiceLifecycle();
    if (os_signpost_enabled(v14))
    {
      v15 = [(DRSClientConnectionState *)v8 stateDescription];
      BOOL v16 = [(DRSClientConnectionState *)v8 hasAdminEntitlement];
      v17 = @"does not have";
      if (v16) {
        v17 = @"has";
      }
      *(_DWORD *)buf = 138543618;
      v31 = v15;
      __int16 v32 = 2114;
      v33 = v17;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v14, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ConnectionAdminEntitlementSetting", "%{public}@ connection %{public}@ the admin entitlement", buf, 0x16u);
    }
    uint64_t v23 = MEMORY[0x263EF8330];
    uint64_t v24 = 3221225472;
    v25 = __55__DRSClientConnectionState_initWithConnection_service___block_invoke;
    v26 = &unk_263FC9940;
    v27 = v8;
    id v18 = v7;
    id v28 = v18;
    xpc_connection_set_event_handler(v6, &v23);
    v19 = objc_msgSend(v18, "messageQueue", v23, v24, v25, v26);
    xpc_connection_set_target_queue(v6, v19);

    xpc_connection_activate(v6);
  }
  v20 = DPLogHandle_ServiceLifecycle();
  if (os_signpost_enabled(v20))
  {
    v21 = [(DRSClientConnectionState *)v8 stateDescription];
    *(_DWORD *)buf = 138543362;
    v31 = v21;
    _os_signpost_emit_with_name_impl(&dword_209E70000, v20, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "NewClientConnection", "Received client connection from %{public}@", buf, 0xCu);
  }
  return v8;
}

void __55__DRSClientConnectionState_initWithConnection_service___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = v3;
  if (v3 == (id)MEMORY[0x263EF86A8])
  {
    id v7 = DPLogHandle_ServiceLifecycle();
    if (os_signpost_enabled(v7))
    {
      v8 = [*(id *)(a1 + 32) stateDescription];
      int v11 = 138543362;
      uint64_t v12 = v8;
      v9 = "ConnectionInvalidation";
      uint64_t v10 = "%{public}@ connection invalidated";
LABEL_12:
      _os_signpost_emit_with_name_impl(&dword_209E70000, v7, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v9, v10, (uint8_t *)&v11, 0xCu);
    }
LABEL_13:

    goto LABEL_14;
  }
  if (v3 == (id)MEMORY[0x263EF86A0])
  {
    id v7 = DPLogHandle_ServiceLifecycle();
    if (os_signpost_enabled(v7))
    {
      v8 = [*(id *)(a1 + 32) stateDescription];
      int v11 = 138543362;
      uint64_t v12 = v8;
      v9 = "ConnectionInterrupted";
      uint64_t v10 = "%{public}@ connection interrupted";
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  if (MEMORY[0x21050E4F0](v3) == MEMORY[0x263EF8708])
  {
    [*(id *)(a1 + 40) handleRequest:v4 state:*(void *)(a1 + 32)];
  }
  else
  {
    v5 = (void *)MEMORY[0x21050E380](v4);
    v6 = DPLogHandle_ServiceLifecycle();
    if (os_signpost_enabled(v6))
    {
      int v11 = 136446210;
      uint64_t v12 = v5;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "InvalidMessageType", "Invalid message type unexpected: %{public}s", (uint8_t *)&v11, 0xCu);
    }

    if (v5) {
      free(v5);
    }
  }
LABEL_14:
}

- (void)dealloc
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = DPLogHandle_ServiceLifecycle();
  if (os_signpost_enabled(v3))
  {
    v4 = [(DRSClientConnectionState *)self stateDescription];
    *(_DWORD *)buf = 138543362;
    id v7 = v4;
    _os_signpost_emit_with_name_impl(&dword_209E70000, v3, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ConnectionStateDealloc", "Disconnecting from %{public}@", buf, 0xCu);
  }
  v5.receiver = self;
  v5.super_class = (Class)DRSClientConnectionState;
  [(DRSClientConnectionState *)&v5 dealloc];
}

- (NSString)stateDescription
{
  id v3 = [NSString alloc];
  v4 = "(admin)";
  if (!self->_hasAdminEntitlement) {
    v4 = "";
  }
  objc_super v5 = (void *)[v3 initWithFormat:@"DRSClient [%d:%@] %s", self->_pid, self->_procName, v4];

  return (NSString *)v5;
}

- (int)pid
{
  return self->_pid;
}

- (NSString)procName
{
  return self->_procName;
}

- (BOOL)hasAdminEntitlement
{
  return self->_hasAdminEntitlement;
}

- (void).cxx_destruct
{
}

@end
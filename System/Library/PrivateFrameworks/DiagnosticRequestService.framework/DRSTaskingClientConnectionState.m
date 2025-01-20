@interface DRSTaskingClientConnectionState
- (BOOL)hasAdminEntitlement;
- (BOOL)hasTeamIDEntitlement:(id)a3 connection:(id)a4;
- (DRSTaskingClientConnectionState)initWithConnection:(id)a3 service:(id)a4;
- (NSMutableDictionary)cachedEntitlements;
- (NSString)procName;
- (NSString)stateDescription;
- (int)pid;
- (void)dealloc;
@end

@implementation DRSTaskingClientConnectionState

- (DRSTaskingClientConnectionState)initWithConnection:(id)a3 service:(id)a4
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  v6 = (_xpc_connection_s *)a3;
  id v7 = a4;
  v31.receiver = self;
  v31.super_class = (Class)DRSTaskingClientConnectionState;
  v8 = [(DRSTaskingClientConnectionState *)&v31 init];
  if (v8)
  {
    pid_t pid = xpc_connection_get_pid(v6);
    v8->_pid_t pid = pid;
    uint64_t v10 = DRSPidToProcessName(pid);
    procName = v8->_procName;
    v8->_procName = (NSString *)v10;

    uint64_t v12 = [MEMORY[0x263EFF9A0] dictionary];
    cachedEntitlements = v8->_cachedEntitlements;
    v8->_cachedEntitlements = (NSMutableDictionary *)v12;

    uint64_t v14 = xpc_connection_copy_entitlement_value();
    v15 = (void *)v14;
    if (v14) {
      LOBYTE(v14) = MEMORY[0x21050E4F0](v14) == MEMORY[0x263EF86E0] && xpc_BOOL_get_value(v15);
    }
    v8->_hasAdminEntitlement = v14;
    v16 = DPLogHandle_ServiceTasking();
    if (os_signpost_enabled(v16))
    {
      v17 = [(DRSTaskingClientConnectionState *)v8 stateDescription];
      BOOL v18 = [(DRSTaskingClientConnectionState *)v8 hasAdminEntitlement];
      v19 = @"does not have";
      if (v18) {
        v19 = @"has";
      }
      *(_DWORD *)buf = 138543618;
      v33 = v17;
      __int16 v34 = 2114;
      v35 = v19;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v16, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "AdminEntitlementSetting", "%{public}@ connection %{public}@ the admin entitlement", buf, 0x16u);
    }
    uint64_t v25 = MEMORY[0x263EF8330];
    uint64_t v26 = 3221225472;
    v27 = __62__DRSTaskingClientConnectionState_initWithConnection_service___block_invoke;
    v28 = &unk_263FC9940;
    v29 = v8;
    id v20 = v7;
    id v30 = v20;
    xpc_connection_set_event_handler(v6, &v25);
    v21 = objc_msgSend(v20, "messageQueue", v25, v26, v27, v28);
    xpc_connection_set_target_queue(v6, v21);

    xpc_connection_activate(v6);
  }
  v22 = DPLogHandle_ServiceTasking();
  if (os_signpost_enabled(v22))
  {
    v23 = [(DRSTaskingClientConnectionState *)v8 stateDescription];
    *(_DWORD *)buf = 138543362;
    v33 = v23;
    _os_signpost_emit_with_name_impl(&dword_209E70000, v22, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "NewClientConnection", "Received client connection from %{public}@", buf, 0xCu);
  }
  return v8;
}

void __62__DRSTaskingClientConnectionState_initWithConnection_service___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = v3;
  if (v3 == (id)MEMORY[0x263EF86A8])
  {
    v8 = DPLogHandle_ServiceTasking();
    if (!os_signpost_enabled(v8)) {
      goto LABEL_19;
    }
    v9 = [*(id *)(a1 + 32) stateDescription];
    int v12 = 138543362;
    v13 = v9;
    uint64_t v10 = "ConnectionInvalidation";
    v11 = "%{public}@ connection invalidated";
LABEL_18:
    _os_signpost_emit_with_name_impl(&dword_209E70000, v8, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v10, v11, (uint8_t *)&v12, 0xCu);

    goto LABEL_19;
  }
  if (v3 == (id)MEMORY[0x263EF86A0])
  {
    v8 = DPLogHandle_ServiceTasking();
    if (!os_signpost_enabled(v8)) {
      goto LABEL_19;
    }
    v9 = [*(id *)(a1 + 32) stateDescription];
    int v12 = 138543362;
    v13 = v9;
    uint64_t v10 = "ConnectionInterrupted";
    v11 = "%{public}@ connection interrupted";
    goto LABEL_18;
  }
  if (v3 == (id)MEMORY[0x263EF86C0])
  {
    v8 = DPLogHandle_ServiceTasking();
    if (!os_signpost_enabled(v8)) {
      goto LABEL_19;
    }
    v9 = [*(id *)(a1 + 32) stateDescription];
    int v12 = 138543362;
    v13 = v9;
    uint64_t v10 = "TerminationImminent";
    v11 = "%{public}@ termination imminent";
    goto LABEL_18;
  }
  if (v3 == (id)MEMORY[0x263EF86B8])
  {
    v8 = DPLogHandle_ServiceTasking();
    if (os_signpost_enabled(v8))
    {
      v9 = [*(id *)(a1 + 32) stateDescription];
      int v12 = 138543362;
      v13 = v9;
      uint64_t v10 = "CodeSigningRequirementsNotMet";
      v11 = "%{public}@ connection doesn't meet code signing requirements";
      goto LABEL_18;
    }
LABEL_19:

    goto LABEL_20;
  }
  if (MEMORY[0x21050E4F0](v3) == MEMORY[0x263EF8708])
  {
    [*(id *)(a1 + 40) handleRequest:v4 state:*(void *)(a1 + 32)];
  }
  else
  {
    v5 = (void *)MEMORY[0x21050E380](v4);
    v6 = DPLogHandle_ServiceTasking();
    if (os_signpost_enabled(v6))
    {
      id v7 = [*(id *)(a1 + 32) stateDescription];
      int v12 = 138543618;
      v13 = v7;
      __int16 v14 = 2082;
      v15 = v5;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "UnexpectedMessageType", "%{public}@ message type unexpected: %{public}s", (uint8_t *)&v12, 0x16u);
    }
    if (v5) {
      free(v5);
    }
  }
LABEL_20:
}

- (void)dealloc
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = DPLogHandle_ServiceTasking();
  if (os_signpost_enabled(v3))
  {
    v4 = [(DRSTaskingClientConnectionState *)self stateDescription];
    *(_DWORD *)buf = 138543362;
    id v7 = v4;
    _os_signpost_emit_with_name_impl(&dword_209E70000, v3, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ConnectionStateDealloc", "Disconnecting from %{public}@", buf, 0xCu);
  }
  v5.receiver = self;
  v5.super_class = (Class)DRSTaskingClientConnectionState;
  [(DRSTaskingClientConnectionState *)&v5 dealloc];
}

- (BOOL)hasTeamIDEntitlement:(id)a3 connection:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(DRSTaskingClientConnectionState *)self cachedEntitlements];
  v9 = [v8 objectForKeyedSubscript:v6];

  if (v9)
  {
    LOBYTE(v10) = [v9 BOOLValue];
  }
  else
  {
    id v11 = [NSString stringWithFormat:@"com.apple.diagnosticpipeline.tasking.%@", v6];
    [v11 UTF8String];
    uint64_t v12 = xpc_connection_copy_entitlement_value();
    v13 = (void *)v12;
    uint64_t v10 = v12 && MEMORY[0x21050E4F0](v12) == MEMORY[0x263EF86E0] && xpc_BOOL_get_value(v13);
    __int16 v14 = DPLogHandle_ServiceTasking();
    if (os_signpost_enabled(v14))
    {
      v15 = [(DRSTaskingClientConnectionState *)self stateDescription];
      uint64_t v16 = "does not have";
      *(_DWORD *)buf = 138543874;
      v21 = v15;
      if (v10) {
        uint64_t v16 = "has";
      }
      __int16 v22 = 2082;
      v23 = v16;
      __int16 v24 = 2112;
      id v25 = v11;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v14, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ConnectionStateTeamIDEntitlement", "Connection for %{public}@ %{public}s entitlement '%@'", buf, 0x20u);
    }
    v17 = [NSNumber numberWithBool:v10];
    BOOL v18 = [(DRSTaskingClientConnectionState *)self cachedEntitlements];
    [v18 setObject:v17 forKeyedSubscript:v6];
  }
  return v10;
}

- (NSString)stateDescription
{
  id v3 = [NSString alloc];
  v4 = " (admin)";
  if (!self->_hasAdminEntitlement) {
    v4 = "";
  }
  objc_super v5 = (void *)[v3 initWithFormat:@"DRSTaskingClient [%d:%@]%s", self->_pid, self->_procName, v4];

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

- (NSMutableDictionary)cachedEntitlements
{
  return self->_cachedEntitlements;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedEntitlements, 0);

  objc_storeStrong((id *)&self->_procName, 0);
}

@end
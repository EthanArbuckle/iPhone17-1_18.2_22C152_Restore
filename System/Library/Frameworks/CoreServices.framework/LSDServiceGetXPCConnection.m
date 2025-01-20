@interface LSDServiceGetXPCConnection
@end

@implementation LSDServiceGetXPCConnection

void ___LSDServiceGetXPCConnection_block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v1 = (void *)_LSDServiceGetXPCConnection::serverConnections;
  _LSDServiceGetXPCConnection::serverConnections = (uint64_t)v0;
}

id ___LSDServiceGetXPCConnection_block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    BOOL v3 = *(unsigned __int16 *)(v2 + 16) == 3;
  }
  else {
    BOOL v3 = 0;
  }
  v4 = objc_msgSend((id)__LSDefaultsGetSharedInstance(), "serviceNameForConnectionType:lightweightSystemService:", objc_msgSend(*(id *)(a1 + 48), "connectionType"), v3);
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:v4 options:*(void *)(a1 + 56)];
  if (v5)
  {
    v6 = [*(id *)(a1 + 48) XPCInterface];
    [v5 setRemoteObjectInterface:v6];

    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = ___LSDServiceGetXPCConnection_block_invoke_3;
    v15[3] = &unk_1E522D3E8;
    id v7 = v4;
    id v16 = v7;
    [v5 setInterruptionHandler:v15];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = ___LSDServiceGetXPCConnection_block_invoke_59;
    v12[3] = &unk_1E522DCE8;
    id v13 = v7;
    id v14 = *(id *)(a1 + 40);
    [v5 setInvalidationHandler:v12];
    [v5 setDelegate:objc_opt_class()];
    uint64_t v8 = *(unsigned int *)(a1 + 64);
    v9 = *(void (**)(void *, uint64_t))(a1 + 72);
    id v10 = *(id *)(a1 + 80);
    v9(v5, v8);

    [v5 resume];
  }

  return v5;
}

void ___LSDServiceGetXPCConnection_block_invoke_3(uint64_t a1)
{
  uint64_t v2 = _LSDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    ___LSDServiceGetXPCConnection_block_invoke_3_cold_1(a1, v2, v3, v4, v5, v6, v7, v8);
  }
}

void ___LSDServiceGetXPCConnection_block_invoke_59(uint64_t a1)
{
  uint64_t v2 = _LSDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    ___LSDServiceGetXPCConnection_block_invoke_59_cold_1(a1, v2, v3, v4, v5, v6, v7, v8);
  }

  os_unfair_lock_lock((os_unfair_lock_t)&_LSDServiceGetXPCConnection::serverConnectionsLock);
  [(id)_LSDServiceGetXPCConnection::serverConnections removeObjectForKey:*(void *)(a1 + 40)];
  os_unfair_lock_unlock((os_unfair_lock_t)&_LSDServiceGetXPCConnection::serverConnectionsLock);
}

void ___LSDServiceGetXPCConnection_block_invoke_3_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ___LSDServiceGetXPCConnection_block_invoke_59_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end
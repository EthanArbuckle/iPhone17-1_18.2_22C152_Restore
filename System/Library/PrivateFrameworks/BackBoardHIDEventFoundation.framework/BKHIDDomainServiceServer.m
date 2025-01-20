@interface BKHIDDomainServiceServer
- (BKHIDDomainServiceServer)initWithDelegate:(id)a3 serverTarget:(id)a4 serverProtocol:(id)a5 clientProtocol:(id)a6 serviceName:(id)a7 queue:(id)a8 log:(id)a9 entitlement:(id)a10;
- (BOOL)responsePendingForConnection:(id)a3;
- (id)connectionForPID:(int)a3;
- (id)currentConnection;
- (id)didRespondBlockForConnection:(id)a3;
- (id)remoteTargetForServiceConnection:(id)a3;
- (id)userInfoForConnection:(id)a3;
- (void)_removeConnection:(void *)a3 process:;
- (void)activate;
- (void)enumerateUserInfoWithBlock:(id)a3;
- (void)invalidate;
- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5;
- (void)setUserInfo:(id)a3 forConnection:(id)a4;
@end

@implementation BKHIDDomainServiceServer

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = [v6 remoteProcess];
  int v8 = [v7 pid];
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)block = 138543618;
    *(void *)&block[4] = v6;
    *(_WORD *)&block[12] = 1024;
    *(_DWORD *)&block[14] = v8;
    _os_log_debug_impl(&dword_1CFDE2000, log, OS_LOG_TYPE_DEBUG, "got a connection! -- %{public}@ pid:%d", block, 0x12u);
  }
  if (v8 <= 0)
  {
    v20 = self->_log;
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
LABEL_17:
      [v6 invalidate];
      goto LABEL_23;
    }
    *(_DWORD *)block = 67109378;
    *(_DWORD *)&block[4] = v8;
    *(_WORD *)&block[8] = 2114;
    *(void *)&block[10] = v6;
    v21 = "dropping connection with junk pid (%d) -- %{public}@, ";
    v22 = v20;
    uint32_t v23 = 18;
LABEL_25:
    _os_log_error_impl(&dword_1CFDE2000, v22, OS_LOG_TYPE_ERROR, v21, block, v23);
    goto LABEL_17;
  }
  if (self->_entitlement && !objc_msgSend(v7, "hasEntitlement:"))
  {
    v24 = self->_log;
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      goto LABEL_17;
    }
    entitlement = self->_entitlement;
    *(_DWORD *)block = 138543618;
    *(void *)&block[4] = v7;
    *(_WORD *)&block[12] = 2114;
    *(void *)&block[14] = entitlement;
    v21 = "cannot connect to '%{public}@': missing entitlement %{public}@";
    v22 = v24;
    uint32_t v23 = 22;
    goto LABEL_25;
  }
  uint64_t v28 = MEMORY[0x1E4F143A8];
  uint64_t v29 = 3221225472;
  v30 = __70__BKHIDDomainServiceServer_listener_didReceiveConnection_withContext___block_invoke;
  v31 = &unk_1E6870BD0;
  v32 = self;
  id v10 = v7;
  id v33 = v10;
  [v6 configureConnection:&v28];
  objc_msgSend(v6, "activate", v28, v29, v30, v31, v32);
  id v11 = v6;
  id v12 = v10;
  int v13 = [v12 pid];
  v14 = self->_log;
  if (v13 < 1)
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)block = 138543362;
      *(void *)&block[4] = v11;
      _os_log_error_impl(&dword_1CFDE2000, v14, OS_LOG_TYPE_ERROR, "cannot get remote process for connection %{public}@", block, 0xCu);
    }
    [v11 invalidate];
  }
  else
  {
    unsigned int v15 = v13;
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG))
    {
      v25 = v14;
      v26 = [v11 remoteTarget];
      *(_DWORD *)block = 67109378;
      *(_DWORD *)&block[4] = v15;
      *(_WORD *)&block[8] = 2114;
      *(void *)&block[10] = v26;
      _os_log_debug_impl(&dword_1CFDE2000, v25, OS_LOG_TYPE_DEBUG, "pid:%d remote target: %{public}@", block, 0x12u);
    }
    os_unfair_lock_lock(&self->_lock);
    lock_connectionsByPID = self->_lock_connectionsByPID;
    if (!lock_connectionsByPID)
    {
      v17 = (BSMutableIntegerMap *)objc_alloc_init(MEMORY[0x1E4F4F788]);
      v18 = self->_lock_connectionsByPID;
      self->_lock_connectionsByPID = v17;

      lock_connectionsByPID = self->_lock_connectionsByPID;
    }
    [(BSMutableIntegerMap *)lock_connectionsByPID setObject:v11 forKey:v15];
    os_unfair_lock_unlock(&self->_lock);
    if (objc_opt_respondsToSelector())
    {
      queue = self->_queue;
      if (queue)
      {
        *(void *)block = MEMORY[0x1E4F143A8];
        *(void *)&block[8] = 3221225472;
        *(void *)&block[16] = __51__BKHIDDomainServiceServer__addConnection_process___block_invoke;
        v35 = &unk_1E6871848;
        v36 = self;
        id v37 = v11;
        id v38 = v12;
        dispatch_sync(queue, block);
      }
      else
      {
        [(BKHIDDomainServiceDelegate *)self->_delegate connectionDidBegin:v11 process:v12];
      }
    }
  }

LABEL_23:
}

- (void)setUserInfo:(id)a3 forConnection:(id)a4
{
  id v14 = a3;
  p_lock = &self->_lock;
  id v8 = a4;
  os_unfair_lock_lock(p_lock);
  v9 = [v8 userInfo];

  uint64_t v10 = objc_opt_class();
  id v11 = v9;
  if (v10)
  {
    if (objc_opt_isKindOfClass()) {
      id v12 = v11;
    }
    else {
      id v12 = 0;
    }
  }
  else
  {
    id v12 = 0;
  }
  int v13 = v12;

  if (v13) {
    objc_storeStrong(v13 + 2, a3);
  }
  os_unfair_lock_unlock(p_lock);
}

- (id)currentConnection
{
  return (id)[MEMORY[0x1E4F50BA0] currentContext];
}

void __70__BKHIDDomainServiceServer_listener_didReceiveConnection_withContext___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [MEMORY[0x1E4F50BE0] userInitiated];
  [v3 setServiceQuality:v4];

  [v3 setInterface:*(void *)(*(void *)(a1 + 32) + 24)];
  [v3 setInterfaceTarget:*(void *)(*(void *)(a1 + 32) + 32)];
  if (*(void *)(*(void *)(a1 + 32) + 40)) {
    objc_msgSend(v3, "setTargetQueue:");
  }
  v5 = objc_alloc_init(_BKHIDDomainClientRecord);
  [v3 setUserInfo:v5];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __70__BKHIDDomainServiceServer_listener_didReceiveConnection_withContext___block_invoke_2;
  v10[3] = &unk_1E6870BA8;
  id v6 = *(void **)(a1 + 40);
  v10[4] = *(void *)(a1 + 32);
  id v11 = v6;
  [v3 setInterruptionHandler:v10];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __70__BKHIDDomainServiceServer_listener_didReceiveConnection_withContext___block_invoke_18;
  v8[3] = &unk_1E6870BA8;
  v7 = *(void **)(a1 + 40);
  v8[4] = *(void *)(a1 + 32);
  id v9 = v7;
  [v3 setInvalidationHandler:v8];
}

void __55__BKHIDDomainServiceServer_enumerateUserInfoWithBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v9 = a3;
  v4 = [v9 userInfo];
  uint64_t v5 = objc_opt_class();
  id v6 = v4;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      v7 = v6;
    }
    else {
      v7 = 0;
    }
  }
  else
  {
    v7 = 0;
  }
  id v8 = v7;

  if (v8) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (id)userInfoForConnection:(id)a3
{
  p_lock = &self->_lock;
  id v4 = a3;
  os_unfair_lock_lock(p_lock);
  uint64_t v5 = [v4 userInfo];

  uint64_t v6 = objc_opt_class();
  id v7 = v5;
  if (v6)
  {
    if (objc_opt_isKindOfClass()) {
      id v8 = v7;
    }
    else {
      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }
  id v9 = v8;

  if (v9) {
    uint64_t v10 = (void *)v9[2];
  }
  else {
    uint64_t v10 = 0;
  }
  id v11 = v10;
  os_unfair_lock_unlock(p_lock);

  return v11;
}

- (id)connectionForPID:(int)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v6 = [(BSMutableIntegerMap *)self->_lock_connectionsByPID objectForKey:a3];
  os_unfair_lock_unlock(p_lock);

  return v6;
}

- (id)remoteTargetForServiceConnection:(id)a3
{
  return (id)[a3 remoteTarget];
}

- (void)enumerateUserInfoWithBlock:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v6 = (void *)[(BSMutableIntegerMap *)self->_lock_connectionsByPID copy];
  os_unfair_lock_unlock(p_lock);
  if (v6)
  {
    id v7 = v4;
    BSIntegerMapEnumerateWithBlock();
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_connectionsByPID, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_entitlement, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_serviceTarget, 0);
  objc_storeStrong((id *)&self->_interface, 0);
  objc_storeStrong((id *)&self->_delegate, 0);

  objc_storeStrong((id *)&self->_connectionListener, 0);
}

uint64_t __51__BKHIDDomainServiceServer__addConnection_process___block_invoke(void *a1)
{
  return [*(id *)(a1[4] + 16) connectionDidBegin:a1[5] process:a1[6]];
}

void __70__BKHIDDomainServiceServer_listener_didReceiveConnection_withContext___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(NSObject **)(v4 + 48);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    uint64_t v6 = *(void *)(a1 + 40);
    int v7 = 138543362;
    uint64_t v8 = v6;
    _os_log_error_impl(&dword_1CFDE2000, v5, OS_LOG_TYPE_ERROR, "interrupted connection %{public}@", (uint8_t *)&v7, 0xCu);
    uint64_t v4 = *(void *)(a1 + 32);
  }
  -[BKHIDDomainServiceServer _removeConnection:process:](v4, v3, *(void **)(a1 + 40));
}

void __70__BKHIDDomainServiceServer_listener_didReceiveConnection_withContext___block_invoke_18(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(NSObject **)(v4 + 48);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    uint64_t v6 = *(void *)(a1 + 40);
    int v7 = 138543362;
    uint64_t v8 = v6;
    _os_log_error_impl(&dword_1CFDE2000, v5, OS_LOG_TYPE_ERROR, "invalidated connection %{public}@", (uint8_t *)&v7, 0xCu);
    uint64_t v4 = *(void *)(a1 + 32);
  }
  -[BKHIDDomainServiceServer _removeConnection:process:](v4, v3, *(void **)(a1 + 40));
}

- (void)_removeConnection:(void *)a3 process:
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    int v7 = [v6 pid];
    uint64_t v8 = *(NSObject **)(a1 + 48);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v9 = v8;
      uint64_t v10 = [v5 remoteTarget];
      v11[0] = 67109378;
      v11[1] = v7;
      __int16 v12 = 2114;
      int v13 = v10;
      _os_log_debug_impl(&dword_1CFDE2000, v9, OS_LOG_TYPE_DEBUG, "removing connection pid:%d remote target: %{public}@", (uint8_t *)v11, 0x12u);
    }
    objc_msgSend(*(id *)(a1 + 72), "removeObjectForKey:", (int)objc_msgSend(v6, "pid"));
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
    if (objc_opt_respondsToSelector()) {
      [*(id *)(a1 + 16) connectionDidTerminate:v5 process:v6];
    }
  }
}

- (id)didRespondBlockForConnection:(id)a3
{
  id v3 = [a3 userInfo];
  uint64_t v4 = objc_opt_class();
  id v5 = v3;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }
  int v7 = v6;

  if (v7) {
    v7[8] = 1;
  }
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __57__BKHIDDomainServiceServer_didRespondBlockForConnection___block_invoke;
  v12[3] = &unk_1E68713E0;
  id v13 = v7;
  uint64_t v8 = v7;
  uint64_t v9 = (void *)MEMORY[0x1D25E04D0](v12);
  uint64_t v10 = (void *)MEMORY[0x1D25E04D0]();

  return v10;
}

uint64_t __57__BKHIDDomainServiceServer_didRespondBlockForConnection___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (v1) {
    *(unsigned char *)(v1 + 8) = 0;
  }
  return result;
}

- (BOOL)responsePendingForConnection:(id)a3
{
  id v3 = [a3 userInfo];
  uint64_t v4 = objc_opt_class();
  id v5 = v3;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }
  int v7 = v6;

  if (v7) {
    BOOL v8 = v7[8] != 0;
  }
  else {
    BOOL v8 = 0;
  }

  return v8;
}

- (void)activate
{
}

- (void)invalidate
{
  if ((atomic_exchange(&self->_invalid._Value, 1u) & 1) == 0)
  {
    [(BSServiceConnectionListener *)self->_connectionListener invalidate];
    connectionListener = self->_connectionListener;
    self->_connectionListener = 0;

    delegate = self->_delegate;
    self->_delegate = 0;

    id serviceTarget = self->_serviceTarget;
    self->_id serviceTarget = 0;

    queue = self->_queue;
    self->_queue = 0;

    log = self->_log;
    self->_log = 0;
  }
}

- (BKHIDDomainServiceServer)initWithDelegate:(id)a3 serverTarget:(id)a4 serverProtocol:(id)a5 clientProtocol:(id)a6 serviceName:(id)a7 queue:(id)a8 log:(id)a9 entitlement:(id)a10
{
  id v40 = a3;
  id v39 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v38 = a8;
  id v37 = a9;
  id v20 = a10;
  v44.receiver = self;
  v44.super_class = (Class)BKHIDDomainServiceServer;
  v21 = [(BKHIDDomainServiceServer *)&v44 init];
  v22 = v21;
  if (v21)
  {
    v21->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v21->_delegate, a3);
    objc_storeStrong(&v22->_serviceTarget, a4);
    objc_storeStrong((id *)&v22->_queue, a8);
    uint64_t v23 = objc_msgSend(v19, "copy", v37, v38, v39, v40);
    serviceName = v22->_serviceName;
    v22->_serviceName = (NSString *)v23;

    objc_storeStrong((id *)&v22->_log, a9);
    uint64_t v25 = [v20 copy];
    entitlement = v22->_entitlement;
    v22->_entitlement = (NSString *)v25;

    v27 = [MEMORY[0x1E4F4F7B8] protocolForProtocol:v17];
    uint64_t v28 = [MEMORY[0x1E4F4F7B8] protocolForProtocol:v18];
    uint64_t v29 = [MEMORY[0x1E4F50B98] interfaceWithIdentifier:v19];
    [v29 setServer:v27];
    [v29 setClient:v28];
    interface = v22->_interface;
    v22->_interface = (BSServiceInterface *)v29;
    id v31 = v29;

    v32 = (void *)MEMORY[0x1E4F50BC8];
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __122__BKHIDDomainServiceServer_initWithDelegate_serverTarget_serverProtocol_clientProtocol_serviceName_queue_log_entitlement___block_invoke;
    v41[3] = &unk_1E6870B58;
    id v42 = v19;
    id v33 = v22;
    v43 = v33;
    uint64_t v34 = [v32 listenerWithConfigurator:v41];
    connectionListener = v33->_connectionListener;
    v33->_connectionListener = (BSServiceConnectionListener *)v34;
  }
  return v22;
}

void __122__BKHIDDomainServiceServer_initWithDelegate_serverTarget_serverProtocol_clientProtocol_serviceName_queue_log_entitlement___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F4F208];
  id v4 = a2;
  [v4 setDomain:v3];
  [v4 setService:*(void *)(a1 + 32)];
  [v4 setDelegate:*(void *)(a1 + 40)];
}

@end
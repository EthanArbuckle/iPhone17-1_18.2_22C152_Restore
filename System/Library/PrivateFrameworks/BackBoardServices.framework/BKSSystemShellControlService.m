@interface BKSSystemShellControlService
+ (id)sharedInstance;
- (BKSSystemShellControlService)initWithCalloutQueue:(id)a3;
- (void)_activateServerConnection;
- (void)terminateSystemShellWithJobLabel:(id)a3;
@end

@implementation BKSSystemShellControlService

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calloutQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

- (void)_activateServerConnection
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v4 = [MEMORY[0x1E4F50BB8] endpointForMachName:@"com.apple.backboard.system-app-server" service:@"Control" instance:0];
  if (v4)
  {
    v5 = [MEMORY[0x1E4F50BA0] connectionWithEndpoint:v4];
    if (v5)
    {
      v6 = v5;
      objc_storeStrong((id *)&self->_connection, v5);
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __57__BKSSystemShellControlService__activateServerConnection__block_invoke;
      v16[3] = &unk_1E5441878;
      v16[4] = self;
      [v6 configureConnection:v16];
      v7 = BKLogSystemShell();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_18AA0B000, v7, OS_LOG_TYPE_DEBUG, "activating connection to server", buf, 2u);
      }

      [v6 activate];
      v8 = BKLogSystemShell();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        v15 = [v6 remoteTarget];
        *(_DWORD *)buf = 138543362;
        v18 = v15;
        _os_log_debug_impl(&dword_18AA0B000, v8, OS_LOG_TYPE_DEBUG, "server remote target %{public}@", buf, 0xCu);
      }
      v9 = [v6 remoteTarget];

      if (!v9)
      {
        v10 = [NSString stringWithFormat:@"we must have a remote target"];
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          v11 = NSStringFromSelector(a2);
          v12 = (objc_class *)objc_opt_class();
          v13 = NSStringFromClass(v12);
          *(_DWORD *)buf = 138544642;
          v18 = v11;
          __int16 v19 = 2114;
          v20 = v13;
          __int16 v21 = 2048;
          v22 = self;
          __int16 v23 = 2114;
          v24 = @"BKSSystemShellControlService.m";
          __int16 v25 = 1024;
          int v26 = 111;
          __int16 v27 = 2114;
          v28 = v10;
          _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
        }
        [v10 UTF8String];
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x18AA2D588);
      }
    }
    else
    {
      v14 = BKLogSystemShell();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_18AA0B000, v14, OS_LOG_TYPE_ERROR, "BKSSystemShellControlService: cannot get connection for service", buf, 2u);
      }

      v6 = 0;
    }
  }
  else
  {
    v6 = BKLogSystemShell();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_18AA0B000, v6, OS_LOG_TYPE_ERROR, "BKSSystemShellControlService: cannot get endpoint for mach service", buf, 2u);
    }
  }
}

void __57__BKSSystemShellControlService__activateServerConnection__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = BKLogSystemShell();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v9 = 0;
    _os_log_debug_impl(&dword_18AA0B000, v4, OS_LOG_TYPE_DEBUG, "configured client service", v9, 2u);
  }

  v5 = [MEMORY[0x1E4F4F7B8] protocolForProtocol:&unk_1ED76FD60];
  v6 = [MEMORY[0x1E4F4F7B8] protocolForProtocol:&unk_1ED779250];
  v7 = [MEMORY[0x1E4F50B98] interfaceWithIdentifier:@"Control"];
  [v7 setServer:v6];
  [v7 setClient:v5];
  [v3 setInterface:v7];
  [v3 setInterfaceTarget:*(void *)(a1 + 32)];
  [v3 setTargetQueue:*(void *)(*(void *)(a1 + 32) + 16)];
  v8 = [MEMORY[0x1E4F50BE0] userInitiated];
  [v3 setServiceQuality:v8];

  [v3 setInterruptionHandler:&__block_literal_global_54];
  [v3 setInvalidationHandler:&__block_literal_global_57];
}

void __57__BKSSystemShellControlService__activateServerConnection__block_invoke_55()
{
  v0 = BKLogSystemShell();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v1 = 0;
    _os_log_error_impl(&dword_18AA0B000, v0, OS_LOG_TYPE_ERROR, "service invalidation", v1, 2u);
  }
}

void __57__BKSSystemShellControlService__activateServerConnection__block_invoke_51()
{
  v0 = BKLogSystemShell();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v1 = 0;
    _os_log_error_impl(&dword_18AA0B000, v0, OS_LOG_TYPE_ERROR, "service interruption", v1, 2u);
  }
}

- (void)terminateSystemShellWithJobLabel:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(BSServiceConnection *)self->_connection remoteTarget];
  v6 = BKLogSystemShell();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543618;
    id v8 = v4;
    __int16 v9 = 2114;
    v10 = v5;
    _os_log_impl(&dword_18AA0B000, v6, OS_LOG_TYPE_DEFAULT, "BKSSystemShellControlService: terminate %{public}@ with server:%{public}@", (uint8_t *)&v7, 0x16u);
  }

  [v5 terminateShellWithJobLabel:v4];
}

- (BKSSystemShellControlService)initWithCalloutQueue:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BKSSystemShellControlService;
  v6 = [(BKSSystemShellControlService *)&v9 init];
  int v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_calloutQueue, a3);
    [(BKSSystemShellControlService *)v7 _activateServerConnection];
  }

  return v7;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_943 != -1) {
    dispatch_once(&sharedInstance_onceToken_943, &__block_literal_global_944);
  }
  v2 = (void *)sharedInstance_service_945;
  return v2;
}

void __46__BKSSystemShellControlService_sharedInstance__block_invoke()
{
  v0 = [BKSSystemShellControlService alloc];
  dispatch_get_global_queue(21, 0);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = [(BKSSystemShellControlService *)v0 initWithCalloutQueue:v3];
  v2 = (void *)sharedInstance_service_945;
  sharedInstance_service_945 = v1;
}

@end
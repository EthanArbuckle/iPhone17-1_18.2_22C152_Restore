@interface BKSSystemShellService
- (BKSSystemShellService)initWithConfigurator:(id)a3;
- (BOOL)collectiveWatchdogPing;
- (BOOL)waitForDataMigration;
- (OS_dispatch_queue)calloutQueue;
- (double)idleSleepInterval;
- (id)_server;
- (id)collectiveWatchdogPingBlock;
- (void)_checkInWithServerForReason:(int)a3 waitForDataMigration:;
- (void)_setCheckInStatus:(uint64_t)a1;
- (void)_tellServerWeFinishedLaunching;
- (void)didFinishLaunching;
- (void)restartWithOptions:(unint64_t)a3;
- (void)setCalloutQueue:(id)a3;
- (void)setCollectiveWatchdogPingBlock:(id)a3;
- (void)setIdleSleepInterval:(double)a3;
- (void)setIndependentWatchdogEnabled:(BOOL)a3;
- (void)setWaitForDataMigration:(BOOL)a3;
- (void)start;
@end

@implementation BKSSystemShellService

- (void).cxx_destruct
{
  objc_storeStrong(&self->_watchdogPingBlock, 0);
  objc_storeStrong((id *)&self->_calloutQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

- (BOOL)collectiveWatchdogPing
{
  v3 = BKLogSystemShell();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18AA0B000, v3, OS_LOG_TYPE_DEFAULT, "collectiveWatchdogPing", buf, 2u);
  }

  uint64_t v4 = atomic_load((unint64_t *)&self->_checkInStatus);
  if (v4 < 2) {
    return 1;
  }
  watchdogPingBlock = (uint64_t (**)(void))self->_watchdogPingBlock;
  if (watchdogPingBlock) {
    return watchdogPingBlock[2]();
  }
  v7 = BKLogSystemShell();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v8 = 0;
    _os_log_error_impl(&dword_18AA0B000, v7, OS_LOG_TYPE_ERROR, "collectiveWatchdogPing -- did someone forgot to set a ping block?", v8, 2u);
  }

  return 0;
}

- (void)setIndependentWatchdogEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v5 = BKLogSystemShell();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109120;
    v8[1] = v3;
    _os_log_impl(&dword_18AA0B000, v5, OS_LOG_TYPE_DEFAULT, "setIndependentWatchdogEnabled: %{BOOL}u", (uint8_t *)v8, 8u);
  }

  v6 = -[BKSSystemShellService _server]((id *)&self->super.isa);
  v7 = [NSNumber numberWithBool:v3];
  [v6 setWatchdogMonitoringEnabled:v7];
}

- (id)_server
{
  if (a1)
  {
    a1 = [a1[1] remoteTarget];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)restartWithOptions:(unint64_t)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v5 = BKLogSystemShell();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = BKSRestartActionOptionsDescription(a3);
    int v9 = 138543362;
    v10 = v6;
    _os_log_impl(&dword_18AA0B000, v5, OS_LOG_TYPE_DEFAULT, "restartWithOptions: %{public}@", (uint8_t *)&v9, 0xCu);
  }
  v7 = -[BKSSystemShellService _server]((id *)&self->super.isa);
  v8 = [NSNumber numberWithUnsignedInteger:a3];
  [v7 restartWithOptions:v8];
}

- (void)didFinishLaunching
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = atomic_load((unint64_t *)&self->_checkInStatus);
  if (v4 <= 0)
  {
    v7 = [NSString stringWithFormat:@"you need to invoke -start first"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v8 = NSStringFromSelector(a2);
      int v9 = (objc_class *)objc_opt_class();
      v10 = NSStringFromClass(v9);
      int v15 = 138544642;
      v16 = v8;
      __int16 v17 = 2114;
      v18 = v10;
      __int16 v19 = 2048;
      v20 = self;
      __int16 v21 = 2114;
      v22 = @"BKSSystemShellService.m";
      __int16 v23 = 1024;
      int v24 = 141;
      __int16 v25 = 2114;
      v26 = v7;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v15, 0x3Au);
    }
    [v7 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA54DE4);
  }
  uint64_t v5 = atomic_load((unint64_t *)&self->_checkInStatus);
  if (v5 >= 3)
  {
    uint64_t v11 = [NSString stringWithFormat:@"you already invoked -didFinishLaunching"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v12 = NSStringFromSelector(a2);
      v13 = (objc_class *)objc_opt_class();
      v14 = NSStringFromClass(v13);
      int v15 = 138544642;
      v16 = v12;
      __int16 v17 = 2114;
      v18 = v14;
      __int16 v19 = 2048;
      v20 = self;
      __int16 v21 = 2114;
      v22 = @"BKSSystemShellService.m";
      __int16 v23 = 1024;
      int v24 = 142;
      __int16 v25 = 2114;
      v26 = v11;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v15, 0x3Au);
    }
    [v11 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA54ED0);
  }
  -[BKSSystemShellService _setCheckInStatus:]((uint64_t)self, 3);
  v6 = BKLogSystemShell();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v15) = 0;
    _os_log_impl(&dword_18AA0B000, v6, OS_LOG_TYPE_DEFAULT, "didFinishLaunching", (uint8_t *)&v15, 2u);
  }

  -[BKSSystemShellService _tellServerWeFinishedLaunching]((uint64_t)self);
}

- (void)_setCheckInStatus:(uint64_t)a1
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    int64_t v4 = atomic_load((unint64_t *)(a1 + 48));
    if (v4 > a2)
    {
      v8 = [NSString stringWithFormat:@"cannot go backwards"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        int v9 = NSStringFromSelector(sel__setCheckInStatus_);
        v10 = (objc_class *)objc_opt_class();
        uint64_t v11 = NSStringFromClass(v10);
        int v12 = 138544642;
        v13 = v9;
        __int16 v14 = 2114;
        int v15 = v11;
        __int16 v16 = 2048;
        uint64_t v17 = a1;
        __int16 v18 = 2114;
        __int16 v19 = @"BKSSystemShellService.m";
        __int16 v20 = 1024;
        int v21 = 227;
        __int16 v22 = 2114;
        __int16 v23 = v8;
        _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v12, 0x3Au);
      }
      [v8 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x18AA550ACLL);
    }
    unint64_t v5 = atomic_load((unint64_t *)(a1 + 48));
    if (v5 != a2)
    {
      atomic_store(a2, (unint64_t *)(a1 + 48));
      v6 = BKLogSystemShell();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v7 = NSStringFromBKSSystemShellCheckInStatus(a2);
        int v12 = 138543362;
        v13 = v7;
        _os_log_impl(&dword_18AA0B000, v6, OS_LOG_TYPE_DEFAULT, "checkin %{public}@", (uint8_t *)&v12, 0xCu);
      }
    }
  }
}

- (void)_tellServerWeFinishedLaunching
{
  if (a1)
  {
    id v1 = [*(id *)(a1 + 8) remoteTarget];
    [v1 finishedLaunching];
  }
}

- (void)start
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (atomic_load((unint64_t *)&self->_checkInStatus))
  {
    v6 = [NSString stringWithFormat:@"you already invoked -start"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v7 = NSStringFromSelector(a2);
      v8 = (objc_class *)objc_opt_class();
      int v9 = NSStringFromClass(v8);
      int v10 = 138544642;
      uint64_t v11 = v7;
      __int16 v12 = 2114;
      v13 = v9;
      __int16 v14 = 2048;
      int v15 = self;
      __int16 v16 = 2114;
      uint64_t v17 = @"BKSSystemShellService.m";
      __int16 v18 = 1024;
      int v19 = 133;
      __int16 v20 = 2114;
      int v21 = v6;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v10, 0x3Au);
    }
    [v6 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA552E0);
  }
  -[BKSSystemShellService _setCheckInStatus:]((uint64_t)self, 1);
  BOOL waitForDataMigration = self->_waitForDataMigration;
  -[BKSSystemShellService _checkInWithServerForReason:waitForDataMigration:]((uint64_t)self, @"first", waitForDataMigration);
}

- (void)_checkInWithServerForReason:(int)a3 waitForDataMigration:
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    v6 = BKLogSystemShell();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v29 = v5;
      __int16 v30 = 1024;
      LODWORD(v31) = a3;
      _os_log_impl(&dword_18AA0B000, v6, OS_LOG_TYPE_DEFAULT, "checkIn(%{public}@): (waits for migration:%{BOOL}u)", buf, 0x12u);
    }

    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __74__BKSSystemShellService__checkInWithServerForReason_waitForDataMigration___block_invoke;
    v24[3] = &unk_1E54412F0;
    id v25 = v5;
    uint64_t v26 = a1;
    v7 = (void *)MEMORY[0x18C123E70](v24);
    v8 = v7;
    if (a3)
    {
      id v9 = v7;
      int v10 = [MEMORY[0x1E4F50BB8] endpointForMachName:@"com.apple.backboard.system-app-server" service:@"DataMigrationCheckIn" instance:0];
      if (v10)
      {
        uint64_t v11 = [MEMORY[0x1E4F50BA0] connectionWithEndpoint:v10];
        if (v11)
        {
          __int16 v12 = v11;
          v27[0] = MEMORY[0x1E4F143A8];
          v27[1] = 3221225472;
          v27[2] = __57__BKSSystemShellService__checkInWaitingForDataMigration___block_invoke;
          v27[3] = &unk_1E5441878;
          v27[4] = a1;
          [v11 configureConnection:v27];
          v13 = BKLogSystemShell();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_debug_impl(&dword_18AA0B000, v13, OS_LOG_TYPE_DEBUG, "_checkInWaitingForDataMigration: activating connection to server", buf, 2u);
          }

          [v12 activate];
          __int16 v14 = BKLogSystemShell();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          {
            int v19 = [v12 remoteTarget];
            *(_DWORD *)buf = 138543362;
            id v29 = v19;
            _os_log_debug_impl(&dword_18AA0B000, v14, OS_LOG_TYPE_DEBUG, "_checkInWaitingForDataMigration: server remote target %{public}@", buf, 0xCu);
          }
          int v15 = [v12 remoteTarget];

          if (!v15)
          {
            __int16 v20 = [NSString stringWithFormat:@"we must have a remote target"];
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
            {
              int v21 = NSStringFromSelector(sel__checkInWaitingForDataMigration_);
              uint64_t v22 = (objc_class *)objc_opt_class();
              __int16 v23 = NSStringFromClass(v22);
              *(_DWORD *)buf = 138544642;
              id v29 = v21;
              __int16 v30 = 2114;
              v31 = v23;
              __int16 v32 = 2048;
              uint64_t v33 = a1;
              __int16 v34 = 2114;
              v35 = @"BKSSystemShellService.m";
              __int16 v36 = 1024;
              int v37 = 286;
              __int16 v38 = 2114;
              v39 = v20;
              _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
            }
            [v20 UTF8String];
            _bs_set_crash_log_message();
            __break(0);
            JUMPOUT(0x18AA55770);
          }
          __int16 v16 = [v12 remoteTarget];
          [v16 checkInAfterDataMigrationUsingCompletionBlock:v9];

          [v12 invalidate];
        }
        else
        {
          __int16 v18 = BKLogSystemShell();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_18AA0B000, v18, OS_LOG_TYPE_ERROR, "_checkInWaitingForDataMigration: cannot get connection for data migration checkin service", buf, 2u);
          }

          __int16 v12 = 0;
        }
      }
      else
      {
        __int16 v12 = BKLogSystemShell();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_18AA0B000, v12, OS_LOG_TYPE_ERROR, "_checkInWaitingForDataMigration: cannot get endpoint for data migration checkin service", buf, 2u);
        }
      }
    }
    else
    {
      uint64_t v17 = [*(id *)(a1 + 8) remoteTarget];
      [v17 checkInBypassingDataMigrationUsingCompletionBlock:v8];
    }
  }
}

void __74__BKSSystemShellService__checkInWithServerForReason_waitForDataMigration___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int64_t v4 = BKLogSystemShell();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v9 = 138543618;
      uint64_t v10 = v8;
      __int16 v11 = 2114;
      id v12 = v3;
      _os_log_error_impl(&dword_18AA0B000, v5, OS_LOG_TYPE_ERROR, "checkIn(%{public}@): exiting due to XPC error: %{public}@", (uint8_t *)&v9, 0x16u);
    }

    if (*(void *)(a1 + 40)) {
      exit(0);
    }
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v9 = 138543362;
      uint64_t v10 = v6;
      _os_log_impl(&dword_18AA0B000, v5, OS_LOG_TYPE_DEFAULT, "checkIn(%{public}@): complete", (uint8_t *)&v9, 0xCu);
    }

    uint64_t v7 = atomic_load((unint64_t *)(*(void *)(a1 + 40) + 48));
    if (v7 <= 1) {
      -[BKSSystemShellService _setCheckInStatus:](*(void *)(a1 + 40), 2);
    }
  }
}

void __57__BKSSystemShellService__checkInWaitingForDataMigration___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  int64_t v4 = BKLogSystemShell();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)int v9 = 0;
    _os_log_debug_impl(&dword_18AA0B000, v4, OS_LOG_TYPE_DEBUG, "_checkInWaitingForDataMigration: configured client service", v9, 2u);
  }

  id v5 = [MEMORY[0x1E4F4F7B8] protocolForProtocol:&unk_1ED779430];
  uint64_t v6 = [MEMORY[0x1E4F4F7B8] protocolForProtocol:&unk_1ED779490];
  uint64_t v7 = [MEMORY[0x1E4F50B98] interfaceWithIdentifier:@"DataMigrationCheckIn"];
  [v7 setServer:v6];
  [v7 setClient:v5];
  [v3 setInterface:v7];
  [v3 setInterfaceTarget:*(void *)(a1 + 32)];
  [v3 setTargetQueue:*(void *)(*(void *)(a1 + 32) + 16)];
  uint64_t v8 = [MEMORY[0x1E4F50BE0] userInitiated];
  [v3 setServiceQuality:v8];

  [v3 setInterruptionHandler:&__block_literal_global_97];
  [v3 setInvalidationHandler:&__block_literal_global_100_7781];
}

void __57__BKSSystemShellService__checkInWaitingForDataMigration___block_invoke_98()
{
  v0 = BKLogSystemShell();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)id v1 = 0;
    _os_log_error_impl(&dword_18AA0B000, v0, OS_LOG_TYPE_ERROR, "_checkInWaitingForDataMigration: data migration checkin service invalidated", v1, 2u);
  }
}

void __57__BKSSystemShellService__checkInWaitingForDataMigration___block_invoke_94()
{
  v0 = BKLogSystemShell();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)id v1 = 0;
    _os_log_error_impl(&dword_18AA0B000, v0, OS_LOG_TYPE_ERROR, "_checkInWaitingForDataMigration: data migration checkin service interrupted", v1, 2u);
  }
}

- (void)setCollectiveWatchdogPingBlock:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (self->_configurationFinished)
  {
    uint64_t v8 = [NSString stringWithFormat:@"cannot modify config after init"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      int v9 = NSStringFromSelector(a2);
      uint64_t v10 = (objc_class *)objc_opt_class();
      __int16 v11 = NSStringFromClass(v10);
      *(_DWORD *)buf = 138544642;
      __int16 v14 = v9;
      __int16 v15 = 2114;
      __int16 v16 = v11;
      __int16 v17 = 2048;
      __int16 v18 = self;
      __int16 v19 = 2114;
      __int16 v20 = @"BKSSystemShellService.m";
      __int16 v21 = 1024;
      int v22 = 125;
      __int16 v23 = 2114;
      uint64_t v24 = v8;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v8 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA55C78);
  }
  id v12 = v5;
  uint64_t v6 = (void *)[v5 copy];
  id watchdogPingBlock = self->_watchdogPingBlock;
  self->_id watchdogPingBlock = v6;
}

- (id)collectiveWatchdogPingBlock
{
  v2 = (void *)MEMORY[0x18C123E70](self->_watchdogPingBlock, a2);
  return v2;
}

- (void)setWaitForDataMigration:(BOOL)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (self->_configurationFinished)
  {
    id v5 = [NSString stringWithFormat:@"cannot modify config after init"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = NSStringFromSelector(a2);
      uint64_t v7 = (objc_class *)objc_opt_class();
      uint64_t v8 = NSStringFromClass(v7);
      int v9 = 138544642;
      uint64_t v10 = v6;
      __int16 v11 = 2114;
      id v12 = v8;
      __int16 v13 = 2048;
      __int16 v14 = self;
      __int16 v15 = 2114;
      __int16 v16 = @"BKSSystemShellService.m";
      __int16 v17 = 1024;
      int v18 = 116;
      __int16 v19 = 2114;
      __int16 v20 = v5;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);
    }
    [v5 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA55DFCLL);
  }
  self->_BOOL waitForDataMigration = a3;
}

- (BOOL)waitForDataMigration
{
  return self->_waitForDataMigration;
}

- (void)setIdleSleepInterval:(double)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (self->_configurationFinished)
  {
    id v5 = objc_msgSend(NSString, "stringWithFormat:", @"cannot modify config after init", a3);
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = NSStringFromSelector(a2);
      uint64_t v7 = (objc_class *)objc_opt_class();
      uint64_t v8 = NSStringFromClass(v7);
      int v9 = 138544642;
      uint64_t v10 = v6;
      __int16 v11 = 2114;
      id v12 = v8;
      __int16 v13 = 2048;
      __int16 v14 = self;
      __int16 v15 = 2114;
      __int16 v16 = @"BKSSystemShellService.m";
      __int16 v17 = 1024;
      int v18 = 107;
      __int16 v19 = 2114;
      __int16 v20 = v5;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);
    }
    [v5 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA55F5CLL);
  }
  self->_idleSleepInterval = a3;
}

- (double)idleSleepInterval
{
  return self->_idleSleepInterval;
}

- (void)setCalloutQueue:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = (OS_dispatch_queue *)a3;
  if (self->_configurationFinished)
  {
    uint64_t v7 = [NSString stringWithFormat:@"cannot modify config after init"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = NSStringFromSelector(a2);
      int v9 = (objc_class *)objc_opt_class();
      uint64_t v10 = NSStringFromClass(v9);
      int v11 = 138544642;
      id v12 = v8;
      __int16 v13 = 2114;
      __int16 v14 = v10;
      __int16 v15 = 2048;
      __int16 v16 = self;
      __int16 v17 = 2114;
      int v18 = @"BKSSystemShellService.m";
      __int16 v19 = 1024;
      int v20 = 98;
      __int16 v21 = 2114;
      int v22 = v7;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v11, 0x3Au);
    }
    [v7 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA560D4);
  }
  calloutQueue = self->_calloutQueue;
  self->_calloutQueue = v5;
  MEMORY[0x1F41817F8](v5, calloutQueue);
}

- (OS_dispatch_queue)calloutQueue
{
  return self->_calloutQueue;
}

- (BKSSystemShellService)initWithConfigurator:(id)a3
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  int64_t v4 = (void (**)(id, void))a3;
  v35.receiver = self;
  v35.super_class = (Class)BKSSystemShellService;
  id v5 = [(BKSSystemShellService *)&v35 init];
  uint64_t v6 = v5;
  if (v5)
  {
    objc_storeStrong((id *)&v5->_calloutQueue, MEMORY[0x1E4F14428]);
    v6->_BOOL waitForDataMigration = 1;
    uint64_t v7 = [&__block_literal_global_7806 copy];
    id watchdogPingBlock = v6->_watchdogPingBlock;
    v6->_id watchdogPingBlock = (id)v7;

    v6->_double idleSleepInterval = 3.0;
    ((void (**)(id, BKSSystemShellService *))v4)[2](v4, v6);
    v6->_configurationFinished = 1;
    double idleSleepInterval = v6->_idleSleepInterval;
    uint64_t v10 = BKLogSystemShell();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 134217984;
      *(double *)((char *)&buf + 4) = idleSleepInterval;
      _os_log_impl(&dword_18AA0B000, v10, OS_LOG_TYPE_DEFAULT, "activate (idle interval %g)", (uint8_t *)&buf, 0xCu);
    }

    int v11 = [MEMORY[0x1E4F28B50] mainBundle];
    id v12 = [v11 bundlePath];
    __int16 v13 = [v11 bundleIdentifier];
    __int16 v14 = [MEMORY[0x1E4F28F80] processInfo];
    __int16 v15 = objc_msgSend(v14, "bs_jobLabel");

    __int16 v16 = [MEMORY[0x1E4F50BB8] endpointForMachName:@"com.apple.backboard.system-app-server" service:@"Shell" instance:0];
    if (v16)
    {
      __int16 v17 = (void *)MEMORY[0x1E4F50BA0];
      *(void *)&long long buf = MEMORY[0x1E4F143A8];
      *((void *)&buf + 1) = 3221225472;
      v52 = __72__BKSSystemShellService__activateServerConnectionWithIdleSleepInterval___block_invoke;
      v53 = &unk_1E5441358;
      v54 = v13;
      id v55 = v12;
      id v18 = v15;
      double v58 = idleSleepInterval;
      id v56 = v18;
      v57 = v6;
      __int16 v19 = [v17 connectionWithEndpoint:v16 clientContextBuilder:&buf];
      if (v19)
      {
        objc_storeStrong((id *)&v6->_connection, v19);
        objc_initWeak(&location, v6);
        v36[0] = MEMORY[0x1E4F143A8];
        v36[1] = 3221225472;
        v36[2] = __72__BKSSystemShellService__activateServerConnectionWithIdleSleepInterval___block_invoke_110;
        v36[3] = &unk_1E5441380;
        v36[4] = v6;
        objc_copyWeak(&v37, &location);
        [v19 configureConnection:v36];
        int v20 = BKLogSystemShell();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)v39 = 0;
          _os_log_debug_impl(&dword_18AA0B000, v20, OS_LOG_TYPE_DEBUG, "activating connection to server", v39, 2u);
        }

        [v19 activate];
        __int16 v21 = BKLogSystemShell();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v27 = [v19 remoteTarget];
          *(_DWORD *)v39 = 138543362;
          uint64_t v40 = v27;
          __int16 v34 = (void *)v27;
          _os_log_debug_impl(&dword_18AA0B000, v21, OS_LOG_TYPE_DEBUG, "server remote target %{public}@", v39, 0xCu);
        }
        int v22 = [v19 remoteTarget];
        BOOL v23 = v22 == 0;

        if (v23)
        {
          v28 = [NSString stringWithFormat:@"we must have a remote target"];
          id v29 = MEMORY[0x1E4F14500];
          id v30 = MEMORY[0x1E4F14500];
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            NSStringFromSelector(sel__activateServerConnectionWithIdleSleepInterval_);
            id v31 = (id)objc_claimAutoreleasedReturnValue();
            __int16 v32 = (objc_class *)objc_opt_class();
            uint64_t v33 = NSStringFromClass(v32);
            *(_DWORD *)v39 = 138544642;
            uint64_t v40 = (uint64_t)v31;
            __int16 v41 = 2114;
            v42 = v33;
            __int16 v43 = 2048;
            v44 = v6;
            __int16 v45 = 2114;
            v46 = @"BKSSystemShellService.m";
            __int16 v47 = 1024;
            int v48 = 361;
            __int16 v49 = 2114;
            v50 = v28;
            _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v39, 0x3Au);
          }
          [v28 UTF8String];
          _bs_set_crash_log_message();
          __break(0);
          JUMPOUT(0x18AA56668);
        }
        BKSDisplayServicesStart();
        objc_destroyWeak(&v37);
        objc_destroyWeak(&location);
      }
      else
      {
        uint64_t v25 = BKLogSystemShell();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v39 = 0;
          _os_log_error_impl(&dword_18AA0B000, v25, OS_LOG_TYPE_ERROR, "cannot get connection for service", v39, 2u);
        }
      }
      uint64_t v24 = v54;
    }
    else
    {
      uint64_t v24 = BKLogSystemShell();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf) = 0;
        _os_log_error_impl(&dword_18AA0B000, v24, OS_LOG_TYPE_ERROR, "BKSSystemShellService: cannot get endpoint for mach service", (uint8_t *)&buf, 2u);
      }
    }
  }
  return v6;
}

void __72__BKSSystemShellService__activateServerConnectionWithIdleSleepInterval___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 encodeObject:v3 forKey:@"bundleID"];
  [v4 encodeObject:*(void *)(a1 + 40) forKey:@"bundlePath"];
  [v4 encodeObject:*(void *)(a1 + 48) forKey:@"jobLabel"];
  [v4 encodeDouble:@"idleInterval" forKey:*(double *)(a1 + 64)];
  [v4 encodeInt64:*(void *)(*(void *)(a1 + 56) + 40) == 0 forKey:@"watchdogType"];
}

void __72__BKSSystemShellService__activateServerConnectionWithIdleSleepInterval___block_invoke_110(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = BKLogSystemShell();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)long long buf = 0;
    _os_log_debug_impl(&dword_18AA0B000, v4, OS_LOG_TYPE_DEBUG, "configured client service", buf, 2u);
  }

  id v5 = [MEMORY[0x1E4F4F7B8] protocolForProtocol:&unk_1ED774628];
  uint64_t v6 = [MEMORY[0x1E4F4F7B8] protocolForProtocol:&unk_1ED7794F0];
  uint64_t v7 = [MEMORY[0x1E4F50B98] interfaceWithIdentifier:@"Shell"];
  [v7 setServer:v6];
  [v7 setClient:v5];
  [v3 setInterface:v7];
  [v3 setInterfaceTarget:*(void *)(a1 + 32)];
  [v3 setTargetQueue:*(void *)(*(void *)(a1 + 32) + 16)];
  uint64_t v8 = [MEMORY[0x1E4F50BE0] userInitiated];
  [v3 setServiceQuality:v8];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __72__BKSSystemShellService__activateServerConnectionWithIdleSleepInterval___block_invoke_120;
  v9[3] = &unk_1E5441830;
  objc_copyWeak(&v10, (id *)(a1 + 40));
  [v3 setInterruptionHandler:v9];
  [v3 setInvalidationHandler:&__block_literal_global_123];
  objc_destroyWeak(&v10);
}

void __72__BKSSystemShellService__activateServerConnectionWithIdleSleepInterval___block_invoke_120(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = BKLogSystemShell();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)long long buf = 0;
    _os_log_error_impl(&dword_18AA0B000, v4, OS_LOG_TYPE_ERROR, "shell service interruption -- attempting to reconnect", buf, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v6 = (unsigned __int8 *)WeakRetained;
  if (WeakRetained)
  {
    unint64_t v7 = atomic_load((unint64_t *)WeakRetained + 6);
    [v3 activate];
    uint64_t v8 = NSString;
    int v9 = NSStringFromBKSSystemShellCheckInStatus(v7);
    id v10 = [v8 stringWithFormat:@"reconnect[%@]", v9];

    int v11 = BKLogSystemShell();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138543362;
      __int16 v16 = v10;
      _os_log_impl(&dword_18AA0B000, v11, OS_LOG_TYPE_DEFAULT, "_%{public}@", buf, 0xCu);
    }

    switch(v7)
    {
      case 3uLL:
        -[BKSSystemShellService _checkInWithServerForReason:waitForDataMigration:]((uint64_t)v6, v10, 0);
        -[BKSSystemShellService _tellServerWeFinishedLaunching]((uint64_t)v6);
        break;
      case 2uLL:
        uint64_t v13 = (uint64_t)v6;
        __int16 v14 = v10;
        int v12 = 0;
        goto LABEL_12;
      case 1uLL:
        int v12 = v6[32];
        uint64_t v13 = (uint64_t)v6;
        __int16 v14 = v10;
LABEL_12:
        -[BKSSystemShellService _checkInWithServerForReason:waitForDataMigration:](v13, v14, v12);
        break;
    }
  }
}

void __72__BKSSystemShellService__activateServerConnectionWithIdleSleepInterval___block_invoke_121(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = BKLogSystemShell();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)id v4 = 0;
    _os_log_error_impl(&dword_18AA0B000, v3, OS_LOG_TYPE_ERROR, "shell service invalidation -- I'm out", v4, 2u);
  }

  exit(0);
}

uint64_t __46__BKSSystemShellService_initWithConfigurator___block_invoke()
{
  v0 = BKLogSystemShell();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v2 = 0;
    _os_log_impl(&dword_18AA0B000, v0, OS_LOG_TYPE_DEFAULT, "watchdog ping received", v2, 2u);
  }

  return 1;
}

@end
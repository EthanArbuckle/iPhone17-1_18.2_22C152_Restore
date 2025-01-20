@interface DKBackupProvider
- (ACAccount)account;
- (BOOL)isBackingUp;
- (BOOL)isBackupEnabled;
- (BOOL)isManualBackupOnCellularAllowed;
- (BOOL)isRestoring;
- (DKBackupProvider)initWithAccount:(id)a3;
- (MBManager)manager;
- (id)completionHandler;
- (id)progressHandler;
- (void)cancel;
- (void)isManualBackupOnCellularAllowed;
- (void)manager:(id)a3 didFailBackupWithError:(id)a4;
- (void)manager:(id)a3 didUpdateProgress:(float)a4 estimatedTimeRemaining:(unint64_t)a5;
- (void)managerDidFinishBackup:(id)a3;
- (void)managerDidLoseConnectionToService:(id)a3;
- (void)setAccount:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setManager:(id)a3;
- (void)setProgressHandler:(id)a3;
- (void)startBackupWithExpensiveCellularAllowed:(BOOL)a3 progressHandler:(id)a4 completionHandler:(id)a5;
@end

@implementation DKBackupProvider

- (DKBackupProvider)initWithAccount:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)DKBackupProvider;
  v6 = [(DKBackupProvider *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_account, a3);
    id v8 = objc_alloc(MEMORY[0x263F559D8]);
    v9 = [v5 personaIdentifier];
    uint64_t v10 = [v8 initWithDelegate:0 eventQueue:0 personaIdentifier:v9];
    manager = v7->_manager;
    v7->_manager = (MBManager *)v10;
  }
  return v7;
}

- (BOOL)isBackupEnabled
{
  v2 = [(DKBackupProvider *)self manager];
  char v3 = [v2 isBackupEnabled];

  return v3;
}

- (BOOL)isBackingUp
{
  v2 = [(DKBackupProvider *)self manager];
  char v3 = [v2 backupState];

  LOBYTE(v2) = [v3 state] - 1 < 3;
  return (char)v2;
}

- (BOOL)isRestoring
{
  v2 = [(DKBackupProvider *)self manager];
  char v3 = [v2 restoreState];

  LOBYTE(v2) = [v3 state] - 1 < 3;
  return (char)v2;
}

- (BOOL)isManualBackupOnCellularAllowed
{
  char v3 = [(DKBackupProvider *)self manager];
  v4 = [(DKBackupProvider *)self account];
  id v9 = 0;
  char v5 = [v3 isManualBackupOnCellularAllowedWithAccount:v4 error:&v9];
  id v6 = v9;

  if (v6)
  {
    v7 = _DKLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      [(DKBackupProvider *)v6 isManualBackupOnCellularAllowed];
    }
  }
  return v5;
}

- (void)startBackupWithExpensiveCellularAllowed:(BOOL)a3 progressHandler:(id)a4 completionHandler:(id)a5
{
  BOOL v6 = a3;
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __94__DKBackupProvider_startBackupWithExpensiveCellularAllowed_progressHandler_completionHandler___block_invoke;
  block[3] = &unk_264CF0F58;
  block[4] = self;
  id v10 = v8;
  id v31 = v10;
  id v11 = v9;
  id v32 = v11;
  dispatch_async(MEMORY[0x263EF83A0], block);
  BOOL v12 = [(DKBackupProvider *)self isBackingUp];
  objc_super v13 = _DKLogSystem();
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (v12)
  {
    if (v14)
    {
      v15 = [(DKBackupProvider *)self account];
      *(_DWORD *)buf = 138412290;
      v34 = v15;
      _os_log_impl(&dword_237B3F000, v13, OS_LOG_TYPE_DEFAULT, "Skipping starting backup; backup already running for %@...",
        buf,
        0xCu);
    }
  }
  else
  {
    if (v14)
    {
      v16 = [(DKBackupProvider *)self account];
      *(_DWORD *)buf = 138412290;
      v34 = v16;
      _os_log_impl(&dword_237B3F000, v13, OS_LOG_TYPE_DEFAULT, "Starting backup for %@...", buf, 0xCu);
    }
    objc_super v13 = objc_alloc_init(MEMORY[0x263F559F8]);
    if ([(DKBackupProvider *)self isManualBackupOnCellularAllowed])
    {
      if (v6) {
        [MEMORY[0x263F559D0] expensiveCellularAccess];
      }
      else {
      v17 = [MEMORY[0x263F559D0] inexpensiveCellularAccess];
      }
      [v13 setCellularAccess:v17];
    }
    v18 = [(DKBackupProvider *)self manager];
    [v18 setDelegate:self];

    v19 = [(DKBackupProvider *)self manager];
    id v29 = 0;
    uint64_t v20 = [v19 startBackupWithOptions:v13 error:&v29];
    id v21 = v29;

    if ((v20 & 1) == 0)
    {
      v22 = _DKLogSystem();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        if (_DKIsInternalInstall())
        {
          int v24 = 0;
          v25 = v21;
        }
        else if (v21)
        {
          v26 = NSString;
          uint64_t v20 = [v21 domain];
          v25 = [v26 stringWithFormat:@"<Error domain: %@, code %ld>", v20, objc_msgSend(v21, "code")];
          int v24 = 1;
        }
        else
        {
          int v24 = 0;
          v25 = 0;
        }
        *(_DWORD *)buf = 138543362;
        v34 = v25;
        _os_log_error_impl(&dword_237B3F000, v22, OS_LOG_TYPE_ERROR, "Failed to start backup: %{public}@", buf, 0xCu);
        if (v24)
        {
        }
      }

      v27[0] = MEMORY[0x263EF8330];
      v27[1] = 3221225472;
      v27[2] = __94__DKBackupProvider_startBackupWithExpensiveCellularAllowed_progressHandler_completionHandler___block_invoke_5;
      v27[3] = &unk_264CF1048;
      v27[4] = self;
      id v28 = v21;
      v23 = (void *)MEMORY[0x263EF83A0];
      dispatch_async(MEMORY[0x263EF83A0], v27);
    }
  }
}

uint64_t __94__DKBackupProvider_startBackupWithExpensiveCellularAllowed_progressHandler_completionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setProgressHandler:*(void *)(a1 + 40)];
  uint64_t v2 = *(void *)(a1 + 48);
  char v3 = *(void **)(a1 + 32);
  return [v3 setCompletionHandler:v2];
}

uint64_t __94__DKBackupProvider_startBackupWithExpensiveCellularAllowed_progressHandler_completionHandler___block_invoke_5(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) completionHandler];

  if (v2)
  {
    char v3 = [*(id *)(a1 + 32) completionHandler];
    v3[2](v3, *(void *)(a1 + 40));
  }
  [*(id *)(a1 + 32) setProgressHandler:0];
  v4 = *(void **)(a1 + 32);
  return [v4 setCompletionHandler:0];
}

- (void)cancel
{
  id v2 = [(DKBackupProvider *)self manager];
  [v2 cancel];
}

- (void)manager:(id)a3 didUpdateProgress:(float)a4 estimatedTimeRemaining:(unint64_t)a5
{
  id v8 = a3;
  id v9 = [(DKBackupProvider *)self manager];

  if (v9 == v8)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __69__DKBackupProvider_manager_didUpdateProgress_estimatedTimeRemaining___block_invoke;
    block[3] = &unk_264CF1020;
    float v11 = a4;
    block[4] = self;
    void block[5] = a5;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

void __69__DKBackupProvider_manager_didUpdateProgress_estimatedTimeRemaining___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) progressHandler];

  if (v2)
  {
    char v3 = [*(id *)(a1 + 32) progressHandler];
    v3[2](v3, *(void *)(a1 + 40), *(float *)(a1 + 48));
  }
}

- (void)managerDidFinishBackup:(id)a3
{
  id v4 = a3;
  id v5 = [(DKBackupProvider *)self manager];

  if (v5 == v4)
  {
    BOOL v6 = _DKLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_237B3F000, v6, OS_LOG_TYPE_DEFAULT, "Backup did finish!", buf, 2u);
    }

    v7 = [(DKBackupProvider *)self manager];
    [v7 setDelegate:0];

    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __43__DKBackupProvider_managerDidFinishBackup___block_invoke;
    block[3] = &unk_264CF0A98;
    block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

void __43__DKBackupProvider_managerDidFinishBackup___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) completionHandler];

  if (v2)
  {
    char v3 = [*(id *)(a1 + 32) completionHandler];
    v3[2](v3, 0);
  }
}

- (void)manager:(id)a3 didFailBackupWithError:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  id v8 = [(DKBackupProvider *)self manager];

  if (v8 == v7)
  {
    id v9 = _DKLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      if (_DKIsInternalInstall())
      {
        int v10 = 0;
        float v11 = v6;
      }
      else if (v6)
      {
        BOOL v12 = NSString;
        id v8 = [v6 domain];
        float v11 = [v12 stringWithFormat:@"<Error domain: %@, code %ld>", v8, objc_msgSend(v6, "code")];
        int v10 = 1;
      }
      else
      {
        int v10 = 0;
        float v11 = 0;
      }
      *(_DWORD *)buf = 138543362;
      v16 = v11;
      _os_log_error_impl(&dword_237B3F000, v9, OS_LOG_TYPE_ERROR, "Backup did fail: %{public}@", buf, 0xCu);
      if (v10)
      {
      }
    }

    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __51__DKBackupProvider_manager_didFailBackupWithError___block_invoke;
    block[3] = &unk_264CF1048;
    block[4] = self;
    id v14 = v6;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

void __51__DKBackupProvider_manager_didFailBackupWithError___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) completionHandler];

  if (v2)
  {
    char v3 = [*(id *)(a1 + 32) completionHandler];
    v3[2](v3, *(void *)(a1 + 40));
  }
}

- (void)managerDidLoseConnectionToService:(id)a3
{
  id v4 = a3;
  id v5 = [(DKBackupProvider *)self manager];

  if (v5 == v4)
  {
    id v6 = _DKLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[DKBackupProvider managerDidLoseConnectionToService:](v6);
    }

    id v7 = [(DKBackupProvider *)self manager];
    [v7 setDelegate:0];

    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __54__DKBackupProvider_managerDidLoseConnectionToService___block_invoke;
    block[3] = &unk_264CF0A98;
    block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

void __54__DKBackupProvider_managerDidLoseConnectionToService___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) completionHandler];

  if (v2)
  {
    id v4 = [*(id *)(a1 + 32) completionHandler];
    char v3 = [MEMORY[0x263F087E8] errorWithDomain:@"MBErrorDomain" code:18 userInfo:0];
    v4[2](v4, v3);
  }
}

- (ACAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

- (MBManager)manager
{
  return self->_manager;
}

- (void)setManager:(id)a3
{
}

- (id)progressHandler
{
  return self->_progressHandler;
}

- (void)setProgressHandler:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong(&self->_progressHandler, 0);
  objc_storeStrong((id *)&self->_manager, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

- (void)isManualBackupOnCellularAllowed
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v5 = _DKIsInternalInstall();
  if ((v5 & 1) == 0)
  {
    id v6 = NSString;
    id v2 = [a1 domain];
    a1 = [v6 stringWithFormat:@"<Error domain: %@, code %ld>", v2, objc_msgSend(a1, "code")];
  }
  *(_DWORD *)buf = 138543362;
  id v8 = a1;
  _os_log_error_impl(&dword_237B3F000, a2, OS_LOG_TYPE_ERROR, "Failed to check if backup is supported on cellular: %{public}@", buf, 0xCu);
  if (!v5)
  {
  }
}

- (void)managerDidLoseConnectionToService:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_237B3F000, log, OS_LOG_TYPE_ERROR, "Lost connection to backup!", v1, 2u);
}

@end
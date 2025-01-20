@interface LNUnlockService
+ (BOOL)isDeviceLocked;
- (LNUnlockService)initWithQueue:(id)a3;
- (OS_dispatch_queue)queue;
- (SBSLockScreenService)service;
- (void)dealloc;
- (void)requestUnlockIfNeeded:(id)a3;
- (void)setQueue:(id)a3;
- (void)setService:(id)a3;
@end

@implementation LNUnlockService

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setService:(id)a3
{
}

- (SBSLockScreenService)service
{
  return self->_service;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)requestUnlockIfNeeded:(id)a3
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = getLNLogCategoryConnection();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A4419000, v5, OS_LOG_TYPE_INFO, "Device unlock requested", buf, 2u);
  }

  v23 = @"ExtendedDeviceLockState";
  v24[0] = MEMORY[0x1E4F1CC38];
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];
  int v7 = MKBGetDeviceLockState();
  if (v7)
  {
    if (v7 != 3)
    {
      if (v7 == 6)
      {
        v8 = getLNLogCategoryConnection();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          v9 = "Requesting passcode unlock UI: device in assert delay";
LABEL_16:
          _os_log_impl(&dword_1A4419000, v8, OS_LOG_TYPE_INFO, v9, buf, 2u);
        }
      }
      else
      {
        v8 = getLNLogCategoryConnection();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          v9 = "Requesting passcode unlock UI";
          goto LABEL_16;
        }
      }

      v15 = [(LNUnlockService *)self service];
      v16 = objc_opt_new();
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __41__LNUnlockService_requestUnlockIfNeeded___block_invoke_6;
      v18[3] = &unk_1E5B39D78;
      v18[4] = self;
      id v19 = v4;
      id v17 = v4;
      [v15 requestPasscodeUnlockUIWithOptions:v16 withCompletion:v18];

      v14 = v19;
      goto LABEL_18;
    }
    v10 = getLNLogCategoryConnection();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v11 = "Unlocking device is not required: key bag is disabled";
      goto LABEL_12;
    }
  }
  else
  {
    v10 = getLNLogCategoryConnection();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v11 = "Unlocking device is not required: device is unlocked";
LABEL_12:
      _os_log_impl(&dword_1A4419000, v10, OS_LOG_TYPE_INFO, v11, buf, 2u);
    }
  }

  v12 = [(LNUnlockService *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__LNUnlockService_requestUnlockIfNeeded___block_invoke;
  block[3] = &unk_1E5B39D28;
  id v21 = v4;
  id v13 = v4;
  dispatch_async(v12, block);

  v14 = v21;
LABEL_18:
}

uint64_t __41__LNUnlockService_requestUnlockIfNeeded___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __41__LNUnlockService_requestUnlockIfNeeded___block_invoke_6(uint64_t a1, int a2)
{
  id v4 = getLNLogCategoryConnection();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);
  if (a2)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      v6 = "Successfully unlocked";
LABEL_6:
      _os_log_impl(&dword_1A4419000, v4, OS_LOG_TYPE_INFO, v6, buf, 2u);
    }
  }
  else if (v5)
  {
    *(_WORD *)buf = 0;
    v6 = "Failed to unlock device";
    goto LABEL_6;
  }

  int v7 = [*(id *)(a1 + 32) queue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __41__LNUnlockService_requestUnlockIfNeeded___block_invoke_7;
  v8[3] = &unk_1E5B39D50;
  id v9 = *(id *)(a1 + 40);
  char v10 = a2;
  dispatch_async(v7, v8);
}

uint64_t __41__LNUnlockService_requestUnlockIfNeeded___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)dealloc
{
  v3 = [(LNUnlockService *)self service];
  [v3 invalidate];

  v4.receiver = self;
  v4.super_class = (Class)LNUnlockService;
  [(LNUnlockService *)&v4 dealloc];
}

- (LNUnlockService)initWithQueue:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)LNUnlockService;
  v6 = [(LNUnlockService *)&v12 init];
  int v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    v8 = (SBSLockScreenService *)objc_alloc_init(MEMORY[0x1E4FA6B38]);
    service = v7->_service;
    v7->_service = v8;

    char v10 = v7;
  }

  return v7;
}

+ (BOOL)isDeviceLocked
{
  return MKBGetDeviceLockState() - 1 < 2;
}

@end
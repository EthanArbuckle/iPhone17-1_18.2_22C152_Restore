@interface CUMobileDeviceSession
- (CUMobileDevice)peerDevice;
- (CUMobileDeviceSession)init;
- (OS_dispatch_queue)dispatchQueue;
- (id)invalidationHandler;
- (id)promptForPINHandler;
- (void)_invalidated;
- (void)_pairSetupWithFlags:(unsigned int)a3 completion:(id)a4;
- (void)_pairVerifyWithFlags:(unsigned int)a3 completion:(id)a4;
- (void)_unpairWithCompletion:(id)a3;
- (void)activate;
- (void)invalidate;
- (void)pairSetupTryPIN:(id)a3;
- (void)pairSetupWithFlags:(unsigned int)a3 completion:(id)a4;
- (void)pairVerifyWithFlags:(unsigned int)a3 completion:(id)a4;
- (void)setDispatchQueue:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setPeerDevice:(id)a3;
- (void)setPromptForPINHandler:(id)a3;
- (void)unpairWithCompletion:(id)a3;
@end

@implementation CUMobileDeviceSession

- (void).cxx_destruct
{
  objc_storeStrong(&self->_promptForPINHandler, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_peerDevice, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_mdRunLoopThread, 0);
}

- (void)setPromptForPINHandler:(id)a3
{
}

- (id)promptForPINHandler
{
  return self->_promptForPINHandler;
}

- (void)setInvalidationHandler:(id)a3
{
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setPeerDevice:(id)a3
{
}

- (CUMobileDevice)peerDevice
{
  return self->_peerDevice;
}

- (void)setDispatchQueue:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)_unpairWithCompletion:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__CUMobileDeviceSession__unpairWithCompletion___block_invoke;
  block[3] = &unk_1E55BFC80;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, block);
}

void __47__CUMobileDeviceSession__unpairWithCompletion___block_invoke(uint64_t a1)
{
  v16[1] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    v2 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v3 = *MEMORY[0x1E4F28760];
    uint64_t v15 = *MEMORY[0x1E4F28568];
    id v4 = NSString;
    if (MEMORY[0x1E4F5E2B0] && (v5 = CUErrorCodesTableGet(), (id v6 = *(const char **)(v5 + 8)) != 0))
    {
      if (*(_DWORD *)v5 != -6735)
      {
        v7 = (const char **)(v5 + 24);
        id v6 = "";
        while (1)
        {
          id v8 = *v7;
          if (!*v7) {
            break;
          }
          int v9 = *((_DWORD *)v7 - 2);
          v7 += 2;
          if (v9 == -6735)
          {
            id v6 = v8;
            break;
          }
        }
      }
    }
    else
    {
      id v6 = "";
    }
    uint64_t v10 = [v4 stringWithUTF8String:v6];
    v11 = (void *)v10;
    v12 = @"?";
    if (v10) {
      v12 = (__CFString *)v10;
    }
    v16[0] = v12;
    v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
    v14 = [v2 errorWithDomain:v3 code:-6735 userInfo:v13];
    (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v14);
  }
}

- (void)unpairWithCompletion:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__CUMobileDeviceSession_unpairWithCompletion___block_invoke;
  v7[3] = &unk_1E55BF148;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __46__CUMobileDeviceSession_unpairWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(void **)(v1 + 16);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __46__CUMobileDeviceSession_unpairWithCompletion___block_invoke_2;
  v3[3] = &unk_1E55BF148;
  v3[4] = v1;
  id v4 = *(id *)(a1 + 40);
  [v2 performBlock:v3];
}

uint64_t __46__CUMobileDeviceSession_unpairWithCompletion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _unpairWithCompletion:*(void *)(a1 + 40)];
}

- (void)_pairVerifyWithFlags:(unsigned int)a3 completion:(id)a4
{
  id v5 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__CUMobileDeviceSession__pairVerifyWithFlags_completion___block_invoke;
  block[3] = &unk_1E55BFC80;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(dispatchQueue, block);
}

void __57__CUMobileDeviceSession__pairVerifyWithFlags_completion___block_invoke(uint64_t a1)
{
  v16[1] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v3 = *MEMORY[0x1E4F28760];
  uint64_t v15 = *MEMORY[0x1E4F28568];
  id v4 = NSString;
  if (MEMORY[0x1E4F5E2B0] && (v5 = CUErrorCodesTableGet(), (id v6 = *(const char **)(v5 + 8)) != 0))
  {
    if (*(_DWORD *)v5 != -6735)
    {
      id v7 = (const char **)(v5 + 24);
      id v6 = "";
      while (1)
      {
        id v8 = *v7;
        if (!*v7) {
          break;
        }
        int v9 = *((_DWORD *)v7 - 2);
        v7 += 2;
        if (v9 == -6735)
        {
          id v6 = v8;
          break;
        }
      }
    }
  }
  else
  {
    id v6 = "";
  }
  uint64_t v10 = [v4 stringWithUTF8String:v6];
  v11 = (void *)v10;
  v12 = @"?";
  if (v10) {
    v12 = (__CFString *)v10;
  }
  v16[0] = v12;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
  v14 = [v2 errorWithDomain:v3 code:-6735 userInfo:v13];
  (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v14);
}

- (void)pairVerifyWithFlags:(unsigned int)a3 completion:(id)a4
{
  id v6 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__CUMobileDeviceSession_pairVerifyWithFlags_completion___block_invoke;
  block[3] = &unk_1E55BE3A0;
  unsigned int v11 = a3;
  void block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(dispatchQueue, block);
}

void __56__CUMobileDeviceSession_pairVerifyWithFlags_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(void **)(v1 + 16);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __56__CUMobileDeviceSession_pairVerifyWithFlags_completion___block_invoke_2;
  v3[3] = &unk_1E55BE3A0;
  v3[4] = v1;
  int v5 = *(_DWORD *)(a1 + 48);
  id v4 = *(id *)(a1 + 40);
  [v2 performBlock:v3];
}

uint64_t __56__CUMobileDeviceSession_pairVerifyWithFlags_completion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _pairVerifyWithFlags:*(unsigned int *)(a1 + 48) completion:*(void *)(a1 + 40)];
}

- (void)pairSetupTryPIN:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __41__CUMobileDeviceSession_pairSetupTryPIN___block_invoke;
  v7[3] = &unk_1E55BF170;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

uint64_t __41__CUMobileDeviceSession_pairSetupTryPIN___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _pairSetupTryPIN:*(void *)(a1 + 40)];
}

- (void)_pairSetupWithFlags:(unsigned int)a3 completion:(id)a4
{
  id v5 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__CUMobileDeviceSession__pairSetupWithFlags_completion___block_invoke;
  block[3] = &unk_1E55BFC80;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(dispatchQueue, block);
}

void __56__CUMobileDeviceSession__pairSetupWithFlags_completion___block_invoke(uint64_t a1)
{
  v16[1] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v3 = *MEMORY[0x1E4F28760];
  uint64_t v15 = *MEMORY[0x1E4F28568];
  id v4 = NSString;
  if (MEMORY[0x1E4F5E2B0] && (v5 = CUErrorCodesTableGet(), (id v6 = *(const char **)(v5 + 8)) != 0))
  {
    if (*(_DWORD *)v5 != -6735)
    {
      id v7 = (const char **)(v5 + 24);
      id v6 = "";
      while (1)
      {
        id v8 = *v7;
        if (!*v7) {
          break;
        }
        int v9 = *((_DWORD *)v7 - 2);
        v7 += 2;
        if (v9 == -6735)
        {
          id v6 = v8;
          break;
        }
      }
    }
  }
  else
  {
    id v6 = "";
  }
  uint64_t v10 = [v4 stringWithUTF8String:v6];
  unsigned int v11 = (void *)v10;
  v12 = @"?";
  if (v10) {
    v12 = (__CFString *)v10;
  }
  v16[0] = v12;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
  v14 = [v2 errorWithDomain:v3 code:-6735 userInfo:v13];
  (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v14);
}

- (void)pairSetupWithFlags:(unsigned int)a3 completion:(id)a4
{
  id v6 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__CUMobileDeviceSession_pairSetupWithFlags_completion___block_invoke;
  block[3] = &unk_1E55BE3A0;
  unsigned int v11 = a3;
  void block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(dispatchQueue, block);
}

void __55__CUMobileDeviceSession_pairSetupWithFlags_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(void **)(v1 + 16);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __55__CUMobileDeviceSession_pairSetupWithFlags_completion___block_invoke_2;
  v3[3] = &unk_1E55BE3A0;
  v3[4] = v1;
  int v5 = *(_DWORD *)(a1 + 48);
  id v4 = *(id *)(a1 + 40);
  [v2 performBlock:v3];
}

uint64_t __55__CUMobileDeviceSession_pairSetupWithFlags_completion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _pairSetupWithFlags:*(unsigned int *)(a1 + 48) completion:*(void *)(a1 + 40)];
}

- (void)_invalidated
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateCalled
    && gLogCategory_CUMobileDeviceSession <= 50
    && (gLogCategory_CUMobileDeviceSession != -1
     || _LogCategory_Initialize((uint64_t)&gLogCategory_CUMobileDeviceSession, 0x32u)))
  {
    LogPrintF((uint64_t)&gLogCategory_CUMobileDeviceSession, (uint64_t)"-[CUMobileDeviceSession _invalidated]", 0x32u, (uint64_t)"### Unexpectedly invalidated\n", v3, v4, v5, v6, v14);
  }
  if (!self->_mdRunLoopThread)
  {
    invalidationHandler = (void (**)(void))self->_invalidationHandler;
    if (invalidationHandler)
    {
      invalidationHandler[2]();
      id v8 = self->_invalidationHandler;
    }
    else
    {
      id v8 = 0;
    }
    self->_invalidationHandler = 0;

    id promptForPINHandler = self->_promptForPINHandler;
    self->_id promptForPINHandler = 0;

    if (gLogCategory_CUMobileDeviceSession <= 30
      && (gLogCategory_CUMobileDeviceSession != -1
       || _LogCategory_Initialize((uint64_t)&gLogCategory_CUMobileDeviceSession, 0x1Eu)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUMobileDeviceSession, (uint64_t)"-[CUMobileDeviceSession _invalidated]", 0x1Eu, (uint64_t)"Invalidated\n", v10, v11, v12, v13, v16);
    }
  }
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__CUMobileDeviceSession_invalidate__block_invoke;
  block[3] = &unk_1E55BFC18;
  void block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __35__CUMobileDeviceSession_invalidate__block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!*(unsigned char *)(*(void *)(result + 32) + 9))
  {
    uint64_t v8 = result;
    if (gLogCategory_CUMobileDeviceSession <= 30
      && (gLogCategory_CUMobileDeviceSession != -1
       || _LogCategory_Initialize((uint64_t)&gLogCategory_CUMobileDeviceSession, 0x1Eu)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUMobileDeviceSession, (uint64_t)"-[CUMobileDeviceSession invalidate]_block_invoke", 0x1Eu, (uint64_t)"Invalidate\n", a5, a6, a7, a8, v11);
    }
    *(unsigned char *)(*(void *)(v8 + 32) + 9) = 1;
    int v9 = *(void **)(v8 + 32);
    if (v9[2])
    {
      uint64_t v10 = (void *)v9[2];
      return [v10 invalidate];
    }
    else
    {
      return [v9 _invalidated];
    }
  }
  return result;
}

- (void)activate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__CUMobileDeviceSession_activate__block_invoke;
  block[3] = &unk_1E55BFC18;
  void block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __33__CUMobileDeviceSession_activate__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (gLogCategory_CUMobileDeviceSession <= 30
    && (gLogCategory_CUMobileDeviceSession != -1
     || _LogCategory_Initialize((uint64_t)&gLogCategory_CUMobileDeviceSession, 0x1Eu)))
  {
    LogPrintF((uint64_t)&gLogCategory_CUMobileDeviceSession, (uint64_t)"-[CUMobileDeviceSession activate]_block_invoke", 0x1Eu, (uint64_t)"Activate\n", a5, a6, a7, a8, v14);
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 8) = 1;
  int v9 = objc_alloc_init(CURunLoopThread);
  uint64_t v10 = *(void *)(a1 + 32);
  uint64_t v11 = *(void **)(v10 + 16);
  *(void *)(v10 + 16) = v9;

  [*(id *)(*(void *)(a1 + 32) + 16) setDispatchQueue:*(void *)(*(void *)(a1 + 32) + 24)];
  uint64_t v12 = [(id)objc_opt_class() description];
  [*(id *)(*(void *)(a1 + 32) + 16) setLabel:v12];

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __33__CUMobileDeviceSession_activate__block_invoke_2;
  v15[3] = &unk_1E55BFC18;
  uint64_t v16 = *(void *)(a1 + 32);
  [*(id *)(v16 + 16) setInvalidationHandler:v15];
  return [*(id *)(*(void *)(a1 + 32) + 16) activate];
}

uint64_t __33__CUMobileDeviceSession_activate__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 16);
  *(void *)(v2 + 16) = 0;

  uint64_t v4 = *(void **)(a1 + 32);
  return [v4 _invalidated];
}

- (CUMobileDeviceSession)init
{
  v4.receiver = self;
  v4.super_class = (Class)CUMobileDeviceSession;
  uint64_t v2 = [(CUMobileDeviceSession *)&v4 init];
  if (v2)
  {
    if (CUMainQueue_sOnce != -1) {
      dispatch_once(&CUMainQueue_sOnce, &__block_literal_global_18);
    }
    objc_storeStrong((id *)&v2->_dispatchQueue, (id)CUMainQueue_sQueue);
  }
  return v2;
}

@end
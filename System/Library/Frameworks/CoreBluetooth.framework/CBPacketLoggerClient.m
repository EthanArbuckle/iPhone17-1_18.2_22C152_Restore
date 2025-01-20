@interface CBPacketLoggerClient
- (CBPacketLoggerClient)init;
- (OS_dispatch_queue)dispatchQueue;
- (id)_ensureXPCStarted;
- (id)errorHandler;
- (id)interruptionHandler;
- (id)invalidationHandler;
- (id)rawPacketHandler;
- (void)_activateWithCompletion:(id)a3;
- (void)_activateXPC:(BOOL)a3 completion:(id)a4;
- (void)_interrupted;
- (void)_invalidated;
- (void)_xpcReceivedEvent:(id)a3;
- (void)_xpcReceivedPacket:(id)a3;
- (void)activateWithCompletion:(id)a3;
- (void)invalidate;
- (void)setDispatchQueue:(id)a3;
- (void)setErrorHandler:(id)a3;
- (void)setInterruptionHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setRawPacketHandler:(id)a3;
@end

@implementation CBPacketLoggerClient

- (CBPacketLoggerClient)init
{
  v6.receiver = self;
  v6.super_class = (Class)CBPacketLoggerClient;
  v2 = [(CBPacketLoggerClient *)&v6 init];
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x1E4F14428]);
    v4 = v3;
  }

  return v3;
}

- (void)activateWithCompletion:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__CBPacketLoggerClient_activateWithCompletion___block_invoke;
  v7[3] = &unk_1E5E32278;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

uint64_t __47__CBPacketLoggerClient_activateWithCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _activateWithCompletion:*(void *)(a1 + 40)];
}

- (void)_activateWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__2;
  v19 = __Block_byref_object_dispose__2;
  id v20 = 0;
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  v11 = __48__CBPacketLoggerClient__activateWithCompletion___block_invoke;
  v12 = &unk_1E5E31298;
  v14 = &v15;
  id v5 = v4;
  id v13 = v5;
  id v6 = (void (**)(void))MEMORY[0x1AD111AA0](&v9);
  if (*(_WORD *)&self->_activateCalled)
  {
    uint64_t v7 = NSErrorF_safe();
    id v8 = (void *)v16[5];
    v16[5] = v7;
  }
  else
  {
    self->_activateCalled = 1;
    -[CBPacketLoggerClient _activateXPC:completion:](self, "_activateXPC:completion:", 0, v5, v9, v10, v11, v12);
  }
  v6[2](v6);

  _Block_object_dispose(&v15, 8);
}

uint64_t __48__CBPacketLoggerClient__activateWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (result)
  {
    if (gLogCategory_CBPacketLoggerClient <= 90
      && (gLogCategory_CBPacketLoggerClient != -1 || _LogCategory_Initialize()))
    {
      id v4 = CUPrintNSError();
      LogPrintF_safe();
    }
    v3 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
    return v3();
  }
  return result;
}

- (void)_activateXPC:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if (v4)
  {
    if (gLogCategory_CBPacketLoggerClient <= 30
      && (gLogCategory_CBPacketLoggerClient != -1 || _LogCategory_Initialize()))
    {
LABEL_7:
      LogPrintF_safe();
    }
  }
  else if (gLogCategory_CBPacketLoggerClient <= 30 {
         && (gLogCategory_CBPacketLoggerClient != -1 || _LogCategory_Initialize()))
  }
  {
    goto LABEL_7;
  }
  xpc_object_t v7 = xpc_dictionary_create(0, 0, 0);
  id v8 = [(CBPacketLoggerClient *)self _ensureXPCStarted];
  dispatchQueue = self->_dispatchQueue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __48__CBPacketLoggerClient__activateXPC_completion___block_invoke;
  v11[3] = &unk_1E5E33A18;
  BOOL v13 = v4;
  id v12 = v6;
  id v10 = v6;
  xpc_connection_send_message_with_reply(v8, v7, dispatchQueue, v11);
}

void __48__CBPacketLoggerClient__activateXPC_completion___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (*(unsigned char *)(a1 + 40))
  {
    if (gLogCategory_CBPacketLoggerClient <= 30
      && (gLogCategory_CBPacketLoggerClient != -1 || _LogCategory_Initialize()))
    {
LABEL_7:
      LogPrintF_safe();
    }
  }
  else if (gLogCategory_CBPacketLoggerClient <= 30 {
         && (gLogCategory_CBPacketLoggerClient != -1 || _LogCategory_Initialize()))
  }
  {
    goto LABEL_7;
  }
  uint64_t v3 = MEMORY[0x1AD111AA0](*(void *)(a1 + 32));
  BOOL v4 = (void *)v3;
  if (v3) {
    (*(void (**)(uint64_t, void))(v3 + 16))(v3, 0);
  }
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__CBPacketLoggerClient_invalidate__block_invoke;
  block[3] = &unk_1E5E31248;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __34__CBPacketLoggerClient_invalidate__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (!*(unsigned char *)(v1 + 9))
  {
    uint64_t v2 = result;
    *(unsigned char *)(v1 + 9) = 1;
    if (gLogCategory_CBPacketLoggerClient <= 30
      && (gLogCategory_CBPacketLoggerClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
    uint64_t v3 = *(_xpc_connection_s **)(*(void *)(v2 + 32) + 16);
    if (v3) {
      xpc_connection_cancel(v3);
    }
    BOOL v4 = *(void **)(v2 + 32);
    return [v4 _invalidated];
  }
  return result;
}

- (void)_interrupted
{
  if (!self->_invalidateCalled)
  {
    if (gLogCategory_CBPacketLoggerClient <= 90
      && (gLogCategory_CBPacketLoggerClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
    uint64_t v3 = MEMORY[0x1AD111AA0](self->_interruptionHandler);
    BOOL v4 = (void *)v3;
    if (v3) {
      (*(void (**)(uint64_t))(v3 + 16))(v3);
    }

    [(CBPacketLoggerClient *)self _activateXPC:1 completion:0];
  }
}

- (void)_invalidated
{
  if (self->_invalidateCalled && !self->_invalidateDone && !self->_xpcCnx)
  {
    uint64_t v9 = MEMORY[0x1AD111AA0](self->_invalidationHandler, a2);
    id errorHandler = self->_errorHandler;
    self->_id errorHandler = 0;

    id interruptionHandler = self->_interruptionHandler;
    self->_id interruptionHandler = 0;

    id invalidationHandler = self->_invalidationHandler;
    self->_id invalidationHandler = 0;

    id rawPacketHandler = self->_rawPacketHandler;
    self->_id rawPacketHandler = 0;

    uint64_t v8 = v9;
    if (v9)
    {
      uint64_t v7 = (*(uint64_t (**)(uint64_t))(v9 + 16))(v9);
      uint64_t v8 = v9;
    }
    self->_invalidateDone = 1;
    if (gLogCategory_CBPacketLoggerClient <= 30
      && (gLogCategory_CBPacketLoggerClient != -1 || (v7 = _LogCategory_Initialize(), uint64_t v8 = v9, v7)))
    {
      uint64_t v7 = LogPrintF_safe();
      uint64_t v8 = v9;
    }
    else if (((vars8 ^ (2 * vars8)) & 0x4000000000000000) != 0)
    {
      __break(0xC471u);
    }
    MEMORY[0x1F41817F8](v7, v8);
  }
}

- (id)_ensureXPCStarted
{
  p_xpcCnx = &self->_xpcCnx;
  BOOL v4 = self->_xpcCnx;
  if (v4)
  {
    id v5 = v4;
  }
  else
  {
    xpc_connection_t mach_service = xpc_connection_create_mach_service("com.apple.bluetooth.BTPacketLogger.ios", (dispatch_queue_t)self->_dispatchQueue, 0);
    objc_storeStrong((id *)p_xpcCnx, mach_service);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __41__CBPacketLoggerClient__ensureXPCStarted__block_invoke;
    v9[3] = &unk_1E5E31630;
    v9[4] = self;
    uint64_t v7 = mach_service;
    id v10 = v7;
    xpc_connection_set_event_handler(v7, v9);
    xpc_connection_activate(v7);
    id v5 = v7;
  }

  return v5;
}

void *__41__CBPacketLoggerClient__ensureXPCStarted__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void **)(a1 + 32);
  if (result[2] == *(void *)(a1 + 40)) {
    return (void *)[result _xpcReceivedEvent:a2];
  }
  return result;
}

- (void)_xpcReceivedEvent:(id)a3
{
  id v15 = a3;
  if (MEMORY[0x1AD1120E0]() == MEMORY[0x1E4F14590])
  {
    [(CBPacketLoggerClient *)self _xpcReceivedPacket:v15];
    BOOL v4 = v15;
  }
  else if (v15 == (id)MEMORY[0x1E4F14520])
  {
    [(CBPacketLoggerClient *)self _interrupted];
    BOOL v4 = v15;
  }
  else if (v15 == (id)MEMORY[0x1E4F14528])
  {
    if (!self->_invalidateCalled
      && gLogCategory_CBPacketLoggerClient <= 90
      && (gLogCategory_CBPacketLoggerClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
    xpcCnx = self->_xpcCnx;
    self->_xpcCnx = 0;

    [(CBPacketLoggerClient *)self _invalidated];
    BOOL v4 = v15;
  }
  else
  {
    if (gLogCategory_CBPacketLoggerClient <= 90
      && (gLogCategory_CBPacketLoggerClient != -1 || _LogCategory_Initialize()))
    {
      v14 = CUPrintXPC();
      LogPrintF_safe();
    }
    v11 = (void (**)(void, void))MEMORY[0x1AD111AA0](self->_errorHandler);
    if (v11)
    {
      id v12 = CBErrorF(-6700, (uint64_t)"XPC error", v5, v6, v7, v8, v9, v10, (uint64_t)v14);
      ((void (**)(void, void *))v11)[2](v11, v12);
    }
    BOOL v4 = v15;
  }
}

- (void)_xpcReceivedPacket:(id)a3
{
  xpc_dictionary_get_value(a3, "packet");
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    if (gLogCategory_CBPacketLoggerClient <= 90
      && (gLogCategory_CBPacketLoggerClient != -1 || _LogCategory_Initialize()))
    {
      goto LABEL_14;
    }
LABEL_6:
    uint64_t v6 = v7;
    goto LABEL_8;
  }
  if (MEMORY[0x1AD1120E0]() == MEMORY[0x1E4F14580])
  {
    uint64_t v4 = MEMORY[0x1AD111AA0](self->_rawPacketHandler);
    uint64_t v5 = (void *)v4;
    if (v4) {
      (*(void (**)(uint64_t, id))(v4 + 16))(v4, v7);
    }

    goto LABEL_6;
  }
  if (gLogCategory_CBPacketLoggerClient > 90
    || gLogCategory_CBPacketLoggerClient == -1 && !_LogCategory_Initialize())
  {
    goto LABEL_6;
  }
LABEL_14:
  LogPrintF_safe();
  uint64_t v6 = v7;

LABEL_8:
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (id)errorHandler
{
  return self->_errorHandler;
}

- (void)setErrorHandler:(id)a3
{
}

- (id)interruptionHandler
{
  return self->_interruptionHandler;
}

- (void)setInterruptionHandler:(id)a3
{
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
}

- (id)rawPacketHandler
{
  return self->_rawPacketHandler;
}

- (void)setRawPacketHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_rawPacketHandler, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong(&self->_errorHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);

  objc_storeStrong((id *)&self->_xpcCnx, 0);
}

@end
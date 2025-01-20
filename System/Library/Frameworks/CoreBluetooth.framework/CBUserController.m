@interface CBUserController
+ (BOOL)writePrefKey:(id)a3 value:(id)a4 source:(unsigned int)a5 error:(id *)a6;
+ (id)readPrefKeys:(id)a3 source:(unsigned int)a4 error:(id *)a5;
- (BOOL)_ensureXPCStarted;
- (CBUserController)init;
- (NSXPCListenerEndpoint)testListenerEndpoint;
- (OS_dispatch_queue)dispatchQueue;
- (id)errorHandler;
- (id)interruptionHandler;
- (id)invalidationHandler;
- (unsigned)clientID;
- (void)_activate;
- (void)_activateXPCStart:(BOOL)a3;
- (void)_interrupted;
- (void)_invalidated;
- (void)activateWithCompletion:(id)a3;
- (void)appleAudioAccessoryLimitedLoggingWithCompletion:(id)a3;
- (void)dealloc;
- (void)deleteControllerInfoForDevice:(id)a3 completion:(id)a4;
- (void)diagnosticShow:(id)a3 completion:(id)a4;
- (void)getCloudPairedDevicesWithCompletionHandler:(id)a3;
- (void)getControllerInfoForDevice:(id)a3 completion:(id)a4;
- (void)getCurrentUserGivenNameWithCompletion:(id)a3;
- (void)getDistributedLoggingStatusWithCompletion:(id)a3;
- (void)invalidate;
- (void)readPrefKeys:(id)a3 source:(unsigned int)a4 completion:(id)a5;
- (void)recordEventWithDeviceIdentifier:(id)a3 initiator:(BOOL)a4 starting:(BOOL)a5 useCase:(unsigned int)a6;
- (void)recordEventWithStarting:(BOOL)a3 useCase:(unsigned int)a4;
- (void)setAppleAudioAccessoryLimitedLogging:(BOOL)a3 completion:(id)a4;
- (void)setClientID:(unsigned int)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setDistributedLoggingStatus:(unsigned int)a3 completion:(id)a4;
- (void)setErrorHandler:(id)a3;
- (void)setInterruptionHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setTestListenerEndpoint:(id)a3;
- (void)storeControllerInfo:(id)a3 completion:(id)a4;
- (void)writePrefKey:(id)a3 value:(id)a4 source:(unsigned int)a5 completion:(id)a6;
@end

@implementation CBUserController

- (void)recordEventWithStarting:(BOOL)a3 useCase:(unsigned int)a4
{
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __52__CBUserController_recordEventWithStarting_useCase___block_invoke;
  v5[3] = &unk_1E5E31428;
  unsigned int v6 = a4;
  v5[4] = self;
  BOOL v7 = a3;
  dispatch_async(dispatchQueue, v5);
}

void __52__CBUserController_recordEventWithStarting_useCase___block_invoke(uint64_t a1)
{
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy_;
  v20 = __Block_byref_object_dispose_;
  id v21 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __52__CBUserController_recordEventWithStarting_useCase___block_invoke_2;
  v14[3] = &unk_1E5E31400;
  v14[4] = &v16;
  int v15 = *(_DWORD *)(a1 + 40);
  v2 = (void (**)(void))MEMORY[0x1AD111AA0](v14);
  if ([*(id *)(a1 + 32) _ensureXPCStarted])
  {
    v9 = *(void **)(*(void *)(a1 + 32) + 40);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __52__CBUserController_recordEventWithStarting_useCase___block_invoke_3;
    v13[3] = &unk_1E5E313B0;
    v13[4] = &v16;
    v10 = [v9 remoteObjectProxyWithErrorHandler:v13];
    [v10 recordEventWithStarting:*(unsigned __int8 *)(a1 + 44) useCase:*(unsigned int *)(a1 + 40)];
  }
  else
  {
    uint64_t v11 = CBErrorF(-6753, (uint64_t)"Unable to establish connection to Bluetooth User Daemon", v3, v4, v5, v6, v7, v8, v12);
    v10 = (void *)v17[5];
    v17[5] = v11;
  }

  v2[2](v2);
  _Block_object_dispose(&v16, 8);
}

void __52__CBUserController_recordEventWithStarting_useCase___block_invoke_2(uint64_t a1)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)
    && gLogCategory_CBUserController <= 90
    && (gLogCategory_CBUserController != -1 || _LogCategory_Initialize()))
  {
    v1 = CUPrintNSError();
    LogPrintF_safe();
  }
}

- (BOOL)_ensureXPCStarted
{
  if (!self->_xpcCnx)
  {
    uint64_t v3 = self->_testListenerEndpoint;
    id v4 = objc_alloc(MEMORY[0x1E4F29268]);
    if (v3) {
      uint64_t v5 = (NSXPCConnection *)[v4 initWithListenerEndpoint:v3];
    }
    else {
      uint64_t v5 = (NSXPCConnection *)[v4 initWithMachServiceName:@"com.apple.bluetoothuser.xpc" options:0];
    }
    xpcCnx = self->_xpcCnx;
    self->_xpcCnx = v5;

    [(NSXPCConnection *)self->_xpcCnx _setQueue:self->_dispatchQueue];
    uint64_t v7 = CBUserControllerXPCInterface();
    [(NSXPCConnection *)self->_xpcCnx setExportedInterface:v7];

    [(NSXPCConnection *)self->_xpcCnx setExportedObject:self];
    id location = 0;
    objc_initWeak(&location, self);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __37__CBUserController__ensureXPCStarted__block_invoke;
    v14[3] = &unk_1E5E31270;
    objc_copyWeak(&v15, &location);
    [(NSXPCConnection *)self->_xpcCnx setInterruptionHandler:v14];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __37__CBUserController__ensureXPCStarted__block_invoke_2;
    v12[3] = &unk_1E5E31270;
    objc_copyWeak(&v13, &location);
    [(NSXPCConnection *)self->_xpcCnx setInvalidationHandler:v12];
    uint64_t v8 = CBUserControllerXPCInterface();
    [(NSXPCConnection *)self->_xpcCnx setRemoteObjectInterface:v8];

    [(NSXPCConnection *)self->_xpcCnx resume];
    if (gLogCategory_CBUserController <= 30
      && (gLogCategory_CBUserController != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
    v9 = (void (**)(void, void))MEMORY[0x1AD111AA0](self->_activateCompletion);
    id activateCompletion = self->_activateCompletion;
    self->_id activateCompletion = 0;

    if (v9) {
      v9[2](v9, 0);
    }

    objc_destroyWeak(&v13);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  return 1;
}

- (CBUserController)init
{
  v5.receiver = self;
  v5.super_class = (Class)CBUserController;
  v2 = [(CBUserController *)&v5 init];
  if (v2)
  {
    v2->_clientID = CBXPCGetNextClientID();
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x1E4F14428]);
    v2->_ucat = (LogCategory *)&gLogCategory_CBUserController;
    uint64_t v3 = v2;
  }

  return v2;
}

- (void)dealloc
{
  uint64_t v3 = (void (**)(void))MEMORY[0x1AD111AA0](self->_invalidationHandler, a2);
  if (!self->_invalidateCalled)
  {
    self->_invalidateCalled = 1;
    int var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
    objc_super v5 = self;
    objc_sync_enter(v5);
    uint64_t v6 = v5->_xpcCnx;
    uint64_t v7 = v6;
    if (v6) {
      [(NSXPCConnection *)v6 invalidate];
    }

    objc_sync_exit(v5);
    ucat = self->_ucat;
    if (ucat && (ucat->var3 & 0x40000) != 0)
    {
      LogCategory_Remove();
      self->_ucat = 0;
    }
    id interruptionHandler = v5->_interruptionHandler;
    v5->_id interruptionHandler = 0;

    id invalidationHandler = self->_invalidationHandler;
    self->_id invalidationHandler = 0;

    if (v3) {
      v3[2](v3);
    }
  }

  v11.receiver = self;
  v11.super_class = (Class)CBUserController;
  [(CBUserController *)&v11 dealloc];
}

- (void)activateWithCompletion:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  objc_sync_enter(v5);
  if (!v5->_activateCalled)
  {
    v5->_activateCalled = 1;
    uint64_t v6 = MEMORY[0x1AD111AA0](v4);
    id activateCompletion = v5->_activateCompletion;
    v5->_id activateCompletion = (id)v6;

    dispatchQueue = v5->_dispatchQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __43__CBUserController_activateWithCompletion___block_invoke;
    block[3] = &unk_1E5E31248;
    block[4] = v5;
    dispatch_async(dispatchQueue, block);
  }
  objc_sync_exit(v5);
}

uint64_t __43__CBUserController_activateWithCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _activate];
}

- (void)_activate
{
  if (self->_invalidateCalled)
  {
    NSErrorF();
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    int var0 = self->_ucat->var0;
    if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v8 = CUPrintNSError();
      LogPrintF_safe();
    }
    id v4 = (void (**)(void, void))MEMORY[0x1AD111AA0](self->_activateCompletion);
    id activateCompletion = self->_activateCompletion;
    self->_id activateCompletion = 0;

    if (v4)
    {
      ((void (**)(void, id))v4)[2](v4, v9);
    }
    else
    {
      uint64_t v6 = MEMORY[0x1AD111AA0](self->_errorHandler);
      uint64_t v7 = (void *)v6;
      if (v6) {
        (*(void (**)(uint64_t, id))(v6 + 16))(v6, v9);
      }
    }
  }
  else
  {
    [(CBUserController *)self _activateXPCStart:0];
  }
}

- (void)_activateXPCStart:(BOOL)a3
{
  int var0 = self->_ucat->var0;
  if (a3)
  {
    if (var0 > 30 || var0 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_11;
    }
  }
  else if (var0 > 30 || var0 == -1 && !_LogCategory_Initialize())
  {
LABEL_11:
    objc_super v5 = self;
    goto LABEL_9;
  }
  LogPrintF_safe();
  objc_super v5 = self;

LABEL_9:
  [(CBUserController *)v5 _ensureXPCStarted];
}

void __37__CBUserController__ensureXPCStarted__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _interrupted];
}

void __37__CBUserController__ensureXPCStarted__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _invalidated];
}

- (void)_interrupted
{
  if (gLogCategory_CBUserController <= 50
    && (gLogCategory_CBUserController != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
  uint64_t v3 = MEMORY[0x1AD111AA0](self->_interruptionHandler);
  id v4 = (void *)v3;
  if (v3) {
    (*(void (**)(uint64_t))(v3 + 16))(v3);
  }

  [(CBUserController *)self _activateXPCStart:1];
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __30__CBUserController_invalidate__block_invoke;
  block[3] = &unk_1E5E31248;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __30__CBUserController_invalidate__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (!*(unsigned char *)(v1 + 24))
  {
    uint64_t v2 = result;
    *(unsigned char *)(v1 + 24) = 1;
    if (!*(unsigned char *)(*(void *)(result + 32) + 25)
      && gLogCategory_CBUserController <= 30
      && (gLogCategory_CBUserController != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
    uint64_t v3 = *(id **)(v2 + 32);
    if (v3[5])
    {
      [v3[5] invalidate];
      uint64_t v3 = *(id **)(v2 + 32);
    }
    return [v3 _invalidated];
  }
  return result;
}

- (void)_invalidated
{
  if (!self->_invalidateDone)
  {
    if (!self->_invalidateCalled
      && gLogCategory_CBUserController <= 50
      && (gLogCategory_CBUserController != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
    uint64_t v3 = MEMORY[0x1AD111AA0](self->_invalidationHandler, a2);
    id v4 = (void *)v3;
    if (v3) {
      (*(void (**)(uint64_t))(v3 + 16))(v3);
    }

    id interruptionHandler = self->_interruptionHandler;
    self->_id interruptionHandler = 0;

    id invalidationHandler = self->_invalidationHandler;
    self->_id invalidationHandler = 0;

    xpcCnx = self->_xpcCnx;
    self->_xpcCnx = 0;

    self->_invalidateDone = 1;
    if (gLogCategory_CBUserController < 11
      && (gLogCategory_CBUserController != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
  }
}

- (void)diagnosticShow:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__CBUserController_diagnosticShow_completion___block_invoke;
  block[3] = &unk_1E5E312E8;
  id v12 = v6;
  id v13 = v7;
  block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(dispatchQueue, block);
}

void __46__CBUserController_diagnosticShow_completion___block_invoke(uint64_t a1)
{
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy_;
  v24 = __Block_byref_object_dispose_;
  id v25 = 0;
  uint64_t v1 = *(void **)(a1 + 48);
  if (v1)
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __46__CBUserController_diagnosticShow_completion___block_invoke_2;
    v17[3] = &unk_1E5E31298;
    v19 = &v20;
    id v18 = v1;
    uint64_t v3 = (void (**)(void))MEMORY[0x1AD111AA0](v17);
    if ([*(id *)(a1 + 32) _ensureXPCStarted])
    {
      id v10 = *(void **)(*(void *)(a1 + 32) + 40);
      if (v10)
      {
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __46__CBUserController_diagnosticShow_completion___block_invoke_3;
        v15[3] = &unk_1E5E312C0;
        id v16 = *(id *)(a1 + 48);
        objc_super v11 = [v10 remoteObjectProxyWithErrorHandler:v15];
        [v11 diagnosticShow:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];

        id v12 = v16;
LABEL_5:

        v3[2](v3);
        goto LABEL_6;
      }
      uint64_t v13 = CBErrorF(-6753, (uint64_t)"NO XPC", v4, v5, v6, v7, v8, v9, v14);
    }
    else
    {
      uint64_t v13 = CBErrorF(-6753, (uint64_t)"Unable to establish connection to Bluetooth User Daemon", v4, v5, v6, v7, v8, v9, v14);
    }
    id v12 = (void *)v21[5];
    v21[5] = v13;
    goto LABEL_5;
  }
  if (gLogCategory_CBUserController <= 90
    && (gLogCategory_CBUserController != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
LABEL_6:
  _Block_object_dispose(&v20, 8);
}

uint64_t __46__CBUserController_diagnosticShow_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (result)
  {
    if (gLogCategory_CBUserController <= 90
      && (gLogCategory_CBUserController != -1 || _LogCategory_Initialize()))
    {
      uint64_t v4 = CUPrintNSError();
      LogPrintF_safe();
    }
    uint64_t v3 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
    return v3();
  }
  return result;
}

uint64_t __46__CBUserController_diagnosticShow_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)appleAudioAccessoryLimitedLoggingWithCompletion:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __68__CBUserController_appleAudioAccessoryLimitedLoggingWithCompletion___block_invoke;
  v7[3] = &unk_1E5E310B8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __68__CBUserController_appleAudioAccessoryLimitedLoggingWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy_;
  v24 = __Block_byref_object_dispose_;
  id v25 = 0;
  uint64_t v1 = *(void **)(a1 + 40);
  if (v1)
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __68__CBUserController_appleAudioAccessoryLimitedLoggingWithCompletion___block_invoke_2;
    v17[3] = &unk_1E5E31298;
    v19 = &v20;
    id v18 = v1;
    uint64_t v3 = (void (**)(void))MEMORY[0x1AD111AA0](v17);
    if ([*(id *)(a1 + 32) _ensureXPCStarted])
    {
      id v10 = *(void **)(*(void *)(a1 + 32) + 40);
      if (v10)
      {
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __68__CBUserController_appleAudioAccessoryLimitedLoggingWithCompletion___block_invoke_3;
        v15[3] = &unk_1E5E312C0;
        id v16 = *(id *)(a1 + 40);
        objc_super v11 = [v10 remoteObjectProxyWithErrorHandler:v15];
        [v11 appleAudioAccessoryLimitedLoggingWithCompletion:*(void *)(a1 + 40)];

        id v12 = v16;
LABEL_5:

        v3[2](v3);
        goto LABEL_6;
      }
      uint64_t v13 = CBErrorF(-6753, (uint64_t)"NO XPC", v4, v5, v6, v7, v8, v9, v14);
    }
    else
    {
      uint64_t v13 = CBErrorF(-6753, (uint64_t)"Unable to establish connection to Bluetooth User Daemon", v4, v5, v6, v7, v8, v9, v14);
    }
    id v12 = (void *)v21[5];
    v21[5] = v13;
    goto LABEL_5;
  }
  if (gLogCategory_CBUserController <= 90
    && (gLogCategory_CBUserController != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
LABEL_6:
  _Block_object_dispose(&v20, 8);
}

uint64_t __68__CBUserController_appleAudioAccessoryLimitedLoggingWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (result)
  {
    if (gLogCategory_CBUserController <= 90
      && (gLogCategory_CBUserController != -1 || _LogCategory_Initialize()))
    {
      uint64_t v4 = CUPrintNSError();
      LogPrintF_safe();
    }
    uint64_t v3 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
    return v3();
  }
  return result;
}

uint64_t __68__CBUserController_appleAudioAccessoryLimitedLoggingWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setAppleAudioAccessoryLimitedLogging:(BOOL)a3 completion:(id)a4
{
  id v6 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__CBUserController_setAppleAudioAccessoryLimitedLogging_completion___block_invoke;
  block[3] = &unk_1E5E31310;
  block[4] = self;
  id v10 = v6;
  BOOL v11 = a3;
  id v8 = v6;
  dispatch_async(dispatchQueue, block);
}

void __68__CBUserController_setAppleAudioAccessoryLimitedLogging_completion___block_invoke(uint64_t a1)
{
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy_;
  v24 = __Block_byref_object_dispose_;
  id v25 = 0;
  uint64_t v1 = *(void **)(a1 + 40);
  if (v1)
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __68__CBUserController_setAppleAudioAccessoryLimitedLogging_completion___block_invoke_2;
    v17[3] = &unk_1E5E31298;
    v19 = &v20;
    id v18 = v1;
    uint64_t v3 = (void (**)(void))MEMORY[0x1AD111AA0](v17);
    if ([*(id *)(a1 + 32) _ensureXPCStarted])
    {
      id v10 = *(void **)(*(void *)(a1 + 32) + 40);
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __68__CBUserController_setAppleAudioAccessoryLimitedLogging_completion___block_invoke_3;
      v15[3] = &unk_1E5E312C0;
      id v16 = *(id *)(a1 + 40);
      BOOL v11 = [v10 remoteObjectProxyWithErrorHandler:v15];
      [v11 setAppleAudioAccessoryLimitedLogging:*(unsigned __int8 *)(a1 + 48) completion:*(void *)(a1 + 40)];

      id v12 = v16;
    }
    else
    {
      uint64_t v13 = CBErrorF(-6753, (uint64_t)"Unable to establish connection to Bluetooth User Daemon", v4, v5, v6, v7, v8, v9, v14);
      id v12 = (void *)v21[5];
      v21[5] = v13;
    }

    v3[2](v3);
  }
  else if (gLogCategory_CBUserController <= 90 {
         && (gLogCategory_CBUserController != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF_safe();
  }
  _Block_object_dispose(&v20, 8);
}

uint64_t __68__CBUserController_setAppleAudioAccessoryLimitedLogging_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (result)
  {
    if (gLogCategory_CBUserController <= 90
      && (gLogCategory_CBUserController != -1 || _LogCategory_Initialize()))
    {
      uint64_t v4 = CUPrintNSError();
      LogPrintF_safe();
    }
    uint64_t v3 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
    return v3();
  }
  return result;
}

uint64_t __68__CBUserController_setAppleAudioAccessoryLimitedLogging_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getDistributedLoggingStatusWithCompletion:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__CBUserController_getDistributedLoggingStatusWithCompletion___block_invoke;
  v7[3] = &unk_1E5E310B8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __62__CBUserController_getDistributedLoggingStatusWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy_;
  v24 = __Block_byref_object_dispose_;
  id v25 = 0;
  uint64_t v1 = *(void **)(a1 + 40);
  if (v1)
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __62__CBUserController_getDistributedLoggingStatusWithCompletion___block_invoke_2;
    v17[3] = &unk_1E5E31298;
    v19 = &v20;
    id v18 = v1;
    uint64_t v3 = (void (**)(void))MEMORY[0x1AD111AA0](v17);
    if ([*(id *)(a1 + 32) _ensureXPCStarted])
    {
      id v10 = *(void **)(*(void *)(a1 + 32) + 40);
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __62__CBUserController_getDistributedLoggingStatusWithCompletion___block_invoke_3;
      v15[3] = &unk_1E5E312C0;
      id v16 = *(id *)(a1 + 40);
      BOOL v11 = [v10 remoteObjectProxyWithErrorHandler:v15];
      [v11 getDistributedLoggingStatusWithCompletion:*(void *)(a1 + 40)];

      id v12 = v16;
    }
    else
    {
      uint64_t v13 = CBErrorF(-6753, (uint64_t)"Unable to establish connection to Bluetooth User Daemon", v4, v5, v6, v7, v8, v9, v14);
      id v12 = (void *)v21[5];
      v21[5] = v13;
    }

    v3[2](v3);
  }
  else if (gLogCategory_CBUserController <= 90 {
         && (gLogCategory_CBUserController != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF_safe();
  }
  _Block_object_dispose(&v20, 8);
}

uint64_t __62__CBUserController_getDistributedLoggingStatusWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (result)
  {
    if (gLogCategory_CBUserController <= 90
      && (gLogCategory_CBUserController != -1 || _LogCategory_Initialize()))
    {
      uint64_t v4 = CUPrintNSError();
      LogPrintF_safe();
    }
    uint64_t v3 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
    return v3();
  }
  return result;
}

uint64_t __62__CBUserController_getDistributedLoggingStatusWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setDistributedLoggingStatus:(unsigned int)a3 completion:(id)a4
{
  id v6 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__CBUserController_setDistributedLoggingStatus_completion___block_invoke;
  block[3] = &unk_1E5E31338;
  block[4] = self;
  id v10 = v6;
  unsigned int v11 = a3;
  id v8 = v6;
  dispatch_async(dispatchQueue, block);
}

void __59__CBUserController_setDistributedLoggingStatus_completion___block_invoke(uint64_t a1)
{
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy_;
  v24 = __Block_byref_object_dispose_;
  id v25 = 0;
  uint64_t v1 = *(void **)(a1 + 40);
  if (v1)
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __59__CBUserController_setDistributedLoggingStatus_completion___block_invoke_2;
    v17[3] = &unk_1E5E31298;
    v19 = &v20;
    id v18 = v1;
    uint64_t v3 = (void (**)(void))MEMORY[0x1AD111AA0](v17);
    if ([*(id *)(a1 + 32) _ensureXPCStarted])
    {
      id v10 = *(void **)(*(void *)(a1 + 32) + 40);
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __59__CBUserController_setDistributedLoggingStatus_completion___block_invoke_3;
      v15[3] = &unk_1E5E312C0;
      id v16 = *(id *)(a1 + 40);
      unsigned int v11 = [v10 remoteObjectProxyWithErrorHandler:v15];
      [v11 setDistributedLoggingStatus:*(unsigned int *)(a1 + 48) completion:*(void *)(a1 + 40)];

      id v12 = v16;
    }
    else
    {
      uint64_t v13 = CBErrorF(-6753, (uint64_t)"Unable to establish connection to Bluetooth User Daemon", v4, v5, v6, v7, v8, v9, v14);
      id v12 = (void *)v21[5];
      v21[5] = v13;
    }

    v3[2](v3);
  }
  else if (gLogCategory_CBUserController <= 90 {
         && (gLogCategory_CBUserController != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF_safe();
  }
  _Block_object_dispose(&v20, 8);
}

uint64_t __59__CBUserController_setDistributedLoggingStatus_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (result)
  {
    if (gLogCategory_CBUserController <= 90
      && (gLogCategory_CBUserController != -1 || _LogCategory_Initialize()))
    {
      uint64_t v4 = CUPrintNSError();
      LogPrintF_safe();
    }
    uint64_t v3 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
    return v3();
  }
  return result;
}

uint64_t __59__CBUserController_setDistributedLoggingStatus_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getCurrentUserGivenNameWithCompletion:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__CBUserController_getCurrentUserGivenNameWithCompletion___block_invoke;
  v7[3] = &unk_1E5E310B8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __58__CBUserController_getCurrentUserGivenNameWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy_;
  v24 = __Block_byref_object_dispose_;
  id v25 = 0;
  uint64_t v1 = *(void **)(a1 + 40);
  if (v1)
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __58__CBUserController_getCurrentUserGivenNameWithCompletion___block_invoke_2;
    v17[3] = &unk_1E5E31298;
    v19 = &v20;
    id v18 = v1;
    uint64_t v3 = (void (**)(void))MEMORY[0x1AD111AA0](v17);
    if ([*(id *)(a1 + 32) _ensureXPCStarted])
    {
      id v10 = *(void **)(*(void *)(a1 + 32) + 40);
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __58__CBUserController_getCurrentUserGivenNameWithCompletion___block_invoke_3;
      v15[3] = &unk_1E5E312C0;
      id v16 = *(id *)(a1 + 40);
      unsigned int v11 = [v10 remoteObjectProxyWithErrorHandler:v15];
      [v11 getCurrentUserGivenNameWithCompletion:*(void *)(a1 + 40)];

      id v12 = v16;
    }
    else
    {
      uint64_t v13 = CBErrorF(-6753, (uint64_t)"Unable to establish connection to Bluetooth User Daemon", v4, v5, v6, v7, v8, v9, v14);
      id v12 = (void *)v21[5];
      v21[5] = v13;
    }

    v3[2](v3);
  }
  else if (gLogCategory_CBUserController <= 90 {
         && (gLogCategory_CBUserController != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF_safe();
  }
  _Block_object_dispose(&v20, 8);
}

uint64_t __58__CBUserController_getCurrentUserGivenNameWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (result)
  {
    if (gLogCategory_CBUserController <= 90
      && (gLogCategory_CBUserController != -1 || _LogCategory_Initialize()))
    {
      uint64_t v4 = CUPrintNSError();
      LogPrintF_safe();
    }
    uint64_t v3 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
    return v3();
  }
  return result;
}

uint64_t __58__CBUserController_getCurrentUserGivenNameWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getControllerInfoForDevice:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__CBUserController_getControllerInfoForDevice_completion___block_invoke;
  block[3] = &unk_1E5E312E8;
  uint64_t v13 = self;
  id v14 = v7;
  id v12 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(dispatchQueue, block);
}

void __58__CBUserController_getControllerInfoForDevice_completion___block_invoke(id *a1)
{
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  id v25 = __Block_byref_object_copy_;
  v26 = __Block_byref_object_dispose_;
  id v27 = 0;
  if (a1[6])
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __58__CBUserController_getControllerInfoForDevice_completion___block_invoke_2;
    v18[3] = &unk_1E5E31360;
    id v21 = &v22;
    id v19 = a1[4];
    id v20 = a1[6];
    uint64_t v2 = (void (**)(void))MEMORY[0x1AD111AA0](v18);
    if ([a1[5] _ensureXPCStarted])
    {
      id v9 = (void *)*((void *)a1[5] + 5);
      uint64_t v13 = MEMORY[0x1E4F143A8];
      uint64_t v14 = 3221225472;
      id v15 = __58__CBUserController_getControllerInfoForDevice_completion___block_invoke_3;
      id v16 = &unk_1E5E312C0;
      id v17 = a1[6];
      id v10 = [v9 remoteObjectProxyWithErrorHandler:&v13];
      objc_msgSend(v10, "getControllerInfoForDevice:completion:", a1[4], a1[6], v13, v14, v15, v16);

      unsigned int v11 = v17;
    }
    else
    {
      uint64_t v12 = CBErrorF(-6753, (uint64_t)"Unable to establish connection to Bluetooth User Daemon", v3, v4, v5, v6, v7, v8, v13);
      unsigned int v11 = (void *)v23[5];
      v23[5] = v12;
    }

    v2[2](v2);
  }
  else if (gLogCategory_CBUserController <= 90 {
         && (gLogCategory_CBUserController != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF_safe();
  }
  _Block_object_dispose(&v22, 8);
}

uint64_t __58__CBUserController_getControllerInfoForDevice_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  if (result)
  {
    if (gLogCategory_CBUserController <= 90
      && (gLogCategory_CBUserController != -1 || _LogCategory_Initialize()))
    {
      uint64_t v4 = CUPrintNSError();
      LogPrintF_safe();
    }
    uint64_t v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
    return v3();
  }
  return result;
}

uint64_t __58__CBUserController_getControllerInfoForDevice_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)storeControllerInfo:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__CBUserController_storeControllerInfo_completion___block_invoke;
  block[3] = &unk_1E5E312E8;
  id v12 = v6;
  id v13 = v7;
  void block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(dispatchQueue, block);
}

void __51__CBUserController_storeControllerInfo_completion___block_invoke(uint64_t a1)
{
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy_;
  uint64_t v24 = __Block_byref_object_dispose_;
  id v25 = 0;
  uint64_t v1 = *(void **)(a1 + 48);
  if (v1)
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __51__CBUserController_storeControllerInfo_completion___block_invoke_2;
    v17[3] = &unk_1E5E31298;
    id v19 = &v20;
    id v18 = v1;
    uint64_t v3 = (void (**)(void))MEMORY[0x1AD111AA0](v17);
    if ([*(id *)(a1 + 32) _ensureXPCStarted])
    {
      id v10 = *(void **)(*(void *)(a1 + 32) + 40);
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __51__CBUserController_storeControllerInfo_completion___block_invoke_3;
      v15[3] = &unk_1E5E312C0;
      id v16 = *(id *)(a1 + 48);
      unsigned int v11 = [v10 remoteObjectProxyWithErrorHandler:v15];
      [v11 storeControllerInfo:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];

      id v12 = v16;
    }
    else
    {
      uint64_t v13 = CBErrorF(-6753, (uint64_t)"Unable to establish connection to Bluetooth User Daemon", v4, v5, v6, v7, v8, v9, v14);
      id v12 = (void *)v21[5];
      v21[5] = v13;
    }

    v3[2](v3);
  }
  else if (gLogCategory_CBUserController <= 90 {
         && (gLogCategory_CBUserController != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF_safe();
  }
  _Block_object_dispose(&v20, 8);
}

uint64_t __51__CBUserController_storeControllerInfo_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (result)
  {
    if (gLogCategory_CBUserController <= 90
      && (gLogCategory_CBUserController != -1 || _LogCategory_Initialize()))
    {
      uint64_t v4 = CUPrintNSError();
      LogPrintF_safe();
    }
    uint64_t v3 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
    return v3();
  }
  return result;
}

uint64_t __51__CBUserController_storeControllerInfo_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getCloudPairedDevicesWithCompletionHandler:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __63__CBUserController_getCloudPairedDevicesWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5E310B8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __63__CBUserController_getCloudPairedDevicesWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy_;
  uint64_t v24 = __Block_byref_object_dispose_;
  id v25 = 0;
  uint64_t v1 = *(void **)(a1 + 40);
  if (v1)
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __63__CBUserController_getCloudPairedDevicesWithCompletionHandler___block_invoke_2;
    v17[3] = &unk_1E5E31298;
    id v19 = &v20;
    id v18 = v1;
    uint64_t v3 = (void (**)(void))MEMORY[0x1AD111AA0](v17);
    if ([*(id *)(a1 + 32) _ensureXPCStarted])
    {
      id v10 = *(void **)(*(void *)(a1 + 32) + 40);
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __63__CBUserController_getCloudPairedDevicesWithCompletionHandler___block_invoke_3;
      v15[3] = &unk_1E5E312C0;
      id v16 = *(id *)(a1 + 40);
      unsigned int v11 = [v10 remoteObjectProxyWithErrorHandler:v15];
      [v11 getCloudPairedDevicesWithCompletionHandler:*(void *)(a1 + 40)];

      id v12 = v16;
    }
    else
    {
      uint64_t v13 = CBErrorF(-6753, (uint64_t)"Unable to establish connection to Bluetooth User Daemon", v4, v5, v6, v7, v8, v9, v14);
      id v12 = (void *)v21[5];
      v21[5] = v13;
    }

    v3[2](v3);
  }
  else if (gLogCategory_CBUserController <= 90 {
         && (gLogCategory_CBUserController != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF_safe();
  }
  _Block_object_dispose(&v20, 8);
}

uint64_t __63__CBUserController_getCloudPairedDevicesWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (result)
  {
    if (gLogCategory_CBUserController <= 90
      && (gLogCategory_CBUserController != -1 || _LogCategory_Initialize()))
    {
      uint64_t v4 = CUPrintNSError();
      LogPrintF_safe();
    }
    uint64_t v3 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
    return v3();
  }
  return result;
}

uint64_t __63__CBUserController_getCloudPairedDevicesWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)deleteControllerInfoForDevice:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__CBUserController_deleteControllerInfoForDevice_completion___block_invoke;
  block[3] = &unk_1E5E312E8;
  id v12 = v6;
  id v13 = v7;
  void block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(dispatchQueue, block);
}

void __61__CBUserController_deleteControllerInfoForDevice_completion___block_invoke(uint64_t a1)
{
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy_;
  uint64_t v24 = __Block_byref_object_dispose_;
  id v25 = 0;
  uint64_t v1 = *(void **)(a1 + 48);
  if (v1)
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __61__CBUserController_deleteControllerInfoForDevice_completion___block_invoke_2;
    v17[3] = &unk_1E5E31298;
    id v19 = &v20;
    id v18 = v1;
    uint64_t v3 = (void (**)(void))MEMORY[0x1AD111AA0](v17);
    if ([*(id *)(a1 + 32) _ensureXPCStarted])
    {
      id v10 = *(void **)(*(void *)(a1 + 32) + 40);
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __61__CBUserController_deleteControllerInfoForDevice_completion___block_invoke_3;
      v15[3] = &unk_1E5E312C0;
      id v16 = *(id *)(a1 + 48);
      unsigned int v11 = [v10 remoteObjectProxyWithErrorHandler:v15];
      [v11 deleteControllerInfoForDevice:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];

      id v12 = v16;
    }
    else
    {
      uint64_t v13 = CBErrorF(-6753, (uint64_t)"Unable to establish connection to Bluetooth User Daemon", v4, v5, v6, v7, v8, v9, v14);
      id v12 = (void *)v21[5];
      v21[5] = v13;
    }

    v3[2](v3);
  }
  else if (gLogCategory_CBUserController <= 90 {
         && (gLogCategory_CBUserController != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF_safe();
  }
  _Block_object_dispose(&v20, 8);
}

uint64_t __61__CBUserController_deleteControllerInfoForDevice_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (result)
  {
    if (gLogCategory_CBUserController <= 90
      && (gLogCategory_CBUserController != -1 || _LogCategory_Initialize()))
    {
      uint64_t v4 = CUPrintNSError();
      LogPrintF_safe();
    }
    uint64_t v3 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
    return v3();
  }
  return result;
}

uint64_t __61__CBUserController_deleteControllerInfoForDevice_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)recordEventWithDeviceIdentifier:(id)a3 initiator:(BOOL)a4 starting:(BOOL)a5 useCase:(unsigned int)a6
{
  id v10 = a3;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__CBUserController_recordEventWithDeviceIdentifier_initiator_starting_useCase___block_invoke;
  block[3] = &unk_1E5E313D8;
  id v14 = v10;
  id v15 = self;
  BOOL v17 = a4;
  BOOL v18 = a5;
  unsigned int v16 = a6;
  id v12 = v10;
  dispatch_async(dispatchQueue, block);
}

void __79__CBUserController_recordEventWithDeviceIdentifier_initiator_starting_useCase___block_invoke(uint64_t a1)
{
  uint64_t v17 = 0;
  BOOL v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy_;
  id v21 = __Block_byref_object_dispose_;
  id v22 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __79__CBUserController_recordEventWithDeviceIdentifier_initiator_starting_useCase___block_invoke_2;
  v14[3] = &unk_1E5E31388;
  unsigned int v16 = &v17;
  id v15 = *(id *)(a1 + 32);
  uint64_t v2 = (void (**)(void))MEMORY[0x1AD111AA0](v14);
  if ([*(id *)(a1 + 40) _ensureXPCStarted])
  {
    uint64_t v9 = *(void **)(*(void *)(a1 + 40) + 40);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __79__CBUserController_recordEventWithDeviceIdentifier_initiator_starting_useCase___block_invoke_3;
    v13[3] = &unk_1E5E313B0;
    v13[4] = &v17;
    id v10 = [v9 remoteObjectProxyWithErrorHandler:v13];
    [v10 recordEventWithDeviceIdentifier:*(void *)(a1 + 32) initiator:*(unsigned __int8 *)(a1 + 52) starting:*(unsigned __int8 *)(a1 + 53) useCase:*(unsigned int *)(a1 + 48)];
  }
  else
  {
    uint64_t v11 = CBErrorF(-6753, (uint64_t)"Unable to establish connection to Bluetooth User Daemon", v3, v4, v5, v6, v7, v8, v12);
    id v10 = (void *)v18[5];
    v18[5] = v11;
  }

  v2[2](v2);
  _Block_object_dispose(&v17, 8);
}

void __79__CBUserController_recordEventWithDeviceIdentifier_initiator_starting_useCase___block_invoke_2(uint64_t a1)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)
    && gLogCategory_CBUserController <= 90
    && (gLogCategory_CBUserController != -1 || _LogCategory_Initialize()))
  {
    uint64_t v1 = CUPrintNSError();
    LogPrintF_safe();
  }
}

void __79__CBUserController_recordEventWithDeviceIdentifier_initiator_starting_useCase___block_invoke_3(uint64_t a1, void *a2)
{
}

void __52__CBUserController_recordEventWithStarting_useCase___block_invoke_3(uint64_t a1, void *a2)
{
}

- (void)readPrefKeys:(id)a3 source:(unsigned int)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  dispatchQueue = self->_dispatchQueue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __51__CBUserController_readPrefKeys_source_completion___block_invoke;
  v13[3] = &unk_1E5E31450;
  id v14 = v8;
  id v15 = self;
  unsigned int v17 = a4;
  id v16 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(dispatchQueue, v13);
}

void __51__CBUserController_readPrefKeys_source_completion___block_invoke(uint64_t a1)
{
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = __Block_byref_object_copy_;
  id v25 = __Block_byref_object_dispose_;
  id v26 = 0;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __51__CBUserController_readPrefKeys_source_completion___block_invoke_2;
  v18[3] = &unk_1E5E31388;
  uint64_t v20 = &v21;
  id v19 = *(id *)(a1 + 32);
  uint64_t v2 = (void (**)(void))MEMORY[0x1AD111AA0](v18);
  if ([*(id *)(a1 + 40) _ensureXPCStarted])
  {
    id v9 = *(void **)(*(void *)(a1 + 40) + 40);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __51__CBUserController_readPrefKeys_source_completion___block_invoke_3;
    v17[3] = &unk_1E5E313B0;
    void v17[4] = &v21;
    id v10 = [v9 synchronousRemoteObjectProxyWithErrorHandler:v17];
    uint64_t v11 = *(void *)(a1 + 32);
    uint64_t v12 = *(unsigned int *)(a1 + 56);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = (uint64_t)__51__CBUserController_readPrefKeys_source_completion___block_invoke_4;
    v15[3] = (uint64_t)&unk_1E5E310E0;
    id v16 = *(id *)(a1 + 48);
    [v10 readPrefKeys:v11 source:v12 completion:v15];

    uint64_t v13 = v16;
  }
  else
  {
    uint64_t v14 = CBErrorF(-6753, (uint64_t)"Unable to establish connection to Bluetooth User Daemon", v3, v4, v5, v6, v7, v8, v15[0]);
    uint64_t v13 = (void *)v22[5];
    v22[5] = v14;
  }

  v2[2](v2);
  _Block_object_dispose(&v21, 8);
}

void __51__CBUserController_readPrefKeys_source_completion___block_invoke_2(uint64_t a1)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)
    && gLogCategory_CBUserController <= 90
    && (gLogCategory_CBUserController != -1 || _LogCategory_Initialize()))
  {
    uint64_t v1 = CUPrintNSError();
    LogPrintF_safe();
  }
}

void __51__CBUserController_readPrefKeys_source_completion___block_invoke_3(uint64_t a1, void *a2)
{
}

uint64_t __51__CBUserController_readPrefKeys_source_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)writePrefKey:(id)a3 value:(id)a4 source:(unsigned int)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__CBUserController_writePrefKey_value_source_completion___block_invoke;
  block[3] = &unk_1E5E31478;
  id v18 = v10;
  id v19 = self;
  unsigned int v22 = a5;
  id v20 = v11;
  id v21 = v12;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_async(dispatchQueue, block);
}

void __57__CBUserController_writePrefKey_value_source_completion___block_invoke(uint64_t a1)
{
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000;
  id v25 = __Block_byref_object_copy_;
  id v26 = __Block_byref_object_dispose_;
  id v27 = 0;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __57__CBUserController_writePrefKey_value_source_completion___block_invoke_2;
  v19[3] = &unk_1E5E31388;
  id v21 = &v22;
  id v20 = *(id *)(a1 + 32);
  uint64_t v2 = (void (**)(void))MEMORY[0x1AD111AA0](v19);
  if ([*(id *)(a1 + 40) _ensureXPCStarted])
  {
    id v9 = *(void **)(*(void *)(a1 + 40) + 40);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __57__CBUserController_writePrefKey_value_source_completion___block_invoke_3;
    v18[3] = &unk_1E5E313B0;
    void v18[4] = &v22;
    id v10 = [v9 synchronousRemoteObjectProxyWithErrorHandler:v18];
    uint64_t v11 = *(void *)(a1 + 32);
    uint64_t v12 = *(unsigned int *)(a1 + 64);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = (uint64_t)__57__CBUserController_writePrefKey_value_source_completion___block_invoke_4;
    v16[3] = (uint64_t)&unk_1E5E312C0;
    uint64_t v13 = *(void *)(a1 + 48);
    id v17 = *(id *)(a1 + 56);
    [v10 writePrefKey:v11 value:v13 source:v12 completion:v16];

    id v14 = v17;
  }
  else
  {
    uint64_t v15 = CBErrorF(-6753, (uint64_t)"Unable to establish connection to Bluetooth User Daemon", v3, v4, v5, v6, v7, v8, v16[0]);
    id v14 = (void *)v23[5];
    v23[5] = v15;
  }

  v2[2](v2);
  _Block_object_dispose(&v22, 8);
}

void __57__CBUserController_writePrefKey_value_source_completion___block_invoke_2(uint64_t a1)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)
    && gLogCategory_CBUserController <= 90
    && (gLogCategory_CBUserController != -1 || _LogCategory_Initialize()))
  {
    uint64_t v1 = CUPrintNSError();
    LogPrintF_safe();
  }
}

void __57__CBUserController_writePrefKey_value_source_completion___block_invoke_3(uint64_t a1, void *a2)
{
}

uint64_t __57__CBUserController_writePrefKey_value_source_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (id)readPrefKeys:(id)a3 source:(unsigned int)a4 error:(id *)a5
{
  uint64_t v6 = *(void *)&a4;
  id v7 = a3;
  uint64_t v26 = 0;
  id v27 = &v26;
  uint64_t v28 = 0x3032000000;
  v29 = __Block_byref_object_copy_;
  v30 = __Block_byref_object_dispose_;
  id v31 = 0;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = __Block_byref_object_copy_;
  v24[4] = __Block_byref_object_dispose_;
  id v25 = 0;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __46__CBUserController_readPrefKeys_source_error___block_invoke;
  v20[3] = &unk_1E5E314A0;
  uint64_t v22 = v24;
  id v8 = v7;
  id v21 = v8;
  uint64_t v23 = a5;
  id v9 = (void (**)(void))MEMORY[0x1AD111AA0](v20);
  id v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v11 = dispatch_queue_create("CBUserController-ReadPrefs", v10);

  uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.bluetoothuser.xpc" options:0];
  [v12 _setQueue:v11];
  uint64_t v13 = CBUserControllerXPCInterface();
  [v12 setExportedInterface:v13];

  id v14 = CBUserControllerXPCInterface();
  [v12 setRemoteObjectInterface:v14];

  [v12 resume];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __46__CBUserController_readPrefKeys_source_error___block_invoke_2;
  v19[3] = &unk_1E5E313B0;
  void v19[4] = v24;
  uint64_t v15 = [v12 synchronousRemoteObjectProxyWithErrorHandler:v19];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __46__CBUserController_readPrefKeys_source_error___block_invoke_3;
  v18[3] = &unk_1E5E314C8;
  void v18[4] = &v26;
  [v15 readPrefKeys:v8 source:v6 completion:v18];

  id v16 = (id)v27[5];
  v9[2](v9);

  _Block_object_dispose(v24, 8);
  _Block_object_dispose(&v26, 8);

  return v16;
}

void __46__CBUserController_readPrefKeys_source_error___block_invoke(uint64_t a1)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    if (gLogCategory_CBUserController <= 90
      && (gLogCategory_CBUserController != -1 || _LogCategory_Initialize()))
    {
      uint64_t v2 = CUPrintNSError();
      LogPrintF_safe();
    }
    if (*(void *)(a1 + 48)) {
      **(void **)(a1 + 48) = *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    }
  }
}

void __46__CBUserController_readPrefKeys_source_error___block_invoke_2(uint64_t a1, void *a2)
{
}

void __46__CBUserController_readPrefKeys_source_error___block_invoke_3(uint64_t a1, void *a2)
{
}

+ (BOOL)writePrefKey:(id)a3 value:(id)a4 source:(unsigned int)a5 error:(id *)a6
{
  uint64_t v7 = *(void *)&a5;
  id v9 = a3;
  id v10 = a4;
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x3032000000;
  v30[3] = __Block_byref_object_copy_;
  v30[4] = __Block_byref_object_dispose_;
  id v31 = 0;
  uint64_t v26 = 0;
  id v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __52__CBUserController_writePrefKey_value_source_error___block_invoke;
  v22[3] = &unk_1E5E314A0;
  uint64_t v24 = v30;
  id v11 = v9;
  id v23 = v11;
  id v25 = a6;
  uint64_t v12 = (void (**)(void))MEMORY[0x1AD111AA0](v22);
  uint64_t v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v14 = dispatch_queue_create("CBUserController-WritePrefs", v13);

  uint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.bluetoothuser.xpc" options:0];
  [v15 _setQueue:v14];
  id v16 = CBUserControllerXPCInterface();
  [v15 setExportedInterface:v16];

  id v17 = CBUserControllerXPCInterface();
  [v15 setRemoteObjectInterface:v17];

  [v15 resume];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __52__CBUserController_writePrefKey_value_source_error___block_invoke_2;
  v21[3] = &unk_1E5E313B0;
  v21[4] = v30;
  id v18 = [v15 synchronousRemoteObjectProxyWithErrorHandler:v21];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __52__CBUserController_writePrefKey_value_source_error___block_invoke_3;
  v20[3] = &unk_1E5E313B0;
  void v20[4] = &v26;
  [v18 writePrefKey:v11 value:v10 source:v7 completion:v20];

  LODWORD(v7) = *((unsigned __int8 *)v27 + 24);
  v12[2](v12);

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(v30, 8);

  return v7 != 0;
}

void __52__CBUserController_writePrefKey_value_source_error___block_invoke(uint64_t a1)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    if (gLogCategory_CBUserController <= 90
      && (gLogCategory_CBUserController != -1 || _LogCategory_Initialize()))
    {
      uint64_t v2 = CUPrintNSError();
      LogPrintF_safe();
    }
    if (*(void *)(a1 + 48)) {
      **(void **)(a1 + 48) = *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    }
  }
}

void __52__CBUserController_writePrefKey_value_source_error___block_invoke_2(uint64_t a1, void *a2)
{
}

uint64_t __52__CBUserController_writePrefKey_value_source_error___block_invoke_3(uint64_t result, uint64_t a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2 == 0;
  return result;
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

- (unsigned)clientID
{
  return self->_clientID;
}

- (void)setClientID:(unsigned int)a3
{
  self->_clientID = a3;
}

- (NSXPCListenerEndpoint)testListenerEndpoint
{
  return self->_testListenerEndpoint;
}

- (void)setTestListenerEndpoint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testListenerEndpoint, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong(&self->_errorHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_xpcCnx, 0);

  objc_storeStrong(&self->_activateCompletion, 0);
}

@end
@interface CUBLEServer
- (CUBLEServer)init;
- (NSString)label;
- (OS_dispatch_queue)dispatchQueue;
- (id)connectionEndedHandler;
- (id)connectionStartedHandler;
- (id)invalidationHandler;
- (unsigned)listenPSM;
- (unsigned)listeningPSM;
- (void)_activateWithCompletion:(id)a3;
- (void)_handleConnectionInvalidated:(id)a3;
- (void)_invalidate;
- (void)_startIfNeeded;
- (void)activateWithCompletion:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)peripheralManager:(id)a3 didOpenL2CAPChannel:(id)a4 error:(id)a5;
- (void)peripheralManager:(id)a3 didPublishL2CAPChannel:(unsigned __int16)a4 error:(id)a5;
- (void)peripheralManager:(id)a3 didUnpublishL2CAPChannel:(unsigned __int16)a4 error:(id)a5;
- (void)peripheralManagerDidUpdateState:(id)a3;
- (void)setConnectionEndedHandler:(id)a3;
- (void)setConnectionStartedHandler:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setLabel:(id)a3;
- (void)setListenPSM:(unsigned __int16)a3;
- (void)setListeningPSM:(unsigned __int16)a3;
@end

@implementation CUBLEServer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong(&self->_connectionEndedHandler, 0);
  objc_storeStrong(&self->_connectionStartedHandler, 0);
  objc_storeStrong((id *)&self->_peripheralManager, 0);
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong(&self->_activateCompletion, 0);
}

- (void)setListeningPSM:(unsigned __int16)a3
{
  self->_listeningPSM = a3;
}

- (unsigned)listeningPSM
{
  return self->_listeningPSM;
}

- (void)setListenPSM:(unsigned __int16)a3
{
  self->_listenPSM = a3;
}

- (unsigned)listenPSM
{
  return self->_listenPSM;
}

- (NSString)label
{
  return self->_label;
}

- (void)setInvalidationHandler:(id)a3
{
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setDispatchQueue:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setConnectionEndedHandler:(id)a3
{
}

- (id)connectionEndedHandler
{
  return self->_connectionEndedHandler;
}

- (void)setConnectionStartedHandler:(id)a3
{
}

- (id)connectionStartedHandler
{
  return self->_connectionStartedHandler;
}

- (void)_handleConnectionInvalidated:(id)a3
{
  id v14 = a3;
  v4 = [v14 l2capChannel];
  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 != -1)
    {
LABEL_3:
      unsigned int v6 = [v4 PSM];
      v7 = [v4 peer];
      v13 = [v7 identifier];
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBLEServer _handleConnectionInvalidated:]", 0x1Eu, (uint64_t)"Connection ended PSM 0x%04X, peer %@\n", v8, v9, v10, v11, v6);

      goto LABEL_5;
    }
    if (_LogCategory_Initialize((uint64_t)self->_ucat, 0x1Eu))
    {
      ucat = self->_ucat;
      goto LABEL_3;
    }
  }
LABEL_5:
  [(NSMutableSet *)self->_connections removeObject:v14];
  connectionEndedHandler = (void (**)(id, id, void))self->_connectionEndedHandler;
  if (connectionEndedHandler) {
    connectionEndedHandler[2](connectionEndedHandler, v14, 0);
  }
}

- (void)peripheralManager:(id)a3 didOpenL2CAPChannel:(id)a4 error:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!v8)
  {
    id v18 = v7;
    ucat = self->_ucat;
    int var0 = ucat->var0;
    if (v18)
    {
      if (var0 > 30) {
        goto LABEL_15;
      }
      if (var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)self->_ucat, 0x1Eu))
        {
LABEL_15:
          v27 = objc_alloc_init(CUBLEConnection);
          [(CUBLEConnection *)v27 setDispatchQueue:self->_dispatchQueue];
          [(CUBLEConnection *)v27 setL2capChannel:v18];
          if (self->_label) {
            -[CUBLEConnection setLabel:](v27, "setLabel:");
          }
          v43[0] = MEMORY[0x1E4F143A8];
          v43[1] = 3221225472;
          v43[2] = __59__CUBLEServer_peripheralManager_didOpenL2CAPChannel_error___block_invoke;
          v43[3] = &unk_1E55BF170;
          v43[4] = self;
          v28 = v27;
          v44 = v28;
          [(CUBLEConnection *)v28 setServerInvalidationHandler:v43];
          id v42 = 0;
          BOOL v29 = [(CUBLEConnection *)v28 activateDirectAndReturnError:&v42];
          id v34 = v42;
          if (v29)
          {
            connections = self->_connections;
            if (!connections)
            {
              v36 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
              v37 = self->_connections;
              self->_connections = v36;

              connections = self->_connections;
            }
            [(NSMutableSet *)connections addObject:v28];
            connectionStartedHandler = (void (**)(id, id))self->_connectionStartedHandler;
            if (connectionStartedHandler) {
              connectionStartedHandler[2](connectionStartedHandler, v28);
            }
            goto LABEL_29;
          }
          v39 = self->_ucat;
          if (v39->var0 <= 90)
          {
            if (v39->var0 == -1)
            {
              if (!_LogCategory_Initialize((uint64_t)v39, 0x5Au)) {
                goto LABEL_28;
              }
              v39 = self->_ucat;
            }
            LogPrintF((uint64_t)v39, (uint64_t)"-[CUBLEServer peripheralManager:didOpenL2CAPChannel:error:]", 0x5Au, (uint64_t)"### Activate accepted connection failed: %{error}\n", v30, v31, v32, v33, (uint64_t)v34);
          }
LABEL_28:
          [(CUBLEConnection *)v28 invalidate];
LABEL_29:

          goto LABEL_30;
        }
        ucat = self->_ucat;
      }
      unsigned int v21 = [v18 PSM];
      v22 = [v18 peer];
      v41 = [v22 identifier];
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBLEServer peripheralManager:didOpenL2CAPChannel:error:]", 0x1Eu, (uint64_t)"L2CAP channel opened PSM 0x%04X, peer %@: %{error}\n", v23, v24, v25, v26, v21);

      goto LABEL_15;
    }
    if (var0 <= 90)
    {
      if (var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)self->_ucat, 0x5Au)) {
          goto LABEL_30;
        }
        ucat = self->_ucat;
      }
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBLEServer peripheralManager:didOpenL2CAPChannel:error:]", 0x5Au, (uint64_t)"### L2CAP open channel null\n", v14, v15, v16, v17, v40);
    }
LABEL_30:

    goto LABEL_31;
  }
  v13 = self->_ucat;
  if (v13->var0 <= 90)
  {
    if (v13->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)v13, 0x5Au)) {
        goto LABEL_31;
      }
      v13 = self->_ucat;
    }
    LogPrintF((uint64_t)v13, (uint64_t)"-[CUBLEServer peripheralManager:didOpenL2CAPChannel:error:]", 0x5Au, (uint64_t)"### L2CAP open channel failed: %{error}\n", v9, v10, v11, v12, (uint64_t)v8);
  }
LABEL_31:
}

uint64_t __59__CUBLEServer_peripheralManager_didOpenL2CAPChannel_error___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleConnectionInvalidated:*(void *)(a1 + 40)];
}

- (void)peripheralManager:(id)a3 didUnpublishL2CAPChannel:(unsigned __int16)a4 error:(id)a5
{
  unsigned int v5 = a4;
  id v12 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 != -1)
    {
LABEL_3:
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBLEServer peripheralManager:didUnpublishL2CAPChannel:error:]", 0x1Eu, (uint64_t)"Unpublished L2CAP channel with PSM 0x%04X: %{error}\n", v7, v8, v9, v10, v5);
      goto LABEL_5;
    }
    if (_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
    {
      ucat = self->_ucat;
      goto LABEL_3;
    }
  }
LABEL_5:
}

- (void)peripheralManager:(id)a3 didPublishL2CAPChannel:(unsigned __int16)a4 error:(id)a5
{
  unsigned int v5 = a4;
  id v15 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  ucat = self->_ucat;
  int var0 = ucat->var0;
  if (v15)
  {
    if (var0 > 90) {
      goto LABEL_12;
    }
    if (var0 != -1) {
      goto LABEL_4;
    }
    if (_LogCategory_Initialize((uint64_t)ucat, 0x5Au))
    {
      ucat = self->_ucat;
LABEL_4:
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBLEServer peripheralManager:didPublishL2CAPChannel:error:]", 0x5Au, (uint64_t)"### Publish L2CAP channel failed: %{error}\n", v7, v8, v9, v10, (uint64_t)v15);
    }
  }
  else
  {
    if (var0 > 30) {
      goto LABEL_12;
    }
    if (var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu)) {
        goto LABEL_12;
      }
      ucat = self->_ucat;
    }
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBLEServer peripheralManager:didPublishL2CAPChannel:error:]", 0x1Eu, (uint64_t)"Published L2CAP channel with PSM 0x%04X\n", v7, v8, v9, v10, v5);
  }
LABEL_12:
  self->_listeningPSM = v5;
  v13 = (void (**)(void *, id))_Block_copy(self->_activateCompletion);
  id activateCompletion = self->_activateCompletion;
  self->_id activateCompletion = 0;

  if (v13) {
    v13[2](v13, v15);
  }
}

- (void)peripheralManagerDidUpdateState:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(dispatchQueue);
  unint64_t v6 = [v5 state];

  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu)) {
        goto LABEL_9;
      }
      ucat = self->_ucat;
    }
    if (v6 > 0xA) {
      id v12 = "?";
    }
    else {
      id v12 = off_1E55BDD88[v6];
    }
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBLEServer peripheralManagerDidUpdateState:]", 0x1Eu, (uint64_t)"Bluetooth state changed: %s\n", v7, v8, v9, v10, (uint64_t)v12);
  }
LABEL_9:
  if (v6 == 1)
  {
    self->_listeningPSM = 0;
  }
  else if (v6 == 5)
  {
    [(CUBLEServer *)self _startIfNeeded];
  }
}

- (void)_startIfNeeded
{
  ucat = self->_ucat;
  if (ucat->var0 <= 9)
  {
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)ucat, 9u)) {
        goto LABEL_5;
      }
      ucat = self->_ucat;
    }
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBLEServer _startIfNeeded]", 9u, (uint64_t)"StartIfNeeded\n", v2, v3, v4, v5, v10);
  }
LABEL_5:
  if (!self->_listeningPSM && [(CBPeripheralManager *)self->_peripheralManager state] == 5)
  {
    peripheralManager = self->_peripheralManager;
    uint64_t listenPSM = self->_listenPSM;
    [(CBPeripheralManager *)peripheralManager publishL2CAPChannel:listenPSM requiresEncryption:0];
  }
}

- (void)_invalidate
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  if (!self->_invalidateCalled)
  {
    self->_invalidateCalled = 1;
    ucat = self->_ucat;
    if (ucat->var0 > 30) {
      goto LABEL_6;
    }
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
      {
LABEL_6:
        uint64_t v8 = (void (**)(void *, void *))_Block_copy(self->_activateCompletion);
        id activateCompletion = self->_activateCompletion;
        self->_id activateCompletion = 0;

        if (v8)
        {
          uint64_t v16 = NSErrorWithOSStatusF(4294960573, (uint64_t)"Invalidated", v10, v11, v12, v13, v14, v15, v32);
          v8[2](v8, v16);
        }
        if (self->_listeningPSM)
        {
          -[CBPeripheralManager unpublishL2CAPChannel:](self->_peripheralManager, "unpublishL2CAPChannel:");
          self->_listeningPSM = 0;
        }
        [(CBPeripheralManager *)self->_peripheralManager setDelegate:0];
        peripheralManager = self->_peripheralManager;
        self->_peripheralManager = 0;

        long long v34 = 0u;
        long long v35 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        id v18 = self->_connections;
        uint64_t v19 = [(NSMutableSet *)v18 countByEnumeratingWithState:&v32 objects:v36 count:16];
        if (v19)
        {
          uint64_t v20 = v19;
          uint64_t v21 = *(void *)v33;
          do
          {
            for (uint64_t i = 0; i != v20; ++i)
            {
              if (*(void *)v33 != v21) {
                objc_enumerationMutation(v18);
              }
              objc_msgSend(*(id *)(*((void *)&v32 + 1) + 8 * i), "invalidate", (void)v32);
            }
            uint64_t v20 = [(NSMutableSet *)v18 countByEnumeratingWithState:&v32 objects:v36 count:16];
          }
          while (v20);
        }

        [(NSMutableSet *)self->_connections removeAllObjects];
        invalidationHandler = (void (**)(void))self->_invalidationHandler;
        if (invalidationHandler) {
          invalidationHandler[2]();
        }
        id connectionStartedHandler = self->_connectionStartedHandler;
        self->_id connectionStartedHandler = 0;

        id connectionEndedHandler = self->_connectionEndedHandler;
        self->_id connectionEndedHandler = 0;

        id v26 = self->_invalidationHandler;
        self->_invalidationHandler = 0;

        uint64_t v31 = self->_ucat;
        if (v31->var0 > 30) {
          goto LABEL_23;
        }
        if (v31->var0 == -1)
        {
          if (!_LogCategory_Initialize((uint64_t)v31, 0x1Eu)) {
            goto LABEL_23;
          }
          uint64_t v31 = self->_ucat;
        }
        LogPrintF((uint64_t)v31, (uint64_t)"-[CUBLEServer _invalidate]", 0x1Eu, (uint64_t)"Invalidated\n", v27, v28, v29, v30, v32);
LABEL_23:

        return;
      }
      ucat = self->_ucat;
    }
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBLEServer _invalidate]", 0x1Eu, (uint64_t)"Invalidate\n", v2, v3, v4, v5, v32);
    goto LABEL_6;
  }
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __25__CUBLEServer_invalidate__block_invoke;
  block[3] = &unk_1E55BFC18;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __25__CUBLEServer_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

- (void)_activateWithCompletion:(id)a3
{
  aBlock = (void (**)(void))a3;
  if (self->_peripheralManager)
  {
    uint64_t v10 = "Activate already called";
    uint64_t v11 = 4294960575;
    goto LABEL_3;
  }
  id v18 = (CBPeripheralManager *)[objc_alloc((Class)getCBPeripheralManagerClass_1631[0]()) initWithDelegate:self queue:self->_dispatchQueue];
  peripheralManager = self->_peripheralManager;
  self->_peripheralManager = v18;

  if (self->_peripheralManager)
  {
    ucat = self->_ucat;
    if (ucat->var0 <= 30)
    {
      if (ucat->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu)) {
          goto LABEL_16;
        }
        ucat = self->_ucat;
      }
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBLEServer _activateWithCompletion:]", 0x1Eu, (uint64_t)"Activate PSM 0x%04X\n", v6, v7, v8, v9, self->_listenPSM);
    }
LABEL_16:
    uint64_t v21 = _Block_copy(aBlock);
    id activateCompletion = self->_activateCompletion;
    self->_id activateCompletion = v21;

    [(CUBLEServer *)self _startIfNeeded];
    goto LABEL_17;
  }
  uint64_t v10 = "Create CBPeripheralManager failed";
  uint64_t v11 = 4294960596;
LABEL_3:
  uint64_t v16 = NSErrorWithOSStatusF(v11, (uint64_t)v10, v4, v5, v6, v7, v8, v9, v23);
  uint64_t v17 = self->_ucat;
  if (v17->var0 <= 90)
  {
    if (v17->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)v17, 0x5Au)) {
        goto LABEL_11;
      }
      uint64_t v17 = self->_ucat;
    }
    LogPrintF((uint64_t)v17, (uint64_t)"-[CUBLEServer _activateWithCompletion:]", 0x5Au, (uint64_t)"### Activate failed: %{error}\n", v12, v13, v14, v15, (uint64_t)v16);
  }
LABEL_11:
  if (aBlock) {
    aBlock[2]();
  }

LABEL_17:
}

- (void)activateWithCompletion:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38__CUBLEServer_activateWithCompletion___block_invoke;
  v7[3] = &unk_1E55BF148;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

uint64_t __38__CUBLEServer_activateWithCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _activateWithCompletion:*(void *)(a1 + 40)];
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
  id v5 = a3;
  p_ucat = (uint64_t *)&self->_ucat;
  uint64_t v7 = qword_1E91CC4E8;
  id v14 = v5;
  [v14 UTF8String];
  LogCategoryReplaceF(p_ucat, (uint64_t)"%s-%s", v8, v9, v10, v11, v12, v13, v7);
}

- (void)dealloc
{
  ucat = self->_ucat;
  if (ucat && (ucat->var3 & 0x40000) != 0)
  {
    LogCategory_Remove(ucat);
    self->_ucat = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CUBLEServer;
  [(CUBLEServer *)&v4 dealloc];
}

- (CUBLEServer)init
{
  v5.receiver = self;
  v5.super_class = (Class)CUBLEServer;
  uint64_t v2 = [(CUBLEServer *)&v5 init];
  if (v2)
  {
    if (CUMainQueue_sOnce != -1) {
      dispatch_once(&CUMainQueue_sOnce, &__block_literal_global_18);
    }
    objc_storeStrong((id *)&v2->_dispatchQueue, (id)CUMainQueue_sQueue);
    v2->_ucat = (LogCategory *)&gLogCategory_CUBLEServer;
    uint64_t v3 = v2;
  }

  return v2;
}

@end
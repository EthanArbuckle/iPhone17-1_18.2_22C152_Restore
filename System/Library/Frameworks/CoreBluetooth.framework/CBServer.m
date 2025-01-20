@interface CBServer
- (CBServer)init;
- (NSString)description;
- (NSString)label;
- (OS_dispatch_queue)dispatchQueue;
- (id)acceptHandler;
- (id)bluetoothStateChangedHandler;
- (id)configChangedHandler;
- (id)invalidationHandler;
- (int64_t)bluetoothState;
- (unsigned)bleListenPSM;
- (unsigned)bleListeningPSM;
- (void)_activateWithCompletion:(id)a3;
- (void)_handleConnectionInvalidated:(id)a3;
- (void)_invalidate;
- (void)_startIfNeeded;
- (void)activateWithCompletion:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)pairingAgent:(id)a3 peerDidCompletePairing:(id)a4;
- (void)pairingAgent:(id)a3 peerDidFailToCompletePairing:(id)a4 error:(id)a5;
- (void)pairingAgent:(id)a3 peerDidRequestPairing:(id)a4 type:(int64_t)a5 passkey:(id)a6;
- (void)pairingAgent:(id)a3 peerDidUnpair:(id)a4;
- (void)pairingGenerateOOBDataForPeer:(id)a3 completionHandler:(id)a4;
- (void)pairingSetOOBEnabled:(BOOL)a3 peer:(id)a4 completionHandler:(id)a5;
- (void)peripheralManager:(id)a3 didOpenL2CAPChannel:(id)a4 error:(id)a5;
- (void)peripheralManager:(id)a3 didPublishL2CAPChannel:(unsigned __int16)a4 error:(id)a5;
- (void)peripheralManager:(id)a3 didUnpublishL2CAPChannel:(unsigned __int16)a4 error:(id)a5;
- (void)peripheralManagerDidUpdateState:(id)a3;
- (void)setAcceptHandler:(id)a3;
- (void)setBleListenPSM:(unsigned __int16)a3;
- (void)setBluetoothStateChangedHandler:(id)a3;
- (void)setConfigChangedHandler:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setLabel:(id)a3;
@end

@implementation CBServer

- (CBServer)init
{
  v6.receiver = self;
  v6.super_class = (Class)CBServer;
  v2 = [(CBServer *)&v6 init];
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x1E4F14428]);
    v3->_ucat = (LogCategory *)&gLogCategory_CBServer;
    v4 = v3;
  }

  return v3;
}

- (void)dealloc
{
  ucat = self->_ucat;
  if (ucat && (ucat->var3 & 0x40000) != 0)
  {
    LogCategory_Remove();
    self->_ucat = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CBServer;
  [(CBServer *)&v4 dealloc];
}

- (NSString)description
{
  return (NSString *)NSPrintF_safe();
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
  id v4 = a3;
  [v4 UTF8String];
  LogCategoryReplaceF();
}

- (void)activateWithCompletion:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __35__CBServer_activateWithCompletion___block_invoke;
  v7[3] = &unk_1E5E32278;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

uint64_t __35__CBServer_activateWithCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _activateWithCompletion:*(void *)(a1 + 40)];
}

- (void)_activateWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__6;
  v21 = __Block_byref_object_dispose__6;
  id v22 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __36__CBServer__activateWithCompletion___block_invoke;
  v14[3] = &unk_1E5E31360;
  v16 = &v17;
  v14[4] = self;
  id v5 = v4;
  id v15 = v5;
  id v6 = (void (**)(void))MEMORY[0x1AD111AA0](v14);
  if (self->_activateCalled
    || self->_invalidateCalled
    || (self->_activateCalled = 1,
        v7 = [[CBPeripheralManager alloc] initWithDelegate:self queue:self->_dispatchQueue], peripheralManager = self->_peripheralManager, self->_peripheralManager = v7, peripheralManager, !self->_peripheralManager))
  {
    uint64_t v12 = NSErrorF_safe();
    v13 = (void *)v18[5];
    v18[5] = v12;
  }
  else
  {
    int var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
    v10 = (void *)MEMORY[0x1AD111AA0](v5);
    id activateCompletion = self->_activateCompletion;
    self->_id activateCompletion = v10;

    [(CBServer *)self _startIfNeeded];
  }
  v6[2](v6);

  _Block_object_dispose(&v17, 8);
}

uint64_t __36__CBServer__activateWithCompletion___block_invoke(void *a1)
{
  uint64_t result = *(void *)(*(void *)(a1[6] + 8) + 40);
  if (result)
  {
    int v3 = **(_DWORD **)(a1[4] + 48);
    if (v3 <= 90 && (v3 != -1 || _LogCategory_Initialize()))
    {
      id v5 = CUPrintNSError();
      LogPrintF_safe();
    }
    id v4 = *(uint64_t (**)(void))(a1[5] + 16);
    return v4();
  }
  return result;
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __22__CBServer_invalidate__block_invoke;
  block[3] = &unk_1E5E31248;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __22__CBServer_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

- (void)_invalidate
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (!self->_invalidateCalled)
  {
    self->_invalidateCalled = 1;
    int var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
    id v4 = (void (**)(void, void))MEMORY[0x1AD111AA0](self->_activateCompletion);
    id activateCompletion = self->_activateCompletion;
    self->_id activateCompletion = 0;

    if (v4)
    {
      id v6 = NSErrorF_safe();
      ((void (**)(void, void *))v4)[2](v4, v6);
    }
    if (self->_bleListeningPSM)
    {
      -[CBPeripheralManager unpublishL2CAPChannel:](self->_peripheralManager, "unpublishL2CAPChannel:");
      self->_bleListeningPSM = 0;
    }
    [(CBPeripheralManager *)self->_peripheralManager setDelegate:0];
    peripheralManager = self->_peripheralManager;
    self->_peripheralManager = 0;

    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v8 = self->_connections;
    uint64_t v9 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v20 != v11) {
            objc_enumerationMutation(v8);
          }
          objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "invalidate", (void)v19);
        }
        uint64_t v10 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v10);
    }

    [(NSMutableSet *)self->_connections removeAllObjects];
    v13 = (void (**)(void))MEMORY[0x1AD111AA0](self->_invalidationHandler);
    id acceptHandler = self->_acceptHandler;
    self->_id acceptHandler = 0;

    id bluetoothStateChangedHandler = self->_bluetoothStateChangedHandler;
    self->_id bluetoothStateChangedHandler = 0;

    id configChangedHandler = self->_configChangedHandler;
    self->_id configChangedHandler = 0;

    id invalidationHandler = self->_invalidationHandler;
    self->_id invalidationHandler = 0;

    if (v13) {
      v13[2](v13);
    }
    int v18 = self->_ucat->var0;
    if (v18 <= 30 && (v18 != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
  }
}

- (void)_startIfNeeded
{
  int var0 = self->_ucat->var0;
  if (var0 <= 9 && (var0 != -1 || _LogCategory_Initialize())) {
    LogPrintF_safe();
  }
  if (!self->_bleListeningPSM && [(CBManager *)self->_peripheralManager state] == CBManagerStatePoweredOn)
  {
    peripheralManager = self->_peripheralManager;
    uint64_t bleListenPSM = self->_bleListenPSM;
    [(CBPeripheralManager *)peripheralManager publishL2CAPChannel:bleListenPSM requiresEncryption:0];
  }
}

- (void)_handleConnectionInvalidated:(id)a3
{
  id v10 = a3;
  id v4 = [v10 l2capChannel];
  int var0 = self->_ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
  {
    unsigned int v6 = [v4 PSM];
    v7 = [v4 peer];
    [v7 identifier];
    v9 = uint64_t v8 = v6;
    LogPrintF_safe();
  }
  -[NSMutableSet removeObject:](self->_connections, "removeObject:", v10, v8, v9);
}

- (void)pairingGenerateOOBDataForPeer:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  uint64_t v45 = 0;
  v46 = &v45;
  uint64_t v47 = 0x3032000000;
  v48 = __Block_byref_object_copy__6;
  v49 = __Block_byref_object_dispose__6;
  id v50 = 0;
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __60__CBServer_pairingGenerateOOBDataForPeer_completionHandler___block_invoke;
  v41[3] = &unk_1E5E352D0;
  v44 = &v45;
  v41[4] = self;
  id v8 = v6;
  id v42 = v8;
  id v9 = v7;
  id v43 = v9;
  v16 = (void (**)(void))MEMORY[0x1AD111AA0](v41);
  if (self->_invalidateCalled)
  {
    uint64_t v35 = CBErrorF(-71148, (uint64_t)"Use after invalidate", v10, v11, v12, v13, v14, v15, v39);
    uint64_t v24 = (void *)v46[5];
    v46[5] = v35;
  }
  else
  {
    uint64_t v17 = [(CBManager *)self->_peripheralManager sharedPairingAgent];
    uint64_t v24 = v17;
    if (v17)
    {
      v25 = [v17 delegate];

      if (!v25) {
        [v24 setDelegate:self];
      }
      v32 = [v24 retrieveOOBDataForPeer:v8];
      if (v32)
      {
        int var0 = self->_ucat->var0;
        if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
        {
          v34 = [v8 identifier];
          v40 = CUPrintNSDataHex();
          LogPrintF_safe();
        }
        (*((void (**)(id, void *, void))v9 + 2))(v9, v32, 0);
      }
      else
      {
        uint64_t v37 = CBErrorF(-6700, (uint64_t)"Generate OOB data failed", v26, v27, v28, v29, v30, v31, v39);
        v38 = (void *)v46[5];
        v46[5] = v37;
      }
    }
    else
    {
      uint64_t v36 = CBErrorF(-6705, (uint64_t)"No pairing agent", v18, v19, v20, v21, v22, v23, v39);
      v32 = (void *)v46[5];
      v46[5] = v36;
    }
  }
  v16[2](v16);

  _Block_object_dispose(&v45, 8);
}

uint64_t __60__CBServer_pairingGenerateOOBDataForPeer_completionHandler___block_invoke(uint64_t result)
{
  if (*(void *)(*(void *)(*(void *)(result + 56) + 8) + 40))
  {
    uint64_t v1 = result;
    int v2 = **(_DWORD **)(*(void *)(result + 32) + 48);
    if (v2 <= 90 && (v2 != -1 || _LogCategory_Initialize()))
    {
      int v3 = [*(id *)(v1 + 40) identifier];
      id v5 = CUPrintNSError();
      LogPrintF_safe();
    }
    id v4 = *(uint64_t (**)(void))(*(void *)(v1 + 48) + 16);
    return v4();
  }
  return result;
}

- (void)pairingSetOOBEnabled:(BOOL)a3 peer:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  uint64_t v39 = 0;
  v40 = &v39;
  uint64_t v41 = 0x3032000000;
  id v42 = __Block_byref_object_copy__6;
  id v43 = __Block_byref_object_dispose__6;
  id v44 = 0;
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __56__CBServer_pairingSetOOBEnabled_peer_completionHandler___block_invoke;
  v34[3] = &unk_1E5E352F8;
  uint64_t v37 = &v39;
  v34[4] = self;
  BOOL v38 = a3;
  id v10 = v8;
  id v35 = v10;
  id v11 = v9;
  id v36 = v11;
  uint64_t v18 = (void (**)(void))MEMORY[0x1AD111AA0](v34);
  if (self->_invalidateCalled)
  {
    uint64_t v30 = CBErrorF(-71148, (uint64_t)"Use after invalidate", v12, v13, v14, v15, v16, v17, v33);
    uint64_t v26 = (void *)v40[5];
    v40[5] = v30;
  }
  else
  {
    uint64_t v19 = [(CBManager *)self->_peripheralManager sharedPairingAgent];
    uint64_t v26 = v19;
    if (v19)
    {
      uint64_t v27 = [v19 delegate];

      if (!v27) {
        [v26 setDelegate:self];
      }
      [v26 setOOBPairingEnabled:1 forPeer:v10];
      int var0 = self->_ucat->var0;
      if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
      {
        uint64_t v29 = [v10 identifier];
        LogPrintF_safe();
      }
      (*((void (**)(id, void))v11 + 2))(v11, 0);
    }
    else
    {
      uint64_t v31 = CBErrorF(-6705, (uint64_t)"No pairing agent", v20, v21, v22, v23, v24, v25, v33);
      v32 = (void *)v40[5];
      v40[5] = v31;
    }
  }

  v18[2](v18);
  _Block_object_dispose(&v39, 8);
}

uint64_t __56__CBServer_pairingSetOOBEnabled_peer_completionHandler___block_invoke(uint64_t result)
{
  if (*(void *)(*(void *)(*(void *)(result + 56) + 8) + 40))
  {
    uint64_t v1 = result;
    int v2 = **(_DWORD **)(*(void *)(result + 32) + 48);
    if (v2 <= 90 && (v2 != -1 || _LogCategory_Initialize()))
    {
      int v3 = [*(id *)(v1 + 40) identifier];
      id v5 = CUPrintNSError();
      LogPrintF_safe();
    }
    id v4 = *(uint64_t (**)(void))(*(void *)(v1 + 48) + 16);
    return v4();
  }
  return result;
}

- (void)pairingAgent:(id)a3 peerDidRequestPairing:(id)a4 type:(int64_t)a5 passkey:(id)a6
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v27 = a3;
  id v9 = a4;
  id v25 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v26 = v9;
  id v10 = [v9 identifier];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v11 = self->_connections;
  uint64_t v12 = [(NSMutableSet *)v11 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v29;
    while (2)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v29 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        uint64_t v17 = [v16 l2capChannel];
        uint64_t v18 = [v17 peer];
        uint64_t v19 = [v18 identifier];

        if ([v19 isEqual:v10])
        {
          uint64_t v22 = v26;
          uint64_t v21 = v27;
          uint64_t v23 = v25;
          [v16 pairingAgent:v27 peerDidRequestPairing:v26 type:a5 passkey:v25];

          goto LABEL_13;
        }
      }
      uint64_t v13 = [(NSMutableSet *)v11 countByEnumeratingWithState:&v28 objects:v32 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }

  int var0 = self->_ucat->var0;
  uint64_t v22 = v26;
  uint64_t v21 = v27;
  uint64_t v23 = v25;
  if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize())) {
    LogPrintF_safe();
  }
LABEL_13:
}

- (void)pairingAgent:(id)a3 peerDidCompletePairing:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v21 = a3;
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v20 = v6;
  id v7 = [v6 identifier];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v8 = self->_connections;
  uint64_t v9 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v23;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        uint64_t v14 = [v13 l2capChannel];
        uint64_t v15 = [v14 peer];
        uint64_t v16 = [v15 identifier];

        if ([v16 isEqual:v7])
        {
          uint64_t v19 = v20;
          uint64_t v18 = v21;
          [v13 pairingAgent:v21 peerDidCompletePairing:v20];

          goto LABEL_13;
        }
      }
      uint64_t v10 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  int var0 = self->_ucat->var0;
  uint64_t v19 = v20;
  uint64_t v18 = v21;
  if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize())) {
    LogPrintF_safe();
  }
LABEL_13:
}

- (void)pairingAgent:(id)a3 peerDidFailToCompletePairing:(id)a4 error:(id)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v25 = a3;
  id v8 = a4;
  id v23 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v24 = v8;
  uint64_t v9 = [v8 identifier];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v10 = self->_connections;
  uint64_t v11 = [(NSMutableSet *)v10 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v27;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v27 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        uint64_t v16 = [v15 l2capChannel];
        uint64_t v17 = [v16 peer];
        uint64_t v18 = [v17 identifier];

        if ([v18 isEqual:v9])
        {
          id v21 = v24;
          id v20 = v25;
          [v15 pairingAgent:v25 peerDidCompletePairing:v24];

          long long v22 = v23;
          goto LABEL_13;
        }
      }
      uint64_t v12 = [(NSMutableSet *)v10 countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }

  int var0 = self->_ucat->var0;
  id v21 = v24;
  id v20 = v25;
  long long v22 = v23;
  if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize()))
  {
    CUPrintNSError();
    uint64_t v10 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    LogPrintF_safe();
LABEL_13:
  }
}

- (void)pairingAgent:(id)a3 peerDidUnpair:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v21 = a3;
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v20 = v6;
  id v7 = [v6 identifier];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v8 = self->_connections;
  uint64_t v9 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v23;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        uint64_t v14 = [v13 l2capChannel];
        uint64_t v15 = [v14 peer];
        uint64_t v16 = [v15 identifier];

        if ([v16 isEqual:v7])
        {
          uint64_t v19 = v20;
          uint64_t v18 = v21;
          [v13 pairingAgent:v21 peerDidUnpair:v20];

          goto LABEL_13;
        }
      }
      uint64_t v10 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  int var0 = self->_ucat->var0;
  uint64_t v19 = v20;
  uint64_t v18 = v21;
  if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize())) {
    LogPrintF_safe();
  }
LABEL_13:
}

- (void)peripheralManagerDidUpdateState:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(dispatchQueue);
  uint64_t v6 = [v5 state];

  int var0 = self->_ucat->var0;
  if (var0 > 30 || var0 == -1 && !_LogCategory_Initialize())
  {
    if (v6 != 1) {
      goto LABEL_5;
    }
LABEL_10:
    self->_bleListeningPSM = 0;
    return;
  }
  LogPrintF_safe();
  if (v6 == 1) {
    goto LABEL_10;
  }
LABEL_5:
  if (v6 == 5)
  {
    [(CBServer *)self _startIfNeeded];
  }
}

- (void)peripheralManager:(id)a3 didPublishL2CAPChannel:(unsigned __int16)a4 error:(id)a5
{
  int v5 = a4;
  id v13 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  int var0 = self->_ucat->var0;
  if (v13)
  {
    if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v12 = CUPrintNSError();
      LogPrintF_safe();
    }
  }
  else if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
  self->_bleListeningPSM = v5;
  id v8 = (void (**)(void, void))MEMORY[0x1AD111AA0](self->_activateCompletion);
  id activateCompletion = self->_activateCompletion;
  self->_id activateCompletion = 0;

  if (v8)
  {
    ((void (**)(void, id))v8)[2](v8, v13);
  }
  else if (self->_bleListenPSM != v5)
  {
    uint64_t v10 = MEMORY[0x1AD111AA0](self->_configChangedHandler);
    uint64_t v11 = (void *)v10;
    if (v10) {
      (*(void (**)(uint64_t))(v10 + 16))(v10);
    }
  }
}

- (void)peripheralManager:(id)a3 didUnpublishL2CAPChannel:(unsigned __int16)a4 error:(id)a5
{
  id v8 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  int var0 = self->_ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
  {
    id v7 = CUPrintNSError();
    LogPrintF_safe();
  }
}

- (void)peripheralManager:(id)a3 didOpenL2CAPChannel:(id)a4 error:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (v8)
  {
    int var0 = self->_ucat->var0;
    if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v27 = CUPrintNSError();
      LogPrintF_safe();
    }
  }
  else
  {
    id v9 = v7;
    int v10 = self->_ucat->var0;
    if (v9)
    {
      if (v10 <= 30 && (v10 != -1 || _LogCategory_Initialize()))
      {
        uint64_t v11 = [v9 peer];
        uint64_t v12 = [v11 identifier];
        unsigned int v13 = [v9 PSM];
        CUPrintNSError();
        v29 = uint64_t v28 = v13;
        long long v24 = v12;
        LogPrintF_safe();
      }
      uint64_t v14 = objc_alloc_init(CBConnection);
      [(CBConnection *)v14 setDispatchQueue:self->_dispatchQueue];
      [(CBConnection *)v14 setL2capChannel:v9];
      [(CBConnection *)v14 setServer:self];
      if (self->_label) {
        -[CBConnection setLabel:](v14, "setLabel:");
      }
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __56__CBServer_peripheralManager_didOpenL2CAPChannel_error___block_invoke;
      v32[3] = &unk_1E5E31068;
      v32[4] = self;
      v32[5] = v14;
      -[CBConnection setServerInvalidationHandler:](v14, "setServerInvalidationHandler:", v32, v24, v28, v29);
      id v31 = 0;
      BOOL v15 = [(CBConnection *)v14 activateDirectAndReturnError:&v31];
      id v16 = v31;
      if (v15)
      {
        connections = self->_connections;
        if (!connections)
        {
          uint64_t v18 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
          uint64_t v19 = self->_connections;
          self->_connections = v18;

          connections = self->_connections;
        }
        [(NSMutableSet *)connections addObject:v14];
        uint64_t v20 = MEMORY[0x1AD111AA0](self->_acceptHandler);
        id v21 = (void *)v20;
        if (v20)
        {
          v30[0] = MEMORY[0x1E4F143A8];
          v30[1] = 3221225472;
          v30[2] = __56__CBServer_peripheralManager_didOpenL2CAPChannel_error___block_invoke_2;
          v30[3] = &unk_1E5E34150;
          v30[4] = self;
          v30[5] = v9;
          v30[6] = v14;
          (*(void (**)(uint64_t, CBConnection *, void *))(v20 + 16))(v20, v14, v30);
        }
      }
      else
      {
        int v22 = self->_ucat->var0;
        if (v22 <= 90 && (v22 != -1 || _LogCategory_Initialize()))
        {
          long long v26 = CUPrintNSError();
          LogPrintF_safe();

          [(CBConnection *)v14 invalidate];
        }
        else
        {
          [(CBConnection *)v14 invalidate];
        }
      }
    }
    else if (v10 <= 90 && (v10 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
  }
}

uint64_t __56__CBServer_peripheralManager_didOpenL2CAPChannel_error___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleConnectionInvalidated:*(void *)(a1 + 40)];
}

uint64_t __56__CBServer_peripheralManager_didOpenL2CAPChannel_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  uint64_t v5 = *(void *)(a1 + 32);
  int v6 = **(_DWORD **)(v5 + 48);
  if (v3)
  {
    id v15 = v3;
    if (v6 <= 30)
    {
      if (v6 != -1 || (v10 = _LogCategory_Initialize(), uint64_t v5 = *(void *)(a1 + 32), v10))
      {
        unsigned int v7 = [*(id *)(a1 + 40) PSM];
        id v8 = [*(id *)(a1 + 40) peer];
        [v8 identifier];
        v13 = uint64_t v12 = v7;
        LogPrintF_safe();

        uint64_t v5 = *(void *)(a1 + 32);
      }
    }
    objc_msgSend(*(id *)(v5 + 24), "removeObject:", *(void *)(a1 + 48), v12, v13);
    id v3 = (id)[*(id *)(a1 + 48) invalidate];
    goto LABEL_10;
  }
  if (v6 <= 30)
  {
    id v15 = 0;
    if (v6 != -1 || (v3 = (id)_LogCategory_Initialize(), id v4 = 0, v3))
    {
      [*(id *)(a1 + 40) PSM];
      id v9 = [*(id *)(a1 + 40) peer];
      uint64_t v14 = [v9 identifier];
      LogPrintF_safe();

LABEL_10:
      id v4 = v15;
    }
  }

  return MEMORY[0x1F41817F8](v3, v4);
}

- (int64_t)bluetoothState
{
  return self->_bluetoothState;
}

- (id)bluetoothStateChangedHandler
{
  return self->_bluetoothStateChangedHandler;
}

- (void)setBluetoothStateChangedHandler:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
}

- (NSString)label
{
  return self->_label;
}

- (id)acceptHandler
{
  return self->_acceptHandler;
}

- (void)setAcceptHandler:(id)a3
{
}

- (unsigned)bleListenPSM
{
  return self->_bleListenPSM;
}

- (void)setBleListenPSM:(unsigned __int16)a3
{
  self->_uint64_t bleListenPSM = a3;
}

- (unsigned)bleListeningPSM
{
  return self->_bleListeningPSM;
}

- (id)configChangedHandler
{
  return self->_configChangedHandler;
}

- (void)setConfigChangedHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_configChangedHandler, 0);
  objc_storeStrong(&self->_acceptHandler, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong(&self->_bluetoothStateChangedHandler, 0);
  objc_storeStrong((id *)&self->_peripheralManager, 0);
  objc_storeStrong((id *)&self->_connections, 0);

  objc_storeStrong(&self->_activateCompletion, 0);
}

@end
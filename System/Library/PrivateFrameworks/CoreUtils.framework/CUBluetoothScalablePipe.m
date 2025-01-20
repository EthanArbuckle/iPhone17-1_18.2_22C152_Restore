@interface CUBluetoothScalablePipe
- (BOOL)_prepareWriteRequest:(id)a3 error:(id *)a4;
- (CUBluetoothScalablePipe)init;
- (NSString)description;
- (NSString)identifier;
- (NSString)label;
- (NSUUID)peerIdentifier;
- (OS_dispatch_queue)dispatchQueue;
- (id)invalidationHandler;
- (id)peerHostStateChangedHandler;
- (id)stateChangedHandler;
- (int)_readBytes:(char *)a3 minLen:(unint64_t)a4 maxLen:(unint64_t)a5 offset:(unint64_t *)a6;
- (int)_writeIOArray:(iovec *)a3 ioCount:(int *)a4;
- (int)peerHostState;
- (int)priority;
- (int)state;
- (unint64_t)_writeBytes:(const char *)a3 length:(unint64_t)a4;
- (void)_abortReadsWithError:(id)a3;
- (void)_abortWritesWithError:(id)a3;
- (void)_completeReadRequest:(id)a3 error:(id)a4;
- (void)_completeWriteRequest:(id)a3 error:(id)a4;
- (void)_ensureStarted;
- (void)_ensureStopped:(id)a3;
- (void)_handleBTPeerHostStateChanged;
- (void)_invalidate;
- (void)_prepareReadRequest:(id)a3;
- (void)_processReads;
- (void)_processWrites;
- (void)_setupPipe;
- (void)_tearDownPipe;
- (void)activateWithCompletion:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)readWithRequest:(id)a3;
- (void)scalablePipeManager:(id)a3 didRegisterEndpoint:(id)a4 error:(id)a5;
- (void)scalablePipeManager:(id)a3 didUnregisterEndpoint:(id)a4;
- (void)scalablePipeManager:(id)a3 pipeDidConnect:(id)a4;
- (void)scalablePipeManager:(id)a3 pipeDidDisconnect:(id)a4 error:(id)a5;
- (void)scalablePipeManagerDidUpdateState:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setLabel:(id)a3;
- (void)setPeerHostStateChangedHandler:(id)a3;
- (void)setPeerIdentifier:(id)a3;
- (void)setPriority:(int)a3;
- (void)setStateChangedHandler:(id)a3;
- (void)writeWithRequest:(id)a3;
@end

@implementation CUBluetoothScalablePipe

- (void).cxx_destruct
{
  objc_storeStrong(&self->_stateChangedHandler, 0);
  objc_storeStrong(&self->_peerHostStateChangedHandler, 0);
  objc_storeStrong((id *)&self->_peerIdentifier, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_writeSource, 0);
  objc_storeStrong((id *)&self->_writeRequests, 0);
  objc_storeStrong((id *)&self->_writeRequestCurrent, 0);
  objc_storeStrong((id *)&self->_readSource, 0);
  objc_storeStrong((id *)&self->_readRequests, 0);
  objc_storeStrong((id *)&self->_readRequestCurrent, 0);
  objc_storeStrong((id *)&self->_btPipeManager, 0);
  objc_storeStrong((id *)&self->_btPipe, 0);
}

- (void)setStateChangedHandler:(id)a3
{
}

- (id)stateChangedHandler
{
  return self->_stateChangedHandler;
}

- (int)state
{
  return self->_state;
}

- (void)setPriority:(int)a3
{
  self->_priority = a3;
}

- (int)priority
{
  return self->_priority;
}

- (void)setPeerHostStateChangedHandler:(id)a3
{
}

- (id)peerHostStateChangedHandler
{
  return self->_peerHostStateChangedHandler;
}

- (int)peerHostState
{
  return self->_peerHostState;
}

- (void)setPeerIdentifier:(id)a3
{
}

- (NSUUID)peerIdentifier
{
  return self->_peerIdentifier;
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

- (void)setIdentifier:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setDispatchQueue:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)scalablePipeManager:(id)a3 pipeDidDisconnect:(id)a4 error:(id)a5
{
  id v34 = a4;
  id v7 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateCalled)
  {
    v8 = [v34 name];
    char v9 = [v8 isEqual:self->_identifier];

    ucat = self->_ucat;
    int var0 = ucat->var0;
    if (v9)
    {
      if (var0 <= 30)
      {
        v12 = v34;
        if (var0 == -1)
        {
          if (!_LogCategory_Initialize((uint64_t)self->_ucat, 0x1Eu)) {
            goto LABEL_10;
          }
          ucat = self->_ucat;
          v12 = v34;
        }
        v13 = [v12 name];
        v14 = [v34 peer];
        v33 = [v14 identifier];
        LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBluetoothScalablePipe scalablePipeManager:pipeDidDisconnect:error:]", 0x1Eu, (uint64_t)"Pipe disconnected: ID '%@', Peer %@, %{error}\n", v15, v16, v17, v18, (uint64_t)v13);
      }
LABEL_10:
      id v19 = v7;
      if (!v19)
      {
        NSErrorWithOSStatusF(4294960543, (uint64_t)"Pipe disconnected", v24, v25, v26, v27, v28, v29, v32);
        id v19 = (id)objc_claimAutoreleasedReturnValue();
      }
      [(CUBluetoothScalablePipe *)self _abortReadsWithError:v19];
      [(CUBluetoothScalablePipe *)self _abortWritesWithError:v19];
      [(CUBluetoothScalablePipe *)self _tearDownPipe];
      btPipe = self->_btPipe;
      self->_btPipe = 0;

      peerIdentifier = self->_peerIdentifier;
      self->_peerIdentifier = 0;

      goto LABEL_13;
    }
    if (var0 > 30) {
      goto LABEL_14;
    }
    if (var0 != -1)
    {
LABEL_8:
      id v19 = [v34 name];
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBluetoothScalablePipe scalablePipeManager:pipeDidDisconnect:error:]", 0x1Eu, (uint64_t)"Ignoring pipeDidDisconnect for unknown identifier ('%@' not '%@'): %{error}\n", v20, v21, v22, v23, (uint64_t)v19);
LABEL_13:

      goto LABEL_14;
    }
    if (_LogCategory_Initialize((uint64_t)self->_ucat, 0x1Eu))
    {
      ucat = self->_ucat;
      goto LABEL_8;
    }
  }
LABEL_14:
}

- (void)scalablePipeManager:(id)a3 pipeDidConnect:(id)a4
{
  id v47 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateCalled)
  {
    v6 = [v47 name];
    char v7 = [v6 isEqual:self->_identifier];

    if ((v7 & 1) == 0)
    {
      ucat = self->_ucat;
      uint64_t v26 = v47;
      if (ucat->var0 > 30) {
        goto LABEL_20;
      }
      if (ucat->var0 == -1)
      {
        BOOL v32 = _LogCategory_Initialize((uint64_t)self->_ucat, 0x1Eu);
        uint64_t v26 = v47;
        if (!v32) {
          goto LABEL_20;
        }
        ucat = self->_ucat;
      }
      uint64_t v27 = [v26 name];
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBluetoothScalablePipe scalablePipeManager:pipeDidConnect:]", 0x1Eu, (uint64_t)"Ignoring pipeDidConnect for unknown identifier ('%@' not '%@')\n", v28, v29, v30, v31, (uint64_t)v27);

      goto LABEL_20;
    }
    btPipe = self->_btPipe;
    if (!btPipe)
    {
LABEL_14:
      v36 = [v47 peer];
      v37 = [v36 identifier];
      peerIdentifier = self->_peerIdentifier;
      self->_peerIdentifier = v37;

      v39 = self->_ucat;
      if (v39->var0 <= 30)
      {
        if (v39->var0 == -1)
        {
          if (!_LogCategory_Initialize((uint64_t)self->_ucat, 0x1Eu)) {
            goto LABEL_19;
          }
          v39 = self->_ucat;
        }
        v40 = [v47 name];
        [v47 type];
        [v47 priority];
        LogPrintF((uint64_t)v39, (uint64_t)"-[CUBluetoothScalablePipe scalablePipeManager:pipeDidConnect:]", 0x1Eu, (uint64_t)"Pipe connected: ID '%@', Peer %@, Type %s, Priority %s\n", v41, v42, v43, v44, (uint64_t)v40);
      }
LABEL_19:
      objc_storeStrong((id *)&self->_btPipe, a4);
      [(CUBluetoothScalablePipe *)self _ensureStarted];
      goto LABEL_20;
    }
    uint64_t v15 = self->_ucat;
    if (v15->var0 <= 90)
    {
      if (v15->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)self->_ucat, 0x5Au)) {
          goto LABEL_13;
        }
        uint64_t v15 = self->_ucat;
        btPipe = self->_btPipe;
      }
      uint64_t v16 = [(CBScalablePipe *)btPipe name];
      uint64_t v17 = [(CBScalablePipe *)self->_btPipe peer];
      uint64_t v18 = [v17 identifier];
      id v19 = [v47 name];
      uint64_t v20 = [v47 peer];
      v46 = [v20 identifier];
      LogPrintF((uint64_t)v15, (uint64_t)"-[CUBluetoothScalablePipe scalablePipeManager:pipeDidConnect:]", 0x5Au, (uint64_t)"Pipe connect when already connected: '%@', Peer %@ -> '%@', Peer %@\n", v21, v22, v23, v24, (uint64_t)v16);
    }
LABEL_13:
    v33 = NSErrorWithOSStatusF(4294960543, (uint64_t)"Pipe disconnect for re-connect", v8, v9, v10, v11, v12, v13, v45);
    [(CUBluetoothScalablePipe *)self _abortReadsWithError:v33];
    [(CUBluetoothScalablePipe *)self _abortWritesWithError:v33];
    [(CUBluetoothScalablePipe *)self _tearDownPipe];
    id v34 = self->_btPipe;
    self->_btPipe = 0;

    v35 = self->_peerIdentifier;
    self->_peerIdentifier = 0;

    goto LABEL_14;
  }
LABEL_20:
  MEMORY[0x1F41817F8]();
}

- (void)scalablePipeManager:(id)a3 didUnregisterEndpoint:(id)a4
{
  id v18 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateCalled)
  {
    char v11 = [v18 isEqual:self->_identifier];
    ucat = self->_ucat;
    int var0 = ucat->var0;
    if (v11)
    {
      if (var0 <= 30)
      {
        if (var0 == -1)
        {
          if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu)) {
            goto LABEL_10;
          }
          ucat = self->_ucat;
        }
        LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBluetoothScalablePipe scalablePipeManager:didUnregisterEndpoint:]", 0x1Eu, (uint64_t)"Endpoint unregistered '%@'\n", v7, v8, v9, v10, (uint64_t)v18);
      }
LABEL_10:
      *(_WORD *)&self->_btEndpointRegistering = 0;
      uint64_t v15 = NSErrorWithOSStatusF(4294960543, (uint64_t)"Endpoint unregistered", v5, v6, v7, v8, v9, v10, v17);
      [(CUBluetoothScalablePipe *)self _ensureStopped:v15];

      goto LABEL_11;
    }
    uint64_t v14 = (uint64_t)v18;
    if (var0 > 30) {
      goto LABEL_11;
    }
    if (var0 != -1)
    {
LABEL_8:
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBluetoothScalablePipe scalablePipeManager:didUnregisterEndpoint:]", 0x1Eu, (uint64_t)"Ignoring didRegisterEndpoint for unknown identifier ('%@' not '%@')\n", v7, v8, v9, v10, v14);
      goto LABEL_11;
    }
    BOOL v16 = _LogCategory_Initialize((uint64_t)ucat, 0x1Eu);
    uint64_t v14 = (uint64_t)v18;
    if (v16)
    {
      ucat = self->_ucat;
      goto LABEL_8;
    }
  }
LABEL_11:
  MEMORY[0x1F41817F8]();
}

- (void)scalablePipeManager:(id)a3 didRegisterEndpoint:(id)a4 error:(id)a5
{
  id v16 = a4;
  id v7 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_invalidateCalled) {
    goto LABEL_2;
  }
  if ([v16 isEqual:self->_identifier])
  {
    ucat = self->_ucat;
    int var0 = ucat->var0;
    if (v7)
    {
      if (var0 > 90) {
        goto LABEL_2;
      }
      if (var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)ucat, 0x5Au)) {
          goto LABEL_2;
        }
        ucat = self->_ucat;
      }
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBluetoothScalablePipe scalablePipeManager:didRegisterEndpoint:error:]", 0x5Au, (uint64_t)"### didRegisterEndpoint error: %{error}\n", v8, v9, v10, v11, (uint64_t)v7);
      goto LABEL_2;
    }
    if (var0 > 30) {
      goto LABEL_22;
    }
    uint64_t v15 = (uint64_t)v16;
    if (var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu)) {
        goto LABEL_22;
      }
      ucat = self->_ucat;
      uint64_t v15 = (uint64_t)v16;
    }
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBluetoothScalablePipe scalablePipeManager:didRegisterEndpoint:error:]", 0x1Eu, (uint64_t)"Endpoint registered '%@'\n", v8, v9, v10, v11, v15);
LABEL_22:
    self->_btEndpointRegistered = 1;
    [(CUBluetoothScalablePipe *)self _ensureStarted];
    goto LABEL_2;
  }
  uint64_t v14 = self->_ucat;
  if (v14->var0 > 30) {
    goto LABEL_2;
  }
  if (v14->var0 == -1)
  {
    if (!_LogCategory_Initialize((uint64_t)v14, 0x1Eu)) {
      goto LABEL_2;
    }
    uint64_t v14 = self->_ucat;
  }
  LogPrintF((uint64_t)v14, (uint64_t)"-[CUBluetoothScalablePipe scalablePipeManager:didRegisterEndpoint:error:]", 0x1Eu, (uint64_t)"Ignoring didRegisterEndpoint for unknown identifier ('%@' not '%@'): %{error}\n", v8, v9, v10, v11, (uint64_t)v16);
LABEL_2:
}

- (void)scalablePipeManagerDidUpdateState:(id)a3
{
  id v18 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v4 = v18;
  if (self->_invalidateCalled) {
    goto LABEL_21;
  }
  unint64_t v11 = [v18 state];
  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu)) {
        goto LABEL_10;
      }
      ucat = self->_ucat;
    }
    if (v11 > 0xA) {
      uint64_t v13 = "?";
    }
    else {
      uint64_t v13 = off_1E55BDD88[v11];
    }
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBluetoothScalablePipe scalablePipeManagerDidUpdateState:]", 0x1Eu, (uint64_t)"Bluetooth scalable pipe state changed: %s\n", v7, v8, v9, v10, (uint64_t)v13);
  }
LABEL_10:
  unint64_t v14 = v11 - 1;
  v4 = v18;
  uint64_t v15 = "Resetting";
  switch(v14)
  {
    case 0uLL:
      goto LABEL_14;
    case 1uLL:
      uint64_t v15 = "Unsupported";
      goto LABEL_14;
    case 2uLL:
      uint64_t v15 = "Unauthorized";
      goto LABEL_14;
    case 3uLL:
      uint64_t v15 = "PoweredOff";
LABEL_14:
      id v16 = self->_ucat;
      if (v16->var0 > 50) {
        goto LABEL_19;
      }
      if (v16->var0 != -1) {
        goto LABEL_16;
      }
      if (_LogCategory_Initialize((uint64_t)v16, 0x32u))
      {
        id v16 = self->_ucat;
LABEL_16:
        LogPrintF((uint64_t)v16, (uint64_t)"-[CUBluetoothScalablePipe scalablePipeManagerDidUpdateState:]", 0x32u, (uint64_t)"Tear down due to %s state\n", v7, v8, v9, v10, (uint64_t)v15);
      }
LABEL_19:
      uint64_t v17 = NSErrorWithOSStatusF(4294960543, (uint64_t)"Bluetooth down (%s)", v5, v6, v7, v8, v9, v10, (uint64_t)v15);
      [(CUBluetoothScalablePipe *)self _ensureStopped:v17];

LABEL_20:
      v4 = v18;
      break;
    case 4uLL:
      [(CUBluetoothScalablePipe *)self _ensureStarted];
      goto LABEL_20;
    default:
      break;
  }
LABEL_21:
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (objc_msgSend(a3, "isEqualToString:", @"hostState", a4, a5, a6))
  {
    dispatchQueue = self->_dispatchQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __74__CUBluetoothScalablePipe_observeValueForKeyPath_ofObject_change_context___block_invoke;
    block[3] = &unk_1E55BFC18;
    block[4] = self;
    dispatch_async(dispatchQueue, block);
  }
}

unsigned char *__74__CUBluetoothScalablePipe_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  result = *(unsigned char **)(a1 + 32);
  if (result[40]) {
    return (unsigned char *)[result _handleBTPeerHostStateChanged];
  }
  return result;
}

- (void)_completeWriteRequest:(id)a3 error:(id)a4
{
  unint64_t v14 = a3;
  id v10 = a4;
  ucat = self->_ucat;
  if (ucat->var0 <= 9)
  {
    if (ucat->var0 != -1)
    {
LABEL_3:
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBluetoothScalablePipe _completeWriteRequest:error:]", 9u, (uint64_t)"Write completed: %{error}\n", v6, v7, v8, v9, (uint64_t)v10);
      goto LABEL_5;
    }
    if (_LogCategory_Initialize((uint64_t)ucat, 9u))
    {
      ucat = self->_ucat;
      goto LABEL_3;
    }
  }
LABEL_5:
  uint64_t v12 = (void *)v14[1];
  v14[1] = v10;

  uint64_t v13 = [v14 completion];
  [v14 setCompletion:0];
  if (v13) {
    v13[2](v13);
  }
}

- (void)_abortWritesWithError:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (self->_writeRequestCurrent || [(NSMutableArray *)self->_writeRequests count])
  {
    ucat = self->_ucat;
    if (ucat->var0 <= 30)
    {
      if (ucat->var0 != -1)
      {
LABEL_5:
        LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBluetoothScalablePipe _abortWritesWithError:]", 0x1Eu, (uint64_t)"Abort writes: %{error}\n", v4, v5, v6, v7, (uint64_t)v8);
        goto LABEL_7;
      }
      if (_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
      {
        ucat = self->_ucat;
        goto LABEL_5;
      }
    }
  }
LABEL_7:
  id v10 = self->_writeRequestCurrent;
  if (v10)
  {
    writeRequestCurrent = self->_writeRequestCurrent;
    self->_writeRequestCurrent = 0;

    [(CUBluetoothScalablePipe *)self _completeWriteRequest:v10 error:v8];
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v12 = self->_writeRequests;
  uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v20;
    do
    {
      uint64_t v16 = 0;
      uint64_t v17 = v10;
      do
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v12);
        }
        id v10 = (CUWriteRequest *)*(id *)(*((void *)&v19 + 1) + 8 * v16);

        [(CUBluetoothScalablePipe *)self _completeWriteRequest:v10 error:v8];
        ++v16;
        uint64_t v17 = v10;
      }
      while (v14 != v16);
      uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v14);
  }

  [(NSMutableArray *)self->_writeRequests removeAllObjects];
  writeSource = self->_writeSource;
  if (writeSource && !self->_writeSuspended)
  {
    self->_writeSuspended = 1;
    dispatch_suspend(writeSource);
  }
}

- (unint64_t)_writeBytes:(const char *)a3 length:(unint64_t)a4
{
  uint64_t v5 = a3;
  if (!a4) {
    return v5 - a3;
  }
  uint64_t v7 = 0;
  id v8 = &a3[a4];
  uint64_t v5 = a3;
  while (1)
  {
    uint64_t next_slot = os_channel_get_next_slot();
    if (!next_slot) {
      break;
    }
    uint64_t v7 = next_slot;
    ucat = self->_ucat;
    if (ucat->var0 <= 8)
    {
      if (ucat->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)ucat, 8u)) {
          goto LABEL_8;
        }
        ucat = self->_ucat;
      }
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBluetoothScalablePipe _writeBytes:length:]", 8u, (uint64_t)"Write channel slot %p, remain %zu, slotLen %u\n", v10, v11, v12, v13, v7);
    }
LABEL_8:
    os_channel_set_slot_properties();
    if (v5 == v8)
    {
      uint64_t v5 = v8;
      goto LABEL_12;
    }
  }
  if (!v7) {
    return v5 - a3;
  }
LABEL_12:
  uint64_t v15 = os_channel_advance_slot();
  if (v15)
  {
    uint64_t v20 = v15;
    long long v21 = self->_ucat;
    if (v21->var0 <= 60)
    {
      if (v21->var0 != -1) {
        goto LABEL_15;
      }
      if (_LogCategory_Initialize((uint64_t)v21, 0x3Cu))
      {
        long long v21 = self->_ucat;
LABEL_15:
        LogPrintF((uint64_t)v21, (uint64_t)"-[CUBluetoothScalablePipe _writeBytes:length:]", 0x3Cu, (uint64_t)"### Advance tx slot failed: %#m\n", v16, v17, v18, v19, v20);
      }
    }
  }
  uint64_t v22 = os_channel_sync();
  if (v22)
  {
    uint64_t v27 = v22;
    uint64_t v28 = self->_ucat;
    if (v28->var0 <= 60)
    {
      if (v28->var0 != -1) {
        goto LABEL_20;
      }
      if (_LogCategory_Initialize((uint64_t)v28, 0x3Cu))
      {
        uint64_t v28 = self->_ucat;
LABEL_20:
        LogPrintF((uint64_t)v28, (uint64_t)"-[CUBluetoothScalablePipe _writeBytes:length:]", 0x3Cu, (uint64_t)"### Sync tx failed: %#m\n", v23, v24, v25, v26, v27);
      }
    }
  }
  return v5 - a3;
}

- (int)_writeIOArray:(iovec *)a3 ioCount:(int *)a4
{
  uint64_t v4 = *a4;
  if (!v4) {
    return 0;
  }
  id v8 = *a3;
  uint64_t v9 = &(*a3)[v4];
  uint64_t v10 = 16 * v4;
  while (1)
  {
    unint64_t v11 = [(CUBluetoothScalablePipe *)self _writeBytes:v8->iov_base length:v8->iov_len];
    size_t iov_len = v8->iov_len;
    BOOL v13 = iov_len > v11;
    size_t v14 = iov_len - v11;
    if (v13) {
      break;
    }
    ++v8;
    v10 -= 16;
    if (!v10) {
      return 0;
    }
  }
  v8->iov_base = (char *)v8->iov_base + v11;
  v8->size_t iov_len = v14;
  *a3 = v8;
  *a4 = (unint64_t)((char *)v9 - (char *)v8) >> 4;
  return 35;
}

- (BOOL)_prepareWriteRequest:(id)a3 error:(id *)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (char *)a3;
  uint64_t v7 = [v6 dataArray];
  id v8 = v7;
  if (!v7)
  {
    *((void *)v6 + 34) = v6 + 16;
    LODWORD(v18) = [v6 bytesIOCount];
    goto LABEL_14;
  }
  unint64_t v9 = [v7 count];
  if (v9 <= [v6 bytesIOMaxCount])
  {
    uint64_t v19 = v6 + 16;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v20 = v8;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v39 objects:v43 count:16];
    uint64_t v22 = v6 + 16;
    if (v21)
    {
      uint64_t v23 = v21;
      uint64_t v24 = *(void *)v40;
      uint64_t v22 = v6 + 16;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v40 != v24) {
            objc_enumerationMutation(v20);
          }
          id v26 = *(id *)(*((void *)&v39 + 1) + 8 * i);
          *(void *)uint64_t v22 = [v26 bytes];
          *((void *)v22 + 1) = [v26 length];
          v22 += 16;
        }
        uint64_t v23 = [v20 countByEnumeratingWithState:&v39 objects:v43 count:16];
      }
      while (v23);
    }

    *((void *)v6 + 34) = v19;
    unint64_t v18 = (unint64_t)(v22 - v19) >> 4;
LABEL_14:
    *((_DWORD *)v6 + 70) = v18;
    *((void *)v6 + 36) = 0;
    uint64_t v27 = (void *)*((void *)v6 + 1);
    *((void *)v6 + 1) = 0;

    if (gLogCategory_CUBluetoothScalablePipe > 9
      || gLogCategory_CUBluetoothScalablePipe == -1
      && !_LogCategory_Initialize((uint64_t)&gLogCategory_CUBluetoothScalablePipe, 9u))
    {
      goto LABEL_27;
    }
    uint64_t v32 = *((unsigned int *)v6 + 70);
    if (v32)
    {
      uint64_t v33 = 0;
      uint64_t v34 = 16 * (int)v32;
      v35 = (uint64_t *)(*((void *)v6 + 34) + 8);
      do
      {
        uint64_t v36 = *v35;
        v35 += 2;
        v33 += v36;
        v34 -= 16;
      }
      while (v34);
    }
    ucat = self->_ucat;
    if (ucat->var0 > 9) {
      goto LABEL_27;
    }
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)ucat, 9u)) {
        goto LABEL_27;
      }
      ucat = self->_ucat;
      uint64_t v32 = *((unsigned int *)v6 + 70);
    }
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBluetoothScalablePipe _prepareWriteRequest:error:]", 9u, (uint64_t)"Write prepared (%d iov, %zu total)\n", v28, v29, v30, v31, v32);
LABEL_27:
    BOOL v17 = 1;
    goto LABEL_28;
  }
  if (a4)
  {
    uint64_t v10 = [v6 bytesIOMaxCount];
    NSErrorWithOSStatusF(4294960532, (uint64_t)"Too many write elements (%zu max)", v11, v12, v13, v14, v15, v16, v10);
    BOOL v17 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v17 = 0;
  }
LABEL_28:

  return v17;
}

- (void)_processWrites
{
  p_writeRequestCurrent = &self->_writeRequestCurrent;
  int v4 = 4;
  do
  {
    uint64_t v5 = *p_writeRequestCurrent;
    if (!v5)
    {
      uint64_t v15 = [(NSMutableArray *)self->_writeRequests firstObject];
      if (!v15)
      {
        if (!self->_writeSuspended)
        {
          self->_writeSuspended = 1;
          dispatch_suspend((dispatch_object_t)self->_writeSource);
        }
        uint64_t v5 = 0;
        goto LABEL_25;
      }
      uint64_t v5 = (unsigned int *)v15;
      [(NSMutableArray *)self->_writeRequests removeObjectAtIndex:0];
      id v21 = 0;
      [(CUBluetoothScalablePipe *)self _prepareWriteRequest:v5 error:&v21];
      id v16 = v21;
      if (v16)
      {
        BOOL v17 = v16;
        [(CUBluetoothScalablePipe *)self _completeWriteRequest:v5 error:v16];
        goto LABEL_12;
      }
      objc_storeStrong((id *)p_writeRequestCurrent, v5);
    }
    uint64_t v6 = v5[70];
    uint64_t v13 = [(CUBluetoothScalablePipe *)self _writeIOArray:v5 + 68 ioCount:v5 + 70];
    ucat = self->_ucat;
    if (ucat->var0 <= 9)
    {
      if (ucat->var0 != -1) {
        goto LABEL_5;
      }
      if (_LogCategory_Initialize((uint64_t)ucat, 9u))
      {
        ucat = self->_ucat;
LABEL_5:
        LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBluetoothScalablePipe _processWrites]", 9u, (uint64_t)"Write channel, pre-ion %d, post-ion %d, %#m\n", v9, v10, v11, v12, v6);
      }
    }
    if (v13)
    {
      if (v13 == 35)
      {
        if (self->_writeSuspended)
        {
          self->_writeSuspended = 0;
          dispatch_resume((dispatch_object_t)self->_writeSource);
        }
      }
      else
      {
        uint64_t v19 = NSErrorWithOSStatusF(v13, (uint64_t)"Write failed", v7, v8, v9, v10, v11, v12, v20);
        [(CUBluetoothScalablePipe *)self _abortWritesWithError:v19];
      }
LABEL_25:

      return;
    }
    writeRequestCurrent = self->_writeRequestCurrent;
    self->_writeRequestCurrent = 0;

    [(CUBluetoothScalablePipe *)self _completeWriteRequest:v5 error:0];
    BOOL v17 = 0;
LABEL_12:

    --v4;
  }
  while (v4);
  if (self->_writeSuspended)
  {
    self->_writeSuspended = 0;
    dispatch_resume((dispatch_object_t)self->_writeSource);
  }
}

- (void)writeWithRequest:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__CUBluetoothScalablePipe_writeWithRequest___block_invoke;
  v7[3] = &unk_1E55BF170;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __44__CUBluetoothScalablePipe_writeWithRequest___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v9 + 8))
  {
    uint64_t v10 = *(void *)(a1 + 40);
    NSErrorWithOSStatusF(4294960573, (uint64_t)"Invalidated (W)", a3, a4, a5, a6, a7, a8, v12);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    [(id)v9 _completeWriteRequest:v10 error:v13];
  }
  else
  {
    [*(id *)(v9 + 160) addObject:*(void *)(a1 + 40)];
    uint64_t v11 = *(_DWORD **)(a1 + 32);
    if ((v11[28] & 0x80000000) == 0)
    {
      [v11 _processWrites];
    }
  }
}

- (void)_completeReadRequest:(id)a3 error:(id)a4
{
  id v16 = a3;
  id v6 = a4;
  ucat = self->_ucat;
  if (ucat->var0 <= 9)
  {
    id v8 = v16;
    if (ucat->var0 != -1)
    {
LABEL_3:
      uint64_t v9 = [v8 length];
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBluetoothScalablePipe _completeReadRequest:error:]", 9u, (uint64_t)"Read completed: %zu byte(s), %{error}\n", v10, v11, v12, v13, v9);
      goto LABEL_5;
    }
    if (_LogCategory_Initialize((uint64_t)self->_ucat, 9u))
    {
      ucat = self->_ucat;
      id v8 = v16;
      goto LABEL_3;
    }
  }
LABEL_5:
  uint64_t v14 = (void *)v16[2];
  v16[2] = v6;

  uint64_t v15 = [v16 completion];
  [v16 setCompletion:0];
  if (v15) {
    v15[2](v15);
  }
}

- (void)_abortReadsWithError:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (self->_readRequestCurrent || [(NSMutableArray *)self->_readRequests count])
  {
    ucat = self->_ucat;
    if (ucat->var0 <= 30)
    {
      if (ucat->var0 != -1)
      {
LABEL_5:
        LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBluetoothScalablePipe _abortReadsWithError:]", 0x1Eu, (uint64_t)"Abort reads: %{error}\n", v4, v5, v6, v7, (uint64_t)v8);
        goto LABEL_7;
      }
      if (_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
      {
        ucat = self->_ucat;
        goto LABEL_5;
      }
    }
  }
LABEL_7:
  uint64_t v10 = self->_readRequestCurrent;
  if (v10)
  {
    readRequestCurrent = self->_readRequestCurrent;
    self->_readRequestCurrent = 0;

    [(CUBluetoothScalablePipe *)self _completeReadRequest:v10 error:v8];
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v12 = self->_readRequests;
  uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v20;
    do
    {
      uint64_t v16 = 0;
      BOOL v17 = v10;
      do
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v10 = (CUReadRequest *)*(id *)(*((void *)&v19 + 1) + 8 * v16);

        [(CUBluetoothScalablePipe *)self _completeReadRequest:v10 error:v8];
        ++v16;
        BOOL v17 = v10;
      }
      while (v14 != v16);
      uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v14);
  }

  [(NSMutableArray *)self->_readRequests removeAllObjects];
  readSource = self->_readSource;
  if (readSource && !self->_readSuspended)
  {
    self->_readSuspended = 1;
    dispatch_suspend(readSource);
  }
}

- (int)_readBytes:(char *)a3 minLen:(unint64_t)a4 maxLen:(unint64_t)a5 offset:(unint64_t *)a6
{
  unint64_t v7 = a4;
  id v8 = a3;
  uint64_t v9 = &a3[*a6];
  unint64_t v10 = a5 - *a6;
  if (a5 == *a6) {
    goto LABEL_26;
  }
  btReadLeftoverPtr = self->_btReadLeftoverPtr;
  uint64_t v13 = (char *)(self->_btReadLeftoverEnd - btReadLeftoverPtr);
  if (v13)
  {
    size_t v14 = (unint64_t)v13 >= v10 ? a5 - *a6 : self->_btReadLeftoverEnd - btReadLeftoverPtr;
    memcpy(v9, btReadLeftoverPtr, v14);
    self->_btReadLeftoverPtr += v14;
    v9 += v14;
    if (v10 == v14) {
      goto LABEL_26;
    }
  }
  for (uint64_t i = 0; ; uint64_t i = v21)
  {
    uint64_t next_slot = os_channel_get_next_slot();
    if (!next_slot) {
      break;
    }
    uint64_t v21 = next_slot;
    ucat = self->_ucat;
    if (ucat->var0 > 8) {
      continue;
    }
    if (ucat->var0 != -1) {
      goto LABEL_11;
    }
    if (_LogCategory_Initialize((uint64_t)ucat, 8u))
    {
      ucat = self->_ucat;
LABEL_11:
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBluetoothScalablePipe _readBytes:minLen:maxLen:offset:]", 8u, (uint64_t)"Read channel slot %p, remain %zu, slotLen %u\n", v17, v18, v19, v20, v21);
      continue;
    }
  }
  id v8 = a3;
  unint64_t v7 = a4;
  if (i)
  {
    uint64_t v23 = os_channel_advance_slot();
    if (v23)
    {
      uint64_t v28 = v23;
      uint64_t v29 = self->_ucat;
      if (v29->var0 <= 90)
      {
        if (v29->var0 != -1) {
          goto LABEL_19;
        }
        if (_LogCategory_Initialize((uint64_t)v29, 0x5Au))
        {
          uint64_t v29 = self->_ucat;
LABEL_19:
          LogPrintF((uint64_t)v29, (uint64_t)"-[CUBluetoothScalablePipe _readBytes:minLen:maxLen:offset:]", 0x5Au, (uint64_t)"### Advance rx slot failed: %#m\n", v24, v25, v26, v27, v28);
        }
      }
    }
    uint64_t v30 = os_channel_sync();
    if (v30)
    {
      uint64_t v35 = v30;
      uint64_t v36 = self->_ucat;
      if (v36->var0 <= 90)
      {
        if (v36->var0 != -1) {
          goto LABEL_24;
        }
        if (_LogCategory_Initialize((uint64_t)v36, 0x5Au))
        {
          uint64_t v36 = self->_ucat;
LABEL_24:
          LogPrintF((uint64_t)v36, (uint64_t)"-[CUBluetoothScalablePipe _readBytes:minLen:maxLen:offset:]", 0x5Au, (uint64_t)"### Sync rx failed: %#m\n", v31, v32, v33, v34, v35);
        }
      }
    }
  }
LABEL_26:
  *a6 = v9 - v8;
  if (v9 - v8 >= v7) {
    return 0;
  }
  else {
    return 35;
  }
}

- (void)_prepareReadRequest:(id)a3
{
  uint64_t v21 = a3;
  if ([v21 bufferBytes])
  {
    v21[1] = [v21 bufferBytes];
    [v21 setData:0];
  }
  else
  {
    uint64_t v4 = [v21 bufferData];

    if (v4)
    {
      uint64_t v5 = [v21 bufferData];
      unint64_t v6 = [v5 length];
      unint64_t v7 = [v21 maxLength];

      if (v6 < v7)
      {
        uint64_t v8 = [v21 maxLength];
        uint64_t v9 = [v21 bufferData];
        [v9 setLength:v8];
      }
    }
    else
    {
      unint64_t v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA58]), "initWithLength:", objc_msgSend(v21, "maxLength"));
      [v21 setBufferData:v10];
    }
    id v11 = [v21 bufferData];
    v21[1] = [v11 mutableBytes];

    uint64_t v12 = [v21 bufferData];
    [v21 setData:v12];
  }
  uint64_t v13 = (void *)v21[2];
  v21[2] = 0;
  v21[3] = 0;

  ucat = self->_ucat;
  if (ucat->var0 <= 9)
  {
    uint64_t v15 = v21;
    if (ucat->var0 != -1)
    {
LABEL_10:
      uint64_t v16 = [v15 minLength];
      [v21 maxLength];
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBluetoothScalablePipe _prepareReadRequest:]", 9u, (uint64_t)"Read prepared (%zu min, %zu max)\n", v17, v18, v19, v20, v16);
      goto LABEL_12;
    }
    if (_LogCategory_Initialize((uint64_t)self->_ucat, 9u))
    {
      ucat = self->_ucat;
      uint64_t v15 = v21;
      goto LABEL_10;
    }
  }
LABEL_12:
}

- (void)_processReads
{
  p_readRequestCurrent = &self->_readRequestCurrent;
  int v4 = 4;
  while (1)
  {
    uint64_t v5 = *p_readRequestCurrent;
    if (v5) {
      goto LABEL_5;
    }
    uint64_t v6 = [(NSMutableArray *)self->_readRequests firstObject];
    if (!v6) {
      break;
    }
    obja = (CUReadRequest *)v6;
    [(NSMutableArray *)self->_readRequests removeObjectAtIndex:0];
    [(CUBluetoothScalablePipe *)self _prepareReadRequest:obja];
    objc_storeStrong((id *)p_readRequestCurrent, obja);
    uint64_t v5 = obja;
LABEL_5:
    obj = v5;
    uint64_t v13 = [(CUBluetoothScalablePipe *)self _readBytes:v5->_bufferPtr minLen:[(CUReadRequest *)v5 minLength] maxLen:[(CUReadRequest *)v5 maxLength] offset:&v5->_length];
    ucat = self->_ucat;
    if (ucat->var0 > 9) {
      goto LABEL_9;
    }
    if (ucat->var0 != -1) {
      goto LABEL_7;
    }
    if (_LogCategory_Initialize((uint64_t)self->_ucat, 9u))
    {
      ucat = self->_ucat;
LABEL_7:
      uint64_t v15 = [(CUReadRequest *)obj minLength];
      [(CUReadRequest *)obj maxLength];
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBluetoothScalablePipe _processReads]", 9u, (uint64_t)"Read channel, %zu min, %zu max, %zu offset, %zu nread, %#m\n", v16, v17, v18, v19, v15);
    }
LABEL_9:
    if (v13)
    {
      if (v13 == 35)
      {
        if (self->_readSuspended)
        {
          self->_readSuspended = 0;
          dispatch_resume((dispatch_object_t)self->_readSource);
        }
      }
      else
      {
        uint64_t v21 = NSErrorWithOSStatusF(v13, (uint64_t)"Read failed", v7, v8, v9, v10, v11, v12, v24);
        [(CUBluetoothScalablePipe *)self _abortReadsWithError:v21];
      }
      long long v22 = obj;
      goto LABEL_18;
    }
    readRequestCurrent = self->_readRequestCurrent;
    self->_readRequestCurrent = 0;

    [(CUBluetoothScalablePipe *)self _completeReadRequest:obj error:0];
    if (!--v4)
    {
      if (self->_readSuspended)
      {
        self->_readSuspended = 0;
        readSource = self->_readSource;
        dispatch_resume(readSource);
      }
      return;
    }
  }
  if (!self->_readSuspended)
  {
    self->_readSuspended = 1;
    dispatch_suspend((dispatch_object_t)self->_readSource);
  }
  long long v22 = 0;
LABEL_18:
}

- (void)readWithRequest:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __43__CUBluetoothScalablePipe_readWithRequest___block_invoke;
  v7[3] = &unk_1E55BF170;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __43__CUBluetoothScalablePipe_readWithRequest___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v9 + 8))
  {
    uint64_t v10 = *(void *)(a1 + 40);
    NSErrorWithOSStatusF(4294960573, (uint64_t)"Invalidated (R)", a3, a4, a5, a6, a7, a8, v12);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    [(id)v9 _completeReadRequest:v10 error:v13];
  }
  else
  {
    [*(id *)(v9 + 128) addObject:*(void *)(a1 + 40)];
    uint64_t v11 = *(_DWORD **)(a1 + 32);
    if ((v11[28] & 0x80000000) == 0)
    {
      [v11 _processReads];
    }
  }
}

- (void)_handleBTPeerHostStateChanged
{
  if (self->_btPeerKVORegistered)
  {
    uint64_t v7 = [(CBScalablePipe *)self->_btPipe peer];
    uint64_t v8 = [v7 hostState];

    if (v8 == 1) {
      int v9 = 1;
    }
    else {
      int v9 = 2 * (v8 == 2);
    }
  }
  else
  {
    int v9 = 0;
  }
  unsigned int peerHostState = self->_peerHostState;
  if (v9 == peerHostState) {
    return;
  }
  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 != -1)
    {
LABEL_9:
      if (peerHostState > 2) {
        uint64_t v12 = "?";
      }
      else {
        uint64_t v12 = off_1E55BDD70[peerHostState];
      }
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBluetoothScalablePipe _handleBTPeerHostStateChanged]", 0x1Eu, (uint64_t)"Peer host state changed: %s -> %s\n", v2, v3, v4, v5, (uint64_t)v12);
      goto LABEL_15;
    }
    if (_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
    {
      ucat = self->_ucat;
      unsigned int peerHostState = self->_peerHostState;
      goto LABEL_9;
    }
  }
LABEL_15:
  self->_unsigned int peerHostState = v9;
  id v13 = (void (**)(void))_Block_copy(self->_peerHostStateChangedHandler);
  if (v13)
  {
    size_t v14 = v13;
    v13[2]();
    id v13 = v14;
  }
}

- (void)_tearDownPipe
{
  if ((self->_channelFD & 0x80000000) == 0)
  {
    ucat = self->_ucat;
    if (ucat->var0 <= 30)
    {
      if (ucat->var0 != -1)
      {
LABEL_4:
        LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBluetoothScalablePipe _tearDownPipe]", 0x1Eu, (uint64_t)"Tear down pipe\n", v2, v3, v4, v5, v15);
        goto LABEL_6;
      }
      if (_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
      {
        ucat = self->_ucat;
        goto LABEL_4;
      }
    }
  }
LABEL_6:
  readSource = self->_readSource;
  if (readSource)
  {
    dispatch_source_cancel(readSource);
    if (self->_readSuspended)
    {
      dispatch_resume((dispatch_object_t)self->_readSource);
      self->_readSuspended = 0;
    }
    int v9 = self->_readSource;
    self->_readSource = 0;
  }
  writeSource = self->_writeSource;
  if (writeSource)
  {
    dispatch_source_cancel(writeSource);
    if (self->_writeSuspended)
    {
      dispatch_resume((dispatch_object_t)self->_writeSource);
      self->_writeSuspended = 0;
    }
    uint64_t v11 = self->_writeSource;
    self->_writeSource = 0;
  }
  self->_btChannel = 0;
  self->_channelFD = -1;
  self->_btReadRing = 0;
  btReadLeftoverBuf = self->_btReadLeftoverBuf;
  if (btReadLeftoverBuf)
  {
    free(btReadLeftoverBuf);
    self->_btReadLeftoverBuf = 0;
  }
  self->_btReadLeftoverMaxLen = 0;
  self->_btWriteRing = 0;
  if (self->_btPeerKVORegistered)
  {
    self->_btPeerKVORegistered = 0;
    id v13 = [(CBScalablePipe *)self->_btPipe peer];
    [v13 removeObserver:self forKeyPath:@"hostState" context:0];

    [(CUBluetoothScalablePipe *)self _handleBTPeerHostStateChanged];
  }
  if (self->_state != 2)
  {
    self->_state = 2;
    size_t v14 = (void (**)(void))_Block_copy(self->_stateChangedHandler);
    if (v14)
    {
      uint64_t v16 = v14;
      v14[2]();
      size_t v14 = v16;
    }
  }
}

- (void)_setupPipe
{
  uint64_t v3 = self->_btPipe;
  uint64_t v4 = (channel *)[(CBScalablePipe *)v3 channel];
  self->_btChannel = v4;
  if (!v4)
  {
    ucat = self->_ucat;
    if (ucat->var0 <= 90)
    {
      if (ucat->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)ucat, 0x5Au)) {
          goto LABEL_21;
        }
        ucat = self->_ucat;
      }
      long long v22 = "### No channel\n";
      goto LABEL_20;
    }
    goto LABEL_21;
  }
  os_channel_ring_id();
  int v9 = (channel_ring_desc *)os_channel_rx_ring();
  self->_btReadRing = v9;
  if (!v9)
  {
    ucat = self->_ucat;
    if (ucat->var0 <= 90)
    {
      if (ucat->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)ucat, 0x5Au)) {
          goto LABEL_21;
        }
        ucat = self->_ucat;
      }
      long long v22 = "### No rx ring\n";
      goto LABEL_20;
    }
    goto LABEL_21;
  }
  os_channel_ring_id();
  uint64_t v10 = (channel_ring_desc *)os_channel_tx_ring();
  self->_btWriteRing = v10;
  if (!v10)
  {
    ucat = self->_ucat;
    if (ucat->var0 <= 90)
    {
      if (ucat->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)ucat, 0x5Au)) {
          goto LABEL_21;
        }
        ucat = self->_ucat;
      }
      long long v22 = "### No tx ring\n";
      goto LABEL_20;
    }
LABEL_21:
    uint64_t v23 = 4294960596;
    goto LABEL_47;
  }
  if (!os_channel_attr_create())
  {
    ucat = self->_ucat;
    if (ucat->var0 <= 90)
    {
      if (ucat->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)ucat, 0x5Au)) {
          goto LABEL_21;
        }
        ucat = self->_ucat;
      }
      long long v22 = "### Create channel attr failed\n";
LABEL_20:
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBluetoothScalablePipe _setupPipe]", 0x5Au, (uint64_t)v22, v5, v6, v7, v8, v29);
      goto LABEL_21;
    }
    goto LABEL_21;
  }
  uint64_t attr = os_channel_read_attr();
  if (attr)
  {
    uint64_t v23 = attr;
    uint64_t v24 = self->_ucat;
    if (v24->var0 <= 90)
    {
      if (v24->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)v24, 0x5Au)) {
          goto LABEL_46;
        }
        uint64_t v24 = self->_ucat;
      }
      LogPrintF((uint64_t)v24, (uint64_t)"-[CUBluetoothScalablePipe _setupPipe]", 0x5Au, (uint64_t)"### Read channel attr failed: %#m\n", v12, v13, v14, v15, v23);
    }
  }
  else
  {
    uint64_t v30 = 0;
    uint64_t v16 = os_channel_attr_get();
    if (!v16)
    {
      uint64_t v26 = self->_ucat;
      if (v26->var0 <= 90)
      {
        if (v26->var0 == -1)
        {
          if (!_LogCategory_Initialize((uint64_t)v26, 0x5Au)) {
            goto LABEL_45;
          }
          uint64_t v26 = self->_ucat;
          uint64_t v27 = v30;
        }
        else
        {
          uint64_t v27 = 0;
        }
        LogPrintF((uint64_t)v26, (uint64_t)"-[CUBluetoothScalablePipe _setupPipe]", 0x5Au, (uint64_t)"### Bad channel slot size: %llu\n", v17, v18, v19, v20, v27);
      }
LABEL_45:
      uint64_t v23 = 4294960553;
      goto LABEL_46;
    }
    uint64_t v23 = v16;
    uint64_t v25 = self->_ucat;
    if (v25->var0 <= 90)
    {
      if (v25->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)v25, 0x5Au)) {
          goto LABEL_46;
        }
        uint64_t v25 = self->_ucat;
      }
      LogPrintF((uint64_t)v25, (uint64_t)"-[CUBluetoothScalablePipe _setupPipe]", 0x5Au, (uint64_t)"### Get channel slot size failed: %#m\n", v17, v18, v19, v20, v23);
    }
  }
LABEL_46:
  os_channel_attr_destroy();
LABEL_47:
  uint64_t v28 = self->_ucat;
  if (v28->var0 <= 90)
  {
    if (v28->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)v28, 0x5Au)) {
        goto LABEL_51;
      }
      uint64_t v28 = self->_ucat;
    }
    LogPrintF((uint64_t)v28, (uint64_t)"-[CUBluetoothScalablePipe _setupPipe]", 0x5Au, (uint64_t)"### Setup pipe failed: %#m\n", v5, v6, v7, v8, v23);
  }
LABEL_51:
  [(CUBluetoothScalablePipe *)self _tearDownPipe];
}

uint64_t __37__CUBluetoothScalablePipe__setupPipe__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _processReads];
}

uint64_t __37__CUBluetoothScalablePipe__setupPipe__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _processWrites];
}

- (void)_ensureStopped:(id)a3
{
  id v4 = a3;
  [(CUBluetoothScalablePipe *)self _abortReadsWithError:v4];
  [(CUBluetoothScalablePipe *)self _abortWritesWithError:v4];

  [(CUBluetoothScalablePipe *)self _tearDownPipe];
  btPipe = self->_btPipe;
  self->_btPipe = 0;

  uint64_t v6 = self->_identifier;
  if (v6 && (self->_btEndpointRegistered || self->_btEndpointRegistering)) {
    [(CBScalablePipeManager *)self->_btPipeManager unregisterEndpoint:v6];
  }
  *(_WORD *)&self->_btEndpointRegistering = 0;
  MEMORY[0x1F41817F8]();
}

- (void)_ensureStarted
{
  v30[1] = *MEMORY[0x1E4F143B8];
  if (self->_invalidateCalled) {
    return;
  }
  btPipeManager = self->_btPipeManager;
  if (!btPipeManager)
  {
    uint64_t v12 = (CBScalablePipeManager *)[objc_alloc((Class)getCBScalablePipeManagerClass[0]()) initWithDelegate:self queue:self->_dispatchQueue];
    uint64_t v13 = self->_btPipeManager;
    self->_btPipeManager = v12;

    uint64_t v14 = self->_btPipeManager;
    if (!v14)
    {
      ucat = self->_ucat;
      if (ucat->var0 > 90) {
        return;
      }
      if (ucat->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)ucat, 0x5Au)) {
          return;
        }
        ucat = self->_ucat;
      }
      uint64_t v16 = "### Create CBScalablePipeManager failed\n";
      goto LABEL_28;
    }
    if ([(CBScalablePipeManager *)v14 state] != 5) {
      return;
    }
LABEL_11:
    if (self->_btEndpointRegistering)
    {
      if (!self->_btEndpointRegistered)
      {
        if (!btPipeManager) {
          return;
        }
        ucat = self->_ucat;
        if (ucat->var0 > 20) {
          return;
        }
        if (ucat->var0 == -1)
        {
          if (!_LogCategory_Initialize((uint64_t)ucat, 0x14u)) {
            return;
          }
          ucat = self->_ucat;
        }
        uint64_t v16 = "Waiting until endpoint registered\n";
LABEL_33:
        unsigned int v20 = 20;
        goto LABEL_34;
      }
      goto LABEL_18;
    }
    if (self->_btEndpointRegistered)
    {
LABEL_18:
      p_btPipe = &self->_btPipe;
      if (!self->_btPipe)
      {
        if (!btPipeManager) {
          return;
        }
        ucat = self->_ucat;
        if (ucat->var0 > 20) {
          return;
        }
        if (ucat->var0 == -1)
        {
          if (!_LogCategory_Initialize((uint64_t)ucat, 0x14u)) {
            return;
          }
          ucat = self->_ucat;
        }
        uint64_t v16 = "Waiting until pipe connected\n";
        goto LABEL_33;
      }
LABEL_19:
      if (self->_channelFD < 0) {
        [(CUBluetoothScalablePipe *)self _setupPipe];
      }
      if (!self->_btPeerKVORegistered)
      {
        uint64_t v18 = [(CBScalablePipe *)*p_btPipe peer];
        uint64_t v19 = v18;
        if (v18)
        {
          [v18 addObserver:self forKeyPath:@"hostState" options:0 context:0];
          self->_btPeerKVORegistered = 1;
          [(CUBluetoothScalablePipe *)self _handleBTPeerHostStateChanged];
        }
      }
      return;
    }
    uint64_t v21 = self->_identifier;
    ucat = self->_ucat;
    int var0 = ucat->var0;
    if (v21)
    {
      if (var0 > 30) {
        goto LABEL_55;
      }
      if (var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
        {
LABEL_55:
          uint64_t v23 = 1;
          self->_btEndpointRegistering = 1;
          int priority = self->_priority;
          if (priority == 3) {
            uint64_t v23 = 2;
          }
          if (priority == 1) {
            uint64_t v25 = 0;
          }
          else {
            uint64_t v25 = v23;
          }
          uint64_t v26 = self->_btPipeManager;
          uint64_t v27 = getCBScalablePipeOptionTransport[0]();
          uint64_t v29 = v27;
          v30[0] = &unk_1EDD44068;
          uint64_t v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:&v29 count:1];
          [(CBScalablePipeManager *)v26 registerEndpoint:v21 type:0 priority:v25 options:v28];

          if (!self->_btEndpointRegistered) {
            return;
          }
          p_btPipe = &self->_btPipe;
          if (!self->_btPipe) {
            return;
          }
          goto LABEL_19;
        }
        ucat = self->_ucat;
      }
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBluetoothScalablePipe _ensureStarted]", 0x1Eu, (uint64_t)"Register endpoint '%@'\n", v5, v6, v7, v8, (uint64_t)v21);
      goto LABEL_55;
    }
    if (var0 > 90) {
      return;
    }
    if (var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)ucat, 0x5Au)) {
        return;
      }
      ucat = self->_ucat;
    }
    uint64_t v16 = "### No identifier to register endpoint\n";
LABEL_28:
    unsigned int v20 = 90;
LABEL_34:
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBluetoothScalablePipe _ensureStarted]", v20, (uint64_t)v16, v5, v6, v7, v8, v32);
    return;
  }
  uint64_t v4 = [(CBScalablePipeManager *)self->_btPipeManager state];
  if (v4 == 5) {
    goto LABEL_11;
  }
  unint64_t v9 = v4;
  uint64_t v10 = self->_ucat;
  if (v10->var0 > 20) {
    return;
  }
  if (v10->var0 == -1)
  {
    if (!_LogCategory_Initialize((uint64_t)v10, 0x14u)) {
      return;
    }
    uint64_t v10 = self->_ucat;
  }
  if (v9 > 0xA) {
    uint64_t v11 = "?";
  }
  else {
    uint64_t v11 = off_1E55BDD18[v9];
  }
  LogPrintF((uint64_t)v10, (uint64_t)"-[CUBluetoothScalablePipe _ensureStarted]", 0x14u, (uint64_t)"Waiting until Bluetooth ready (%s)\n", v5, v6, v7, v8, (uint64_t)v11);
}

- (void)_invalidate
{
  if (self->_invalidateCalled || self->_invalidateDone) {
    return;
  }
  self->_invalidateCalled = 1;
  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 != -1)
    {
LABEL_5:
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBluetoothScalablePipe _invalidate]", 0x1Eu, (uint64_t)"Invalidating\n", v2, v3, v4, v5, v26);
      goto LABEL_7;
    }
    if (_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
    {
      ucat = self->_ucat;
      goto LABEL_5;
    }
  }
LABEL_7:
  id peerHostStateChangedHandler = self->_peerHostStateChangedHandler;
  self->_id peerHostStateChangedHandler = 0;

  id stateChangedHandler = self->_stateChangedHandler;
  self->_id stateChangedHandler = 0;

  uint64_t v16 = NSErrorWithOSStatusF(4294960573, (uint64_t)"Invalidated (I)", v10, v11, v12, v13, v14, v15, v26);
  [(CUBluetoothScalablePipe *)self _ensureStopped:v16];

  [(CBScalablePipeManager *)self->_btPipeManager setDelegate:0];
  btPipeManager = self->_btPipeManager;
  self->_btPipeManager = 0;

  long long v22 = self->_ucat;
  if (v22->var0 <= 30)
  {
    if (v22->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)v22, 0x1Eu)) {
        goto LABEL_11;
      }
      long long v22 = self->_ucat;
    }
    LogPrintF((uint64_t)v22, (uint64_t)"-[CUBluetoothScalablePipe _invalidate]", 0x1Eu, (uint64_t)"Invalidated\n", v18, v19, v20, v21, v27);
  }
LABEL_11:
  invalidationHandler = (void (**)(void))self->_invalidationHandler;
  if (invalidationHandler)
  {
    invalidationHandler[2]();
    id v24 = self->_invalidationHandler;
  }
  else
  {
    id v24 = 0;
  }
  self->_invalidationHandler = 0;

  id v25 = self->_stateChangedHandler;
  self->_id stateChangedHandler = 0;

  self->_invalidateDone = 1;
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__CUBluetoothScalablePipe_invalidate__block_invoke;
  block[3] = &unk_1E55BFC18;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __37__CUBluetoothScalablePipe_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

- (void)activateWithCompletion:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__CUBluetoothScalablePipe_activateWithCompletion___block_invoke;
  v7[3] = &unk_1E55BF148;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __50__CUBluetoothScalablePipe_activateWithCompletion___block_invoke(uint64_t a1)
{
  id v24 = *(id *)(*(void *)(a1 + 32) + 200);
  if (v24)
  {
    id v8 = *(int **)(*(void *)(a1 + 32) + 16);
    if (*v8 > 30) {
      goto LABEL_9;
    }
    if (*v8 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)v8, 0x1Eu))
      {
LABEL_9:
        id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        uint64_t v16 = *(void *)(a1 + 32);
        uint64_t v17 = *(void **)(v16 + 128);
        *(void *)(v16 + 128) = v15;

        id v18 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        uint64_t v19 = *(void *)(a1 + 32);
        uint64_t v20 = *(void **)(v19 + 160);
        *(void *)(v19 + 160) = v18;

        [*(id *)(a1 + 32) _ensureStarted];
        uint64_t v21 = *(void *)(a1 + 40);
        if (v21) {
          (*(void (**)(uint64_t, void))(v21 + 16))(v21, 0);
        }
        goto LABEL_15;
      }
      id v8 = *(int **)(*(void *)(a1 + 32) + 16);
    }
    LogPrintF((uint64_t)v8, (uint64_t)"-[CUBluetoothScalablePipe activateWithCompletion:]_block_invoke", 0x1Eu, (uint64_t)"Activate\n", v4, v5, v6, v7, v23);
    goto LABEL_9;
  }
  uint64_t v13 = NSErrorWithOSStatusF(4294960591, (uint64_t)"No endpoint identifier", v2, v3, v4, v5, v6, v7, v23);
  uint64_t v14 = *(int **)(*(void *)(a1 + 32) + 16);
  if (*v14 <= 90)
  {
    if (*v14 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)v14, 0x5Au)) {
        goto LABEL_12;
      }
      uint64_t v14 = *(int **)(*(void *)(a1 + 32) + 16);
    }
    LogPrintF((uint64_t)v14, (uint64_t)"-[CUBluetoothScalablePipe activateWithCompletion:]_block_invoke", 0x5Au, (uint64_t)"### Activate failed: %{error}\n", v9, v10, v11, v12, (uint64_t)v13);
  }
LABEL_12:
  uint64_t v22 = *(void *)(a1 + 40);
  if (v22) {
    (*(void (**)(uint64_t, void *))(v22 + 16))(v22, v13);
  }

LABEL_15:
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
  id v5 = a3;
  p_ucat = (uint64_t *)&self->_ucat;
  uint64_t v7 = qword_1E91CC688;
  id v14 = v5;
  [v14 UTF8String];
  LogCategoryReplaceF(p_ucat, (uint64_t)"%s-%s", v8, v9, v10, v11, v12, v13, v7);
}

- (NSString)description
{
  return (NSString *)NSPrintF((uint64_t)"CUBluetoothScalablePipe '%@', Registered %s, State %s, Priority %s, PeerState %s, Peer %@", (uint64_t)a2, v2, v3, v4, v5, v6, v7, (uint64_t)self->_identifier);
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
  v4.super_class = (Class)CUBluetoothScalablePipe;
  [(CUBluetoothScalablePipe *)&v4 dealloc];
}

- (CUBluetoothScalablePipe)init
{
  v6.receiver = self;
  v6.super_class = (Class)CUBluetoothScalablePipe;
  uint64_t v2 = [(CUBluetoothScalablePipe *)&v6 init];
  uint64_t v3 = v2;
  if (v2)
  {
    v2->_channelFD = -1;
    if (CUMainQueue_sOnce != -1) {
      dispatch_once(&CUMainQueue_sOnce, &__block_literal_global_18);
    }
    objc_storeStrong((id *)&v3->_dispatchQueue, (id)CUMainQueue_sQueue);
    v3->_int priority = 2;
    v3->_ucat = (LogCategory *)&gLogCategory_CUBluetoothScalablePipe;
    objc_super v4 = v3;
  }

  return v3;
}

@end
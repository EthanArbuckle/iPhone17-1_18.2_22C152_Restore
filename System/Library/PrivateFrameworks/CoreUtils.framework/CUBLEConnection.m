@interface CUBLEConnection
- (BOOL)_prepareWriteRequest:(id)a3 error:(id *)a4;
- (BOOL)_processReadStatus;
- (BOOL)_runConnectStart;
- (BOOL)_runSetupChannel;
- (BOOL)_setupIOAndReturnError:(id *)a3;
- (BOOL)_startConnectingAndReturnError:(id *)a3;
- (BOOL)activateDirectAndReturnError:(id *)a3;
- (CBL2CAPChannel)l2capChannel;
- (CUBLEConnection)init;
- (NSString)clientBundleID;
- (NSString)description;
- (NSString)label;
- (NSUUID)destinationUUID;
- (OS_dispatch_queue)dispatchQueue;
- (id)errorHandler;
- (id)invalidationHandler;
- (id)serverInvalidationHandler;
- (int)connectionLatency;
- (int64_t)clientUseCase;
- (unsigned)destinationPSM;
- (void)_abortReadsWithError:(id)a3;
- (void)_abortWritesWithError:(id)a3;
- (void)_completeReadRequest:(id)a3 error:(id)a4;
- (void)_completeWriteRequest:(id)a3 error:(id)a4;
- (void)_invalidate;
- (void)_invalidated;
- (void)_prepareReadRequest:(id)a3;
- (void)_processReads:(BOOL)a3;
- (void)_processWrites;
- (void)_reportError:(id)a3;
- (void)_run;
- (void)activateWithCompletion:(id)a3;
- (void)centralManager:(id)a3 didConnectPeripheral:(id)a4;
- (void)centralManager:(id)a3 didFailToConnectPeripheral:(id)a4 error:(id)a5;
- (void)centralManagerDidUpdateState:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)peripheral:(id)a3 didOpenL2CAPChannel:(id)a4 error:(id)a5;
- (void)readWithRequest:(id)a3;
- (void)setClientBundleID:(id)a3;
- (void)setClientUseCase:(int64_t)a3;
- (void)setConnectionLatency:(int)a3;
- (void)setDestinationPSM:(unsigned __int16)a3;
- (void)setDestinationUUID:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setErrorHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setL2capChannel:(id)a3;
- (void)setLabel:(id)a3;
- (void)setServerInvalidationHandler:(id)a3;
- (void)writeEndOfDataWithCompletion:(id)a3;
- (void)writeWithRequest:(id)a3;
@end

@implementation CUBLEConnection

- (void).cxx_destruct
{
  objc_storeStrong(&self->_serverInvalidationHandler, 0);
  objc_storeStrong((id *)&self->_l2capChannel, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_errorHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_destinationUUID, 0);
  objc_storeStrong((id *)&self->_clientBundleID, 0);
  objc_storeStrong((id *)&self->_writeRequests, 0);
  objc_storeStrong((id *)&self->_writeRequestCurrent, 0);
  objc_storeStrong((id *)&self->_writeSource, 0);
  objc_storeStrong((id *)&self->_readRequests, 0);
  objc_storeStrong((id *)&self->_readRequestCurrent, 0);
  objc_storeStrong((id *)&self->_readSource, 0);
  objc_storeStrong((id *)&self->_peripheral, 0);
  objc_storeStrong((id *)&self->_centralManager, 0);
  objc_storeStrong(&self->_activateCompletion, 0);
}

- (void)setServerInvalidationHandler:(id)a3
{
}

- (id)serverInvalidationHandler
{
  return self->_serverInvalidationHandler;
}

- (void)setL2capChannel:(id)a3
{
}

- (CBL2CAPChannel)l2capChannel
{
  return self->_l2capChannel;
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

- (void)setErrorHandler:(id)a3
{
}

- (id)errorHandler
{
  return self->_errorHandler;
}

- (void)setDispatchQueue:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDestinationUUID:(id)a3
{
}

- (NSUUID)destinationUUID
{
  return self->_destinationUUID;
}

- (void)setDestinationPSM:(unsigned __int16)a3
{
  self->_destinationPSM = a3;
}

- (unsigned)destinationPSM
{
  return self->_destinationPSM;
}

- (void)setConnectionLatency:(int)a3
{
  self->_connectionLatency = a3;
}

- (int)connectionLatency
{
  return self->_connectionLatency;
}

- (void)setClientUseCase:(int64_t)a3
{
  self->_clientUseCase = a3;
}

- (int64_t)clientUseCase
{
  return self->_clientUseCase;
}

- (void)setClientBundleID:(id)a3
{
}

- (NSString)clientBundleID
{
  return self->_clientBundleID;
}

- (void)peripheral:(id)a3 didOpenL2CAPChannel:(id)a4 error:(id)a5
{
  id v56 = a3;
  id v8 = a4;
  id v9 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateCalled)
  {
    if (self->_l2capChannel)
    {
      ucat = self->_ucat;
      if (ucat->var0 > 60) {
        goto LABEL_2;
      }
      if (ucat->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)ucat, 0x3Cu)) {
          goto LABEL_2;
        }
        ucat = self->_ucat;
      }
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBLEConnection peripheral:didOpenL2CAPChannel:error:]", 0x3Cu, (uint64_t)"### DidOpenL2CAPChannel already open: channel %@, error %{error}\n", v10, v11, v12, v13, (uint64_t)v8);
      goto LABEL_2;
    }
    v15 = [v56 identifier];
    destinationUUID = self->_destinationUUID;
    v17 = v15;
    v18 = destinationUUID;
    if (v17 == v18)
    {
    }
    else
    {
      v19 = v18;
      if ((v17 == 0) == (v18 != 0))
      {

        goto LABEL_20;
      }
      char v20 = [(NSUUID *)v17 isEqual:v18];

      if ((v20 & 1) == 0)
      {
LABEL_20:
        v26 = self->_ucat;
        if (v26->var0 > 60) {
          goto LABEL_2;
        }
        if (v26->var0 == -1)
        {
          if (!_LogCategory_Initialize((uint64_t)self->_ucat, 0x3Cu)) {
            goto LABEL_2;
          }
          v26 = self->_ucat;
        }
        v27 = [v56 identifier];
        LogPrintF((uint64_t)v26, (uint64_t)"-[CUBLEConnection peripheral:didOpenL2CAPChannel:error:]", 0x3Cu, (uint64_t)"### DidOpenL2CAPChannel wrong peer: peer %@ (not %@), channel %@, error %{error}\n", v28, v29, v30, v31, (uint64_t)v27);

        goto LABEL_2;
      }
    }
    v25 = self->_ucat;
    if (v25->var0 <= 30)
    {
      if (v25->var0 != -1)
      {
LABEL_16:
        LogPrintF((uint64_t)v25, (uint64_t)"-[CUBLEConnection peripheral:didOpenL2CAPChannel:error:]", 0x1Eu, (uint64_t)"DidOpenL2CAPChannel %@, error %{error}\n", v21, v22, v23, v24, (uint64_t)v8);
        goto LABEL_24;
      }
      if (_LogCategory_Initialize((uint64_t)v25, 0x1Eu))
      {
        v25 = self->_ucat;
        goto LABEL_16;
      }
    }
LABEL_24:
    if (v9)
    {
      v32 = NSErrorNestedF((void *)*MEMORY[0x1E4F28760], 4294960541, v9, (uint64_t)"L2CAP open channel failed", v21, v22, v23, v24, v54);
      [(CUBLEConnection *)self _reportError:v32];
      goto LABEL_26;
    }
    id v33 = v8;
    v32 = v33;
    if (!v33)
    {
      v47 = NSErrorWithOSStatusF(4294960596, (uint64_t)"L2CAP open channel null", v34, v35, v36, v37, v38, v39, v54);
      [(CUBLEConnection *)self _reportError:v47];

      goto LABEL_26;
    }
    if ([v33 PSM] != self->_destinationPSM)
    {
      v48 = self->_ucat;
      if (v48->var0 <= 60)
      {
        if (v48->var0 == -1)
        {
          if (!_LogCategory_Initialize((uint64_t)self->_ucat, 0x3Cu)) {
            goto LABEL_26;
          }
          v48 = self->_ucat;
        }
        unsigned int v49 = [v32 PSM];
        LogPrintF((uint64_t)v48, (uint64_t)"-[CUBLEConnection peripheral:didOpenL2CAPChannel:error:]", 0x3Cu, (uint64_t)"### DidOpenL2CAPChannel wrong PSM: 0x%04X (not 0x%04X)\n", v50, v51, v52, v53, v49);
      }
LABEL_26:

      goto LABEL_2;
    }
    objc_storeStrong((id *)&self->_l2capChannel, a4);
    v40 = self->_ucat;
    if (v40->var0 <= 30)
    {
      if (v40->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)self->_ucat, 0x1Eu)) {
          goto LABEL_39;
        }
        v40 = self->_ucat;
      }
      unsigned int v41 = [v32 PSM];
      v42 = [v32 peer];
      v55 = [v42 identifier];
      LogPrintF((uint64_t)v40, (uint64_t)"-[CUBLEConnection peripheral:didOpenL2CAPChannel:error:]", 0x1Eu, (uint64_t)"Connection started PSM 0x%04X, peer %@\n", v43, v44, v45, v46, v41);
    }
LABEL_39:
    [(CUBLEConnection *)self _run];
    goto LABEL_26;
  }
LABEL_2:
}

- (void)centralManager:(id)a3 didFailToConnectPeripheral:(id)a4 error:(id)a5
{
  id v35 = a4;
  id v7 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateCalled)
  {
    id v8 = [v35 identifier];
    destinationUUID = self->_destinationUUID;
    uint64_t v10 = v8;
    uint64_t v11 = destinationUUID;
    if (v10 == v11)
    {
    }
    else
    {
      uint64_t v12 = v11;
      if ((v10 == 0) == (v11 != 0))
      {

        goto LABEL_14;
      }
      char v13 = [(NSUUID *)v10 isEqual:v11];

      if ((v13 & 1) == 0)
      {
LABEL_14:
        ucat = self->_ucat;
        if (ucat->var0 > 60) {
          goto LABEL_2;
        }
        if (ucat->var0 == -1)
        {
          if (!_LogCategory_Initialize((uint64_t)self->_ucat, 0x3Cu)) {
            goto LABEL_2;
          }
          ucat = self->_ucat;
        }
        uint64_t v28 = [v35 identifier];
        LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBLEConnection centralManager:didFailToConnectPeripheral:error:]", 0x3Cu, (uint64_t)"### DidFailToConnectPeripheral wrong peripheral: %@ (not %@), error %{error}\n", v29, v30, v31, v32, (uint64_t)v28);

        goto LABEL_2;
      }
    }
    char v20 = self->_ucat;
    if (v20->var0 <= 90)
    {
      uint64_t v21 = v35;
      if (v20->var0 != -1)
      {
LABEL_12:
        uint64_t v22 = [v21 identifier];
        LogPrintF((uint64_t)v20, (uint64_t)"-[CUBLEConnection centralManager:didFailToConnectPeripheral:error:]", 0x5Au, (uint64_t)"### DidFailToConnectPeripheral %@, error %{error}\n", v23, v24, v25, v26, (uint64_t)v22);

        goto LABEL_18;
      }
      if (_LogCategory_Initialize((uint64_t)self->_ucat, 0x5Au))
      {
        char v20 = self->_ucat;
        uint64_t v21 = v35;
        goto LABEL_12;
      }
    }
LABEL_18:
    if (v7)
    {
      [(CUBLEConnection *)self _reportError:v7];
    }
    else
    {
      id v33 = NSErrorWithOSStatusF(4294960543, (uint64_t)"Connect failed without error", v14, v15, v16, v17, v18, v19, v34);
      [(CUBLEConnection *)self _reportError:v33];
    }
  }
LABEL_2:
}

- (void)centralManager:(id)a3 didConnectPeripheral:(id)a4
{
  id v35 = a3;
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_invalidateCalled) {
    goto LABEL_28;
  }
  id v7 = [v6 identifier];
  destinationUUID = self->_destinationUUID;
  id v9 = v7;
  uint64_t v10 = destinationUUID;
  if (v9 == v10)
  {

    goto LABEL_7;
  }
  uint64_t v11 = v10;
  if ((v9 == 0) != (v10 != 0))
  {
    char v12 = [(NSUUID *)v9 isEqual:v10];

    if ((v12 & 1) == 0) {
      goto LABEL_11;
    }
LABEL_7:
    ucat = self->_ucat;
    if (ucat->var0 > 30) {
      goto LABEL_15;
    }
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)self->_ucat, 0x1Eu))
      {
LABEL_15:
        int connectionLatency = self->_connectionLatency;
        if (!connectionLatency)
        {
LABEL_27:
          self->_guardConnected = 1;
          [(CUBLEConnection *)self _run];
          goto LABEL_28;
        }
        if (connectionLatency == 3) {
          uint64_t v26 = 2;
        }
        else {
          uint64_t v26 = connectionLatency == 2;
        }
        v27 = self->_ucat;
        uint64_t v28 = v35;
        if (v27->var0 <= 30)
        {
          if (v27->var0 == -1)
          {
            BOOL v30 = _LogCategory_Initialize((uint64_t)self->_ucat, 0x1Eu);
            uint64_t v28 = v35;
            if (!v30) {
              goto LABEL_26;
            }
            v27 = self->_ucat;
          }
          uint64_t v29 = [v6 identifier];
          LogPrintF((uint64_t)v27, (uint64_t)"-[CUBLEConnection centralManager:didConnectPeripheral:]", 0x1Eu, (uint64_t)"Setting connection latency %@, %s (BT %d)\n", v31, v32, v33, v34, (uint64_t)v29);

          uint64_t v28 = v35;
        }
LABEL_26:
        [v28 setDesiredConnectionLatency:v26 forPeripheral:v6];
        goto LABEL_27;
      }
      ucat = self->_ucat;
    }
    uint64_t v14 = [v6 identifier];
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBLEConnection centralManager:didConnectPeripheral:]", 0x1Eu, (uint64_t)"DidConnectPeripheral %@\n", v15, v16, v17, v18, (uint64_t)v14);

    goto LABEL_15;
  }

LABEL_11:
  uint64_t v19 = self->_ucat;
  if (v19->var0 > 60) {
    goto LABEL_28;
  }
  if (v19->var0 != -1) {
    goto LABEL_13;
  }
  if (_LogCategory_Initialize((uint64_t)self->_ucat, 0x3Cu))
  {
    uint64_t v19 = self->_ucat;
LABEL_13:
    char v20 = [v6 identifier];
    LogPrintF((uint64_t)v19, (uint64_t)"-[CUBLEConnection centralManager:didConnectPeripheral:]", 0x3Cu, (uint64_t)"### DidConnectPeripheral wrong peripheral: %@ (not %@)\n", v21, v22, v23, v24, (uint64_t)v20);
  }
LABEL_28:
}

- (void)centralManagerDidUpdateState:(id)a3
{
  id v17 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_invalidateCalled) {
    goto LABEL_2;
  }
  unint64_t v10 = [v17 state];
  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu)) {
        goto LABEL_13;
      }
      ucat = self->_ucat;
    }
    if (v10 > 0xA) {
      char v12 = "?";
    }
    else {
      char v12 = off_1E55BDD88[v10];
    }
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBLEConnection centralManagerDidUpdateState:]", 0x1Eu, (uint64_t)"Bluetooth state changed: %s\n", v6, v7, v8, v9, (uint64_t)v12);
  }
LABEL_13:
  switch(v10)
  {
    case 1uLL:
      uint64_t v13 = 4294896145;
      uint64_t v14 = "Bluetooth reset";
      goto LABEL_17;
    case 4uLL:
      uint64_t v14 = "Bluetooth powered off";
      uint64_t v13 = 4294896144;
LABEL_17:
      uint64_t v15 = NSErrorWithOSStatusF(v13, (uint64_t)v14, v4, v5, v6, v7, v8, v9, v16);
      [(CUBLEConnection *)self _reportError:v15];

      break;
    case 5uLL:
    case 0xAuLL:
      [(CUBLEConnection *)self _run];
      break;
    default:
      break;
  }
LABEL_2:
}

- (void)_completeWriteRequest:(id)a3 error:(id)a4
{
  uint64_t v14 = a3;
  id v10 = a4;
  ucat = self->_ucat;
  if (ucat->var0 <= 10)
  {
    if (ucat->var0 != -1)
    {
LABEL_3:
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBLEConnection _completeWriteRequest:error:]", 0xAu, (uint64_t)"Write completed: %{error}\n", v6, v7, v8, v9, (uint64_t)v10);
      goto LABEL_5;
    }
    if (_LogCategory_Initialize((uint64_t)ucat, 0xAu))
    {
      ucat = self->_ucat;
      goto LABEL_3;
    }
  }
LABEL_5:
  char v12 = (void *)v14[1];
  v14[1] = v10;

  uint64_t v13 = [v14 completion];
  [v14 setCompletion:0];
  if (v13) {
    v13[2](v13);
  }
}

- (void)_abortWritesWithError:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (self->_writeRequestCurrent || [(NSMutableArray *)self->_writeRequests count])
  {
    ucat = self->_ucat;
    if (ucat->var0 <= 30)
    {
      if (ucat->var0 != -1)
      {
LABEL_5:
        LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBLEConnection _abortWritesWithError:]", 0x1Eu, (uint64_t)"Abort writes: %{error}\n", v4, v5, v6, v7, (uint64_t)v8);
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

    [(CUBLEConnection *)self _completeWriteRequest:v10 error:v8];
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  char v12 = self->_writeRequests;
  uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v22;
    do
    {
      uint64_t v16 = 0;
      id v17 = v10;
      do
      {
        if (*(void *)v22 != v15) {
          objc_enumerationMutation(v12);
        }
        id v10 = (CUWriteRequest *)*(id *)(*((void *)&v21 + 1) + 8 * v16);

        [(CUBLEConnection *)self _completeWriteRequest:v10 error:v8];
        ++v16;
        id v17 = v10;
      }
      while (v14 != v16);
      uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
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
  uint64_t v19 = (void (**)(void *, id))_Block_copy(self->_errorHandler);
  id errorHandler = self->_errorHandler;
  self->_id errorHandler = 0;

  if (v19) {
    v19[2](v19, v8);
  }
  [(CUBLEConnection *)self _invalidated];
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
    long long v22 = v6 + 16;
    if (v21)
    {
      uint64_t v23 = v21;
      uint64_t v24 = *(void *)v40;
      long long v22 = v6 + 16;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v40 != v24) {
            objc_enumerationMutation(v20);
          }
          id v26 = *(id *)(*((void *)&v39 + 1) + 8 * i);
          *(void *)long long v22 = [v26 bytes];
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
    v27 = (void *)*((void *)v6 + 1);
    *((void *)v6 + 1) = 0;

    if (gLogCategory_CUBLEConnection > 10
      || gLogCategory_CUBLEConnection == -1 && !_LogCategory_Initialize((uint64_t)&gLogCategory_CUBLEConnection, 0xAu))
    {
      goto LABEL_27;
    }
    uint64_t v32 = *((unsigned int *)v6 + 70);
    if (v32)
    {
      uint64_t v33 = 0;
      uint64_t v34 = 16 * (int)v32;
      id v35 = (uint64_t *)(*((void *)v6 + 34) + 8);
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
    if (ucat->var0 > 10) {
      goto LABEL_27;
    }
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)ucat, 0xAu)) {
        goto LABEL_27;
      }
      ucat = self->_ucat;
      uint64_t v32 = *((unsigned int *)v6 + 70);
    }
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBLEConnection _prepareWriteRequest:error:]", 0xAu, (uint64_t)"Write prepared (%d iov, %zu total)\n", v28, v29, v30, v31, v32);
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
      uint64_t v14 = [(NSMutableArray *)self->_writeRequests firstObject];
      if (!v14)
      {
        if (!self->_writeSuspended)
        {
          self->_writeSuspended = 1;
          dispatch_suspend((dispatch_object_t)self->_writeSource);
        }
        uint64_t v5 = 0;
        goto LABEL_37;
      }
      uint64_t v5 = (CUWriteRequest *)v14;
      [(NSMutableArray *)self->_writeRequests removeObjectAtIndex:0];
      id v32 = 0;
      [(CUBLEConnection *)self _prepareWriteRequest:v5 error:&v32];
      id v15 = v32;
      if (v15)
      {
        uint64_t v16 = v15;
        goto LABEL_24;
      }
      objc_storeStrong((id *)p_writeRequestCurrent, v5);
    }
    uint64_t v12 = SocketWriteData(self->_socketFD, (const iovec **)&v5->_iop, &v5->_ion);
    ucat = self->_ucat;
    if (ucat->var0 <= 20)
    {
      if (ucat->var0 != -1) {
        goto LABEL_5;
      }
      if (_LogCategory_Initialize((uint64_t)ucat, 0x14u))
      {
        ucat = self->_ucat;
LABEL_5:
        LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBLEConnection _processWrites]", 0x14u, (uint64_t)"Write socket %d, pre-ion %d, post-ion %d, %#m\n", v8, v9, v10, v11, self->_socketFD);
      }
    }
    if (v12)
    {
      if (v12 == 35)
      {
        if (self->_writeSuspended)
        {
          self->_writeSuspended = 0;
          dispatch_resume((dispatch_object_t)self->_writeSource);
        }
      }
      else
      {
        uint64_t v30 = NSErrorWithOSStatusF(v12, (uint64_t)"Write failed", v6, v7, v8, v9, v10, v11, v31);
        [(CUBLEConnection *)self _abortWritesWithError:v30];
      }
LABEL_37:

      return;
    }
    if (![(CUWriteRequest *)v5 endOfData]) {
      goto LABEL_20;
    }
    uint64_t v21 = self->_ucat;
    if (v21->var0 <= 20)
    {
      if (v21->var0 != -1) {
        goto LABEL_14;
      }
      if (_LogCategory_Initialize((uint64_t)v21, 0x14u))
      {
        uint64_t v21 = self->_ucat;
LABEL_14:
        LogPrintF((uint64_t)v21, (uint64_t)"-[CUBLEConnection _processWrites]", 0x14u, (uint64_t)"Shutdown socket %d\n", v17, v18, v19, v20, self->_socketFD);
      }
    }
    if (shutdown(self->_socketFD, 1))
    {
      if (!*__error())
      {
        uint64_t v28 = 4294960596;
LABEL_22:
        uint64_t v16 = NSErrorWithOSStatusF(v28, (uint64_t)"shutdown() failed", v22, v23, v24, v25, v26, v27, v31);
        goto LABEL_23;
      }
      uint64_t v28 = *__error();
      if (v28) {
        goto LABEL_22;
      }
    }
LABEL_20:
    uint64_t v16 = 0;
LABEL_23:
    writeRequestCurrent = self->_writeRequestCurrent;
    self->_writeRequestCurrent = 0;

LABEL_24:
    [(CUBLEConnection *)self _completeWriteRequest:v5 error:v16];

    --v4;
  }
  while (v4);
  if (self->_writeSuspended)
  {
    self->_writeSuspended = 0;
    dispatch_resume((dispatch_object_t)self->_writeSource);
  }
}

- (void)writeEndOfDataWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_alloc_init(CUWriteRequest);
  [(CUWriteRequest *)v5 setEndOfData:1];
  if (v4)
  {
    uint64_t v6 = MEMORY[0x1E4F143A8];
    uint64_t v7 = 3221225472;
    uint64_t v8 = __48__CUBLEConnection_writeEndOfDataWithCompletion___block_invoke;
    uint64_t v9 = &unk_1E55BF148;
    id v11 = v4;
    uint64_t v10 = v5;
    [(CUWriteRequest *)v10 setCompletion:&v6];
  }
  -[CUBLEConnection writeWithRequest:](self, "writeWithRequest:", v5, v6, v7, v8, v9);
}

void __48__CUBLEConnection_writeEndOfDataWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) error];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)writeWithRequest:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __36__CUBLEConnection_writeWithRequest___block_invoke;
  v7[3] = &unk_1E55BF170;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __36__CUBLEConnection_writeWithRequest___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v9 + 25))
  {
    uint64_t v10 = *(void *)(a1 + 40);
    NSErrorWithOSStatusF(4294960573, (uint64_t)"Invalidated (W)", a3, a4, a5, a6, a7, a8, v12);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    [(id)v9 _completeWriteRequest:v10 error:v13];
  }
  else
  {
    [*(id *)(v9 + 104) addObject:*(void *)(a1 + 40)];
    id v11 = *(_DWORD **)(a1 + 32);
    if ((v11[18] & 0x80000000) == 0)
    {
      [v11 _processWrites];
    }
  }
}

- (void)_completeReadRequest:(id)a3 error:(id)a4
{
  uint64_t v16 = a3;
  id v6 = a4;
  ucat = self->_ucat;
  if (ucat->var0 <= 10)
  {
    id v8 = v16;
    if (ucat->var0 != -1)
    {
LABEL_3:
      uint64_t v9 = [v8 length];
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBLEConnection _completeReadRequest:error:]", 0xAu, (uint64_t)"Read completed: %zu byte(s), %{error}\n", v10, v11, v12, v13, v9);
      goto LABEL_5;
    }
    if (_LogCategory_Initialize((uint64_t)self->_ucat, 0xAu))
    {
      ucat = self->_ucat;
      id v8 = v16;
      goto LABEL_3;
    }
  }
LABEL_5:
  uint64_t v14 = (void *)v16[2];
  v16[2] = v6;

  id v15 = [v16 completion];
  [v16 setCompletion:0];
  if (v15) {
    v15[2](v15);
  }
}

- (BOOL)_processReadStatus
{
  while (1)
  {
    ssize_t v3 = recv(self->_socketFD, &v25, 1uLL, 2);
    if ((v3 & 0x8000000000000000) == 0) {
      break;
    }
    if (!*__error())
    {
      uint64_t v4 = 4294960596;
LABEL_12:
      id v15 = (void (**)(void *, void *))_Block_copy(self->_errorHandler);
      id errorHandler = self->_errorHandler;
      self->_id errorHandler = 0;

      if (v15)
      {
        uint64_t v23 = NSErrorWithOSStatusF(v4, (uint64_t)"Read status error", v17, v18, v19, v20, v21, v22, v24);
        v15[2](v15, v23);
      }
      return 1;
    }
    uint64_t v4 = *__error();
    if (v4 != 4)
    {
      if (!v4) {
        return 1;
      }
      if (v4 == 35) {
        return 0;
      }
      goto LABEL_12;
    }
  }
  if (!v3)
  {
    id v6 = (void (**)(void *, void *))_Block_copy(self->_errorHandler);
    id v7 = self->_errorHandler;
    self->_id errorHandler = 0;

    if (v6)
    {
      uint64_t v14 = NSErrorWithOSStatusF(4294960543, (uint64_t)"Read status EOF", v8, v9, v10, v11, v12, v13, v24);
      v6[2](v6, v14);
    }
  }
  return 1;
}

- (void)_abortReadsWithError:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (self->_readRequestCurrent || [(NSMutableArray *)self->_readRequests count])
  {
    ucat = self->_ucat;
    if (ucat->var0 <= 30)
    {
      if (ucat->var0 != -1)
      {
LABEL_5:
        LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBLEConnection _abortReadsWithError:]", 0x1Eu, (uint64_t)"Abort reads: %{error}\n", v4, v5, v6, v7, (uint64_t)v8);
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

    [(CUBLEConnection *)self _completeReadRequest:v10 error:v8];
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v12 = self->_readRequests;
  uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v22;
    do
    {
      uint64_t v16 = 0;
      uint64_t v17 = v10;
      do
      {
        if (*(void *)v22 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v10 = (CUReadRequest *)*(id *)(*((void *)&v21 + 1) + 8 * v16);

        [(CUBLEConnection *)self _completeReadRequest:v10 error:v8];
        ++v16;
        uint64_t v17 = v10;
      }
      while (v14 != v16);
      uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
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
  uint64_t v19 = (void (**)(void *, id))_Block_copy(self->_errorHandler);
  id errorHandler = self->_errorHandler;
  self->_id errorHandler = 0;

  if (v19) {
    v19[2](v19, v8);
  }
  [(CUBLEConnection *)self _invalidated];
}

- (void)_prepareReadRequest:(id)a3
{
  long long v21 = a3;
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
      uint64_t v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA58]), "initWithLength:", objc_msgSend(v21, "maxLength"));
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
  if (ucat->var0 <= 10)
  {
    uint64_t v15 = v21;
    if (ucat->var0 != -1)
    {
LABEL_10:
      uint64_t v16 = [v15 minLength];
      [v21 maxLength];
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBLEConnection _prepareReadRequest:]", 0xAu, (uint64_t)"Read prepared (%zu min, %zu max)\n", v17, v18, v19, v20, v16);
      goto LABEL_12;
    }
    if (_LogCategory_Initialize((uint64_t)self->_ucat, 0xAu))
    {
      ucat = self->_ucat;
      uint64_t v15 = v21;
      goto LABEL_10;
    }
  }
LABEL_12:
}

- (void)_processReads:(BOOL)a3
{
  BOOL v29 = a3;
  int v4 = 0;
  p_readRequestCurrent = &self->_readRequestCurrent;
  while (1)
  {
    unint64_t v6 = *p_readRequestCurrent;
    if (v6) {
      goto LABEL_5;
    }
    uint64_t v7 = [(NSMutableArray *)self->_readRequests firstObject];
    if (!v7)
    {
      if (v29)
      {
        if (v4)
        {
          int readSuspended = self->_readSuspended;
        }
        else
        {
          BOOL v27 = [(CUBLEConnection *)self _processReadStatus];
          int readSuspended = self->_readSuspended;
          if (v27)
          {
            if (!self->_readSuspended)
            {
              self->_int readSuspended = 1;
              dispatch_suspend((dispatch_object_t)self->_readSource);
            }
            goto LABEL_37;
          }
        }
        if (readSuspended)
        {
          self->_int readSuspended = 0;
          dispatch_resume((dispatch_object_t)self->_readSource);
        }
      }
LABEL_37:
      long long v24 = 0;
      goto LABEL_21;
    }
    id obja = (id)v7;
    [(NSMutableArray *)self->_readRequests removeObjectAtIndex:0];
    [(CUBLEConnection *)self _prepareReadRequest:obja];
    objc_storeStrong((id *)p_readRequestCurrent, obja);
    unint64_t v6 = (uint64_t *)obja;
LABEL_5:
    obj = v6;
    uint64_t Data = SocketReadDataEx(self->_socketFD, v6[1], [v6 minLength], objc_msgSend(v6, "maxLength"), v6 + 3);
    ucat = self->_ucat;
    if (ucat->var0 > 20) {
      goto LABEL_9;
    }
    if (ucat->var0 != -1) {
      goto LABEL_7;
    }
    if (_LogCategory_Initialize((uint64_t)self->_ucat, 0x14u))
    {
      ucat = self->_ucat;
LABEL_7:
      uint64_t socketFD = self->_socketFD;
      [obj minLength];
      [obj maxLength];
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBLEConnection _processReads:]", 0x14u, (uint64_t)"Read socket %d, %zu min, %zu max, %zu offset, %zu nread, %#m\n", v17, v18, v19, v20, socketFD);
    }
LABEL_9:
    if (Data) {
      break;
    }
    readRequestCurrent = self->_readRequestCurrent;
    self->_readRequestCurrent = 0;

    [(CUBLEConnection *)self _completeReadRequest:obj error:0];
    if (++v4 == 4)
    {
      if (self->_readSuspended)
      {
        self->_int readSuspended = 0;
        readSource = self->_readSource;
        dispatch_resume(readSource);
      }
      return;
    }
  }
  if (Data == 35)
  {
    if (self->_readSuspended)
    {
      self->_int readSuspended = 0;
      dispatch_resume((dispatch_object_t)self->_readSource);
    }
  }
  else
  {
    if (Data == -6753) {
      long long v22 = "Read EOF";
    }
    else {
      long long v22 = "Read error";
    }
    long long v23 = NSErrorWithOSStatusF(Data, (uint64_t)v22, v8, v9, v10, v11, v12, v13, v28);
    [(CUBLEConnection *)self _abortReadsWithError:v23];
  }
  long long v24 = obj;
LABEL_21:
}

- (void)readWithRequest:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __35__CUBLEConnection_readWithRequest___block_invoke;
  v7[3] = &unk_1E55BF170;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __35__CUBLEConnection_readWithRequest___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v9 + 25))
  {
    uint64_t v10 = *(void *)(a1 + 40);
    NSErrorWithOSStatusF(4294960573, (uint64_t)"Invalidated (R)", a3, a4, a5, a6, a7, a8, v12);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    [(id)v9 _completeReadRequest:v10 error:v13];
  }
  else
  {
    [*(id *)(v9 + 64) addObject:*(void *)(a1 + 40)];
    uint64_t v11 = *(_DWORD **)(a1 + 32);
    if ((v11[18] & 0x80000000) == 0)
    {
      [v11 _processReads:0];
    }
  }
}

- (BOOL)_runSetupChannel
{
  id v8 = 0;
  BOOL v3 = [(CUBLEConnection *)self _setupIOAndReturnError:&v8];
  id v4 = v8;
  if (v3)
  {
    uint64_t v5 = (void (**)(void *, void))_Block_copy(self->_activateCompletion);
    id activateCompletion = self->_activateCompletion;
    self->_id activateCompletion = 0;

    if (v5) {
      v5[2](v5, 0);
    }
  }
  else
  {
    [(CUBLEConnection *)self _reportError:v4];
  }

  return v3;
}

- (BOOL)_runConnectStart
{
  v29[1] = *MEMORY[0x1E4F143B8];
  BOOL v3 = self->_destinationUUID;
  centralManager = self->_centralManager;
  v29[0] = v3;
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:1];
  id v6 = [(CBCentralManager *)centralManager retrievePeripheralsWithIdentifiers:v5];

  id v13 = [v6 firstObject];
  if (v13)
  {
    objc_storeStrong((id *)&self->_peripheral, v13);
    [(CBPeripheral *)self->_peripheral setDelegate:self];
    id v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v15 = getCBConnectPeripheralOptionClientBundleID[0]();

    if (v15)
    {
      clientBundleID = self->_clientBundleID;
      if (clientBundleID)
      {
        uint64_t v17 = (void (__cdecl *)())getCBConnectPeripheralOptionClientBundleID[0];
        uint64_t v18 = clientBundleID;
        uint64_t v19 = v17();
        [v14 setObject:v18 forKeyedSubscript:v19];
      }
    }
    uint64_t v20 = getCBConnectPeripheralOptionConnectionUseCase[0]();

    if (v20 && self->_clientUseCase)
    {
      char v25 = objc_msgSend(NSNumber, "numberWithInteger:");
      uint64_t v26 = getCBConnectPeripheralOptionConnectionUseCase[0]();
      [v14 setObject:v25 forKeyedSubscript:v26];
    }
    ucat = self->_ucat;
    if (ucat->var0 > 30) {
      goto LABEL_13;
    }
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu)) {
        goto LABEL_13;
      }
      ucat = self->_ucat;
    }
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBLEConnection _runConnectStart]", 0x1Eu, (uint64_t)"Connecting to %@, %##@\n", v21, v22, v23, v24, (uint64_t)v3);
LABEL_13:
    [(CBCentralManager *)self->_centralManager connectPeripheral:v13 options:v14];
    goto LABEL_14;
  }
  NSErrorWithOSStatusF(4294960569, (uint64_t)"No peripheral %@", v7, v8, v9, v10, v11, v12, (uint64_t)v3);
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  [(CUBLEConnection *)self _reportError:v14];
LABEL_14:

  return v13 != 0;
}

- (void)_run
{
  while (1)
  {
    uint64_t state = self->_state;
    switch((int)state)
    {
      case 0:
        self->_uint64_t state = 10;
        break;
      case 10:
        uint64_t v8 = [(CBCentralManager *)self->_centralManager state];
        if (v8 == 10 || v8 == 5) {
          goto LABEL_18;
        }
        break;
      case 11:
        if ([(CUBLEConnection *)self _runConnectStart]) {
          goto LABEL_18;
        }
        break;
      case 12:
        if (self->_guardConnected)
        {
          int v10 = 13;
          goto LABEL_19;
        }
        break;
      case 13:
        self->_uint64_t state = 14;
        break;
      case 14:
        [(CBPeripheral *)self->_peripheral openL2CAPChannel:self->_destinationPSM];
        goto LABEL_18;
      case 15:
        if (self->_l2capChannel) {
          self->_uint64_t state = 16;
        }
        break;
      case 16:
        self->_uint64_t state = 17;
        break;
      case 17:
        if ([(CUBLEConnection *)self _runSetupChannel])
        {
LABEL_18:
          int v10 = self->_state + 1;
LABEL_19:
          self->_uint64_t state = v10;
        }
        break;
      case 18:
        [(CUBLEConnection *)self _processReads:0];
        [(CUBLEConnection *)self _processWrites];
        break;
      default:
        break;
    }
    if (self->_state == state) {
      break;
    }
    ucat = self->_ucat;
    if (ucat->var0 <= 30)
    {
      if (ucat->var0 != -1) {
        goto LABEL_24;
      }
      if (_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
      {
        ucat = self->_ucat;
LABEL_24:
        uint64_t v12 = "?";
        if (state <= 0x12) {
          uint64_t v12 = off_1E55BD8D0[state];
        }
        LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBLEConnection _run]", 0x1Eu, (uint64_t)"State: %s -> %s\n", v2, v3, v4, v5, (uint64_t)v12);
      }
    }
  }
}

- (void)_reportError:(id)a3
{
  id v14 = a3;
  ucat = self->_ucat;
  if (ucat->var0 <= 90)
  {
    uint64_t v9 = (uint64_t)v14;
    if (ucat->var0 != -1)
    {
LABEL_3:
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBLEConnection _reportError:]", 0x5Au, (uint64_t)"Error: %{error}\n", v4, v5, v6, v7, v9);
      goto LABEL_5;
    }
    if (_LogCategory_Initialize((uint64_t)ucat, 0x5Au))
    {
      ucat = self->_ucat;
      uint64_t v9 = (uint64_t)v14;
      goto LABEL_3;
    }
  }
LABEL_5:
  self->_uint64_t state = 3;
  int v10 = (void (**)(void *, id))_Block_copy(self->_activateCompletion);
  id activateCompletion = self->_activateCompletion;
  self->_id activateCompletion = 0;

  if (v10)
  {
    v10[2](v10, v14);
  }
  else
  {
    uint64_t v12 = (void (**)(void *, id))_Block_copy(self->_errorHandler);
    id errorHandler = self->_errorHandler;
    self->_id errorHandler = 0;

    if (v12) {
      v12[2](v12, v14);
    }
  }
  [(CUBLEConnection *)self _abortReadsWithError:v14];
  [(CUBLEConnection *)self _abortWritesWithError:v14];
}

- (BOOL)_setupIOAndReturnError:(id *)a3
{
  int v5 = [(CBL2CAPChannel *)self->_l2capChannel socketFD];
  if (v5 < 0)
  {
    if (a3)
    {
      NSErrorWithOSStatusF(4294960596, (uint64_t)"No socket for L2CAP channel: %@", v6, v7, v8, v9, v10, v11, (uint64_t)self->_l2capChannel);
LABEL_15:
      id v21 = (id)objc_claimAutoreleasedReturnValue();
      BOOL v22 = 0;
      goto LABEL_16;
    }
    return 0;
  }
  unsigned int v12 = v5;
  self->_uint64_t socketFD = v5;
  int v43 = 1;
  if (setsockopt(v5, 0xFFFF, 4130, &v43, 4u))
  {
    if (!*__error())
    {
      uint64_t v19 = 4294960596;
      if (a3)
      {
LABEL_13:
        uint64_t v20 = "Set SO_NOSIGPIPE failed";
        goto LABEL_14;
      }
      return 0;
    }
    uint64_t v19 = *__error();
    if (v19)
    {
      if (!a3) {
        return 0;
      }
      goto LABEL_13;
    }
  }
  uint64_t v19 = SocketSetNonBlocking(v12, 1);
  if (v19)
  {
    if (a3)
    {
      uint64_t v20 = "Make non-blocking failed";
LABEL_14:
      NSErrorWithOSStatusF(v19, (uint64_t)v20, v13, v14, v15, v16, v17, v18, v38);
      goto LABEL_15;
    }
    return 0;
  }
  uint64_t v23 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14478], v12, 0, (dispatch_queue_t)self->_dispatchQueue);
  readSource = self->_readSource;
  self->_readSource = v23;

  char v25 = self->_readSource;
  if (!v25)
  {
    if (a3)
    {
      uint64_t v20 = "Create read source failed";
      uint64_t v19 = 4294960550;
      goto LABEL_14;
    }
    return 0;
  }
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __42__CUBLEConnection__setupIOAndReturnError___block_invoke;
  handler[3] = &unk_1E55BFC18;
  handler[4] = self;
  dispatch_source_set_event_handler(v25, handler);
  uint64_t v26 = self->_readSource;
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __42__CUBLEConnection__setupIOAndReturnError___block_invoke_2;
  v41[3] = &unk_1E55BFC18;
  v41[4] = self;
  dispatch_source_set_cancel_handler(v26, v41);
  dispatch_resume((dispatch_object_t)self->_readSource);
  BOOL v27 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F144B0], v12, 0, (dispatch_queue_t)self->_dispatchQueue);
  writeSource = self->_writeSource;
  self->_writeSource = v27;

  id v35 = self->_writeSource;
  BOOL v22 = v35 != 0;
  if (v35)
  {
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __42__CUBLEConnection__setupIOAndReturnError___block_invoke_3;
    v40[3] = &unk_1E55BFC18;
    v40[4] = self;
    dispatch_source_set_event_handler(v35, v40);
    uint64_t v36 = self->_writeSource;
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __42__CUBLEConnection__setupIOAndReturnError___block_invoke_4;
    v39[3] = &unk_1E55BFC18;
    v39[4] = self;
    dispatch_source_set_cancel_handler(v36, v39);
    self->_writeSuspended = 1;
    return v22;
  }
  if (!a3) {
    return v22;
  }
  NSErrorWithOSStatusF(4294960549, (uint64_t)"Create write source failed", v29, v30, v31, v32, v33, v34, v38);
  id v21 = (id)objc_claimAutoreleasedReturnValue();
LABEL_16:
  *a3 = v21;
  return v22;
}

uint64_t __42__CUBLEConnection__setupIOAndReturnError___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _processReads:1];
}

uint64_t __42__CUBLEConnection__setupIOAndReturnError___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;

  uint64_t v4 = *(void **)(a1 + 32);
  return [v4 _invalidated];
}

uint64_t __42__CUBLEConnection__setupIOAndReturnError___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _processWrites];
}

uint64_t __42__CUBLEConnection__setupIOAndReturnError___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 80);
  *(void *)(v2 + 80) = 0;

  uint64_t v4 = *(void **)(a1 + 32);
  return [v4 _invalidated];
}

- (BOOL)_startConnectingAndReturnError:(id *)a3
{
  v22[1] = *MEMORY[0x1E4F143B8];
  if (!self->_destinationUUID)
  {
    if (!a3) {
      return 0;
    }
    uint64_t v17 = "No destination UUID";
LABEL_9:
    uint64_t v18 = 4294960591;
LABEL_10:
    NSErrorWithOSStatusF(v18, (uint64_t)v17, (uint64_t)a3, v3, v4, v5, v6, v7, v20);
    id v19 = (id)objc_claimAutoreleasedReturnValue();
    BOOL result = 0;
    *a3 = v19;
    return result;
  }
  if (!self->_destinationPSM)
  {
    if (!a3) {
      return 0;
    }
    uint64_t v17 = "No destination PSM";
    goto LABEL_9;
  }
  id v10 = objc_alloc((Class)getCBCentralManagerClass[0]());
  dispatchQueue = self->_dispatchQueue;
  unsigned int v12 = getCBManagerNeedsRestrictedStateOperation[0]();
  id v21 = v12;
  v22[0] = MEMORY[0x1E4F1CC38];
  uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
  uint64_t v14 = (CBCentralManager *)[v10 initWithDelegate:self queue:dispatchQueue options:v13];
  centralManager = self->_centralManager;
  self->_centralManager = v14;

  if (self->_centralManager)
  {
    [(CUBLEConnection *)self _run];
    return 1;
  }
  if (a3)
  {
    uint64_t v17 = "Create CBCentralManager failed";
    uint64_t v18 = 4294960596;
    goto LABEL_10;
  }
  return 0;
}

- (void)_invalidated
{
  if (!self->_invalidateDone
    && !self->_readSource
    && !self->_writeSource
    && !self->_readRequestCurrent
    && ![(NSMutableArray *)self->_readRequests count]
    && !self->_writeRequestCurrent
    && ![(NSMutableArray *)self->_writeRequests count])
  {
    serverInvalidationHandler = (void (**)(void))self->_serverInvalidationHandler;
    if (serverInvalidationHandler) {
      serverInvalidationHandler[2]();
    }
    invalidationHandler = (void (**)(void))self->_invalidationHandler;
    if (invalidationHandler) {
      invalidationHandler[2]();
    }
    id errorHandler = self->_errorHandler;
    self->_id errorHandler = 0;

    id v6 = self->_invalidationHandler;
    self->_invalidationHandler = 0;

    id v7 = self->_serverInvalidationHandler;
    self->_serverInvalidationHandler = 0;

    self->_invalidateDone = 1;
    ucat = self->_ucat;
    if (ucat->var0 <= 30)
    {
      if (ucat->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu)) {
          return;
        }
        ucat = self->_ucat;
      }
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBLEConnection _invalidated]", 0x1Eu, (uint64_t)"Invalidated\n", v8, v9, v10, v11, v14);
    }
  }
}

- (void)_invalidate
{
  if (self->_invalidateCalled) {
    return;
  }
  self->_invalidateCalled = 1;
  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu)) {
        goto LABEL_6;
      }
      ucat = self->_ucat;
    }
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBLEConnection _invalidate]", 0x1Eu, (uint64_t)"Invalidating\n", v2, v3, v4, v5, v20);
  }
LABEL_6:
  if (self->_peripheral)
  {
    self->_guardConnected = 0;
    -[CBCentralManager cancelPeripheralConnection:](self->_centralManager, "cancelPeripheralConnection:");
  }
  [(CBCentralManager *)self->_centralManager setDelegate:0];
  centralManager = self->_centralManager;
  self->_centralManager = 0;

  id errorHandler = self->_errorHandler;
  self->_id errorHandler = 0;

  [(CBPeripheral *)self->_peripheral setDelegate:0];
  peripheral = self->_peripheral;
  self->_peripheral = 0;

  uint64_t v17 = NSErrorWithOSStatusF(4294960573, (uint64_t)"Invalidated (I)", v11, v12, v13, v14, v15, v16, v20);
  [(CUBLEConnection *)self _reportError:v17];

  readSource = self->_readSource;
  if (readSource)
  {
    dispatch_source_cancel(readSource);
    if (self->_readSuspended)
    {
      self->_int readSuspended = 0;
      dispatch_resume((dispatch_object_t)self->_readSource);
    }
  }
  writeSource = self->_writeSource;
  if (writeSource)
  {
    dispatch_source_cancel(writeSource);
    if (self->_writeSuspended)
    {
      self->_writeSuspended = 0;
      dispatch_resume((dispatch_object_t)self->_writeSource);
    }
  }
  [(CUBLEConnection *)self _invalidated];
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __29__CUBLEConnection_invalidate__block_invoke;
  block[3] = &unk_1E55BFC18;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __29__CUBLEConnection_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

- (BOOL)activateDirectAndReturnError:(id *)a3
{
  l2capChannel = self->_l2capChannel;
  ucat = self->_ucat;
  int var0 = ucat->var0;
  if (l2capChannel)
  {
    if (var0 > 30) {
      goto LABEL_9;
    }
    if (var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)self->_ucat, 0x1Eu))
      {
LABEL_9:
        id v40 = 0;
        BOOL v18 = [(CUBLEConnection *)self _setupIOAndReturnError:&v40];
        writeRequests = (NSMutableArray *)v40;
        if (v18)
        {
          uint64_t v24 = (void (**)(void *, void))_Block_copy(self->_activateCompletion);
          id activateCompletion = self->_activateCompletion;
          self->_id activateCompletion = 0;

          if (v24) {
            v24[2](v24, 0);
          }

          goto LABEL_18;
        }
        uint64_t v26 = self->_ucat;
        if (v26->var0 <= 90)
        {
          if (v26->var0 != -1)
          {
LABEL_15:
            LogPrintF((uint64_t)v26, (uint64_t)"-[CUBLEConnection activateDirectAndReturnError:]", 0x5Au, (uint64_t)"### Activate failed: %{error}\n", v19, v20, v21, v22, (uint64_t)writeRequests);
            goto LABEL_23;
          }
          if (_LogCategory_Initialize((uint64_t)v26, 0x5Au))
          {
            uint64_t v26 = self->_ucat;
            goto LABEL_15;
          }
        }
LABEL_23:
        if (a3)
        {
LABEL_24:
          writeRequests = writeRequests;
          BOOL v35 = 0;
          *a3 = writeRequests;
          goto LABEL_28;
        }
LABEL_27:
        BOOL v35 = 0;
        goto LABEL_28;
      }
      ucat = self->_ucat;
      l2capChannel = self->_l2capChannel;
    }
    unsigned int v12 = [(CBL2CAPChannel *)l2capChannel PSM];
    uint64_t v13 = [(CBL2CAPChannel *)self->_l2capChannel peer];
    uint64_t v38 = [v13 identifier];
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBLEConnection activateDirectAndReturnError:]", 0x1Eu, (uint64_t)"Activate incoming PSM 0x%04X, peer %@\n", v14, v15, v16, v17, v12);

    goto LABEL_9;
  }
  if (var0 <= 30)
  {
    if (var0 != -1)
    {
LABEL_7:
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBLEConnection activateDirectAndReturnError:]", 0x1Eu, (uint64_t)"Activate outgoing PSM 0x%04X, peer %@\n", v3, v4, v5, v6, self->_destinationPSM);
      goto LABEL_17;
    }
    if (_LogCategory_Initialize((uint64_t)self->_ucat, 0x1Eu))
    {
      ucat = self->_ucat;
      goto LABEL_7;
    }
  }
LABEL_17:
  id v39 = 0;
  BOOL v27 = [(CUBLEConnection *)self _startConnectingAndReturnError:&v39];
  writeRequests = (NSMutableArray *)v39;
  if (!v27)
  {
    uint64_t v36 = self->_ucat;
    if (v36->var0 > 90) {
      goto LABEL_26;
    }
    if (v36->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)v36, 0x5Au))
      {
LABEL_26:
        if (a3) {
          goto LABEL_24;
        }
        goto LABEL_27;
      }
      uint64_t v36 = self->_ucat;
    }
    LogPrintF((uint64_t)v36, (uint64_t)"-[CUBLEConnection activateDirectAndReturnError:]", 0x5Au, (uint64_t)"### Activate failed: %{error}\n", v28, v29, v30, v31, (uint64_t)writeRequests);
    goto LABEL_26;
  }
LABEL_18:

  uint64_t v32 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  readRequests = self->_readRequests;
  self->_readRequests = v32;

  uint64_t v34 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  writeRequests = self->_writeRequests;
  self->_writeRequests = v34;
  BOOL v35 = 1;
LABEL_28:

  return v35;
}

- (void)activateWithCompletion:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42__CUBLEConnection_activateWithCompletion___block_invoke;
  v7[3] = &unk_1E55BF148;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __42__CUBLEConnection_activateWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = _Block_copy(*(const void **)(a1 + 40));
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 8);
  *(void *)(v3 + 8) = v2;

  uint64_t v5 = *(void **)(a1 + 32);
  id v9 = 0;
  [v5 activateDirectAndReturnError:&v9];
  id v6 = v9;
  if (v6)
  {
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = *(void **)(v7 + 8);
    *(void *)(v7 + 8) = 0;

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
  id v5 = a3;
  p_ucat = (uint64_t *)&self->_ucat;
  uint64_t v7 = qword_1E91CC3A8;
  id v14 = v5;
  [v14 UTF8String];
  LogCategoryReplaceF(p_ucat, (uint64_t)"%s-%s", v8, v9, v10, v11, v12, v13, v7);
}

- (NSString)description
{
  int v27 = 12;
  uint64_t v8 = self->_label;
  uint64_t v9 = "-";
  id v26 = 0;
  if (!v8) {
    uint64_t v9 = "";
  }
  CUAppendF(&v26, &v27, (uint64_t)"CUBLEConnection%s%@", v3, v4, v5, v6, v7, (uint64_t)v9);
  id v10 = v26;
  destinationUUID = self->_destinationUUID;
  if (destinationUUID)
  {
    uint64_t v17 = destinationUUID;
LABEL_6:
    id v25 = v10;
    CUAppendF(&v25, &v27, (uint64_t)"Peer %@", v12, v13, v14, v15, v16, (uint64_t)v17);
    id v19 = v25;

    id v10 = v19;
    goto LABEL_7;
  }
  BOOL v18 = [(CBL2CAPChannel *)self->_l2capChannel peer];
  uint64_t v17 = [v18 identifier];

  if (v17) {
    goto LABEL_6;
  }
LABEL_7:
  uint64_t destinationPSM = self->_destinationPSM;
  if (self->_destinationPSM
    || (uint64_t destinationPSM = [(CBL2CAPChannel *)self->_l2capChannel PSM], destinationPSM))
  {
    id v24 = v10;
    CUAppendF(&v24, &v27, (uint64_t)"PSM 0x%X", v12, v13, v14, v15, v16, destinationPSM);
    id v21 = v24;

    id v10 = v21;
  }
  id v22 = v10;

  return (NSString *)v22;
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
  v4.super_class = (Class)CUBLEConnection;
  [(CUBLEConnection *)&v4 dealloc];
}

- (CUBLEConnection)init
{
  v5.receiver = self;
  v5.super_class = (Class)CUBLEConnection;
  uint64_t v2 = [(CUBLEConnection *)&v5 init];
  if (v2)
  {
    if (CUMainQueue_sOnce != -1) {
      dispatch_once(&CUMainQueue_sOnce, &__block_literal_global_18);
    }
    objc_storeStrong((id *)&v2->_dispatchQueue, (id)CUMainQueue_sQueue);
    v2->_uint64_t socketFD = -1;
    v2->_ucat = (LogCategory *)&gLogCategory_CUBLEConnection;
    uint64_t v3 = v2;
  }

  return v2;
}

@end
@interface CUBluetoothClassicConnection
- (BOOL)_prepareWriteRequest:(id)a3 error:(id *)a4;
- (BOOL)_processReadStatus;
- (BOOL)_runBTSessionStart;
- (BOOL)_runConnectStart;
- (BOOL)_runOpenChannelStart;
- (BOOL)_runSetupChannel;
- (BOOL)_setupIOAndReturnError:(id *)a3;
- (BOOL)_startConnectingAndReturnError:(id *)a3;
- (BOOL)activateDirectAndReturnError:(id *)a3;
- (BTDeviceImpl)_btDeviceWithID:(id)a3 error:(id *)a4;
- (CBL2CAPChannel)l2capChannel;
- (CUBluetoothClassicConnection)init;
- (NSString)destinationPeer;
- (NSString)destinationService;
- (NSString)label;
- (OS_dispatch_queue)dispatchQueue;
- (id)errorHandler;
- (id)invalidationHandler;
- (id)serverInvalidationHandler;
- (unsigned)connectionFlags;
- (unsigned)requiredServices;
- (void)_abortReadsWithError:(id)a3;
- (void)_abortWritesWithError:(id)a3;
- (void)_btEnsureStopped;
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
- (void)dealloc;
- (void)invalidate;
- (void)readWithRequest:(id)a3;
- (void)setConnectionFlags:(unsigned int)a3;
- (void)setDestinationPeer:(id)a3;
- (void)setDestinationService:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setErrorHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setL2capChannel:(id)a3;
- (void)setLabel:(id)a3;
- (void)setRequiredServices:(unsigned int)a3;
- (void)setServerInvalidationHandler:(id)a3;
- (void)writeEndOfDataWithCompletion:(id)a3;
- (void)writeWithRequest:(id)a3;
@end

@implementation CUBluetoothClassicConnection

- (void).cxx_destruct
{
  objc_storeStrong(&self->_serverInvalidationHandler, 0);
  objc_storeStrong((id *)&self->_l2capChannel, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_errorHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_destinationService, 0);
  objc_storeStrong((id *)&self->_destinationPeer, 0);
  objc_storeStrong((id *)&self->_writeRequests, 0);
  objc_storeStrong((id *)&self->_writeRequestCurrent, 0);
  objc_storeStrong((id *)&self->_writeSource, 0);
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
  objc_storeStrong((id *)&self->_readRequests, 0);
  objc_storeStrong((id *)&self->_readRequestCurrent, 0);
  objc_storeStrong((id *)&self->_readSource, 0);
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

- (void)setRequiredServices:(unsigned int)a3
{
  self->_requiredServices = a3;
}

- (unsigned)requiredServices
{
  return self->_requiredServices;
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

- (void)setDestinationService:(id)a3
{
}

- (NSString)destinationService
{
  return self->_destinationService;
}

- (void)setDestinationPeer:(id)a3
{
}

- (NSString)destinationPeer
{
  return self->_destinationPeer;
}

- (void)setConnectionFlags:(unsigned int)a3
{
  self->_connectionFlags = a3;
}

- (unsigned)connectionFlags
{
  return self->_connectionFlags;
}

- (void)_completeWriteRequest:(id)a3 error:(id)a4
{
  v14 = a3;
  id v10 = a4;
  ucat = self->_ucat;
  if (ucat->var0 <= 9)
  {
    if (ucat->var0 != -1)
    {
LABEL_3:
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBluetoothClassicConnection _completeWriteRequest:error:]", 9u, (uint64_t)"Write completed: %{error}\n", v6, v7, v8, v9, (uint64_t)v10);
      goto LABEL_5;
    }
    if (_LogCategory_Initialize((uint64_t)ucat, 9u))
    {
      ucat = self->_ucat;
      goto LABEL_3;
    }
  }
LABEL_5:
  v12 = (void *)v14[1];
  v14[1] = v10;

  v13 = [v14 completion];
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
        LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBluetoothClassicConnection _abortWritesWithError:]", 0x1Eu, (uint64_t)"Abort writes: %{error}\n", v4, v5, v6, v7, (uint64_t)v8);
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

    [(CUBluetoothClassicConnection *)self _completeWriteRequest:v10 error:v8];
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v12 = self->_writeRequests;
  uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v22;
    do
    {
      uint64_t v16 = 0;
      v17 = v10;
      do
      {
        if (*(void *)v22 != v15) {
          objc_enumerationMutation(v12);
        }
        id v10 = (CUWriteRequest *)*(id *)(*((void *)&v21 + 1) + 8 * v16);

        [(CUBluetoothClassicConnection *)self _completeWriteRequest:v10 error:v8];
        ++v16;
        v17 = v10;
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
  v19 = (void (**)(void *, id))_Block_copy(self->_errorHandler);
  id errorHandler = self->_errorHandler;
  self->_id errorHandler = 0;

  if (v19) {
    v19[2](v19, v8);
  }
  [(CUBluetoothClassicConnection *)self _invalidated];
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
    v19 = v6 + 16;
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

    if (gLogCategory_CUBluetoothClassicConnection > 9
      || gLogCategory_CUBluetoothClassicConnection == -1
      && !_LogCategory_Initialize((uint64_t)&gLogCategory_CUBluetoothClassicConnection, 9u))
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
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBluetoothClassicConnection _prepareWriteRequest:error:]", 9u, (uint64_t)"Write prepared (%d iov, %zu total)\n", v28, v29, v30, v31, v32);
LABEL_27:
    BOOL v17 = 1;
    goto LABEL_28;
  }
  if (a4)
  {
    id v10 = (void *)*MEMORY[0x1E4F28760];
    uint64_t v11 = [v6 bytesIOMaxCount];
    NSErrorF_safe(v10, 4294960532, (uint64_t)"Too many write elements (%zu max)", v12, v13, v14, v15, v16, v11);
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
  uint64_t v5 = (void *)*MEMORY[0x1E4F28760];
  do
  {
    uint64_t v6 = *p_writeRequestCurrent;
    if (!v6)
    {
      uint64_t v14 = [(NSMutableArray *)self->_writeRequests firstObject];
      if (!v14)
      {
        if (!self->_writeSuspended)
        {
          self->_writeSuspended = 1;
          dispatch_suspend((dispatch_object_t)self->_writeSource);
        }
        uint64_t v6 = 0;
        goto LABEL_37;
      }
      uint64_t v6 = (CUWriteRequest *)v14;
      [(NSMutableArray *)self->_writeRequests removeObjectAtIndex:0];
      id v31 = 0;
      [(CUBluetoothClassicConnection *)self _prepareWriteRequest:v6 error:&v31];
      id v15 = v31;
      if (v15)
      {
        uint64_t v16 = v15;
        goto LABEL_24;
      }
      objc_storeStrong((id *)p_writeRequestCurrent, v6);
    }
    uint64_t v12 = SocketWriteData(self->_socketFD, (const iovec **)&v6->_iop, &v6->_ion);
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
        LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBluetoothClassicConnection _processWrites]", 9u, (uint64_t)"Write socket %d, pre-ion %d, post-ion %d, %#m\n", v8, v9, v10, v11, self->_socketFD);
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
        uint64_t v29 = NSErrorF_safe(v5, v12, (uint64_t)"Write failed", v7, v8, v9, v10, v11, v30);
        [(CUBluetoothClassicConnection *)self _abortWritesWithError:v29];
      }
LABEL_37:

      return;
    }
    if (![(CUWriteRequest *)v6 endOfData]) {
      goto LABEL_20;
    }
    uint64_t v21 = self->_ucat;
    if (v21->var0 <= 9)
    {
      if (v21->var0 != -1) {
        goto LABEL_14;
      }
      if (_LogCategory_Initialize((uint64_t)v21, 9u))
      {
        uint64_t v21 = self->_ucat;
LABEL_14:
        LogPrintF((uint64_t)v21, (uint64_t)"-[CUBluetoothClassicConnection _processWrites]", 9u, (uint64_t)"Shutdown socket %d\n", v17, v18, v19, v20, self->_socketFD);
      }
    }
    if (shutdown(self->_socketFD, 1))
    {
      if (!*__error())
      {
        uint64_t v27 = 4294960596;
LABEL_22:
        uint64_t v16 = NSErrorF_safe(v5, v27, (uint64_t)"shutdown() failed", v22, v23, v24, v25, v26, v30);
        goto LABEL_23;
      }
      uint64_t v27 = *__error();
      if (v27) {
        goto LABEL_22;
      }
    }
LABEL_20:
    uint64_t v16 = 0;
LABEL_23:
    writeRequestCurrent = self->_writeRequestCurrent;
    self->_writeRequestCurrent = 0;

LABEL_24:
    [(CUBluetoothClassicConnection *)self _completeWriteRequest:v6 error:v16];

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
    uint64_t v8 = __61__CUBluetoothClassicConnection_writeEndOfDataWithCompletion___block_invoke;
    uint64_t v9 = &unk_1E55BF148;
    uint64_t v10 = v5;
    id v11 = v4;
    [(CUWriteRequest *)v5 setCompletion:&v6];
  }
  -[CUBluetoothClassicConnection writeWithRequest:](self, "writeWithRequest:", v5, v6, v7, v8, v9);
}

void __61__CUBluetoothClassicConnection_writeEndOfDataWithCompletion___block_invoke(uint64_t a1)
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
  v7[2] = __49__CUBluetoothClassicConnection_writeWithRequest___block_invoke;
  v7[3] = &unk_1E55BF170;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __49__CUBluetoothClassicConnection_writeWithRequest___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v9 + 68))
  {
    uint64_t v10 = *(void *)(a1 + 40);
    NSErrorF_safe((void *)*MEMORY[0x1E4F28760], 4294960573, (uint64_t)"Invalidated (W)", a4, a5, a6, a7, a8, v12);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    [(id)v9 _completeWriteRequest:v10 error:v13];
  }
  else
  {
    [*(id *)(v9 + 144) addObject:*(void *)(a1 + 40)];
    id v11 = *(_DWORD **)(a1 + 32);
    if ((v11[26] & 0x80000000) == 0)
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
  if (ucat->var0 <= 9)
  {
    id v8 = v16;
    if (ucat->var0 != -1)
    {
LABEL_3:
      uint64_t v9 = [v8 length];
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBluetoothClassicConnection _completeReadRequest:error:]", 9u, (uint64_t)"Read completed: %zu byte(s), %{error}\n", v10, v11, v12, v13, v9);
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
    ssize_t v3 = recv(self->_socketFD, &v23, 1uLL, 2);
    if ((v3 & 0x8000000000000000) == 0) {
      break;
    }
    if (!*__error())
    {
      uint64_t v4 = 4294960596;
LABEL_12:
      uint64_t v14 = (void (**)(void *, void *))_Block_copy(self->_errorHandler);
      id errorHandler = self->_errorHandler;
      self->_id errorHandler = 0;

      if (v14)
      {
        uint64_t v21 = NSErrorF_safe((void *)*MEMORY[0x1E4F28760], v4, (uint64_t)"Read status error", v16, v17, v18, v19, v20, v22);
        v14[2](v14, v21);
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
      uint64_t v13 = NSErrorF_safe((void *)*MEMORY[0x1E4F28760], 4294960543, (uint64_t)"Read status EOF", v8, v9, v10, v11, v12, v22);
      v6[2](v6, v13);
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
        LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBluetoothClassicConnection _abortReadsWithError:]", 0x1Eu, (uint64_t)"Abort reads: %{error}\n", v4, v5, v6, v7, (uint64_t)v8);
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

    [(CUBluetoothClassicConnection *)self _completeReadRequest:v10 error:v8];
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

        [(CUBluetoothClassicConnection *)self _completeReadRequest:v10 error:v8];
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
  [(CUBluetoothClassicConnection *)self _invalidated];
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
  if (ucat->var0 <= 9)
  {
    uint64_t v15 = v21;
    if (ucat->var0 != -1)
    {
LABEL_10:
      uint64_t v16 = [v15 minLength];
      [v21 maxLength];
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBluetoothClassicConnection _prepareReadRequest:]", 9u, (uint64_t)"Read prepared (%zu min, %zu max)\n", v17, v18, v19, v20, v16);
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

- (void)_processReads:(BOOL)a3
{
  BOOL v28 = a3;
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
      if (v28)
      {
        if (v4)
        {
          int readSuspended = self->_readSuspended;
        }
        else
        {
          BOOL v26 = [(CUBluetoothClassicConnection *)self _processReadStatus];
          int readSuspended = self->_readSuspended;
          if (v26)
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
      long long v23 = 0;
      goto LABEL_21;
    }
    id obja = (id)v7;
    [(NSMutableArray *)self->_readRequests removeObjectAtIndex:0];
    [(CUBluetoothClassicConnection *)self _prepareReadRequest:obja];
    objc_storeStrong((id *)p_readRequestCurrent, obja);
    unint64_t v6 = (uint64_t *)obja;
LABEL_5:
    obj = v6;
    uint64_t Data = SocketReadDataEx(self->_socketFD, v6[1], [v6 minLength], objc_msgSend(v6, "maxLength"), v6 + 3);
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
      uint64_t socketFD = self->_socketFD;
      [obj minLength];
      [obj maxLength];
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBluetoothClassicConnection _processReads:]", 9u, (uint64_t)"Read socket %d, %zu min, %zu max, %zu offset, %zu nread, %#m\n", v16, v17, v18, v19, socketFD);
    }
LABEL_9:
    if (Data) {
      break;
    }
    readRequestCurrent = self->_readRequestCurrent;
    self->_readRequestCurrent = 0;

    [(CUBluetoothClassicConnection *)self _completeReadRequest:obj error:0];
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
      long long v21 = "Read EOF";
    }
    else {
      long long v21 = "Read error";
    }
    long long v22 = NSErrorF_safe((void *)*MEMORY[0x1E4F28760], Data, (uint64_t)v21, v8, v9, v10, v11, v12, v27);
    [(CUBluetoothClassicConnection *)self _abortReadsWithError:v22];
  }
  long long v23 = obj;
LABEL_21:
}

- (void)readWithRequest:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__CUBluetoothClassicConnection_readWithRequest___block_invoke;
  v7[3] = &unk_1E55BF170;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __48__CUBluetoothClassicConnection_readWithRequest___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v9 + 68))
  {
    uint64_t v10 = *(void *)(a1 + 40);
    NSErrorF_safe((void *)*MEMORY[0x1E4F28760], 4294960573, (uint64_t)"Invalidated (R)", a4, a5, a6, a7, a8, v12);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    [(id)v9 _completeReadRequest:v10 error:v13];
  }
  else
  {
    [*(id *)(v9 + 96) addObject:*(void *)(a1 + 40)];
    uint64_t v11 = *(_DWORD **)(a1 + 32);
    if ((v11[26] & 0x80000000) == 0)
    {
      [v11 _processReads:0];
    }
  }
}

- (void)_btEnsureStopped
{
  if (self->_btServiceAddCallbacks)
  {
    self->_btServiceAddCallbacks = 0;
    btSession = self->_btSession;
    if (btSession) {
      ((void (*)(uint64_t, uint64_t))softLinkBTServiceRemoveCallbacks[0])((uint64_t)btSession, (uint64_t)_btServiceEventHandler);
    }
  }
  if (self->_btSession)
  {
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
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBluetoothClassicConnection _btEnsureStopped]", 0x1Eu, (uint64_t)"BTSession detach\n", v2, v3, v4, v5, v9);
    }
LABEL_9:
    ((void (*)(uint64_t))softLinkBTSessionDetachWithQueue[0])((uint64_t)&self->_btSession);
    self->_btSession = 0;
  }
  self->_btSessionStarted = 0;
}

- (BTDeviceImpl)_btDeviceWithID:(id)a3 error:(id *)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  uint64_t v36 = 0;
  id v6 = a3;
  uint64_t v7 = (char *)[v6 UTF8String];
  if (!v7)
  {
    if (!a4) {
      goto LABEL_21;
    }
    NSErrorF_safe((void *)*MEMORY[0x1E4F28760], 4294960591, (uint64_t)"Bad device ID UTF-8: '%@'", v8, v9, v10, v11, v12, (uint64_t)v6);
    goto LABEL_24;
  }
  id v13 = v7;
  long long v37 = 0uLL;
  if (!StringToUUIDEx(v7, 0xFFFFFFFFFFFFFFFFLL, 0, 0, &v37, v10, v11, v12))
  {
    int v24 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))softLinkBTDeviceFromIdentifier[0])((uint64_t)self->_btSession, (uint64_t)&v37, (uint64_t)&v36);
    if (v24 == -310000) {
      uint64_t v30 = 4294960596;
    }
    else {
      uint64_t v30 = (v24 + 310000);
    }
    if (!v24) {
      goto LABEL_14;
    }
    if (!a4) {
      goto LABEL_21;
    }
    NSErrorF_safe((void *)*MEMORY[0x1E4F28760], v30, (uint64_t)"BTDeviceFromIdentifier failed", v25, v26, v27, v28, v29, v33);
LABEL_24:
    id v31 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  __int16 v35 = 0;
  int v34 = 0;
  uint64_t v14 = TextToHardwareAddress(v13, 0xFFFFFFFFFFFFFFFFLL, 6, &v34);
  if (v14)
  {
    if (a4)
    {
      uint64_t v21 = v14;
      long long v22 = (void *)*MEMORY[0x1E4F28760];
      uint64_t v33 = (uint64_t)v13;
      long long v23 = "Bad device ID format: '%s'";
      goto LABEL_20;
    }
LABEL_21:
    id v31 = 0;
    goto LABEL_15;
  }
  int v20 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))softLinkBTDeviceFromAddress[0])((uint64_t)self->_btSession, (uint64_t)&v34, (uint64_t)&v36);
  if (v20 == -310000) {
    uint64_t v21 = 4294960596;
  }
  else {
    uint64_t v21 = (v20 + 310000);
  }
  if (v20)
  {
    if (a4)
    {
      long long v22 = (void *)*MEMORY[0x1E4F28760];
      long long v23 = "BTDeviceFromAddress failed";
LABEL_20:
      NSErrorF_safe(v22, v21, (uint64_t)v23, v15, v16, v17, v18, v19, v33);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_21;
    }
    goto LABEL_21;
  }
LABEL_14:
  id v31 = v36;
LABEL_15:

  return v31;
}

- (BOOL)_runSetupChannel
{
  id v6 = 0;
  BOOL v3 = [(CUBluetoothClassicConnection *)self _setupIOAndReturnError:&v6];
  id v4 = v6;
  if (!v3) {
    [(CUBluetoothClassicConnection *)self _reportError:v4];
  }

  return v3;
}

- (BOOL)_runOpenChannelStart
{
  return 1;
}

- (BOOL)_runConnectStart
{
  v40[2] = *MEMORY[0x1E4F143B8];
  uint64_t v8 = self->_destinationPeer;
  if (!v8)
  {
    uint64_t v33 = NSErrorF_safe((void *)*MEMORY[0x1E4F28760], 4294960591, (uint64_t)"No destination peer", v3, v4, v5, v6, v7, v37);
    [(CUBluetoothClassicConnection *)self _reportError:v33];

    BOOL v31 = 0;
    goto LABEL_29;
  }
  id v39 = 0;
  uint64_t v9 = [(CUBluetoothClassicConnection *)self _btDeviceWithID:v8 error:&v39];
  id v10 = v39;
  uint64_t v16 = v10;
  if (v9)
  {
    int v17 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))softLinkBTDeviceGetAddressString[0])((uint64_t)v9, (uint64_t)self->_btDeviceAddrStr, 32);
    uint64_t v18 = (v17 + 310000);
    if (v17) {
      BOOL v19 = v18 == 0;
    }
    else {
      BOOL v19 = 1;
    }
    if (!v19)
    {
      int v34 = (void *)*MEMORY[0x1E4F28760];
      __int16 v35 = "BTDeviceGetAddressString failed";
LABEL_36:
      uint64_t v36 = NSErrorF_safe(v34, v18, (uint64_t)v35, v11, v12, v13, v14, v15, v37);
      [(CUBluetoothClassicConnection *)self _reportError:v36];

      goto LABEL_37;
    }
    if (!self->_btServiceAddCallbacks)
    {
      int v20 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))softLinkBTServiceAddCallbacks[0])((uint64_t)self->_btSession, (uint64_t)_btServiceEventHandler, (uint64_t)self);
      if (v20)
      {
        uint64_t v18 = (v20 + 310000);
        if (v20 != -310000)
        {
          int v34 = (void *)*MEMORY[0x1E4F28760];
          __int16 v35 = "BTServiceAddCallbacks failed";
          goto LABEL_36;
        }
      }
      self->_btServiceAddCallbacks = 1;
    }
    ucat = self->_ucat;
    if (ucat->var0 > 30) {
      goto LABEL_16;
    }
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu)) {
        goto LABEL_16;
      }
      ucat = self->_ucat;
    }
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBluetoothClassicConnection _runConnectStart]", 0x1Eu, (uint64_t)"Connect: %@\n", v12, v13, v14, v15, (uint64_t)v8);
LABEL_16:
    if ((self->_connectionFlags & 4) != 0)
    {
      v40[0] = 0;
      v40[1] = 0;
      int v22 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))softLinkBTDeviceConnectServicesWithParameters[0])((uint64_t)v9, 4294956991, 32, (uint64_t)v40);
      if (v22 != 2) {
        goto LABEL_23;
      }
      long long v23 = self->_ucat;
      if (v23->var0 <= 30)
      {
        if (v23->var0 == -1)
        {
          if (!_LogCategory_Initialize((uint64_t)v23, 0x1Eu)) {
            goto LABEL_22;
          }
          long long v23 = self->_ucat;
        }
        LogPrintF((uint64_t)v23, (uint64_t)"-[CUBluetoothClassicConnection _runConnectStart]", 0x1Eu, (uint64_t)"Connect Tipi failed, retrying in normal mode", v12, v13, v14, v15, v37);
      }
    }
LABEL_22:
    int v22 = ((uint64_t (*)(uint64_t, uint64_t))softLinkBTDeviceConnectServices[0])((uint64_t)v9, 4294956991);
LABEL_23:
    if (!v22 || (uint64_t v18 = (v22 + 310000), v22 == -310000))
    {
      timeoutTimer = self->_timeoutTimer;
      if (timeoutTimer)
      {
        uint64_t v25 = timeoutTimer;
        dispatch_source_cancel(v25);
        uint64_t v26 = self->_timeoutTimer;
        self->_timeoutTimer = 0;
      }
      uint64_t v27 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_dispatchQueue);
      uint64_t v28 = self->_timeoutTimer;
      self->_timeoutTimer = v27;
      uint64_t v29 = v27;

      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __48__CUBluetoothClassicConnection__runConnectStart__block_invoke;
      handler[3] = &unk_1E55BF170;
      handler[4] = v29;
      handler[5] = self;
      dispatch_source_set_event_handler(v29, handler);
      dispatch_time_t v30 = dispatch_time(0, 15000000000);
      dispatch_source_set_timer(v29, v30, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
      dispatch_activate(v29);

      BOOL v31 = 1;
      goto LABEL_28;
    }
    int v34 = (void *)*MEMORY[0x1E4F28760];
    __int16 v35 = "BTDeviceConnectServices failed";
    goto LABEL_36;
  }
  if (!v10)
  {
    int v34 = (void *)*MEMORY[0x1E4F28760];
    __int16 v35 = "No device, no error";
    uint64_t v18 = 4294960596;
    goto LABEL_36;
  }
  [(CUBluetoothClassicConnection *)self _reportError:v10];
LABEL_37:
  BOOL v31 = 0;
LABEL_28:

LABEL_29:
  return v31;
}

void __48__CUBluetoothClassicConnection__runConnectStart__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = *(void **)(a1 + 32);
  uint64_t v9 = *(void **)(a1 + 40);
  if (v8 == (void *)v9[14])
  {
    if (v8)
    {
      uint64_t v11 = v8;
      dispatch_source_cancel(v11);
      uint64_t v12 = *(void *)(a1 + 40);
      uint64_t v13 = *(void **)(v12 + 112);
      *(void *)(v12 + 112) = 0;

      uint64_t v9 = *(void **)(a1 + 40);
    }
    NSErrorF_safe((void *)*MEMORY[0x1E4F28760], 4294960574, (uint64_t)"Connection timeout", a4, a5, a6, a7, a8, v14);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    [v9 _reportError:v15];
  }
}

- (BOOL)_runBTSessionStart
{
  uint64_t v12 = _btSessionEventCallback;
  uint64_t v2 = self;
  int v3 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t, void *))softLinkBTSessionAttachWithQueue[0])((uint64_t)v2->_ucat->var4, (uint64_t)&v12, (uint64_t)v2, v2->_dispatchQueue);
  if (v3)
  {
    CFRelease(v2);
    uint64_t v9 = NSErrorF_safe((void *)*MEMORY[0x1E4F28760], (v3 + 310000), (uint64_t)"BTSessionAttachWithQueue failed", v4, v5, v6, v7, v8, v11);
    [(CUBluetoothClassicConnection *)v2 _reportError:v9];
  }
  else
  {
    v2->_btSessionAttaching = 1;
    v2->_btSessionStarted = 1;
  }
  return v3 == 0;
}

- (void)_run
{
  if (!self->_invalidateCalled)
  {
    while (1)
    {
      while (1)
      {
        do
        {
          uint64_t state = self->_state;
          switch((int)state)
          {
            case 0:
              int v8 = 10;
              goto LABEL_22;
            case 10:
              BOOL v9 = [(CUBluetoothClassicConnection *)self _runBTSessionStart];
              goto LABEL_20;
            case 11:
              if (self->_btSession)
              {
                int v8 = 12;
                goto LABEL_22;
              }
              int v8 = 11;
              break;
            case 12:
              BOOL v9 = [(CUBluetoothClassicConnection *)self _runConnectStart];
              goto LABEL_20;
            case 13:
              if (self->_btConnected)
              {
                int v8 = 14;
                goto LABEL_22;
              }
              int v8 = 13;
              break;
            case 14:
              if ((self->_connectionFlags & 2) != 0) {
                int v8 = 19;
              }
              else {
                int v8 = 15;
              }
              goto LABEL_22;
            case 15:
              BOOL v9 = [(CUBluetoothClassicConnection *)self _runOpenChannelStart];
              goto LABEL_20;
            case 16:
              if (self->_l2capChannel)
              {
                int v8 = 17;
LABEL_22:
                self->_uint64_t state = v8;
              }
              else
              {
                int v8 = 16;
              }
              break;
            case 17:
              int v8 = 18;
              goto LABEL_22;
            case 18:
              BOOL v9 = [(CUBluetoothClassicConnection *)self _runSetupChannel];
LABEL_20:
              int v8 = self->_state;
              if (!v9) {
                break;
              }
              ++v8;
              goto LABEL_22;
            case 19:
              timeoutTimer = self->_timeoutTimer;
              if (timeoutTimer)
              {
                uint64_t v12 = timeoutTimer;
                dispatch_source_cancel(v12);
                uint64_t v13 = self->_timeoutTimer;
                self->_timeoutTimer = 0;
              }
              uint64_t v14 = (void (**)(void *, void))_Block_copy(self->_activateCompletion);
              id activateCompletion = self->_activateCompletion;
              self->_id activateCompletion = 0;

              if (v14) {
                v14[2](v14, 0);
              }
              if ((self->_connectionFlags & 2) == 0)
              {
                [(CUBluetoothClassicConnection *)self _processReads:0];
                [(CUBluetoothClassicConnection *)self _processWrites];
              }

              int v8 = self->_state;
              break;
            default:
              return;
          }
          if (v8 == state) {
            return;
          }
          ucat = self->_ucat;
        }
        while (ucat->var0 > 30);
        if (ucat->var0 == -1) {
          break;
        }
LABEL_26:
        LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBluetoothClassicConnection _run]", 0x1Eu, (uint64_t)"State: %s -> %s\n", v2, v3, v4, v5, (uint64_t)off_1E55BDAF8[state]);
      }
      if (_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
      {
        ucat = self->_ucat;
        goto LABEL_26;
      }
    }
  }
  [(CUBluetoothClassicConnection *)self _invalidated];
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
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBluetoothClassicConnection _reportError:]", 0x5Au, (uint64_t)"Error: %{error}\n", v4, v5, v6, v7, v9);
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
  id v10 = (void (**)(void *, id))_Block_copy(self->_activateCompletion);
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
  [(CUBluetoothClassicConnection *)self _abortReadsWithError:v14];
  [(CUBluetoothClassicConnection *)self _abortWritesWithError:v14];
}

- (BOOL)_setupIOAndReturnError:(id *)a3
{
  int v5 = [(CBL2CAPChannel *)self->_l2capChannel socketFD];
  if (v5 < 0)
  {
    if (a3)
    {
      NSErrorF_safe((void *)*MEMORY[0x1E4F28760], 4294960596, (uint64_t)"No socket for L2CAP channel: %@", v6, v7, v8, v9, v10, (uint64_t)self->_l2capChannel);
      goto LABEL_14;
    }
    return 0;
  }
  unsigned int v11 = v5;
  self->_uint64_t socketFD = v5;
  int v42 = 1;
  if (setsockopt(v5, 0xFFFF, 4130, &v42, 4u))
  {
    if (*__error())
    {
      uint64_t v17 = *__error();
      if (!v17) {
        goto LABEL_5;
      }
    }
    else
    {
      uint64_t v17 = 4294960596;
    }
    if (!a3) {
      return 0;
    }
    int v34 = (void *)*MEMORY[0x1E4F28760];
    __int16 v35 = "Set SO_NOSIGPIPE failed";
LABEL_13:
    NSErrorF_safe(v34, v17, (uint64_t)v35, v12, v13, v14, v15, v16, v37);
LABEL_14:
    id v36 = (id)objc_claimAutoreleasedReturnValue();
    BOOL v31 = 0;
LABEL_15:
    *a3 = v36;
    return v31;
  }
LABEL_5:
  uint64_t v18 = SocketSetNonBlocking(v11, 1);
  if (v18)
  {
    if (!a3) {
      return 0;
    }
    uint64_t v17 = v18;
    int v34 = (void *)*MEMORY[0x1E4F28760];
    __int16 v35 = "Make non-blocking failed";
    goto LABEL_13;
  }
  BOOL v19 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14478], v11, 0, (dispatch_queue_t)self->_dispatchQueue);
  readSource = self->_readSource;
  self->_readSource = v19;

  uint64_t v21 = self->_readSource;
  if (!v21)
  {
    if (a3)
    {
      int v34 = (void *)*MEMORY[0x1E4F28760];
      __int16 v35 = "Create read source failed";
      uint64_t v17 = 4294960550;
      goto LABEL_13;
    }
    return 0;
  }
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __55__CUBluetoothClassicConnection__setupIOAndReturnError___block_invoke;
  handler[3] = &unk_1E55BFC18;
  handler[4] = self;
  dispatch_source_set_event_handler(v21, handler);
  int v22 = self->_readSource;
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __55__CUBluetoothClassicConnection__setupIOAndReturnError___block_invoke_2;
  void v40[3] = &unk_1E55BFC18;
  v40[4] = self;
  dispatch_source_set_cancel_handler(v22, v40);
  dispatch_resume((dispatch_object_t)self->_readSource);
  long long v23 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F144B0], v11, 0, (dispatch_queue_t)self->_dispatchQueue);
  writeSource = self->_writeSource;
  self->_writeSource = v23;

  dispatch_time_t v30 = self->_writeSource;
  BOOL v31 = v30 != 0;
  if (!v30)
  {
    if (!a3) {
      return v31;
    }
    NSErrorF_safe((void *)*MEMORY[0x1E4F28760], 4294960549, (uint64_t)"Create write source failed", v25, v26, v27, v28, v29, v37);
    id v36 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __55__CUBluetoothClassicConnection__setupIOAndReturnError___block_invoke_3;
  v39[3] = &unk_1E55BFC18;
  v39[4] = self;
  dispatch_source_set_event_handler(v30, v39);
  uint64_t v32 = self->_writeSource;
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __55__CUBluetoothClassicConnection__setupIOAndReturnError___block_invoke_4;
  v38[3] = &unk_1E55BFC18;
  v38[4] = self;
  dispatch_source_set_cancel_handler(v32, v38);
  self->_writeSuspended = 1;
  return v31;
}

uint64_t __55__CUBluetoothClassicConnection__setupIOAndReturnError___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _processReads:1];
}

uint64_t __55__CUBluetoothClassicConnection__setupIOAndReturnError___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 72);
  *(void *)(v2 + 72) = 0;

  uint64_t v4 = *(void **)(a1 + 32);
  return [v4 _invalidated];
}

uint64_t __55__CUBluetoothClassicConnection__setupIOAndReturnError___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _processWrites];
}

uint64_t __55__CUBluetoothClassicConnection__setupIOAndReturnError___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 120);
  *(void *)(v2 + 120) = 0;

  uint64_t v4 = *(void **)(a1 + 32);
  return [v4 _invalidated];
}

- (BOOL)_startConnectingAndReturnError:(id *)a3
{
  destinationPeer = self->_destinationPeer;
  if (destinationPeer)
  {
    [(CUBluetoothClassicConnection *)self _run];
  }
  else if (a3)
  {
    NSErrorF_safe((void *)*MEMORY[0x1E4F28760], 4294960591, (uint64_t)"No destination peer", v3, v4, v5, v6, v7, v11);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return destinationPeer != 0;
}

- (void)_invalidated
{
  if (self->_invalidateCalled
    && !self->_invalidateDone
    && !self->_btSession
    && !self->_btSessionAttaching
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
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBluetoothClassicConnection _invalidated]", 0x1Eu, (uint64_t)"Invalidated\n", v8, v9, v10, v11, v14);
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
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBluetoothClassicConnection _invalidate]", 0x1Eu, (uint64_t)"Invalidating\n", v2, v3, v4, v5, v20);
  }
LABEL_6:
  id errorHandler = self->_errorHandler;
  self->_id errorHandler = 0;

  timeoutTimer = self->_timeoutTimer;
  if (timeoutTimer)
  {
    uint64_t v15 = timeoutTimer;
    dispatch_source_cancel(v15);
    uint64_t v16 = self->_timeoutTimer;
    self->_timeoutTimer = 0;
  }
  uint64_t v17 = NSErrorF_safe((void *)*MEMORY[0x1E4F28760], 4294960573, (uint64_t)"Invalidated (I)", v9, v10, v11, v12, v13, v20);
  [(CUBluetoothClassicConnection *)self _reportError:v17];

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
  [(CUBluetoothClassicConnection *)self _btEnsureStopped];
  [(CUBluetoothClassicConnection *)self _invalidated];
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__CUBluetoothClassicConnection_invalidate__block_invoke;
  block[3] = &unk_1E55BFC18;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __42__CUBluetoothClassicConnection_invalidate__block_invoke(uint64_t a1)
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
        BOOL v19 = [(CUBluetoothClassicConnection *)self _setupIOAndReturnError:&v40];
        writeRequests = (NSMutableArray *)v40;
        if (v19)
        {
          uint64_t v25 = (void (**)(void *, void))_Block_copy(self->_activateCompletion);
          id activateCompletion = self->_activateCompletion;
          self->_id activateCompletion = 0;

          if (v25) {
            v25[2](v25, 0);
          }

          goto LABEL_18;
        }
        uint64_t v27 = self->_ucat;
        if (v27->var0 <= 90)
        {
          if (v27->var0 != -1)
          {
LABEL_15:
            LogPrintF((uint64_t)v27, (uint64_t)"-[CUBluetoothClassicConnection activateDirectAndReturnError:]", 0x5Au, (uint64_t)"### Activate failed: %{error}\n", v20, v21, v22, v23, (uint64_t)writeRequests);
            goto LABEL_23;
          }
          if (_LogCategory_Initialize((uint64_t)v27, 0x5Au))
          {
            uint64_t v27 = self->_ucat;
            goto LABEL_15;
          }
        }
LABEL_23:
        if (a3)
        {
LABEL_24:
          writeRequests = writeRequests;
          BOOL v36 = 0;
          *a3 = writeRequests;
          goto LABEL_28;
        }
LABEL_27:
        BOOL v36 = 0;
        goto LABEL_28;
      }
      ucat = self->_ucat;
      l2capChannel = self->_l2capChannel;
    }
    unsigned int v12 = [(CBL2CAPChannel *)l2capChannel PSM];
    uint64_t v13 = [(CBL2CAPChannel *)self->_l2capChannel peer];
    uint64_t v14 = [v13 identifier];
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBluetoothClassicConnection activateDirectAndReturnError:]", 0x1Eu, (uint64_t)"Activate incoming PSM 0x%04X, peer %@, CF %#{flags}\n", v15, v16, v17, v18, v12);

    goto LABEL_9;
  }
  if (var0 <= 30)
  {
    if (var0 != -1)
    {
LABEL_7:
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBluetoothClassicConnection activateDirectAndReturnError:]", 0x1Eu, (uint64_t)"Activate outgoing peer %@, service %@, CF %#{flags}, RS %#{flags}\n", v3, v4, v5, v6, (uint64_t)self->_destinationPeer);
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
  BOOL v28 = [(CUBluetoothClassicConnection *)self _startConnectingAndReturnError:&v39];
  writeRequests = (NSMutableArray *)v39;
  if (!v28)
  {
    uint64_t v37 = self->_ucat;
    if (v37->var0 > 90) {
      goto LABEL_26;
    }
    if (v37->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)v37, 0x5Au))
      {
LABEL_26:
        if (a3) {
          goto LABEL_24;
        }
        goto LABEL_27;
      }
      uint64_t v37 = self->_ucat;
    }
    LogPrintF((uint64_t)v37, (uint64_t)"-[CUBluetoothClassicConnection activateDirectAndReturnError:]", 0x5Au, (uint64_t)"### Activate failed: %{error}\n", v29, v30, v31, v32, (uint64_t)writeRequests);
    goto LABEL_26;
  }
LABEL_18:

  uint64_t v33 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  readRequests = self->_readRequests;
  self->_readRequests = v33;

  __int16 v35 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  writeRequests = self->_writeRequests;
  self->_writeRequests = v35;
  BOOL v36 = 1;
LABEL_28:

  return v36;
}

- (void)activateWithCompletion:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__CUBluetoothClassicConnection_activateWithCompletion___block_invoke;
  v7[3] = &unk_1E55BF148;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __55__CUBluetoothClassicConnection_activateWithCompletion___block_invoke(uint64_t a1)
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
  uint64_t v7 = qword_1E91CC558;
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
  v4.super_class = (Class)CUBluetoothClassicConnection;
  [(CUBluetoothClassicConnection *)&v4 dealloc];
}

- (CUBluetoothClassicConnection)init
{
  v5.receiver = self;
  v5.super_class = (Class)CUBluetoothClassicConnection;
  uint64_t v2 = [(CUBluetoothClassicConnection *)&v5 init];
  if (v2)
  {
    if (CUMainQueue_sOnce != -1) {
      dispatch_once(&CUMainQueue_sOnce, &__block_literal_global_18);
    }
    objc_storeStrong((id *)&v2->_dispatchQueue, (id)CUMainQueue_sQueue);
    v2->_uint64_t socketFD = -1;
    v2->_ucat = (LogCategory *)&gLogCategory_CUBluetoothClassicConnection;
    uint64_t v3 = v2;
  }

  return v2;
}

@end
@interface CUTCPConnection
- ($9D4F243E34B80324A1B90A38B57CFE16)peerAddr;
- ($9D4F243E34B80324A1B90A38B57CFE16)selfAddr;
- (BOOL)_activateDirectAndReturnError:(id *)a3;
- (BOOL)_prepareWriteRequest:(id)a3 error:(id *)a4;
- (BOOL)_readStatus;
- (BOOL)_readableData;
- (BOOL)_setupIOAndReturnError:(id *)a3;
- (BOOL)_startConnectingToBonjourDevice:(id)a3 error:(id *)a4;
- (BOOL)_startConnectingToDestination:(id)a3 error:(id *)a4;
- (BOOL)activateDirectAndReturnError:(id *)a3;
- (CUBonjourDevice)destinationBonjour;
- (CUNANDataSession)nanDataSession;
- (CUNetLinkManager)netLinkManager;
- (CUTCPConnection)init;
- (NSString)destinationString;
- (NSString)interfaceName;
- (NSString)label;
- (OS_dispatch_queue)dispatchQueue;
- (double)connectTimeoutSecs;
- (double)dataTimeoutSecs;
- (id)description;
- (id)errorHandler;
- (id)flowControlChangedHandler;
- (id)invalidationHandler;
- (id)serverInvalidationHandler;
- (id)socketEventHandler;
- (int)defaultPort;
- (int)flowControlState;
- (int)keepAliveIdleSeconds;
- (int)keepAliveIntervalSeconds;
- (int)keepAliveMaxCount;
- (int)keepAliveSeconds;
- (int)socketFD;
- (unsigned)flags;
- (unsigned)netTransportType;
- (unsigned)trafficFlags;
- (void)_abortReadsWithError:(id)a3;
- (void)_abortWritesWithError:(id)a3;
- (void)_completeReadRequest:(id)a3 error:(id)a4;
- (void)_completeWriteRequest:(id)a3 error:(id)a4;
- (void)_invalidate;
- (void)_invalidated;
- (void)_logMetrics;
- (void)_netLinkStateChanged;
- (void)_prepareReadRequest:(id)a3;
- (void)_processReads:(BOOL)a3;
- (void)_processSocketEvents;
- (void)_processWrites:(BOOL)a3;
- (void)_updateTrafficRegistration;
- (void)activateWithCompletion:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)readWithRequest:(id)a3;
- (void)setConnectTimeoutSecs:(double)a3;
- (void)setDataTimeoutSecs:(double)a3;
- (void)setDefaultPort:(int)a3;
- (void)setDestinationBonjour:(id)a3;
- (void)setDestinationString:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setErrorHandler:(id)a3;
- (void)setFlags:(unsigned int)a3;
- (void)setFlowControlChangedHandler:(id)a3;
- (void)setInterfaceName:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setKeepAliveIdleSeconds:(int)a3;
- (void)setKeepAliveIntervalSeconds:(int)a3;
- (void)setKeepAliveMaxCount:(int)a3;
- (void)setKeepAliveSeconds:(int)a3;
- (void)setLabel:(id)a3;
- (void)setNanDataSession:(id)a3;
- (void)setNetLinkManager:(id)a3;
- (void)setServerInvalidationHandler:(id)a3;
- (void)setSocketEventHandler:(id)a3;
- (void)setSocketFD:(int)a3;
- (void)setTrafficFlags:(unsigned int)a3;
- (void)writeEndOfDataWithCompletion:(id)a3;
- (void)writeWithRequest:(id)a3;
@end

@implementation CUTCPConnection

- (void).cxx_destruct
{
  objc_storeStrong(&self->_serverInvalidationHandler, 0);
  objc_storeStrong(&self->_socketEventHandler, 0);
  objc_storeStrong((id *)&self->_netLinkManager, 0);
  objc_storeStrong((id *)&self->_nanDataSession, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_interfaceName, 0);
  objc_storeStrong(&self->_flowControlChangedHandler, 0);
  objc_storeStrong(&self->_errorHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_destinationString, 0);
  objc_storeStrong((id *)&self->_destinationBonjour, 0);
  objc_storeStrong((id *)&self->_wifiTrafficManager, 0);
  objc_storeStrong((id *)&self->_netLinkEndpoint, 0);
  objc_storeStrong((id *)&self->_socketEventsSource, 0);
  objc_storeStrong((id *)&self->_firstError, 0);
  objc_storeStrong(&self->_activateCompletion, 0);
  objc_storeStrong((id *)&self->_writeRequests, 0);
  objc_storeStrong((id *)&self->_writeRequestCurrent, 0);
  objc_storeStrong((id *)&self->_writeSource, 0);
  objc_storeStrong((id *)&self->_readRequests, 0);
  objc_storeStrong((id *)&self->_readRequestCurrent, 0);
  objc_storeStrong((id *)&self->_readSource, 0);
}

- (void)setServerInvalidationHandler:(id)a3
{
}

- (id)serverInvalidationHandler
{
  return self->_serverInvalidationHandler;
}

- (unsigned)trafficFlags
{
  return self->_trafficFlags;
}

- (void)setSocketFD:(int)a3
{
  self->_socketFD = a3;
}

- (int)socketFD
{
  return self->_socketFD;
}

- (void)setSocketEventHandler:(id)a3
{
}

- (id)socketEventHandler
{
  return self->_socketEventHandler;
}

- (unsigned)netTransportType
{
  return self->_netTransportType;
}

- (void)setNetLinkManager:(id)a3
{
}

- (CUNetLinkManager)netLinkManager
{
  return self->_netLinkManager;
}

- (void)setNanDataSession:(id)a3
{
}

- (CUNANDataSession)nanDataSession
{
  return self->_nanDataSession;
}

- (NSString)label
{
  return self->_label;
}

- (void)setKeepAliveMaxCount:(int)a3
{
  self->_keepAliveMaxCount = a3;
}

- (int)keepAliveMaxCount
{
  return self->_keepAliveMaxCount;
}

- (void)setKeepAliveIntervalSeconds:(int)a3
{
  self->_keepAliveIntervalSeconds = a3;
}

- (int)keepAliveIntervalSeconds
{
  return self->_keepAliveIntervalSeconds;
}

- (void)setKeepAliveIdleSeconds:(int)a3
{
  self->_keepAliveIdleSeconds = a3;
}

- (int)keepAliveIdleSeconds
{
  return self->_keepAliveIdleSeconds;
}

- (void)setKeepAliveSeconds:(int)a3
{
  self->_keepAliveSeconds = a3;
}

- (int)keepAliveSeconds
{
  return self->_keepAliveSeconds;
}

- (void)setInvalidationHandler:(id)a3
{
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInterfaceName:(id)a3
{
}

- (NSString)interfaceName
{
  return self->_interfaceName;
}

- (int)flowControlState
{
  return self->_flowControlState;
}

- (void)setFlowControlChangedHandler:(id)a3
{
}

- (id)flowControlChangedHandler
{
  return self->_flowControlChangedHandler;
}

- (void)setFlags:(unsigned int)a3
{
  self->_flags = a3;
}

- (unsigned)flags
{
  return self->_flags;
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

- (void)setDefaultPort:(int)a3
{
  self->_defaultPort = a3;
}

- (int)defaultPort
{
  return self->_defaultPort;
}

- (void)setDestinationString:(id)a3
{
}

- (NSString)destinationString
{
  return self->_destinationString;
}

- (void)setDestinationBonjour:(id)a3
{
}

- (CUBonjourDevice)destinationBonjour
{
  return self->_destinationBonjour;
}

- (void)setDataTimeoutSecs:(double)a3
{
  self->_dataTimeoutSecs = a3;
}

- (double)dataTimeoutSecs
{
  return self->_dataTimeoutSecs;
}

- (void)setConnectTimeoutSecs:(double)a3
{
  self->_connectTimeoutSecs = a3;
}

- (double)connectTimeoutSecs
{
  return self->_connectTimeoutSecs;
}

- ($9D4F243E34B80324A1B90A38B57CFE16)selfAddr
{
  *(in6_addr *)((char *)&retstr->var2.sin6_addr + 4) = *(in6_addr *)((char *)&self[16].var2.sin6_addr + 8);
  retstr->var0 = *(sockaddr *)&self[16].var2.sin6_flowinfo;
  return self;
}

- ($9D4F243E34B80324A1B90A38B57CFE16)peerAddr
{
  retstr->var0 = *(sockaddr *)&self[15].var2.sin6_flowinfo;
  *(in6_addr *)((char *)&retstr->var2.sin6_addr + 4) = *(in6_addr *)((char *)&self[15].var2.sin6_addr + 8);
  return self;
}

- (void)_completeWriteRequest:(id)a3 error:(id)a4
{
  v15 = a3;
  id v10 = a4;
  unsigned int rawIOLogLevel = self->_rawIOLogLevel;
  ucat = self->_ucat;
  if (ucat->var0 <= rawIOLogLevel)
  {
    if (ucat->var0 != -1)
    {
LABEL_3:
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUTCPConnection _completeWriteRequest:error:]", rawIOLogLevel, (uint64_t)"Write completed: %{error}\n", v6, v7, v8, v9, (uint64_t)v10);
      goto LABEL_5;
    }
    if (_LogCategory_Initialize((uint64_t)ucat, self->_rawIOLogLevel))
    {
      ucat = self->_ucat;
      unsigned int rawIOLogLevel = self->_rawIOLogLevel;
      goto LABEL_3;
    }
  }
LABEL_5:
  v13 = (void *)v15[1];
  v15[1] = v10;

  v14 = [v15 completion];
  [v15 setCompletion:0];
  if (v14) {
    v14[2](v14);
  }
}

- (void)_abortWritesWithError:(id)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  if (!self->_invalidateCalled && !self->_firstError) {
    objc_storeStrong((id *)&self->_firstError, a3);
  }
  netLinkManager = self->_netLinkManager;
  if (netLinkManager)
  {
    netLinkEndpoint = self->_netLinkEndpoint;
    if (netLinkEndpoint)
    {
      -[CUNetLinkManager removeEndpoint:](netLinkManager, "removeEndpoint:");
      v14 = self->_netLinkManager;
      self->_netLinkManager = 0;
    }
  }
  if (self->_writeRequestCurrent || [(NSMutableArray *)self->_writeRequests count])
  {
    ucat = self->_ucat;
    if (ucat->var0 <= 30)
    {
      if (ucat->var0 != -1)
      {
LABEL_11:
        v16 = NSPrintF((uint64_t)"%##a", v5, (uint64_t)netLinkEndpoint, v7, v8, v9, v10, v11, (uint64_t)&self->_peerAddr);
        v24 = NSPrintF((uint64_t)"%##a", v17, v18, v19, v20, v21, v22, v23, (uint64_t)&self->_selfAddr);
        v47 = NSPrintF((uint64_t)"%{error}", v25, v26, v27, v28, v29, v30, v31, (uint64_t)v12);
        LogPrintF((uint64_t)ucat, (uint64_t)"-[CUTCPConnection _abortWritesWithError:]", 0x1Eu, (uint64_t)"Abort writes: peer=%@, self=%@, error=%@", v32, v33, v34, v35, (uint64_t)v16);

        goto LABEL_13;
      }
      if (_LogCategory_Initialize((uint64_t)self->_ucat, 0x1Eu))
      {
        ucat = self->_ucat;
        goto LABEL_11;
      }
    }
  }
LABEL_13:
  v36 = self->_writeRequestCurrent;
  if (v36)
  {
    writeRequestCurrent = self->_writeRequestCurrent;
    self->_writeRequestCurrent = 0;

    [(CUTCPConnection *)self _completeWriteRequest:v36 error:v12];
  }
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  v38 = self->_writeRequests;
  uint64_t v39 = [(NSMutableArray *)v38 countByEnumeratingWithState:&v48 objects:v52 count:16];
  if (v39)
  {
    uint64_t v40 = v39;
    uint64_t v41 = *(void *)v49;
    do
    {
      uint64_t v42 = 0;
      v43 = v36;
      do
      {
        if (*(void *)v49 != v41) {
          objc_enumerationMutation(v38);
        }
        v36 = (CUWriteRequest *)*(id *)(*((void *)&v48 + 1) + 8 * v42);

        [(CUTCPConnection *)self _completeWriteRequest:v36 error:v12];
        ++v42;
        v43 = v36;
      }
      while (v40 != v42);
      uint64_t v40 = [(NSMutableArray *)v38 countByEnumeratingWithState:&v48 objects:v52 count:16];
    }
    while (v40);
  }

  [(NSMutableArray *)self->_writeRequests removeAllObjects];
  writeSource = self->_writeSource;
  if (writeSource && !self->_writeSuspended)
  {
    self->_writeSuspended = 1;
    dispatch_suspend(writeSource);
  }
  errorHandler = (void (**)(id, id))self->_errorHandler;
  if (errorHandler)
  {
    errorHandler[2](errorHandler, v12);
    id v46 = self->_errorHandler;
  }
  else
  {
    id v46 = 0;
  }
  self->_errorHandler = 0;

  [(CUTCPConnection *)self _invalidated];
}

- (BOOL)_prepareWriteRequest:(id)a3 error:(id *)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (char *)a3;
  uint64_t v7 = [v6 dataArray];
  uint64_t v8 = v7;
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
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v20 = v8;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v41 objects:v45 count:16];
    uint64_t v22 = v6 + 16;
    if (v21)
    {
      uint64_t v23 = v21;
      uint64_t v24 = *(void *)v42;
      uint64_t v22 = v6 + 16;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v42 != v24) {
            objc_enumerationMutation(v20);
          }
          id v26 = *(id *)(*((void *)&v41 + 1) + 8 * i);
          *(void *)uint64_t v22 = [v26 bytes];
          *((void *)v22 + 1) = [v26 length];
          v22 += 16;
        }
        uint64_t v23 = [v20 countByEnumeratingWithState:&v41 objects:v45 count:16];
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

    int rawIOLogLevel = self->_rawIOLogLevel;
    if (gLogCategory_CUTCPConnection > rawIOLogLevel
      || gLogCategory_CUTCPConnection == -1
      && !_LogCategory_Initialize((uint64_t)&gLogCategory_CUTCPConnection, rawIOLogLevel))
    {
      goto LABEL_27;
    }
    uint64_t v33 = *((unsigned int *)v6 + 70);
    if (v33)
    {
      uint64_t v34 = 0;
      uint64_t v35 = 16 * (int)v33;
      v36 = (uint64_t *)(*((void *)v6 + 34) + 8);
      do
      {
        uint64_t v37 = *v36;
        v36 += 2;
        v34 += v37;
        v35 -= 16;
      }
      while (v35);
    }
    unsigned int v38 = self->_rawIOLogLevel;
    ucat = self->_ucat;
    if (ucat->var0 > v38) {
      goto LABEL_27;
    }
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)ucat, self->_rawIOLogLevel)) {
        goto LABEL_27;
      }
      ucat = self->_ucat;
      unsigned int v38 = self->_rawIOLogLevel;
      uint64_t v33 = *((unsigned int *)v6 + 70);
    }
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUTCPConnection _prepareWriteRequest:error:]", v38, (uint64_t)"Write prepared (%d iov, %zu total)\n", v28, v29, v30, v31, v33);
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

- (void)_processWrites:(BOOL)a3
{
  if (a3)
  {
    int flowControlState = self->_flowControlState;
    if (flowControlState != 10)
    {
      unsigned int rawIOLogLevel = self->_rawIOLogLevel;
      ucat = self->_ucat;
      if (ucat->var0 <= rawIOLogLevel)
      {
        if (ucat->var0 != -1)
        {
          if (flowControlState) {
            goto LABEL_6;
          }
          goto LABEL_11;
        }
        if (_LogCategory_Initialize((uint64_t)ucat, self->_rawIOLogLevel))
        {
          ucat = self->_ucat;
          unsigned int rawIOLogLevel = self->_rawIOLogLevel;
          int flowControlState = self->_flowControlState;
          if (flowControlState)
          {
LABEL_6:
            if (flowControlState == 20)
            {
              uint64_t v11 = "Closed";
            }
            else if (flowControlState == 10)
            {
              uint64_t v11 = "Open";
            }
            else
            {
              uint64_t v11 = "?";
            }
            goto LABEL_14;
          }
LABEL_11:
          uint64_t v11 = "Unknown";
LABEL_14:
          LogPrintF((uint64_t)ucat, (uint64_t)"-[CUTCPConnection _processWrites:]", rawIOLogLevel, (uint64_t)"Flow control changed: %s -> %s\n", v3, v4, v5, v6, (uint64_t)v11);
        }
      }
      self->_int flowControlState = 10;
      uint64_t v12 = _Block_copy(self->_flowControlChangedHandler);
      uint64_t v13 = v12;
      if (v12) {
        (*((void (**)(void *))v12 + 2))(v12);
      }
    }
  }
  int v14 = 4;
  do
  {
    uint64_t v15 = self->_writeRequestCurrent;
    if (!v15)
    {
      uint64_t v24 = [(NSMutableArray *)self->_writeRequests firstObject];
      if (!v24)
      {
        if ((!self->_flowControlChangedHandler || self->_flowControlState == 10) && !self->_writeSuspended)
        {
          self->_writeSuspended = 1;
          dispatch_suspend((dispatch_object_t)self->_writeSource);
        }
        uint64_t v15 = 0;
        goto LABEL_72;
      }
      uint64_t v15 = (CUWriteRequest *)v24;
      [(NSMutableArray *)self->_writeRequests removeObjectAtIndex:0];
      id v49 = 0;
      [(CUTCPConnection *)self _prepareWriteRequest:v15 error:&v49];
      id v25 = v49;
      if (v25)
      {
        id v26 = v25;
        goto LABEL_41;
      }
      objc_storeStrong((id *)&self->_writeRequestCurrent, v15);
    }
    uint64_t v21 = SocketWriteData(self->_socketFD, (const iovec **)&v15->_iop, &v15->_ion);
    uint64_t v22 = self->_rawIOLogLevel;
    uint64_t v23 = self->_ucat;
    if (v23->var0 <= v22)
    {
      if (v23->var0 != -1) {
        goto LABEL_22;
      }
      if (_LogCategory_Initialize((uint64_t)v23, self->_rawIOLogLevel))
      {
        uint64_t v23 = self->_ucat;
        LODWORD(v22) = self->_rawIOLogLevel;
LABEL_22:
        LogPrintF((uint64_t)v23, (uint64_t)"-[CUTCPConnection _processWrites:]", v22, (uint64_t)"Write socket %d, pre-ion %d, post-ion %d, %#m\n", v17, v18, v19, v20, self->_socketFD);
      }
    }
    if (v21)
    {
      if (v21 != 35)
      {
        v45 = NSErrorWithOSStatusF(v21, (uint64_t)"Write failed", v22, v16, v17, v18, v19, v20, v48);
        [(CUTCPConnection *)self _abortWritesWithError:v45];

LABEL_72:
        return;
      }
      int v41 = self->_flowControlState;
      if (v41 == 20)
      {
LABEL_70:
        if (self->_writeSuspended)
        {
          self->_writeSuspended = 0;
          dispatch_resume((dispatch_object_t)self->_writeSource);
        }
        goto LABEL_72;
      }
      unsigned int v42 = self->_rawIOLogLevel;
      long long v43 = self->_ucat;
      if (v43->var0 <= v42)
      {
        if (v43->var0 != -1)
        {
LABEL_49:
          if (v41)
          {
            if (v41 == 20)
            {
              long long v44 = "Closed";
            }
            else if (v41 == 10)
            {
              long long v44 = "Open";
            }
            else
            {
              long long v44 = "?";
            }
          }
          else
          {
            long long v44 = "Unknown";
          }
          LogPrintF((uint64_t)v43, (uint64_t)"-[CUTCPConnection _processWrites:]", v42, (uint64_t)"Flow control changed: %s -> %s\n", v17, v18, v19, v20, (uint64_t)v44);
          goto LABEL_67;
        }
        if (_LogCategory_Initialize((uint64_t)v43, self->_rawIOLogLevel))
        {
          long long v43 = self->_ucat;
          unsigned int v42 = self->_rawIOLogLevel;
          int v41 = self->_flowControlState;
          goto LABEL_49;
        }
      }
LABEL_67:
      self->_int flowControlState = 20;
      uint64_t v46 = _Block_copy(self->_flowControlChangedHandler);
      v47 = v46;
      if (v46) {
        (*((void (**)(void *))v46 + 2))(v46);
      }

      goto LABEL_70;
    }
    if (![(CUWriteRequest *)v15 endOfData]) {
      goto LABEL_37;
    }
    unsigned int v31 = self->_rawIOLogLevel;
    uint64_t v32 = self->_ucat;
    if (v32->var0 <= v31)
    {
      if (v32->var0 != -1) {
        goto LABEL_31;
      }
      if (_LogCategory_Initialize((uint64_t)v32, self->_rawIOLogLevel))
      {
        uint64_t v32 = self->_ucat;
        unsigned int v31 = self->_rawIOLogLevel;
LABEL_31:
        LogPrintF((uint64_t)v32, (uint64_t)"-[CUTCPConnection _processWrites:]", v31, (uint64_t)"Shutdown socket %d\n", v27, v28, v29, v30, self->_socketFD);
      }
    }
    if (shutdown(self->_socketFD, 1))
    {
      if (!*__error())
      {
        uint64_t v39 = 4294960596;
LABEL_39:
        id v26 = NSErrorWithOSStatusF(v39, (uint64_t)"shutdown() failed", v33, v34, v35, v36, v37, v38, v48);
        goto LABEL_40;
      }
      uint64_t v39 = *__error();
      if (v39) {
        goto LABEL_39;
      }
    }
LABEL_37:
    id v26 = 0;
LABEL_40:
    writeRequestCurrent = self->_writeRequestCurrent;
    self->_writeRequestCurrent = 0;

LABEL_41:
    [(CUTCPConnection *)self _completeWriteRequest:v15 error:v26];

    --v14;
  }
  while (v14);
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
    uint64_t v8 = __48__CUTCPConnection_writeEndOfDataWithCompletion___block_invoke;
    unint64_t v9 = &unk_1E55BF148;
    id v11 = v4;
    uint64_t v10 = v5;
    [(CUWriteRequest *)v10 setCompletion:&v6];
  }
  -[CUTCPConnection writeWithRequest:](self, "writeWithRequest:", v5, v6, v7, v8, v9);
}

void __48__CUTCPConnection_writeEndOfDataWithCompletion___block_invoke(uint64_t a1)
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
  v7[2] = __36__CUTCPConnection_writeWithRequest___block_invoke;
  v7[3] = &unk_1E55BF170;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __36__CUTCPConnection_writeWithRequest___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v9 + 112))
  {
    uint64_t v10 = *(void *)(a1 + 40);
    NSErrorWithOSStatusF(4294960573, (uint64_t)"Invalidated (W)", a3, a4, a5, a6, a7, a8, v12);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    [(id)v9 _completeWriteRequest:v10 error:v13];
  }
  else
  {
    [*(id *)(v9 + 72) addObject:*(void *)(a1 + 40)];
    id v11 = *(_DWORD **)(a1 + 32);
    if ((v11[76] & 0x80000000) == 0)
    {
      [v11 _processWrites:0];
    }
  }
}

- (void)_completeReadRequest:(id)a3 error:(id)a4
{
  uint64_t v17 = a3;
  id v6 = a4;
  unsigned int rawIOLogLevel = self->_rawIOLogLevel;
  ucat = self->_ucat;
  if (ucat->var0 <= rawIOLogLevel)
  {
    uint64_t v9 = v17;
    if (ucat->var0 != -1)
    {
LABEL_3:
      uint64_t v10 = [v9 length];
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUTCPConnection _completeReadRequest:error:]", rawIOLogLevel, (uint64_t)"Read completed: %zu byte(s), %{error}\n", v11, v12, v13, v14, v10);
      goto LABEL_5;
    }
    if (_LogCategory_Initialize((uint64_t)self->_ucat, self->_rawIOLogLevel))
    {
      ucat = self->_ucat;
      unsigned int rawIOLogLevel = self->_rawIOLogLevel;
      uint64_t v9 = v17;
      goto LABEL_3;
    }
  }
LABEL_5:
  uint64_t v15 = (void *)v17[2];
  v17[2] = v6;

  uint64_t v16 = [v17 completion];
  [v17 setCompletion:0];
  if (v16) {
    v16[2](v16);
  }
}

- (BOOL)_readStatus
{
  while (1)
  {
    ssize_t v3 = recv(self->_socketFD, &v17, 1uLL, 2);
    if ((v3 & 0x8000000000000000) == 0) {
      break;
    }
    if (!*__error())
    {
      uint64_t v10 = 4294960596;
      goto LABEL_11;
    }
    uint64_t v10 = *__error();
    if (v10 != 4)
    {
      if (!v10) {
        return 1;
      }
      if (v10 == 35) {
        return 0;
      }
LABEL_11:
      errorHandler = (void (**)(id, void *))self->_errorHandler;
      if (errorHandler)
      {
        uint64_t v13 = "Read status error";
        goto LABEL_13;
      }
      goto LABEL_14;
    }
  }
  if (v3) {
    return 1;
  }
  errorHandler = (void (**)(id, void *))self->_errorHandler;
  if (errorHandler)
  {
    uint64_t v13 = "Read status EOF";
    uint64_t v10 = 4294960543;
LABEL_13:
    uint64_t v14 = NSErrorWithOSStatusF(v10, (uint64_t)v13, v4, v5, v6, v7, v8, v9, v16);
    errorHandler[2](errorHandler, v14);

    id v15 = self->_errorHandler;
    goto LABEL_15;
  }
LABEL_14:
  id v15 = 0;
LABEL_15:
  self->_errorHandler = 0;

  return 1;
}

- (BOOL)_readableData
{
  do
    ssize_t v3 = recv(self->_socketFD, &v5, 1uLL, 2);
  while (v3 < 0 && *__error() && *__error() == 4);
  return v3 > 0;
}

- (void)_abortReadsWithError:(id)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  if (!self->_invalidateCalled && !self->_firstError) {
    objc_storeStrong((id *)&self->_firstError, a3);
  }
  netLinkManager = self->_netLinkManager;
  if (netLinkManager)
  {
    netLinkEndpoint = self->_netLinkEndpoint;
    if (netLinkEndpoint)
    {
      -[CUNetLinkManager removeEndpoint:](netLinkManager, "removeEndpoint:");
      uint64_t v14 = self->_netLinkManager;
      self->_netLinkManager = 0;
    }
  }
  if (self->_readRequestCurrent || [(NSMutableArray *)self->_readRequests count])
  {
    ucat = self->_ucat;
    if (ucat->var0 <= 30)
    {
      if (ucat->var0 != -1)
      {
LABEL_11:
        uint64_t v16 = NSPrintF((uint64_t)"%##a", v5, (uint64_t)netLinkEndpoint, v7, v8, v9, v10, v11, (uint64_t)&self->_peerAddr);
        uint64_t v24 = NSPrintF((uint64_t)"%##a", v17, v18, v19, v20, v21, v22, v23, (uint64_t)&self->_selfAddr);
        v47 = NSPrintF((uint64_t)"%{error}", v25, v26, v27, v28, v29, v30, v31, (uint64_t)v12);
        LogPrintF((uint64_t)ucat, (uint64_t)"-[CUTCPConnection _abortReadsWithError:]", 0x1Eu, (uint64_t)"Abort reads: peer=%@, self=%@, error=%@", v32, v33, v34, v35, (uint64_t)v16);

        goto LABEL_13;
      }
      if (_LogCategory_Initialize((uint64_t)self->_ucat, 0x1Eu))
      {
        ucat = self->_ucat;
        goto LABEL_11;
      }
    }
  }
LABEL_13:
  uint64_t v36 = self->_readRequestCurrent;
  if (v36)
  {
    readRequestCurrent = self->_readRequestCurrent;
    self->_readRequestCurrent = 0;

    [(CUTCPConnection *)self _completeReadRequest:v36 error:v12];
  }
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  uint64_t v38 = self->_readRequests;
  uint64_t v39 = [(NSMutableArray *)v38 countByEnumeratingWithState:&v48 objects:v52 count:16];
  if (v39)
  {
    uint64_t v40 = v39;
    uint64_t v41 = *(void *)v49;
    do
    {
      uint64_t v42 = 0;
      long long v43 = v36;
      do
      {
        if (*(void *)v49 != v41) {
          objc_enumerationMutation(v38);
        }
        uint64_t v36 = (CUReadRequest *)*(id *)(*((void *)&v48 + 1) + 8 * v42);

        [(CUTCPConnection *)self _completeReadRequest:v36 error:v12];
        ++v42;
        long long v43 = v36;
      }
      while (v40 != v42);
      uint64_t v40 = [(NSMutableArray *)v38 countByEnumeratingWithState:&v48 objects:v52 count:16];
    }
    while (v40);
  }

  [(NSMutableArray *)self->_readRequests removeAllObjects];
  readSource = self->_readSource;
  if (readSource && !self->_readSuspended)
  {
    self->_readSuspended = 1;
    dispatch_suspend(readSource);
  }
  errorHandler = (void (**)(id, id))self->_errorHandler;
  if (errorHandler)
  {
    errorHandler[2](errorHandler, v12);
    id v46 = self->_errorHandler;
  }
  else
  {
    id v46 = 0;
  }
  self->_errorHandler = 0;

  [(CUTCPConnection *)self _invalidated];
}

- (void)_prepareReadRequest:(id)a3
{
  uint64_t v22 = a3;
  if ([v22 bufferBytes])
  {
    v22[1] = [v22 bufferBytes];
    [v22 setData:0];
  }
  else
  {
    uint64_t v4 = [v22 bufferData];

    if (v4)
    {
      uint64_t v5 = [v22 bufferData];
      unint64_t v6 = [v5 length];
      unint64_t v7 = [v22 maxLength];

      if (v6 < v7)
      {
        uint64_t v8 = [v22 maxLength];
        uint64_t v9 = [v22 bufferData];
        [v9 setLength:v8];
      }
    }
    else
    {
      uint64_t v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA58]), "initWithLength:", objc_msgSend(v22, "maxLength"));
      [v22 setBufferData:v10];
    }
    id v11 = [v22 bufferData];
    v22[1] = [v11 mutableBytes];

    id v12 = [v22 bufferData];
    [v22 setData:v12];
  }
  uint64_t v13 = (void *)v22[2];
  v22[2] = 0;
  v22[3] = 0;

  [v22 setStatusFlags:0];
  unsigned int rawIOLogLevel = self->_rawIOLogLevel;
  ucat = self->_ucat;
  if (ucat->var0 <= rawIOLogLevel)
  {
    uint64_t v16 = v22;
    if (ucat->var0 != -1)
    {
LABEL_10:
      uint64_t v17 = [v16 minLength];
      [v22 maxLength];
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUTCPConnection _prepareReadRequest:]", rawIOLogLevel, (uint64_t)"Read prepared (%zu min, %zu max)\n", v18, v19, v20, v21, v17);
      goto LABEL_12;
    }
    if (_LogCategory_Initialize((uint64_t)self->_ucat, self->_rawIOLogLevel))
    {
      ucat = self->_ucat;
      unsigned int rawIOLogLevel = self->_rawIOLogLevel;
      uint64_t v16 = v22;
      goto LABEL_10;
    }
  }
LABEL_12:
}

- (void)_processReads:(BOOL)a3
{
  BOOL v30 = a3;
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
      if (v30)
      {
        if (v4)
        {
          int readSuspended = self->_readSuspended;
        }
        else
        {
          BOOL v28 = [(CUTCPConnection *)self _readStatus];
          int readSuspended = self->_readSuspended;
          if (v28)
          {
            if (!self->_readSuspended)
            {
              self->_int readSuspended = 1;
              dispatch_suspend((dispatch_object_t)self->_readSource);
            }
            goto LABEL_40;
          }
        }
        if (readSuspended)
        {
          self->_int readSuspended = 0;
          dispatch_resume((dispatch_object_t)self->_readSource);
        }
      }
LABEL_40:
      uint64_t v25 = 0;
      goto LABEL_24;
    }
    id obja = (id)v7;
    [(NSMutableArray *)self->_readRequests removeObjectAtIndex:0];
    [(CUTCPConnection *)self _prepareReadRequest:obja];
    objc_storeStrong((id *)p_readRequestCurrent, obja);
    unint64_t v6 = (uint64_t *)obja;
LABEL_5:
    obj = v6;
    uint64_t Data = SocketReadDataEx(self->_socketFD, v6[1], [v6 minLength], objc_msgSend(v6, "maxLength"), v6 + 3);
    unsigned int rawIOLogLevel = self->_rawIOLogLevel;
    ucat = self->_ucat;
    if (ucat->var0 > rawIOLogLevel) {
      goto LABEL_9;
    }
    if (ucat->var0 != -1) {
      goto LABEL_7;
    }
    if (_LogCategory_Initialize((uint64_t)self->_ucat, self->_rawIOLogLevel))
    {
      ucat = self->_ucat;
      unsigned int rawIOLogLevel = self->_rawIOLogLevel;
LABEL_7:
      uint64_t socketFD = self->_socketFD;
      [obj minLength];
      [obj maxLength];
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUTCPConnection _processReads:]", rawIOLogLevel, (uint64_t)"Read socket %d, %zu min, %zu max, %zu offset, %zu nread, %#m\n", v18, v19, v20, v21, socketFD);
    }
LABEL_9:
    if (Data) {
      break;
    }
    if ((self->_flags & 0x80) != 0 && [(CUTCPConnection *)self _readableData]) {
      objc_msgSend(obj, "setStatusFlags:", objc_msgSend(obj, "statusFlags") | 1);
    }
    readRequestCurrent = self->_readRequestCurrent;
    self->_readRequestCurrent = 0;

    [(CUTCPConnection *)self _completeReadRequest:obj error:0];
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
      uint64_t v23 = "Read EOF";
    }
    else {
      uint64_t v23 = "Read error";
    }
    uint64_t v24 = NSErrorWithOSStatusF(Data, (uint64_t)v23, v8, v9, v10, v11, v12, v13, v29);
    [(CUTCPConnection *)self _abortReadsWithError:v24];
  }
  uint64_t v25 = obj;
LABEL_24:
}

- (void)readWithRequest:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __35__CUTCPConnection_readWithRequest___block_invoke;
  v7[3] = &unk_1E55BF170;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __35__CUTCPConnection_readWithRequest___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v9 + 112))
  {
    uint64_t v10 = *(void *)(a1 + 40);
    NSErrorWithOSStatusF(4294960573, (uint64_t)"Invalidated (R)", a3, a4, a5, a6, a7, a8, v12);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    [(id)v9 _completeReadRequest:v10 error:v13];
  }
  else
  {
    [*(id *)(v9 + 40) addObject:*(void *)(a1 + 40)];
    uint64_t v11 = *(_DWORD **)(a1 + 32);
    if ((v11[76] & 0x80000000) == 0)
    {
      [v11 _processReads:0];
    }
  }
}

- (void)_updateTrafficRegistration
{
  v15[1] = *MEMORY[0x1E4F143B8];
  p_mutex = &self->_mutex;
  pthread_mutex_lock(&self->_mutex);
  uint64_t trafficFlags = self->_trafficFlags;
  self->_trafficFlagsPending = 0;
  pthread_mutex_unlock(p_mutex);
  if ((self->_flags & 0x200) == 0 || self->_netTransportType != 4 || trafficFlags == self->_trafficFlagsApplied) {
    return;
  }
  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu)) {
        goto LABEL_8;
      }
      ucat = self->_ucat;
    }
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUTCPConnection _updateTrafficRegistration]", 0x1Eu, (uint64_t)"Update traffic: %##a, %#{flags}\n", v5, v6, v7, v8, (uint64_t)&self->_peerAddr);
  }
LABEL_8:
  if (!self->_wifiTrafficManager)
  {
    uint64_t v10 = objc_alloc_init(CUWiFiManager);
    wifiTrafficManager = self->_wifiTrafficManager;
    self->_wifiTrafficManager = v10;

    if (self->_label) {
      -[CUWiFiManager setLabel:](self->_wifiTrafficManager, "setLabel:");
    }
    [(CUWiFiManager *)self->_wifiTrafficManager activateWithCompletion:0];
  }
  uint64_t v12 = objc_alloc_init(CUWiFiTrafficPeer);
  v14[0] = self->_peerAddr.sa;
  *(in6_addr *)((char *)v14 + 12) = *(in6_addr *)((char *)&self->_peerAddr.v6.sin6_addr + 4);
  [(CUWiFiTrafficPeer *)v12 setPeerIP:v14];
  [(CUWiFiTrafficPeer *)v12 setTrafficFlags:trafficFlags];
  v15[0] = v12;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  [(CUWiFiManager *)self->_wifiTrafficManager setTrafficPeers:v13];

  self->_trafficFlagsApplied = trafficFlags;
}

- (void)_logMetrics
{
  v31[6] = *MEMORY[0x1E4F143B8];
  if (CoreAnalyticsLibrary_sOnce_8643 != -1) {
    dispatch_once(&CoreAnalyticsLibrary_sOnce_8643, &__block_literal_global_8644);
  }
  if (CoreAnalyticsLibrary_sLib_8645 && dlsym((void *)CoreAnalyticsLibrary_sLib_8645, "AnalyticsSendEvent"))
  {
    v30[0] = @"connectTimeoutSecs";
    id v4 = [NSNumber numberWithInt:(int)self->_connectTimeoutSecs];
    v31[0] = v4;
    v30[1] = @"dataTimeoutSecs";
    uint64_t v5 = [NSNumber numberWithInt:(int)self->_dataTimeoutSecs];
    v31[1] = v5;
    v30[2] = @"durationSecs";
    uint64_t v6 = NSNumber;
    uint64_t v7 = mach_absolute_time();
    uint64_t v8 = [v6 numberWithUnsignedLongLong:UpTicksToSeconds(v7 - self->_activateTicks)];
    v31[2] = v8;
    v30[3] = @"error";
    firstError = self->_firstError;
    if (firstError)
    {
      id v10 = [NSString alloc];
      id v2 = [(NSError *)self->_firstError domain];
      uint64_t v11 = (__CFString *)[v10 initWithFormat:@"%@:%d", v2, -[NSError code](self->_firstError, "code")];
    }
    else
    {
      uint64_t v11 = @"nil";
    }
    v31[3] = v11;
    v30[4] = @"ifname";
    uint64_t v12 = [NSString stringWithUTF8String:self->_ifName];
    id v13 = (void *)v12;
    label = @"?";
    if (v12) {
      id v15 = (__CFString *)v12;
    }
    else {
      id v15 = @"?";
    }
    v30[5] = @"label";
    if (self->_label) {
      label = (__CFString *)self->_label;
    }
    v31[4] = v15;
    v31[5] = label;
    uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:6];

    if (firstError)
    {
    }
    ucat = self->_ucat;
    if (ucat->var0 > 30) {
      goto LABEL_19;
    }
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)self->_ucat, 0x1Eu)) {
        goto LABEL_19;
      }
      ucat = self->_ucat;
    }
    uint64_t v25 = NSPrintF((uint64_t)"%##@", v17, v18, v19, v20, v21, v22, v23, (uint64_t)v16);
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUTCPConnection _logMetrics]", 0x1Eu, (uint64_t)"Metrics: %@", v26, v27, v28, v29, (uint64_t)v25);

LABEL_19:
    softLinkAnalyticsSendEvent_8656(@"com.apple.cutcp", v16);
  }
}

- (void)_processSocketEvents
{
  socketEventsSource = self->_socketEventsSource;
  if (!socketEventsSource) {
    return;
  }
  uintptr_t data = dispatch_source_get_data(socketEventsSource);
  uint64_t v12 = (data >> 4) & 0x800 | (((data >> 8) & 1) << 10);
  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 != -1)
    {
LABEL_4:
      uint64_t v19 = NSPrintF((uint64_t)"%#{flags}", v4, v5, v6, v7, v8, v9, v10, v12);
      LogPrintF_safe((uint64_t)ucat, (uint64_t)"-[CUTCPConnection _processSocketEvents]", 0x1Eu, (uint64_t)"Socket events: raw 0x%llX, flags %@", v14, v15, v16, v17, data);

      goto LABEL_6;
    }
    if (_LogCategory_Initialize((uint64_t)self->_ucat, 0x1Eu))
    {
      ucat = self->_ucat;
      goto LABEL_4;
    }
  }
LABEL_6:
  if (v12)
  {
    uint64_t v18 = _Block_copy(self->_socketEventHandler);
    if (v18)
    {
      id v20 = v18;
      (*((void (**)(void *, uint64_t))v18 + 2))(v18, v12);
      uint64_t v18 = v20;
    }
  }
}

- (void)_netLinkStateChanged
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__CUTCPConnection__netLinkStateChanged__block_invoke;
  block[3] = &unk_1E55BFC18;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __39__CUTCPConnection__netLinkStateChanged__block_invoke(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 200);
  if (!v2) {
    return;
  }
  int v9 = [v2 state];
  uint64_t v10 = *(void *)(a1 + 32);
  uint64_t v11 = *(int **)(v10 + 216);
  if (*v11 <= 20)
  {
    if (*v11 != -1)
    {
LABEL_4:
      LogPrintF((uint64_t)v11, (uint64_t)"-[CUTCPConnection _netLinkStateChanged]_block_invoke", 0x14u, (uint64_t)"NetLink state changed: %##a, %s\n", v5, v6, v7, v8, v10 + 424);
      goto LABEL_7;
    }
    if (_LogCategory_Initialize((uint64_t)v11, 0x14u))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      uint64_t v11 = *(int **)(v10 + 216);
      goto LABEL_4;
    }
  }
LABEL_7:
  if (v9 == 3)
  {
    uint64_t v15 = *(void *)(*(void *)(a1 + 32) + 352);
    if (v15)
    {
      NSErrorWithOSStatusF(4294960538, (uint64_t)"Unreachable", v3, v4, v5, v6, v7, v8, v16);
      id v17 = (id)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, id))(v15 + 16))(v15, v17);
    }
  }
  else if (v9 == 1)
  {
    uint64_t v12 = *(void *)(a1 + 32);
    id v13 = *(void **)(v12 + 200);
    *(void *)(v12 + 200) = 0;

    uint64_t v14 = *(void **)(a1 + 32);
    [v14 _invalidated];
  }
}

- (BOOL)_setupIOAndReturnError:(id *)a3
{
  int socketFD = self->_socketFD;
  uint64_t v59 = 1;
  if (setsockopt(socketFD, 0xFFFF, 4130, &v59, 4u))
  {
    if (*__error())
    {
      uint64_t InterfaceInfo = *__error();
      if (!InterfaceInfo) {
        goto LABEL_4;
      }
    }
    else
    {
      uint64_t InterfaceInfo = 4294960596;
    }
    uint64_t v19 = "Set SO_NOSIGPIPE failed";
    goto LABEL_58;
  }
LABEL_4:
  uint64_t InterfaceInfo = SocketSetNonBlocking(self->_socketFD, 1);
  if (InterfaceInfo)
  {
    uint64_t v19 = "Make non-blocking failed";
    goto LABEL_58;
  }
  int v13 = self->_socketFD;
  int v58 = 1;
  if (setsockopt(v13, 6, 1, &v58, 4u))
  {
    if (*__error())
    {
      uint64_t InterfaceInfo = *__error();
      if (!InterfaceInfo) {
        goto LABEL_8;
      }
    }
    else
    {
      uint64_t InterfaceInfo = 4294960596;
    }
    uint64_t v19 = "Set TCP_NODELAY failed";
    goto LABEL_58;
  }
LABEL_8:
  uint64_t InterfaceInfo = SocketSetNotSentLowWatermark(self->_socketFD, 0x4000uLL);
  if (InterfaceInfo)
  {
    uint64_t v19 = "Set TCP_NOTSENT_LOWAT failed";
    goto LABEL_58;
  }
  if ((self->_flags & 8) != 0)
  {
    int v14 = self->_socketFD;
    int v57 = 1;
    if (setsockopt(v14, 0xFFFF, 4131, &v57, 4u))
    {
      if (*__error())
      {
        uint64_t InterfaceInfo = *__error();
        if (!InterfaceInfo) {
          goto LABEL_13;
        }
      }
      else
      {
        uint64_t InterfaceInfo = 4294960596;
      }
      uint64_t v19 = "Set SO_NOADDRERR failed";
      goto LABEL_58;
    }
  }
LABEL_13:
  double dataTimeoutSecs = self->_dataTimeoutSecs;
  if (dataTimeoutSecs > 0.0)
  {
    uint64_t InterfaceInfo = SocketSetTCPTimeout(self->_socketFD, (int)dataTimeoutSecs);
    if (InterfaceInfo)
    {
      uint64_t v19 = "Set TCP timeout failed";
      goto LABEL_58;
    }
  }
  int keepAliveIdleSeconds = self->_keepAliveIdleSeconds;
  if (keepAliveIdleSeconds >= 1)
  {
    uint64_t InterfaceInfo = SocketSetKeepAliveEx(self->_socketFD, keepAliveIdleSeconds, self->_keepAliveIntervalSeconds, self->_keepAliveMaxCount);
    if (!InterfaceInfo)
    {
      if ((self->_flags & 2) == 0) {
        goto LABEL_40;
      }
      int v17 = self->_socketFD;
      int v56 = 1;
      uint64_t v18 = &v56;
      goto LABEL_27;
    }
LABEL_77:
    uint64_t v19 = "Set TCP keepalive failed";
    goto LABEL_58;
  }
  int keepAliveSeconds = self->_keepAliveSeconds;
  if (keepAliveSeconds < 1) {
    goto LABEL_40;
  }
  if (keepAliveSeconds <= 3) {
    int keepAliveSeconds = 3;
  }
  uint64_t InterfaceInfo = SocketSetKeepAliveEx(self->_socketFD, (1431655766 * (unint64_t)keepAliveSeconds) >> 32, (1431655766 * (unint64_t)keepAliveSeconds) >> 32, 3);
  if (InterfaceInfo) {
    goto LABEL_77;
  }
  if ((self->_flags & 2) == 0) {
    goto LABEL_40;
  }
  int v17 = self->_socketFD;
  int v55 = 1;
  uint64_t v18 = &v55;
LABEL_27:
  if (!setsockopt(v17, 6, 529, v18, 4u)) {
    goto LABEL_40;
  }
  if (!*__error())
  {
    uint64_t v25 = 4294960596;
LABEL_36:
    ucat = self->_ucat;
    if (ucat->var0 > 60) {
      goto LABEL_40;
    }
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)ucat, 0x3Cu)) {
        goto LABEL_40;
      }
      ucat = self->_ucat;
    }
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUTCPConnection _setupIOAndReturnError:]", 0x3Cu, (uint64_t)"### Set TCP_KEEPALIVE_OFFLOAD failed: %#m\n", v21, v22, v23, v24, v25);
    goto LABEL_40;
  }
  uint64_t v25 = *__error();
  if (v25) {
    goto LABEL_36;
  }
LABEL_40:
  HIDWORD(v59) = 28;
  if (!getsockname(self->_socketFD, &self->_selfAddr.sa, (socklen_t *)&v59 + 1)) {
    goto LABEL_43;
  }
  if (!*__error())
  {
    uint64_t InterfaceInfo = 4294960596;
    goto LABEL_55;
  }
  uint64_t InterfaceInfo = *__error();
  if (InterfaceInfo)
  {
LABEL_55:
    uint64_t v19 = "Get self address failed";
    goto LABEL_58;
  }
LABEL_43:
  HIDWORD(v59) = 28;
  if (!getpeername(self->_socketFD, &self->_peerAddr.sa, (socklen_t *)&v59 + 1)) {
    goto LABEL_46;
  }
  if (!*__error())
  {
    uint64_t InterfaceInfo = 4294960596;
    goto LABEL_57;
  }
  uint64_t InterfaceInfo = *__error();
  if (InterfaceInfo)
  {
LABEL_57:
    uint64_t v19 = "Get peer address failed";
    goto LABEL_58;
  }
LABEL_46:
  p_netTransportType = &self->_netTransportType;
  uint64_t InterfaceInfo = SocketGetInterfaceInfo(self->_socketFD, 0, self->_ifName, &self->_ifIndex, 0, &self->_ifMedia, (int *)&self->_ifFlags, &self->_ifExtendedFlags, 0, (uint64_t)&self->_netTransportType);
  if (InterfaceInfo)
  {
    uint64_t v19 = "Get interface info failed";
    goto LABEL_58;
  }
  unsigned int v28 = *p_netTransportType;
  if (*p_netTransportType != 4 && v28 != 64 && v28 != 128) {
    SocketSetP2P(self->_socketFD, 0);
  }
  uint64_t v29 = self->_ucat;
  if (v29->var0 > 30) {
    goto LABEL_63;
  }
  if (v29->var0 != -1) {
    goto LABEL_53;
  }
  if (_LogCategory_Initialize((uint64_t)v29, 0x1Eu))
  {
    uint64_t v29 = self->_ucat;
LABEL_53:
    LogPrintF((uint64_t)v29, (uint64_t)"-[CUTCPConnection _setupIOAndReturnError:]", 0x1Eu, (uint64_t)"Connected to %##a from %##a, %s\n", v8, v9, v10, v11, (uint64_t)&self->_peerAddr);
  }
LABEL_63:
  [(CUTCPConnection *)self _updateTrafficRegistration];
  if ((self->_flags & 4) != 0 && self->_netLinkManager && (self->_ifExtendedFlags & 0x40000) == 0)
  {
    uint64_t v32 = objc_alloc_init(CUNetLinkEndpoint);
    netLinkEndpoint = self->_netLinkEndpoint;
    self->_netLinkEndpoint = v32;

    v54[0] = self->_peerAddr.sa;
    *(in6_addr *)((char *)v54 + 12) = *(in6_addr *)((char *)&self->_peerAddr.v6.sin6_addr + 4);
    [(CUNetLinkEndpoint *)self->_netLinkEndpoint setIpAddr:v54];
    v53[0] = MEMORY[0x1E4F143A8];
    v53[1] = 3221225472;
    v53[2] = __42__CUTCPConnection__setupIOAndReturnError___block_invoke;
    v53[3] = &unk_1E55BFC18;
    v53[4] = self;
    [(CUNetLinkEndpoint *)self->_netLinkEndpoint setStateChangedHandler:v53];
    [(CUNetLinkManager *)self->_netLinkManager addEndpoint:self->_netLinkEndpoint];
  }
  uint64_t v34 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14478], self->_socketFD, 0, (dispatch_queue_t)self->_dispatchQueue);
  readSource = self->_readSource;
  self->_readSource = v34;

  uint64_t v36 = self->_readSource;
  if (v36)
  {
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __42__CUTCPConnection__setupIOAndReturnError___block_invoke_2;
    handler[3] = &unk_1E55BFC18;
    handler[4] = self;
    dispatch_source_set_event_handler(v36, handler);
    uint64_t v37 = self->_readSource;
    v51[0] = MEMORY[0x1E4F143A8];
    v51[1] = 3221225472;
    v51[2] = __42__CUTCPConnection__setupIOAndReturnError___block_invoke_3;
    v51[3] = &unk_1E55BFC18;
    v51[4] = self;
    dispatch_source_set_cancel_handler(v37, v51);
    dispatch_resume((dispatch_object_t)self->_readSource);
    uint64_t v38 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F144B0], self->_socketFD, 0, (dispatch_queue_t)self->_dispatchQueue);
    writeSource = self->_writeSource;
    self->_writeSource = v38;

    uint64_t v40 = self->_writeSource;
    if (v40)
    {
      v50[0] = MEMORY[0x1E4F143A8];
      v50[1] = 3221225472;
      v50[2] = __42__CUTCPConnection__setupIOAndReturnError___block_invoke_4;
      v50[3] = &unk_1E55BFC18;
      v50[4] = self;
      dispatch_source_set_event_handler(v40, v50);
      uint64_t v41 = self->_writeSource;
      v49[0] = MEMORY[0x1E4F143A8];
      v49[1] = 3221225472;
      v49[2] = __42__CUTCPConnection__setupIOAndReturnError___block_invoke_5;
      v49[3] = &unk_1E55BFC18;
      v49[4] = self;
      dispatch_source_set_cancel_handler(v41, v49);
      self->_writeSuspended = 1;
      self->_int flowControlState = 10;
      uintptr_t v42 = (self->_flags >> 2) & 0x100 | (((self->_flags >> 11) & 1) << 15);
      if (v42)
      {
        dispatch_source_t v43 = dispatch_source_create(MEMORY[0x1E4F14488], self->_socketFD, v42, (dispatch_queue_t)self->_dispatchQueue);
        objc_storeStrong((id *)&self->_socketEventsSource, v43);
        if (v43)
        {
          v48[0] = MEMORY[0x1E4F143A8];
          v48[1] = 3221225472;
          v48[2] = __42__CUTCPConnection__setupIOAndReturnError___block_invoke_6;
          v48[3] = &unk_1E55BFC18;
          v48[4] = self;
          dispatch_source_set_event_handler(v43, v48);
          v47[0] = MEMORY[0x1E4F143A8];
          v47[1] = 3221225472;
          v47[2] = __42__CUTCPConnection__setupIOAndReturnError___block_invoke_7;
          v47[3] = &unk_1E55BFC18;
          v47[4] = self;
          dispatch_source_set_cancel_handler(v43, v47);
          dispatch_activate(v43);
        }
      }
      BOOL v31 = 0;
      id v30 = 0;
      goto LABEL_74;
    }
    uint64_t v19 = "Create write source failed";
  }
  else
  {
    uint64_t v19 = "Create read source failed";
  }
  uint64_t InterfaceInfo = 4294960596;
LABEL_58:
  NSErrorWithOSStatusF(InterfaceInfo, (uint64_t)v19, v6, v7, v8, v9, v10, v11, v46);
  id v30 = (id)objc_claimAutoreleasedReturnValue();
  BOOL v31 = v30 != 0;
  if (a3 && v30)
  {
    id v30 = v30;
    *a3 = v30;
    BOOL v31 = 1;
  }
LABEL_74:
  BOOL v44 = !v31;

  return v44;
}

uint64_t __42__CUTCPConnection__setupIOAndReturnError___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _netLinkStateChanged];
}

uint64_t __42__CUTCPConnection__setupIOAndReturnError___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _processReads:1];
}

uint64_t __42__CUTCPConnection__setupIOAndReturnError___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 16);
  *(void *)(v2 + 16) = 0;

  uint64_t v4 = *(void **)(a1 + 32);
  return [v4 _invalidated];
}

uint64_t __42__CUTCPConnection__setupIOAndReturnError___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _processWrites:1];
}

uint64_t __42__CUTCPConnection__setupIOAndReturnError___block_invoke_5(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 48);
  *(void *)(v2 + 48) = 0;

  uint64_t v4 = *(void **)(a1 + 32);
  return [v4 _invalidated];
}

uint64_t __42__CUTCPConnection__setupIOAndReturnError___block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) _processSocketEvents];
}

uint64_t __42__CUTCPConnection__setupIOAndReturnError___block_invoke_7(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 192);
  *(void *)(v2 + 192) = 0;

  uint64_t v4 = *(void **)(a1 + 32);
  return [v4 _invalidated];
}

- (BOOL)_startConnectingToDestination:(id)a3 error:(id *)a4
{
  id v10 = a3;
  ucat = self->_ucat;
  if (ucat->var0 > 30) {
    goto LABEL_5;
  }
  if (ucat->var0 != -1) {
    goto LABEL_3;
  }
  if (_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
  {
    ucat = self->_ucat;
LABEL_3:
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUTCPConnection _startConnectingToDestination:error:]", 0x1Eu, (uint64_t)"Connecting to '%@'\n", v6, v7, v8, v9, (uint64_t)v10);
  }
LABEL_5:
  if ((self->_flags & 0x10) != 0) {
    int v12 = 1536;
  }
  else {
    int v12 = 1024;
  }
  unsigned int v13 = self->_flags & 1 | (4 * ((self->_flags >> 5) & 1)) | v12;
  double connectTimeoutSecs = self->_connectTimeoutSecs;
  if (connectTimeoutSecs <= 0.0) {
    unint64_t v15 = -1;
  }
  else {
    unint64_t v15 = (unint64_t)(connectTimeoutSecs * 1000000000.0);
  }
  uint64_t v16 = self;
  uint64_t v43 = 0;
  long long v42 = 0u;
  long long v41 = 0u;
  long long v40 = 0u;
  uint64_t v38 = 0;
  long long v37 = 0u;
  long long v36 = 0u;
  long long v35 = 0u;
  uint64_t v39 = 152;
  id v17 = v10;
  uint64_t v30 = [v17 UTF8String];
  int defaultPort = v16->_defaultPort;
  unsigned int v32 = v13;
  unint64_t v33 = v15;
  uint64_t v34 = -1;
  *(void *)&long long v36 = _connectHandler;
  *((void *)&v36 + 1) = v16;
  *(void *)&long long v37 = v16->_dispatchQueue;
  *(void *)&long long v40 = [(NSString *)v16->_label UTF8String];
  uint64_t v18 = AsyncConnection_ConnectEx(&v16->_connector, (uint64_t)&v30);
  if (v18)
  {
    NSErrorWithOSStatusF(v18, (uint64_t)"Start connect failed", v19, v20, v21, v22, v23, v24, v29);
    id v26 = (id)objc_claimAutoreleasedReturnValue();
    CFRelease(v16);
    BOOL v25 = v26 != 0;
    if (a4 && v26)
    {
      id v26 = v26;
      *a4 = v26;
      BOOL v25 = 1;
    }
  }
  else
  {
    BOOL v25 = 0;
    id v26 = 0;
  }
  BOOL v27 = !v25;

  return v27;
}

- (BOOL)_startConnectingToBonjourDevice:(id)a3 error:(id *)a4
{
  id v10 = a3;
  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 != -1)
    {
LABEL_3:
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUTCPConnection _startConnectingToBonjourDevice:error:]", 0x1Eu, (uint64_t)"Connecting to '%@'\n", v6, v7, v8, v9, (uint64_t)v10);
      goto LABEL_5;
    }
    if (_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
    {
      ucat = self->_ucat;
      goto LABEL_3;
    }
  }
LABEL_5:
  interfaceName = self->_interfaceName;
  id v34 = 0;
  unsigned int v13 = (void *)[v10 copyConnectionInfoWithFlags:0 interfaceName:interfaceName error:&v34];
  id v14 = v34;
  unint64_t v15 = v14;
  if (v13)
  {
    if ((self->_flags & 0x10) != 0) {
      int v16 = 1536;
    }
    else {
      int v16 = 1024;
    }
    unsigned int v17 = self->_flags & 1 | (4 * ((self->_flags >> 5) & 1)) | v16;
    double connectTimeoutSecs = self->_connectTimeoutSecs;
    if (connectTimeoutSecs <= 0.0) {
      unint64_t v19 = -1;
    }
    else {
      unint64_t v19 = (unint64_t)(connectTimeoutSecs * 1000000000.0);
    }
    uint64_t v20 = self;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    uint64_t v33 = 0;
    long long v32 = 0u;
    long long v27 = 0u;
    uint64_t v28 = 0;
    long long v25 = 0u;
    long long v26 = 0u;
    uint64_t v29 = 152;
    DWORD2(v23) = v20->_defaultPort;
    HIDWORD(v23) = v17;
    *(void *)&long long v24 = v19;
    *((void *)&v24 + 1) = -1;
    *((void *)&v30 + 1) = _connectCompletion;
    *(void *)&long long v31 = v13;
    dispatchQueue = v20->_dispatchQueue;
    *((void *)&v26 + 1) = v20;
    *(void *)&long long v27 = dispatchQueue;
    *(void *)&long long v30 = [(NSString *)v20->_label UTF8String];
    if (AsyncConnection_ConnectEx(&v20->_connector, (uint64_t)&v23)) {
      CFRelease(v20);
    }
  }
  else if (a4)
  {
    *a4 = v14;
  }

  return v13 != 0;
}

- (void)_invalidated
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateDone
    && !self->_connector
    && !self->_readSource
    && !self->_writeSource
    && !self->_socketEventsSource
    && !self->_readRequestCurrent
    && ![(NSMutableArray *)self->_readRequests count]
    && !self->_writeRequestCurrent
    && ![(NSMutableArray *)self->_writeRequests count]
    && !self->_netLinkEndpoint)
  {
    int socketFD = self->_socketFD;
    if ((socketFD & 0x80000000) == 0)
    {
      if (close(socketFD) && *__error()) {
        __error();
      }
      self->_int socketFD = -1;
    }
    [(CUWiFiManager *)self->_wifiTrafficManager invalidate];
    wifiTrafficManager = self->_wifiTrafficManager;
    self->_wifiTrafficManager = 0;

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

    id flowControlChangedHandler = self->_flowControlChangedHandler;
    self->_id flowControlChangedHandler = 0;

    id v9 = self->_invalidationHandler;
    self->_invalidationHandler = 0;

    id v10 = self->_serverInvalidationHandler;
    self->_serverInvalidationHandler = 0;

    id socketEventHandler = self->_socketEventHandler;
    self->_id socketEventHandler = 0;

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
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUTCPConnection _invalidated]", 0x1Eu, (uint64_t)"Invalidated\n", v12, v13, v14, v15, v18);
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
    if (ucat->var0 != -1)
    {
LABEL_4:
      id v10 = NSPrintF((uint64_t)"%##a", (uint64_t)a2, v2, v3, v4, v5, v6, v7, (uint64_t)&self->_peerAddr);
      long long v37 = NSPrintF((uint64_t)"%##a", v11, v12, v13, v14, v15, v16, v17, (uint64_t)&self->_selfAddr);
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUTCPConnection _invalidate]", 0x1Eu, (uint64_t)"Invalidating: peer=%@, self=%@", v18, v19, v20, v21, (uint64_t)v10);

      goto LABEL_6;
    }
    if (_LogCategory_Initialize((uint64_t)self->_ucat, 0x1Eu))
    {
      ucat = self->_ucat;
      goto LABEL_4;
    }
  }
LABEL_6:
  [(CUTCPConnection *)self _logMetrics];
  [(CUNANDataSession *)self->_nanDataSession invalidate];
  nanDataSession = self->_nanDataSession;
  self->_nanDataSession = 0;

  netLinkManager = self->_netLinkManager;
  if (netLinkManager && self->_netLinkEndpoint)
  {
    -[CUNetLinkManager removeEndpoint:](netLinkManager, "removeEndpoint:");
    long long v24 = self->_netLinkManager;
    self->_netLinkManager = 0;
  }
  id errorHandler = self->_errorHandler;
  self->_id errorHandler = 0;

  NSErrorWithOSStatusF(4294960573, (uint64_t)"Invalidated (I)", v26, v27, v28, v29, v30, v31, v36);
  id v38 = (id)objc_claimAutoreleasedReturnValue();
  [(CUTCPConnection *)self _abortReadsWithError:v38];
  [(CUTCPConnection *)self _abortWritesWithError:v38];
  connector = self->_connector;
  if (connector) {
    dispatch_async_f(*((dispatch_queue_t *)connector + 13), connector, (dispatch_function_t)_AsyncConnection_UserRelease);
  }
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
  socketEventsSource = self->_socketEventsSource;
  if (socketEventsSource) {
    dispatch_source_cancel(socketEventsSource);
  }
  [(CUTCPConnection *)self _invalidated];
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __29__CUTCPConnection_invalidate__block_invoke;
  block[3] = &unk_1E55BFC18;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __29__CUTCPConnection_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

- (BOOL)_activateDirectAndReturnError:(id *)a3
{
  self->_activateTicks = mach_absolute_time();
  uint64_t socketFD = self->_socketFD;
  if ((socketFD & 0x80000000) == 0)
  {
    ucat = self->_ucat;
    if (ucat->var0 > 30) {
      goto LABEL_15;
    }
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
      {
LABEL_15:
        id v37 = 0;
        [(CUTCPConnection *)self _setupIOAndReturnError:&v37];
        id v24 = v37;
        if (!v24)
        {
          activateCompletion = (void (**)(id, void))self->_activateCompletion;
          if (!activateCompletion)
          {
LABEL_19:
            uint64_t v26 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
            readRequests = self->_readRequests;
            self->_readRequests = v26;

            uint64_t v28 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
            writeRequests = self->_writeRequests;
            self->_writeRequests = v28;

            id v16 = 0;
LABEL_20:
            BOOL v30 = 1;
            goto LABEL_21;
          }
          activateCompletion[2](activateCompletion, 0);
          id v14 = self->_activateCompletion;
          self->_activateCompletion = 0;
LABEL_18:

          goto LABEL_19;
        }
        goto LABEL_23;
      }
      ucat = self->_ucat;
      uint64_t socketFD = self->_socketFD;
    }
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUTCPConnection _activateDirectAndReturnError:]", 0x1Eu, (uint64_t)"Activate with socket %d\n", v6, v7, v8, v9, socketFD);
    goto LABEL_15;
  }
  destinationBonjour = self->_destinationBonjour;
  if (destinationBonjour)
  {
    unsigned int flags = self->_flags;
    self->_unsigned int flags = flags | 0x200;
    if ((flags & 0x100) != 0)
    {
      v36[1] = 0;
      -[CUTCPConnection _startConnectingToBonjourDevice:error:](self, "_startConnectingToBonjourDevice:error:");
      id v24 = 0;
      if (!v24) {
        goto LABEL_19;
      }
LABEL_23:
      id v16 = v24;
      goto LABEL_26;
    }
    v36[0] = 0;
    id v14 = [(CUBonjourDevice *)destinationBonjour copyConnectionStringWithFlags:0 error:v36];
    id v15 = v36[0];
    id v16 = v15;
    if (v14)
    {
      id v35 = v15;
      [(CUTCPConnection *)self _startConnectingToDestination:v14 error:&v35];
      id v17 = v35;

      if (!v17) {
        goto LABEL_18;
      }
      id v16 = v17;
    }

    goto LABEL_25;
  }
  destinationString = self->_destinationString;
  if (!destinationString)
  {
    NSErrorWithOSStatusF(4294960591, (uint64_t)"No destination or socket", 0, v5, v6, v7, v8, v9, v33);
    id v16 = (id)objc_claimAutoreleasedReturnValue();
LABEL_25:
    if (!v16) {
      goto LABEL_20;
    }
    goto LABEL_26;
  }
  self->_flags |= 0x200u;
  id v34 = 0;
  long long v23 = destinationString;
  [(CUTCPConnection *)self _startConnectingToDestination:v23 error:&v34];
  id v16 = v34;

  if (!v16) {
    goto LABEL_19;
  }
LABEL_26:
  long long v32 = self->_ucat;
  if (v32->var0 > 60) {
    goto LABEL_30;
  }
  if (v32->var0 != -1) {
    goto LABEL_28;
  }
  if (_LogCategory_Initialize((uint64_t)v32, 0x3Cu))
  {
    long long v32 = self->_ucat;
LABEL_28:
    LogPrintF((uint64_t)v32, (uint64_t)"-[CUTCPConnection _activateDirectAndReturnError:]", 0x3Cu, (uint64_t)"### Activate direct failed: %{error}\n", v18, v19, v20, v21, (uint64_t)v16);
  }
LABEL_30:
  if (a3)
  {
    id v16 = v16;
    BOOL v30 = 0;
    *a3 = v16;
  }
  else
  {
    BOOL v30 = 0;
  }
LABEL_21:

  return v30;
}

- (BOOL)activateDirectAndReturnError:(id *)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  pthread_mutex_lock(&self->_mutex);
  self->_activateCalled = 1;
  pthread_mutex_unlock(&self->_mutex);
  return [(CUTCPConnection *)self _activateDirectAndReturnError:a3];
}

- (void)activateWithCompletion:(id)a3
{
  id v4 = a3;
  p_mutex = &self->_mutex;
  pthread_mutex_lock(&self->_mutex);
  self->_activateCalled = 1;
  dispatchQueue = self->_dispatchQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __42__CUTCPConnection_activateWithCompletion___block_invoke;
  v8[3] = &unk_1E55BF148;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(dispatchQueue, v8);
  pthread_mutex_unlock(p_mutex);
}

void __42__CUTCPConnection_activateWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = _Block_copy(*(const void **)(a1 + 40));
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 88);
  *(void *)(v3 + 88) = v2;

  uint64_t v5 = *(void **)(a1 + 32);
  id v9 = 0;
  [v5 _activateDirectAndReturnError:&v9];
  id v6 = v9;
  if (v6)
  {
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void **)(v7 + 88);
    *(void *)(v7 + 88) = 0;

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)setTrafficFlags:(unsigned int)a3
{
  p_mutex = &self->_mutex;
  pthread_mutex_lock(&self->_mutex);
  if (self->_trafficFlags != a3)
  {
    self->_uint64_t trafficFlags = a3;
    if (self->_activateCalled && !self->_trafficFlagsPending)
    {
      self->_trafficFlagsPending = 1;
      dispatchQueue = self->_dispatchQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __35__CUTCPConnection_setTrafficFlags___block_invoke;
      block[3] = &unk_1E55BFC18;
      block[4] = self;
      dispatch_async(dispatchQueue, block);
    }
  }
  pthread_mutex_unlock(p_mutex);
}

uint64_t __35__CUTCPConnection_setTrafficFlags___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateTrafficRegistration];
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
  id v5 = a3;
  p_ucat = (uint64_t *)&self->_ucat;
  uint64_t v7 = qword_1E91CD8D8;
  id v14 = v5;
  [v14 UTF8String];
  LogCategoryReplaceF(p_ucat, (uint64_t)"%s-%s", v8, v9, v10, v11, v12, v13, v7);
}

- (id)description
{
  CFMutableStringRef v40 = 0;
  NSAppendPrintF(&v40, (uint64_t)"CUTCPConnection ", v2, v3, v4, v5, v6, v7, v36);
  uint64_t v9 = v40;
  id v16 = v9;
  label = self->_label;
  if (label)
  {
    CFMutableStringRef v39 = v9;
    uint64_t v18 = label;
    NSAppendPrintF(&v39, (uint64_t)"'%@' ", v19, v20, v21, v22, v23, v24, (uint64_t)v18);
    long long v25 = v39;

    id v16 = v25;
  }
  CFMutableStringRef v38 = v16;
  NSAppendPrintF(&v38, (uint64_t)"%##a -> %##a", v10, v11, v12, v13, v14, v15, (uint64_t)&self->_selfAddr);
  uint64_t v26 = v38;

  uint64_t trafficFlags = self->_trafficFlags;
  if (trafficFlags)
  {
    CFMutableStringRef v37 = v26;
    NSAppendPrintF(&v37, (uint64_t)", TF %#{flags}", v27, v28, v29, v30, v31, v32, trafficFlags);
    id v34 = v37;

    uint64_t v26 = v34;
  }
  return v26;
}

- (void)dealloc
{
  pthread_mutex_destroy(&self->_mutex);
  ucat = self->_ucat;
  if (ucat && (ucat->var3 & 0x40000) != 0)
  {
    LogCategory_Remove(ucat);
    self->_ucat = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CUTCPConnection;
  [(CUTCPConnection *)&v4 dealloc];
}

- (CUTCPConnection)init
{
  v6.receiver = self;
  v6.super_class = (Class)CUTCPConnection;
  uint64_t v2 = [(CUTCPConnection *)&v6 init];
  if (v2)
  {
    if (CUMainQueue_sOnce != -1) {
      dispatch_once(&CUMainQueue_sOnce, &__block_literal_global_18);
    }
    objc_storeStrong((id *)&v2->_dispatchQueue, (id)CUMainQueue_sQueue);
    if (_os_feature_enabled_impl()) {
      int v3 = 50;
    }
    else {
      int v3 = 9;
    }
    v2->_unsigned int rawIOLogLevel = v3;
    v2->_uint64_t socketFD = -1;
    v2->_ucat = (LogCategory *)&gLogCategory_CUTCPConnection;
    pthread_mutex_init(&v2->_mutex, 0);
    objc_super v4 = v2;
  }

  return v2;
}

@end
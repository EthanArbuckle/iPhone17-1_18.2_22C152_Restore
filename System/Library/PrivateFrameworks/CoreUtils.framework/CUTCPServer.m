@interface CUTCPServer
- ($9D4F243E34B80324A1B90A38B57CFE16)interfaceAddress;
- (BOOL)activateDirectAndReturnError:(id *)a3;
- (CUBonjourAdvertiser)bonjourAdvertiser;
- (CUNetLinkManager)netLinkManager;
- (CUTCPServer)init;
- (NSString)label;
- (OS_dispatch_queue)dispatchQueue;
- (id)connectionAcceptHandler;
- (id)connectionEndedHandler;
- (id)connectionPrepareHandler;
- (id)connectionStartedHandler;
- (id)description;
- (id)detailedDescription;
- (id)invalidationHandler;
- (int)tcpListenPort;
- (int)tcpListeningPort;
- (unsigned)flags;
- (unsigned)maxConnectionCount;
- (void)_handleConnectionAccept:(int)a3;
- (void)_handleConnectionInvalidated:(id)a3 addr:(id *)a4;
- (void)_invalidated;
- (void)activateWithCompletion:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)setBonjourAdvertiser:(id)a3;
- (void)setConnectionAcceptHandler:(id)a3;
- (void)setConnectionEndedHandler:(id)a3;
- (void)setConnectionPrepareHandler:(id)a3;
- (void)setConnectionStartedHandler:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setFlags:(unsigned int)a3;
- (void)setInterfaceAddress:(id *)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setLabel:(id)a3;
- (void)setMaxConnectionCount:(unsigned int)a3;
- (void)setNetLinkManager:(id)a3;
- (void)setTcpListenPort:(int)a3;
- (void)setTcpListeningPort:(int)a3;
@end

@implementation CUTCPServer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_netLinkManager, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong(&self->_connectionPrepareHandler, 0);
  objc_storeStrong(&self->_connectionEndedHandler, 0);
  objc_storeStrong(&self->_connectionStartedHandler, 0);
  objc_storeStrong(&self->_connectionAcceptHandler, 0);
  objc_storeStrong((id *)&self->_bonjourAdvertiser, 0);
  objc_storeStrong((id *)&self->_listenerSourceV6, 0);
  objc_storeStrong((id *)&self->_listenerSourceV4, 0);
  objc_storeStrong((id *)&self->_connections, 0);
}

- (void)setTcpListeningPort:(int)a3
{
  self->_tcpListeningPort = a3;
}

- (int)tcpListeningPort
{
  return self->_tcpListeningPort;
}

- (void)setTcpListenPort:(int)a3
{
  self->_tcpListenPort = a3;
}

- (int)tcpListenPort
{
  return self->_tcpListenPort;
}

- (void)setNetLinkManager:(id)a3
{
}

- (CUNetLinkManager)netLinkManager
{
  return self->_netLinkManager;
}

- (void)setMaxConnectionCount:(unsigned int)a3
{
  self->_maxConnectionCount = a3;
}

- (unsigned)maxConnectionCount
{
  return self->_maxConnectionCount;
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

- (void)setInterfaceAddress:(id *)a3
{
  sockaddr var0 = a3->var0;
  *(in6_addr *)((char *)&self->_interfaceAddress.v6.sin6_addr + 4) = *(in6_addr *)((char *)&a3->var2.sin6_addr + 4);
  self->_interfaceAddress.sa = var0;
}

- ($9D4F243E34B80324A1B90A38B57CFE16)interfaceAddress
{
  retstr->sockaddr var0 = *(sockaddr *)&self[4].var2.sin6_scope_id;
  *(in6_addr *)((char *)&retstr->var2.sin6_addr + 4) = self[5].var2.sin6_addr;
  return self;
}

- (void)setFlags:(unsigned int)a3
{
  self->_flags = a3;
}

- (unsigned)flags
{
  return self->_flags;
}

- (void)setDispatchQueue:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setConnectionPrepareHandler:(id)a3
{
}

- (id)connectionPrepareHandler
{
  return self->_connectionPrepareHandler;
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

- (void)setConnectionAcceptHandler:(id)a3
{
}

- (id)connectionAcceptHandler
{
  return self->_connectionAcceptHandler;
}

- (void)setBonjourAdvertiser:(id)a3
{
}

- (CUBonjourAdvertiser)bonjourAdvertiser
{
  return self->_bonjourAdvertiser;
}

- (void)_handleConnectionInvalidated:(id)a3 addr:(id *)a4
{
  id v6 = a3;
  ucat = self->_ucat;
  id v14 = v6;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 != -1)
    {
LABEL_3:
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUTCPServer _handleConnectionInvalidated:addr:]", 0x1Eu, (uint64_t)"Connection ended from %##a\n", v7, v8, v9, v10, (uint64_t)a4);
      id v6 = v14;
      goto LABEL_5;
    }
    BOOL v12 = _LogCategory_Initialize((uint64_t)ucat, 0x1Eu);
    id v6 = v14;
    if (v12)
    {
      ucat = self->_ucat;
      goto LABEL_3;
    }
  }
LABEL_5:
  [(NSMutableSet *)self->_connections removeObject:v6];
  connectionEndedHandler = (void (**)(id, id, void))self->_connectionEndedHandler;
  if (connectionEndedHandler) {
    connectionEndedHandler[2](connectionEndedHandler, v14, 0);
  }
}

- (void)_handleConnectionAccept:(int)a3
{
  memset(v37, 0, 28);
  socklen_t v36 = 28;
  uint64_t v8 = accept(a3, v37, &v36);
  if ((v8 & 0x80000000) != 0)
  {
    if (*__error())
    {
      uint64_t v9 = *__error();
      if (!v9) {
        goto LABEL_4;
      }
    }
    else
    {
      uint64_t v9 = 4294960596;
    }
    ucat = self->_ucat;
    if (ucat->var0 <= 30)
    {
      if (ucat->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu)) {
          goto LABEL_31;
        }
        ucat = self->_ucat;
      }
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUTCPServer _handleConnectionAccept:]", 0x1Eu, (uint64_t)"### accept() failed: %#m\n", v4, v5, v6, v7, v9);
    }
LABEL_31:
    id v20 = 0;
    goto LABEL_32;
  }
LABEL_4:
  uint64_t v10 = self->_ucat;
  if (v10->var0 <= 30)
  {
    if (v10->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)v10, 0x1Eu)) {
        goto LABEL_8;
      }
      uint64_t v10 = self->_ucat;
    }
    LogPrintF((uint64_t)v10, (uint64_t)"-[CUTCPServer _handleConnectionAccept:]", 0x1Eu, (uint64_t)"Connection started from %##a\n", v4, v5, v6, v7, (uint64_t)v37);
  }
LABEL_8:
  if (!self->_maxConnectionCount
    || [(NSMutableSet *)self->_connections count] < (unint64_t)self->_maxConnectionCount)
  {
    v11 = _Block_copy(self->_connectionAcceptHandler);
    if (v11)
    {
      BOOL v12 = v11;
      (*((void (**)(void *, uint64_t))v11 + 2))(v11, v8);

      return;
    }
    v13 = objc_alloc_init(CUTCPConnection);
    [(CUTCPConnection *)v13 setDispatchQueue:self->_dispatchQueue];
    [(CUTCPConnection *)v13 setFlags:self->_flags];
    if (self->_label) {
      -[CUTCPConnection setLabel:](v13, "setLabel:");
    }
    [(CUTCPConnection *)v13 setNetLinkManager:self->_netLinkManager];
    [(CUTCPConnection *)v13 setSocketFD:v8];
    if ((self->_flags & 0x40) == 0)
    {
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __39__CUTCPServer__handleConnectionAccept___block_invoke;
      v33[3] = &unk_1E55BED60;
      v33[4] = self;
      v34 = v13;
      *(sockaddr *)v35 = v37[0];
      *(sockaddr *)&v35[12] = *(sockaddr *)&v37[0].sa_data[10];
      [(CUTCPConnection *)v34 setServerInvalidationHandler:v33];
    }
    connectionPrepareHandler = (void (**)(id, CUTCPConnection *))self->_connectionPrepareHandler;
    if (connectionPrepareHandler) {
      connectionPrepareHandler[2](connectionPrepareHandler, v13);
    }
    id v32 = 0;
    BOOL v15 = [(CUTCPConnection *)v13 activateDirectAndReturnError:&v32];
    id v20 = v32;
    if (!v15)
    {
      v31 = self->_ucat;
      if (v31->var0 <= 30)
      {
        if (v31->var0 == -1)
        {
          if (!_LogCategory_Initialize((uint64_t)v31, 0x1Eu)) {
            goto LABEL_33;
          }
          v31 = self->_ucat;
        }
        LogPrintF((uint64_t)v31, (uint64_t)"-[CUTCPServer _handleConnectionAccept:]", 0x1Eu, (uint64_t)"### Activate accepted connection failed: %{error}\n", v16, v17, v18, v19, (uint64_t)v20);
      }
LABEL_33:
      [(CUTCPConnection *)v13 invalidate];

      return;
    }
    if ((self->_flags & 0x40) == 0)
    {
      connections = self->_connections;
      if (!connections)
      {
        v22 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
        v23 = self->_connections;
        self->_connections = v22;

        connections = self->_connections;
      }
      [(NSMutableSet *)connections addObject:v13];
    }
    connectionStartedHandler = (void (**)(id, CUTCPConnection *))self->_connectionStartedHandler;
    if (connectionStartedHandler) {
      connectionStartedHandler[2](connectionStartedHandler, v13);
    }

LABEL_32:
    v13 = 0;
    goto LABEL_33;
  }
  v26 = self->_ucat;
  if (v26->var0 <= 60)
  {
    if (v26->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)self->_ucat, 0x3Cu)) {
        goto LABEL_43;
      }
      v26 = self->_ucat;
    }
    [(NSMutableSet *)self->_connections count];
    LogPrintF((uint64_t)v26, (uint64_t)"-[CUTCPServer _handleConnectionAccept:]", 0x3Cu, (uint64_t)"### Rejecting connection from %##a when at limit of %d\n", v27, v28, v29, v30, (uint64_t)v37);
  }
LABEL_43:
  [0 invalidate];
  if ((v8 & 0x80000000) == 0 && close(v8) && *__error()) {
    __error();
  }
}

uint64_t __39__CUTCPServer__handleConnectionAccept___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleConnectionInvalidated:*(void *)(a1 + 40) addr:a1 + 48];
}

- (void)_invalidated
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_invalidateDone) {
    return;
  }
  if (!self->_invalidateCalled)
  {
    ucat = self->_ucat;
    if (ucat->var0 <= 60)
    {
      if (ucat->var0 != -1)
      {
LABEL_5:
        LogPrintF((uint64_t)ucat, (uint64_t)"-[CUTCPServer _invalidated]", 0x3Cu, (uint64_t)"### Unexpectedly invalidated\n", v3, v4, v5, v6, v19);
        goto LABEL_7;
      }
      if (_LogCategory_Initialize((uint64_t)ucat, 0x3Cu))
      {
        ucat = self->_ucat;
        goto LABEL_5;
      }
    }
  }
LABEL_7:
  if (!self->_bonjourAdvertiser
    && !self->_listenerSourceV4
    && !self->_listenerSourceV6
    && ![(NSMutableSet *)self->_connections count])
  {
    invalidationHandler = (void (**)(void))self->_invalidationHandler;
    if (invalidationHandler) {
      invalidationHandler[2]();
    }
    id connectionAcceptHandler = self->_connectionAcceptHandler;
    self->_id connectionAcceptHandler = 0;

    id connectionStartedHandler = self->_connectionStartedHandler;
    self->_id connectionStartedHandler = 0;

    id connectionEndedHandler = self->_connectionEndedHandler;
    self->_id connectionEndedHandler = 0;

    id connectionPrepareHandler = self->_connectionPrepareHandler;
    self->_id connectionPrepareHandler = 0;

    id v13 = self->_invalidationHandler;
    self->_invalidationHandler = 0;

    self->_invalidateDone = 1;
    uint64_t v18 = self->_ucat;
    if (v18->var0 <= 30)
    {
      if (v18->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)v18, 0x1Eu)) {
          return;
        }
        uint64_t v18 = self->_ucat;
      }
      LogPrintF((uint64_t)v18, (uint64_t)"-[CUTCPServer _invalidated]", 0x1Eu, (uint64_t)"Invalidated\n", v14, v15, v16, v17, v21);
    }
  }
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __25__CUTCPServer_invalidate__block_invoke;
  block[3] = &unk_1E55BFC18;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __25__CUTCPServer_invalidate__block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = *(void *)(result + 32);
  if (*(unsigned char *)(v8 + 16)) {
    return result;
  }
  uint64_t v9 = result;
  *(unsigned char *)(v8 + 16) = 1;
  uint64_t v10 = *(void *)(result + 32);
  v11 = *(int **)(v10 + 40);
  if (*v11 <= 30)
  {
    if (*v11 == -1)
    {
      BOOL v12 = _LogCategory_Initialize((uint64_t)v11, 0x1Eu);
      uint64_t v10 = *(void *)(v9 + 32);
      if (!v12) {
        goto LABEL_6;
      }
      v11 = *(int **)(v10 + 40);
    }
    LogPrintF((uint64_t)v11, (uint64_t)"-[CUTCPServer invalidate]_block_invoke", 0x1Eu, (uint64_t)"Invalidating\n", a5, a6, a7, a8, v23);
    uint64_t v10 = *(void *)(v9 + 32);
  }
LABEL_6:
  [*(id *)(v10 + 64) invalidate];
  uint64_t v13 = *(void *)(v9 + 32);
  uint64_t v14 = *(void **)(v13 + 64);
  *(void *)(v13 + 64) = 0;

  uint64_t v15 = *(void *)(v9 + 32);
  uint64_t v16 = *(NSObject **)(v15 + 24);
  if (v16)
  {
    dispatch_source_cancel(v16);
    uint64_t v15 = *(void *)(v9 + 32);
  }
  uint64_t v17 = *(NSObject **)(v15 + 32);
  if (v17)
  {
    dispatch_source_cancel(v17);
    uint64_t v15 = *(void *)(v9 + 32);
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v18 = *(id *)(v15 + 8);
  uint64_t v19 = [v18 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v24 != v21) {
          objc_enumerationMutation(v18);
        }
        objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * i), "invalidate", (void)v23);
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v20);
  }

  [*(id *)(*(void *)(v9 + 32) + 8) removeAllObjects];
  return [*(id *)(v9 + 32) _invalidated];
}

- (BOOL)activateDirectAndReturnError:(id *)a3
{
  int v54 = -1;
  int v55 = -1;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 != -1)
    {
LABEL_3:
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUTCPServer activateDirectAndReturnError:]", 0x1Eu, (uint64_t)"Activate\n", v5, v6, v7, v8, v45);
      goto LABEL_5;
    }
    if (_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
    {
      ucat = self->_ucat;
      goto LABEL_3;
    }
  }
LABEL_5:
  int sa_family = self->_interfaceAddress.sa.sa_family;
  if (sa_family == 30)
  {
    p_sin6_addr = &self->_interfaceAddress.v6.sin6_addr;
    __uint32_t sin6_scope_id = self->_interfaceAddress.v6.sin6_scope_id;
    uint64_t v13 = &v54;
LABEL_9:
    uint64_t v14 = ServerSocketOpenEx2(sa_family, 1, 6, (long long *)p_sin6_addr, sin6_scope_id, self->_tcpListenPort, (unsigned int *)&self->_tcpListeningPort, -1, 0, v13);
    if (v14)
    {
      NSErrorWithOSStatusF(v14, (uint64_t)"Open server socket failed (%##a)", v15, v16, v17, v18, v19, v20, (uint64_t)&self->_interfaceAddress);
      v35 = LABEL_57:;
      goto LABEL_33;
    }
    goto LABEL_12;
  }
  if (sa_family == 2)
  {
    __uint32_t sin6_scope_id = 0;
    p_sin6_addr = (in6_addr *)&self->_interfaceAddress.v6.sin6_flowinfo;
    uint64_t v13 = &v55;
    goto LABEL_9;
  }
  uint64_t v21 = ServerSocketPairOpen(1, 6, self->_tcpListenPort, &self->_tcpListeningPort, -1, &v55, &v54);
  if (v21)
  {
    v44 = "Open server sockets failed";
    goto LABEL_56;
  }
LABEL_12:
  int v24 = v55;
  if ((v55 & 0x80000000) == 0)
  {
    if (self->_flags) {
      SocketSetP2P(v55, 1);
    }
    long long v25 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14478], v24, 0, (dispatch_queue_t)self->_dispatchQueue);
    if (!v25)
    {
      v44 = "Create V4 dispatch source failed";
LABEL_54:
      uint64_t v21 = 4294960596;
LABEL_56:
      NSErrorWithOSStatusF(v21, (uint64_t)v44, v22, v23, v17, v18, v19, v20, v45);
      goto LABEL_57;
    }
    listenerSourceV4 = self->_listenerSourceV4;
    self->_listenerSourceV4 = v25;
    uint64_t v27 = v25;

    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __44__CUTCPServer_activateDirectAndReturnError___block_invoke;
    handler[3] = &unk_1E55BF088;
    handler[4] = self;
    int v53 = v24;
    dispatch_source_set_event_handler(v27, handler);
    v50[0] = MEMORY[0x1E4F143A8];
    v50[1] = 3221225472;
    v50[2] = __44__CUTCPServer_activateDirectAndReturnError___block_invoke_2;
    v50[3] = &unk_1E55BF088;
    int v51 = v24;
    v50[4] = self;
    dispatch_source_set_cancel_handler(v27, v50);
    dispatch_activate(v27);
    int v55 = -1;
  }
  int v28 = v54;
  if (v54 < 0) {
    goto LABEL_22;
  }
  if (self->_flags) {
    SocketSetP2P(v54, 1);
  }
  uint64_t v29 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14478], v28, 0, (dispatch_queue_t)self->_dispatchQueue);
  if (!v29)
  {
    v44 = "Create V6 dispatch source failed";
    goto LABEL_54;
  }
  listenerSourceV6 = self->_listenerSourceV6;
  self->_listenerSourceV6 = v29;
  v31 = v29;

  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __44__CUTCPServer_activateDirectAndReturnError___block_invoke_3;
  v48[3] = &unk_1E55BF088;
  v48[4] = self;
  int v49 = v28;
  dispatch_source_set_event_handler(v31, v48);
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __44__CUTCPServer_activateDirectAndReturnError___block_invoke_4;
  v46[3] = &unk_1E55BF088;
  int v47 = v28;
  v46[4] = self;
  dispatch_source_set_cancel_handler(v31, v46);
  dispatch_activate(v31);
  int v54 = -1;

LABEL_22:
  id v32 = self->_ucat;
  if (v32->var0 <= 30)
  {
    if (v32->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)v32, 0x1Eu)) {
        goto LABEL_26;
      }
      id v32 = self->_ucat;
    }
    LogPrintF((uint64_t)v32, (uint64_t)"-[CUTCPServer activateDirectAndReturnError:]", 0x1Eu, (uint64_t)"Activated on port %d\n", v17, v18, v19, v20, self->_tcpListeningPort);
  }
LABEL_26:
  bonjourAdvertiser = self->_bonjourAdvertiser;
  if (bonjourAdvertiser)
  {
    v34 = [(CUBonjourAdvertiser *)bonjourAdvertiser label];
    if (v34)
    {
    }
    else if (self->_label)
    {
      -[CUBonjourAdvertiser setLabel:](self->_bonjourAdvertiser, "setLabel:");
    }
    [(CUBonjourAdvertiser *)self->_bonjourAdvertiser setPort:self->_tcpListeningPort];
    [(CUBonjourAdvertiser *)self->_bonjourAdvertiser activate];
  }
  v35 = 0;
LABEL_33:
  if ((v55 & 0x80000000) == 0 && close(v55) && *__error()) {
    __error();
  }
  if ((v54 & 0x80000000) == 0 && close(v54) && *__error()) {
    __error();
  }
  if (v35)
  {
    socklen_t v36 = self->_ucat;
    if (v36->var0 > 60) {
      goto LABEL_46;
    }
    if (v36->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)v36, 0x3Cu))
      {
LABEL_46:
        v37 = self->_listenerSourceV4;
        if (v37)
        {
          v38 = v37;
          dispatch_source_cancel(v38);
          v39 = self->_listenerSourceV4;
          self->_listenerSourceV4 = 0;

          v40 = self->_listenerSourceV4;
          if (v40)
          {
            v41 = v40;
            dispatch_source_cancel(v41);
            v42 = self->_listenerSourceV4;
            self->_listenerSourceV4 = 0;
          }
        }
        if (a3) {
          *a3 = v35;
        }
        goto LABEL_51;
      }
      socklen_t v36 = self->_ucat;
    }
    LogPrintF((uint64_t)v36, (uint64_t)"-[CUTCPServer activateDirectAndReturnError:]", 0x3Cu, (uint64_t)"### Activate failed: %{error}\n", v17, v18, v19, v20, (uint64_t)v35);
    goto LABEL_46;
  }
LABEL_51:

  return v35 == 0;
}

uint64_t __44__CUTCPServer_activateDirectAndReturnError___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleConnectionAccept:*(unsigned int *)(a1 + 40)];
}

uint64_t __44__CUTCPServer_activateDirectAndReturnError___block_invoke_2(uint64_t a1)
{
  close(*(_DWORD *)(a1 + 40));
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 24);
  *(void *)(v2 + 24) = 0;

  uint64_t v4 = *(void **)(a1 + 32);
  return [v4 _invalidated];
}

uint64_t __44__CUTCPServer_activateDirectAndReturnError___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleConnectionAccept:*(unsigned int *)(a1 + 40)];
}

uint64_t __44__CUTCPServer_activateDirectAndReturnError___block_invoke_4(uint64_t a1)
{
  close(*(_DWORD *)(a1 + 40));
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 32);
  *(void *)(v2 + 32) = 0;

  uint64_t v4 = *(void **)(a1 + 32);
  return [v4 _invalidated];
}

- (void)activateWithCompletion:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38__CUTCPServer_activateWithCompletion___block_invoke;
  v7[3] = &unk_1E55BF148;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __38__CUTCPServer_activateWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v5 = 0;
  [v2 activateDirectAndReturnError:&v5];
  id v3 = v5;
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4) {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
  }
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
  id v5 = a3;
  p_ucat = (uint64_t *)&self->_ucat;
  uint64_t v7 = qword_1E91CD9A8;
  id v14 = v5;
  [v14 UTF8String];
  LogCategoryReplaceF(p_ucat, (uint64_t)"%s-%s", v8, v9, v10, v11, v12, v13, v7);
}

- (id)detailedDescription
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  CFMutableStringRef v29 = 0;
  NSAppendPrintF(&v29, (uint64_t)"%@\n", v2, v3, v4, v5, v6, v7, (uint64_t)self);
  uint64_t v9 = v29;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v10 = self->_connections;
  uint64_t v11 = [(NSMutableSet *)v10 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v11)
  {
    uint64_t v18 = v11;
    uint64_t v19 = *(void *)v26;
    do
    {
      uint64_t v20 = 0;
      uint64_t v21 = v9;
      do
      {
        if (*(void *)v26 != v19) {
          objc_enumerationMutation(v10);
        }
        uint64_t v23 = *(void *)(*((void *)&v25 + 1) + 8 * v20);
        CFMutableStringRef v24 = v21;
        NSAppendPrintF(&v24, (uint64_t)"    %@\n", v12, v13, v14, v15, v16, v17, v23);
        uint64_t v9 = v24;

        ++v20;
        uint64_t v21 = v9;
      }
      while (v18 != v20);
      uint64_t v18 = [(NSMutableSet *)v10 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v18);
  }

  return v9;
}

- (id)description
{
  CFMutableStringRef v22 = 0;
  uint64_t tcpListeningPort = self->_tcpListeningPort;
  [(NSMutableSet *)self->_connections count];
  NSAppendPrintF(&v22, (uint64_t)"CUTCPServer port %d, %d connection(s)", v4, v5, v6, v7, v8, v9, tcpListeningPort);
  uint64_t v10 = v22;
  uint64_t v17 = v10;
  uint64_t flags = self->_flags;
  if (flags)
  {
    CFMutableStringRef v21 = v10;
    NSAppendPrintF(&v21, (uint64_t)", Flags 0x%X", v11, v12, v13, v14, v15, v16, flags);
    uint64_t v19 = v21;

    uint64_t v17 = v19;
  }
  return v17;
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
  v4.super_class = (Class)CUTCPServer;
  [(CUTCPServer *)&v4 dealloc];
}

- (CUTCPServer)init
{
  v5.receiver = self;
  v5.super_class = (Class)CUTCPServer;
  uint64_t v2 = [(CUTCPServer *)&v5 init];
  if (v2)
  {
    if (CUMainQueue_sOnce != -1) {
      dispatch_once(&CUMainQueue_sOnce, &__block_literal_global_18);
    }
    objc_storeStrong((id *)&v2->_dispatchQueue, (id)CUMainQueue_sQueue);
    v2->_ucat = (LogCategory *)&gLogCategory_CUTCPServer;
    uint64_t v3 = v2;
  }

  return v2;
}

@end
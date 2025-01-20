@interface CUMessageSessionXPCConnection
- (void)connectionInvalidated;
- (void)remoteRegisterRequestID:(id)a3 options:(id)a4;
- (void)remoteSendRequestID:(id)a3 options:(id)a4 request:(id)a5 responseHandler:(id)a6;
@end

@implementation CUMessageSessionXPCConnection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcCnx, 0);
  objc_storeStrong((id *)&self->_server, 0);
  objc_storeStrong((id *)&self->_registeredRequestIDs, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

- (void)remoteSendRequestID:(id)a3 options:(id)a4 request:(id)a5 responseHandler:(id)a6
{
  id v22 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_invalidated)
  {
    if (gLogCategory_CUMessageSession <= 60
      && (gLogCategory_CUMessageSession != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUMessageSession, 0x3Cu)))
    {
      [(NSXPCConnection *)self->_xpcCnx processIdentifier];
      LogPrintF((uint64_t)&gLogCategory_CUMessageSession, (uint64_t)"-[CUMessageSessionXPCConnection remoteSendRequestID:options:request:responseHandler:]", 0x3Cu, (uint64_t)"### SendRequestID '%@' from %#{pid} after invalidate\n", v13, v14, v15, v16, (uint64_t)v22);
    }
  }
  else
  {
    sendRequestHandler = (void (**)(id, id, id, id, id))self->_server->_sendRequestHandler;
    if (sendRequestHandler)
    {
      sendRequestHandler[2](sendRequestHandler, v22, v10, v11, v12);
    }
    else if (gLogCategory_CUMessageSession <= 60 {
           && (gLogCategory_CUMessageSession != -1
    }
            || _LogCategory_Initialize((uint64_t)&gLogCategory_CUMessageSession, 0x3Cu)))
    {
      [(NSXPCConnection *)self->_xpcCnx processIdentifier];
      LogPrintF((uint64_t)&gLogCategory_CUMessageSession, (uint64_t)"-[CUMessageSessionXPCConnection remoteSendRequestID:options:request:responseHandler:]", 0x3Cu, (uint64_t)"### SendRequestID '%@' from %#{pid} with no handler\n", v18, v19, v20, v21, (uint64_t)v22);
    }
  }
}

- (void)remoteRegisterRequestID:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_invalidated)
  {
    if (gLogCategory_CUMessageSession <= 60
      && (gLogCategory_CUMessageSession != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUMessageSession, 0x3Cu)))
    {
      [(NSXPCConnection *)self->_xpcCnx processIdentifier];
      LogPrintF((uint64_t)&gLogCategory_CUMessageSession, (uint64_t)"-[CUMessageSessionXPCConnection remoteRegisterRequestID:options:]", 0x3Cu, (uint64_t)"### RegisterRequestID '%@' from %#{pid} after invalidate\n", v8, v9, v10, v11, (uint64_t)v6);
    }
  }
  else if (self->_server->_registerRequestHandler)
  {
    registeredRequestIDs = self->_registeredRequestIDs;
    if (!registeredRequestIDs)
    {
      uint64_t v13 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
      uint64_t v14 = self->_registeredRequestIDs;
      self->_registeredRequestIDs = v13;

      registeredRequestIDs = self->_registeredRequestIDs;
    }
    [(NSMutableSet *)registeredRequestIDs addObject:v6];
    registerRequestHandler = (void (**)(id, id, id, void *))self->_server->_registerRequestHandler;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __65__CUMessageSessionXPCConnection_remoteRegisterRequestID_options___block_invoke;
    v20[3] = &unk_1E55BE378;
    v20[4] = self;
    id v21 = v6;
    registerRequestHandler[2](registerRequestHandler, v21, v7, v20);
  }
  else if (gLogCategory_CUMessageSession <= 60 {
         && (gLogCategory_CUMessageSession != -1
  }
          || _LogCategory_Initialize((uint64_t)&gLogCategory_CUMessageSession, 0x3Cu)))
  {
    [(NSXPCConnection *)self->_xpcCnx processIdentifier];
    LogPrintF((uint64_t)&gLogCategory_CUMessageSession, (uint64_t)"-[CUMessageSessionXPCConnection remoteRegisterRequestID:options:]", 0x3Cu, (uint64_t)"### RegisterRequestID '%@' from %#{pid} with no handler\n", v16, v17, v18, v19, (uint64_t)v6);
  }
}

void __65__CUMessageSessionXPCConnection_remoteRegisterRequestID_options___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 8));
  uint64_t v10 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v10 + 16))
  {
    if (gLogCategory_CUMessageSession <= 60)
    {
      if (gLogCategory_CUMessageSession == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)&gLogCategory_CUMessageSession, 0x3Cu)) {
          goto LABEL_7;
        }
        uint64_t v10 = *(void *)(a1 + 32);
      }
      uint64_t v11 = *(void *)(a1 + 40);
      [*(id *)(v10 + 40) processIdentifier];
      LogPrintF((uint64_t)&gLogCategory_CUMessageSession, (uint64_t)"-[CUMessageSessionXPCConnection remoteRegisterRequestID:options:]_block_invoke", 0x3Cu, (uint64_t)"### RemoteRequestID '%@' to %#{pid} after invalidate\n", v12, v13, v14, v15, v11);
    }
LABEL_7:
    (*((void (**)(id, uint64_t, void, void))v9 + 2))(v9, 4294960573, 0, 0);
    goto LABEL_8;
  }
  uint64_t v16 = *(void **)(v10 + 40);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __65__CUMessageSessionXPCConnection_remoteRegisterRequestID_options___block_invoke_2;
  v20[3] = &unk_1E55BE328;
  id v17 = *(id *)(a1 + 40);
  uint64_t v18 = *(void *)(a1 + 32);
  id v21 = v17;
  uint64_t v22 = v18;
  uint64_t v19 = [v16 remoteObjectProxyWithErrorHandler:v20];
  [v19 remoteRequestID:*(void *)(a1 + 40) options:v7 request:v8 responseHandler:v9];

LABEL_8:
}

uint64_t __65__CUMessageSessionXPCConnection_remoteRegisterRequestID_options___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = a2;
  uint64_t v4 = v3;
  if (gLogCategory_CUMessageSession <= 60)
  {
    uint64_t v11 = v3;
    if (gLogCategory_CUMessageSession != -1
      || (uint64_t v3 = _LogCategory_Initialize((uint64_t)&gLogCategory_CUMessageSession, 0x3Cu), v4 = v11, v3))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      [*(id *)(*(void *)(a1 + 40) + 40) processIdentifier];
      uint64_t v3 = LogPrintF((uint64_t)&gLogCategory_CUMessageSession, (uint64_t)"-[CUMessageSessionXPCConnection remoteRegisterRequestID:options:]_block_invoke_2", 0x3Cu, (uint64_t)"### RemoteRequestID '%@' to %#{pid} failed: %{error}\n", v6, v7, v8, v9, v5);
      uint64_t v4 = v11;
    }
  }
  return MEMORY[0x1F41817F8](v3, v4);
}

- (void)connectionInvalidated
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_CUMessageSession <= 20
    && (gLogCategory_CUMessageSession != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUMessageSession, 0x14u)))
  {
    uint64_t v3 = [(NSXPCConnection *)self->_xpcCnx processIdentifier];
    LogPrintF((uint64_t)&gLogCategory_CUMessageSession, (uint64_t)"-[CUMessageSessionXPCConnection connectionInvalidated]", 0x14u, (uint64_t)"XPC connection invalidated from %#{pid}\n", v4, v5, v6, v7, v3);
  }
  self->_invalidated = 1;
  if (self->_server->_deregisterRequestHandler)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v8 = self->_registeredRequestIDs;
    uint64_t v9 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v14 != v11) {
            objc_enumerationMutation(v8);
          }
          (*((void (**)(void))self->_server->_deregisterRequestHandler + 2))();
        }
        uint64_t v10 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v10);
    }
  }
  [(NSMutableSet *)self->_registeredRequestIDs removeAllObjects];
}

@end
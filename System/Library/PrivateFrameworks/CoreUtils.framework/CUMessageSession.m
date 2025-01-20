@interface CUMessageSession
+ (BOOL)supportsSecureCoding;
- (CUMessageSession)init;
- (CUMessageSession)initWithCoder:(id)a3;
- (CUMessageSession)initWithTemplate:(id)a3;
- (NSString)label;
- (NSXPCListenerEndpoint)listenerEndpoint;
- (OS_dispatch_queue)dispatchQueue;
- (id)activateHandler;
- (id)invalidateHandler;
- (id)invalidationHandler;
- (id)registerRequestHandler;
- (id)sendRequestHandler;
- (void)_cleanup;
- (void)_ensureXPCStarted;
- (void)_interrupted;
- (void)_invalidated;
- (void)_registerRequestID:(id)a3 options:(id)a4 handler:(id)a5;
- (void)_sendRequestID:(id)a3 options:(id)a4 request:(id)a5 responseHandler:(id)a6;
- (void)activate;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)invalidate;
- (void)registerRequestID:(id)a3 options:(id)a4 handler:(id)a5;
- (void)remoteRequestID:(id)a3 options:(id)a4 request:(id)a5 responseHandler:(id)a6;
- (void)sendRequestID:(id)a3 options:(id)a4 request:(id)a5 responseHandler:(id)a6;
- (void)setActivateHandler:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setInvalidateHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setLabel:(id)a3;
- (void)setListenerEndpoint:(id)a3;
- (void)setRegisterRequestHandler:(id)a3;
- (void)setSendRequestHandler:(id)a3;
@end

@implementation CUMessageSession

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_xpcCnx, 0);
  objc_storeStrong((id *)&self->_requestMap, 0);
  objc_storeStrong(&self->_sendRequestHandler, 0);
  objc_storeStrong(&self->_registerRequestHandler, 0);
  objc_storeStrong((id *)&self->_listenerEndpoint, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_invalidateHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong(&self->_activateHandler, 0);
}

- (void)setSendRequestHandler:(id)a3
{
}

- (id)sendRequestHandler
{
  return self->_sendRequestHandler;
}

- (void)setRegisterRequestHandler:(id)a3
{
}

- (id)registerRequestHandler
{
  return self->_registerRequestHandler;
}

- (void)setListenerEndpoint:(id)a3
{
}

- (NSXPCListenerEndpoint)listenerEndpoint
{
  return self->_listenerEndpoint;
}

- (void)setInvalidateHandler:(id)a3
{
}

- (id)invalidateHandler
{
  return self->_invalidateHandler;
}

- (void)setActivateHandler:(id)a3
{
}

- (id)activateHandler
{
  return self->_activateHandler;
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

- (void)remoteRequestID:(id)a3 options:(id)a4 request:(id)a5 responseHandler:(id)a6
{
  id v27 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v13 = [(NSMutableDictionary *)self->_requestMap objectForKeyedSubscript:v27];
  v18 = v13;
  if (!v13)
  {
    ucat = self->_ucat;
    if (ucat->var0 > 60) {
      goto LABEL_14;
    }
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)ucat, 0x3Cu)) {
        goto LABEL_14;
      }
      ucat = self->_ucat;
    }
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUMessageSession remoteRequestID:options:request:responseHandler:]", 0x3Cu, (uint64_t)"### No entry for request ID '%@'\n", v14, v15, v16, v17, (uint64_t)v27);
    goto LABEL_14;
  }
  uint64_t v19 = [v13 handler];
  v24 = (void *)v19;
  if (v19)
  {
    (*(void (**)(uint64_t, id, id, id))(v19 + 16))(v19, v10, v11, v12);
  }
  else
  {
    v26 = self->_ucat;
    if (v26->var0 <= 60)
    {
      if (v26->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)v26, 0x3Cu)) {
          goto LABEL_13;
        }
        v26 = self->_ucat;
      }
      LogPrintF((uint64_t)v26, (uint64_t)"-[CUMessageSession remoteRequestID:options:request:responseHandler:]", 0x3Cu, (uint64_t)"### No handler for request ID '%@'\n", v20, v21, v22, v23, (uint64_t)v27);
    }
  }
LABEL_13:

LABEL_14:
}

- (void)_sendRequestID:(id)a3 options:(id)a4 request:(id)a5 responseHandler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  [(CUMessageSession *)self _ensureXPCStarted];
  xpcCnx = self->_xpcCnx;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __67__CUMessageSession__sendRequestID_options_request_responseHandler___block_invoke;
  v17[3] = &unk_1E55BE680;
  id v18 = v10;
  id v15 = v10;
  uint64_t v16 = [(NSXPCConnection *)xpcCnx remoteObjectProxyWithErrorHandler:v17];
  [v16 remoteSendRequestID:v13 options:v12 request:v11 responseHandler:v15];
}

uint64_t __67__CUMessageSession__sendRequestID_options_request_responseHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (a2) {
    uint64_t v3 = NSErrorToOSStatusEx(a2, 0);
  }
  else {
    uint64_t v3 = 4294960596;
  }
  v4 = *(uint64_t (**)(uint64_t, uint64_t, void, void))(v2 + 16);
  return v4(v2, v3, 0, 0);
}

- (void)sendRequestID:(id)a3 options:(id)a4 request:(id)a5 responseHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__CUMessageSession_sendRequestID_options_request_responseHandler___block_invoke;
  block[3] = &unk_1E55BE350;
  block[4] = self;
  id v20 = v10;
  id v21 = v11;
  id v22 = v12;
  id v23 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  dispatch_async(dispatchQueue, block);
}

uint64_t __66__CUMessageSession_sendRequestID_options_request_responseHandler___block_invoke(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t result = a1[4];
  if (*(unsigned char *)(result + 73))
  {
    uint64_t result = *(void *)(result + 64);
    if (*(int *)result <= 60)
    {
      if (*(_DWORD *)result != -1) {
        return LogPrintF(result, (uint64_t)"-[CUMessageSession sendRequestID:options:request:responseHandler:]_block_invoke", 0x3Cu, (uint64_t)"### SendRequestID '%@' after invalidate\n", a5, a6, a7, a8, a1[5]);
      }
      uint64_t result = _LogCategory_Initialize(result, 0x3Cu);
      if (result)
      {
        uint64_t result = *(void *)(a1[4] + 64);
        return LogPrintF(result, (uint64_t)"-[CUMessageSession sendRequestID:options:request:responseHandler:]_block_invoke", 0x3Cu, (uint64_t)"### SendRequestID '%@' after invalidate\n", a5, a6, a7, a8, a1[5]);
      }
    }
    return result;
  }
  uint64_t v11 = *(void *)(result + 56);
  if (v11)
  {
    (*(void (**)(void, void, void, void, void))(v11 + 16))(*(void *)(result + 56), a1[5], a1[6], a1[7], a1[8]);
    uint64_t result = a1[4];
    if (!*(void *)(result + 40)) {
      return result;
    }
    goto LABEL_9;
  }
  if (*(void *)(result + 40))
  {
LABEL_9:
    uint64_t v12 = a1[5];
    uint64_t v13 = a1[6];
    uint64_t v14 = a1[7];
    uint64_t v15 = a1[8];
    return [(id)result _sendRequestID:v12 options:v13 request:v14 responseHandler:v15];
  }
  uint64_t result = *(void *)(result + 64);
  if (*(int *)result > 60) {
    return result;
  }
  if (*(_DWORD *)result == -1)
  {
    uint64_t result = _LogCategory_Initialize(result, 0x3Cu);
    if (!result) {
      return result;
    }
    uint64_t result = *(void *)(a1[4] + 64);
  }
  return LogPrintF(result, (uint64_t)"-[CUMessageSession sendRequestID:options:request:responseHandler:]_block_invoke", 0x3Cu, (uint64_t)"### No handler or endpoint to send requests\n", a5, a6, a7, a8, a9);
}

- (void)_registerRequestID:(id)a3 options:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = objc_alloc_init(CUMessageRequestEntry);
  [(CUMessageRequestEntry *)v11 setHandler:v10];

  if (v9) {
    [(CUMessageRequestEntry *)v11 setOptions:v9];
  }
  requestMap = self->_requestMap;
  if (!requestMap)
  {
    uint64_t v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v14 = self->_requestMap;
    self->_requestMap = v13;

    requestMap = self->_requestMap;
  }
  [(NSMutableDictionary *)requestMap setObject:v11 forKeyedSubscript:v8];
  [(CUMessageSession *)self _ensureXPCStarted];
  xpcCnx = self->_xpcCnx;
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  id v20 = __55__CUMessageSession__registerRequestID_options_handler___block_invoke;
  id v21 = &unk_1E55BE328;
  id v22 = self;
  id v23 = v8;
  id v16 = v8;
  id v17 = [(NSXPCConnection *)xpcCnx remoteObjectProxyWithErrorHandler:&v18];
  objc_msgSend(v17, "remoteRegisterRequestID:options:", v16, v9, v18, v19, v20, v21, v22);
}

void __55__CUMessageSession__registerRequestID_options_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = *(int **)(v8 + 64);
  id v11 = v3;
  if (*v9 <= 60)
  {
    if (*v9 != -1)
    {
LABEL_3:
      LogPrintF((uint64_t)v9, (uint64_t)"-[CUMessageSession _registerRequestID:options:handler:]_block_invoke", 0x3Cu, (uint64_t)"### RegisterRequestID '%@' failed: %{error}\n", v4, v5, v6, v7, *(void *)(a1 + 40));
      uint64_t v8 = *(void *)(a1 + 32);
      goto LABEL_5;
    }
    BOOL v10 = _LogCategory_Initialize((uint64_t)v9, 0x3Cu);
    uint64_t v8 = *(void *)(a1 + 32);
    if (v10)
    {
      id v9 = *(int **)(v8 + 64);
      goto LABEL_3;
    }
  }
LABEL_5:
  [*(id *)(v8 + 80) setObject:0 forKeyedSubscript:*(void *)(a1 + 40)];
}

- (void)registerRequestID:(id)a3 options:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatchQueue = self->_dispatchQueue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __54__CUMessageSession_registerRequestID_options_handler___block_invoke;
  v15[3] = &unk_1E55BEEF0;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(dispatchQueue, v15);
}

uint64_t __54__CUMessageSession_registerRequestID_options_handler___block_invoke(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t result = a1[4];
  if (*(unsigned char *)(result + 73))
  {
    uint64_t result = *(void *)(result + 64);
    if (*(int *)result <= 60)
    {
      if (*(_DWORD *)result != -1) {
        return LogPrintF(result, (uint64_t)"-[CUMessageSession registerRequestID:options:handler:]_block_invoke", 0x3Cu, (uint64_t)"### RegisterRequestID '%@' after invalidate\n", a5, a6, a7, a8, a1[5]);
      }
      uint64_t result = _LogCategory_Initialize(result, 0x3Cu);
      if (result)
      {
        uint64_t result = *(void *)(a1[4] + 64);
        return LogPrintF(result, (uint64_t)"-[CUMessageSession registerRequestID:options:handler:]_block_invoke", 0x3Cu, (uint64_t)"### RegisterRequestID '%@' after invalidate\n", a5, a6, a7, a8, a1[5]);
      }
    }
  }
  else
  {
    uint64_t v11 = *(void *)(result + 48);
    if (v11)
    {
      (*(void (**)(void, void, void, void))(v11 + 16))(*(void *)(result + 48), a1[5], a1[6], a1[7]);
      uint64_t result = a1[4];
    }
    if (*(void *)(result + 40))
    {
      [(id)result _registerRequestID:a1[5] options:a1[6] handler:a1[7]];
      uint64_t result = a1[4];
    }
    if (!*(void *)(result + 48) && !*(void *)(result + 40))
    {
      uint64_t result = *(void *)(result + 64);
      if (*(int *)result <= 60)
      {
        if (*(_DWORD *)result == -1)
        {
          uint64_t result = _LogCategory_Initialize(result, 0x3Cu);
          if (!result) {
            return result;
          }
          uint64_t result = *(void *)(a1[4] + 64);
        }
        return LogPrintF(result, (uint64_t)"-[CUMessageSession registerRequestID:options:handler:]_block_invoke", 0x3Cu, (uint64_t)"### No handler or endpoint to register requests\n", a5, a6, a7, a8, a9);
      }
    }
  }
  return result;
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
        LogPrintF((uint64_t)ucat, (uint64_t)"-[CUMessageSession _invalidated]", 0x3Cu, (uint64_t)"### Unexpectedly invalidated\n", v3, v4, v5, v6, v14);
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
  invalidationHandler = (void (**)(void))self->_invalidationHandler;
  if (invalidationHandler) {
    invalidationHandler[2]();
  }
  [(CUMessageSession *)self _cleanup];
  self->_invalidateDone = 1;
  id v13 = self->_ucat;
  if (v13->var0 <= 30)
  {
    if (v13->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)v13, 0x1Eu)) {
        return;
      }
      id v13 = self->_ucat;
    }
    LogPrintF((uint64_t)v13, (uint64_t)"-[CUMessageSession _invalidated]", 0x1Eu, (uint64_t)"Invalidated\n", v9, v10, v11, v12, v16);
  }
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __30__CUMessageSession_invalidate__block_invoke;
  block[3] = &unk_1E55BFC18;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __30__CUMessageSession_invalidate__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v8 + 73)) {
    return;
  }
  *(unsigned char *)(v8 + 73) = 1;
  uint64_t v10 = *(void *)(a1 + 32);
  uint64_t v11 = *(int **)(v10 + 64);
  if (*v11 <= 30)
  {
    if (*v11 == -1)
    {
      BOOL v12 = _LogCategory_Initialize((uint64_t)v11, 0x1Eu);
      uint64_t v10 = *(void *)(a1 + 32);
      if (!v12) {
        goto LABEL_6;
      }
      uint64_t v11 = *(int **)(v10 + 64);
    }
    LogPrintF((uint64_t)v11, (uint64_t)"-[CUMessageSession invalidate]_block_invoke", 0x1Eu, (uint64_t)"Invalidating\n", a5, a6, a7, a8, v20);
    uint64_t v10 = *(void *)(a1 + 32);
  }
LABEL_6:
  uint64_t v13 = *(void *)(v10 + 24);
  if (v13)
  {
    (*(void (**)(void))(v13 + 16))();
    uint64_t v10 = *(void *)(a1 + 32);
  }
  [*(id *)(v10 + 80) removeAllObjects];
  uint64_t v14 = *(void *)(a1 + 32);
  uint64_t v15 = *(void **)(v14 + 80);
  *(void *)(v14 + 80) = 0;

  uint64_t v16 = *(void **)(*(void *)(a1 + 32) + 88);
  if (v16)
  {
    [v16 invalidate];
    uint64_t v17 = *(void *)(a1 + 32);
    id v18 = *(void **)(v17 + 88);
    *(void *)(v17 + 88) = 0;
  }
  else
  {
    uint64_t v19 = *(void **)(a1 + 32);
    [v19 _invalidated];
  }
}

- (void)_interrupted
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  ucat = self->_ucat;
  if (ucat->var0 <= 60)
  {
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)ucat, 0x3Cu)) {
        return;
      }
      ucat = self->_ucat;
    }
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUMessageSession _interrupted]", 0x3Cu, (uint64_t)"### Interrupted\n", v3, v4, v5, v6, v9);
  }
}

- (void)_ensureXPCStarted
{
  if (!self->_xpcCnx)
  {
    uint64_t v7 = self->_listenerEndpoint;
    if (v7)
    {
      uint64_t v8 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithListenerEndpoint:v7];
      xpcCnx = self->_xpcCnx;
      self->_xpcCnx = v8;

      [(NSXPCConnection *)self->_xpcCnx _setQueue:self->_dispatchQueue];
      uint64_t v10 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EDD4D618];
      [(NSXPCConnection *)self->_xpcCnx setExportedInterface:v10];

      [(NSXPCConnection *)self->_xpcCnx setExportedObject:self];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __37__CUMessageSession__ensureXPCStarted__block_invoke;
      v14[3] = &unk_1E55BFC18;
      v14[4] = self;
      [(NSXPCConnection *)self->_xpcCnx setInterruptionHandler:v14];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = (uint64_t)__37__CUMessageSession__ensureXPCStarted__block_invoke_2;
      v13[3] = (uint64_t)&unk_1E55BFC18;
      v13[4] = (uint64_t)self;
      [(NSXPCConnection *)self->_xpcCnx setInvalidationHandler:v13];
      uint64_t v11 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EDD4DC80];
      [(NSXPCConnection *)self->_xpcCnx setRemoteObjectInterface:v11];

      [(NSXPCConnection *)self->_xpcCnx resume];
    }
    else
    {
      ucat = self->_ucat;
      if (ucat->var0 <= 60)
      {
        if (ucat->var0 == -1)
        {
          if (!_LogCategory_Initialize((uint64_t)ucat, 0x3Cu)) {
            goto LABEL_8;
          }
          ucat = self->_ucat;
        }
        LogPrintF((uint64_t)ucat, (uint64_t)"-[CUMessageSession _ensureXPCStarted]", 0x3Cu, (uint64_t)"### No XPC listener endpoint\n", v3, v4, v5, v6, v13[0]);
      }
    }
LABEL_8:
  }
}

uint64_t __37__CUMessageSession__ensureXPCStarted__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _interrupted];
}

uint64_t __37__CUMessageSession__ensureXPCStarted__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidated];
}

- (void)activate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __28__CUMessageSession_activate__block_invoke;
  block[3] = &unk_1E55BFC18;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void *__28__CUMessageSession_activate__block_invoke(uint64_t a1)
{
  uint64_t result = *(void **)(a1 + 32);
  uint64_t v3 = result[1];
  if (v3)
  {
    (*(void (**)(void))(v3 + 16))(result[1]);
    uint64_t result = *(void **)(a1 + 32);
  }
  if (result[5])
  {
    return (void *)[result _ensureXPCStarted];
  }
  return result;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
  id v5 = a3;
  p_ucat = (uint64_t *)&self->_ucat;
  uint64_t v7 = qword_1E91CBD78;
  id v14 = v5;
  [v14 UTF8String];
  LogCategoryReplaceF(p_ucat, (uint64_t)"%s-%s", v8, v9, v10, v11, v12, v13, v7);
}

- (void)_cleanup
{
  id activateHandler = self->_activateHandler;
  self->_id activateHandler = 0;

  id invalidateHandler = self->_invalidateHandler;
  self->_id invalidateHandler = 0;

  id invalidationHandler = self->_invalidationHandler;
  self->_id invalidationHandler = 0;

  id registerRequestHandler = self->_registerRequestHandler;
  self->_id registerRequestHandler = 0;

  id sendRequestHandler = self->_sendRequestHandler;
  self->_id sendRequestHandler = 0;
}

- (void)encodeWithCoder:(id)a3
{
  listenerEndpoint = self->_listenerEndpoint;
  if (listenerEndpoint) {
    [a3 encodeObject:listenerEndpoint forKey:@"lep"];
  }
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
  v4.super_class = (Class)CUMessageSession;
  [(CUMessageSession *)&v4 dealloc];
}

- (CUMessageSession)initWithTemplate:(id)a3
{
  id v4 = a3;
  id v5 = [(CUMessageSession *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 listenerEndpoint];
    listenerEndpoint = v5->_listenerEndpoint;
    v5->_listenerEndpoint = (NSXPCListenerEndpoint *)v6;
  }
  return v5;
}

- (CUMessageSession)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(CUMessageSession *)self init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    NSDecodeObjectIfPresent(v4, @"lep", v6, (void **)&v5->_listenerEndpoint);
  }

  return v5;
}

- (CUMessageSession)init
{
  v4.receiver = self;
  v4.super_class = (Class)CUMessageSession;
  uint64_t v2 = [(CUMessageSession *)&v4 init];
  if (v2)
  {
    if (CUMainQueue_sOnce != -1) {
      dispatch_once(&CUMainQueue_sOnce, &__block_literal_global_18);
    }
    objc_storeStrong((id *)&v2->_dispatchQueue, (id)CUMainQueue_sQueue);
    v2->_ucat = (LogCategory *)&gLogCategory_CUMessageSession;
  }
  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
@interface CUFileClient
- (CUFileClient)init;
- (NSString)destinationID;
- (NSString)label;
- (NSString)serviceType;
- (OS_dispatch_queue)dispatchQueue;
- (id)invalidationHandler;
- (void)_activateWithCompletion:(id)a3;
- (void)_completeQuery:(id)a3 response:(id)a4 error:(id)a5;
- (void)_invalidate;
- (void)_invalidated;
- (void)_reportError:(id)a3 where:(const char *)a4;
- (void)_run;
- (void)_runCLinkActivate;
- (void)_runPrepare;
- (void)_runQueries;
- (void)_runQueryResponse:(id)a3 query:(id)a4 error:(id)a5;
- (void)_runSendQuery:(id)a3;
- (void)_runSessionStartRequest;
- (void)_runSessionStartResponse:(id)a3 error:(id)a4;
- (void)_sendKeepAlive:(double)a3;
- (void)_sendSessionStop;
- (void)_sessionTimerFired;
- (void)activateWithCompletion:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)performQuery:(id)a3;
- (void)setDestinationID:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setLabel:(id)a3;
- (void)setServiceType:(id)a3;
@end

@implementation CUFileClient

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceType, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_destinationID, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_sessionTimer, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_currentQuery, 0);
  objc_storeStrong((id *)&self->_queryArray, 0);
  objc_storeStrong((id *)&self->_clinkClient, 0);
  objc_storeStrong(&self->_activateCompletion, 0);
}

- (void)setServiceType:(id)a3
{
}

- (NSString)serviceType
{
  return self->_serviceType;
}

- (NSString)label
{
  return self->_label;
}

- (void)setDestinationID:(id)a3
{
}

- (NSString)destinationID
{
  return self->_destinationID;
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

- (void)_runQueryResponse:(id)a3 query:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v16 = v8;
  if (!v16 || v10)
  {
    if (v10)
    {
      [(CUFileClient *)self _completeQuery:v9 response:0 error:v10];
    }
    else
    {
      v19 = NSErrorF_safe((void *)*MEMORY[0x1E4F28760], 4294960596, (uint64_t)"No response, no error", v11, v12, v13, v14, v15, v20);
      [(CUFileClient *)self _completeQuery:v9 response:0 error:v19];
    }
  }
  else
  {
    id v21 = 0;
    v17 = [[CUFileResponse alloc] initWithDictionary:v16 error:&v21];
    id v18 = v21;
    [(CUFileClient *)self _completeQuery:v9 response:v17 error:v18];
  }
}

- (void)_runSendQuery:(id)a3
{
  v26[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu)) {
        goto LABEL_5;
      }
      ucat = self->_ucat;
    }
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUFileClient _runSendQuery:]", 0x1Eu, (uint64_t)"Query start: %@", v4, v5, v6, v7, (uint64_t)v8);
  }
LABEL_5:
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v8 encodeWithDictionary:v10];
  id v18 = NSPrintF((uint64_t)"FSQy:%@", v11, v12, v13, v14, v15, v16, v17, (uint64_t)self->_serviceType);
  v25[0] = @"fQry";
  v25[1] = @"sid";
  sessionID = self->_sessionID;
  v26[0] = v10;
  v26[1] = sessionID;
  uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:2];
  clinkClient = self->_clinkClient;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __30__CUFileClient__runSendQuery___block_invoke;
  v23[3] = &unk_1E55BDF38;
  v23[4] = self;
  id v24 = v8;
  id v22 = v8;
  [(RPCompanionLinkClient *)clinkClient sendRequestID:v18 request:v20 options:0 responseHandler:v23];
  self->_lastRequestTicks = mach_absolute_time();
}

uint64_t __30__CUFileClient__runSendQuery___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(a1 + 32) _runQueryResponse:a2 query:*(void *)(a1 + 40) error:a4];
}

- (void)_runQueries
{
  p_currentQuery = &self->_currentQuery;
  if (!self->_currentQuery)
  {
    uint64_t v4 = [(NSMutableArray *)self->_queryArray popFirstObject];
    if (v4)
    {
      uint64_t v5 = v4;
      objc_storeStrong((id *)p_currentQuery, v4);
      [(CUFileClient *)self _runSendQuery:v5];
    }
    MEMORY[0x1F41817F8]();
  }
}

- (void)_runPrepare
{
  p_sessionTimer = (id *)&self->_sessionTimer;
  sessionTimer = self->_sessionTimer;
  if (sessionTimer)
  {
    uint64_t v5 = sessionTimer;
    dispatch_source_cancel(v5);
    id v6 = *p_sessionTimer;
    id *p_sessionTimer = 0;
  }
  dispatch_source_t v7 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_dispatchQueue);
  objc_storeStrong(p_sessionTimer, v7);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __27__CUFileClient__runPrepare__block_invoke;
  v11[3] = &unk_1E55BF170;
  v11[4] = v7;
  v11[5] = self;
  dispatch_source_set_event_handler(v7, v11);
  dispatch_time_t v8 = dispatch_time(0, 15000000000);
  dispatch_source_set_timer(v7, v8, 0xFFFFFFFFFFFFFFFFLL, 0x37E11D600uLL);
  dispatch_activate(v7);
  id v9 = (void (**)(void *, void))_Block_copy(self->_activateCompletion);
  id activateCompletion = self->_activateCompletion;
  self->_id activateCompletion = 0;

  if (v9) {
    v9[2](v9, 0);
  }
}

void *__27__CUFileClient__runPrepare__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  result = *(void **)(a1 + 40);
  if (v2 == result[10]) {
    return (void *)[result _sessionTimerFired];
  }
  return result;
}

- (void)_runSessionStartResponse:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v29 = 0;
  v30 = (id *)&v29;
  uint64_t v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__3068;
  v33 = __Block_byref_object_dispose__3069;
  id v34 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __47__CUFileClient__runSessionStartResponse_error___block_invoke;
  aBlock[3] = &unk_1E55BE000;
  aBlock[4] = self;
  aBlock[5] = &v29;
  uint64_t v13 = (void (**)(void))_Block_copy(aBlock);
  if (v6 && !v7)
  {
    v19 = NSDictionaryGetNSNumber(v6, @"sid", 0);
    if (!v19)
    {
      uint64_t v25 = NSErrorF_safe((void *)*MEMORY[0x1E4F28760], 4294960591, (uint64_t)"No session ID", v14, v15, v16, v17, v18, v27);
      id v26 = v30[5];
      v30[5] = (id)v25;

      v19 = 0;
      goto LABEL_9;
    }
    objc_storeStrong((id *)&self->_sessionID, v19);
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
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUFileClient _runSessionStartResponse:error:]", 0x1Eu, (uint64_t)"Session started: ID %@", v20, v21, v22, v23, (uint64_t)v19);
    }
LABEL_8:
    [(CUFileClient *)self _run];
LABEL_9:

    goto LABEL_10;
  }
  v19 = v7;
  if (!v7)
  {
    v19 = NSErrorF_safe((void *)*MEMORY[0x1E4F28760], 4294960596, (uint64_t)"No response, no error", v8, v9, v10, v11, v12, v27);
  }
  objc_storeStrong(v30 + 5, v19);
  if (!v7) {
    goto LABEL_9;
  }
LABEL_10:
  v13[2](v13);

  _Block_object_dispose(&v29, 8);
}

uint64_t __47__CUFileClient__runSessionStartResponse_error___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = *(void *)(result + 40);
  uint64_t v9 = *(void *)(*(void *)(v8 + 8) + 40);
  if (!v9) {
    return result;
  }
  uint64_t v10 = result;
  uint64_t v11 = *(uint64_t **)(result + 32);
  uint64_t v12 = (int *)v11[12];
  if (*v12 <= 90)
  {
    if (*v12 == -1)
    {
      BOOL v13 = _LogCategory_Initialize(v11[12], 0x5Au);
      uint64_t v11 = *(uint64_t **)(v10 + 32);
      uint64_t v8 = *(void *)(v10 + 40);
      if (!v13) {
        goto LABEL_7;
      }
      uint64_t v12 = (int *)v11[12];
      uint64_t v9 = *(void *)(*(void *)(v8 + 8) + 40);
    }
    LogPrintF((uint64_t)v12, (uint64_t)"-[CUFileClient _runSessionStartResponse:error:]_block_invoke", 0x5Au, (uint64_t)"### Session start failed: %{error}", a5, a6, a7, a8, v9);
    uint64_t v11 = *(uint64_t **)(v10 + 32);
    uint64_t v8 = *(void *)(v10 + 40);
  }
LABEL_7:
  uint64_t v14 = *(void *)(*(void *)(v8 + 8) + 40);
  return [v11 _reportError:v14 where:"Session start"];
}

- (void)_runSessionStartRequest
{
  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu)) {
        goto LABEL_5;
      }
      ucat = self->_ucat;
    }
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUFileClient _runSessionStartRequest]", 0x1Eu, (uint64_t)"Session start request", v2, v3, v4, v5, v18);
  }
LABEL_5:
  sessionID = self->_sessionID;
  self->_sessionID = 0;

  uint64_t v16 = NSPrintF((uint64_t)"FSSr:%@", v9, v10, v11, v12, v13, v14, v15, (uint64_t)self->_serviceType);
  clinkClient = self->_clinkClient;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __39__CUFileClient__runSessionStartRequest__block_invoke;
  v19[3] = &unk_1E55BDF10;
  v19[4] = self;
  [(RPCompanionLinkClient *)clinkClient sendRequestID:v16 request:MEMORY[0x1E4F1CC08] options:0 responseHandler:v19];
  self->_lastRequestTicks = mach_absolute_time();
}

uint64_t __39__CUFileClient__runSessionStartRequest__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_runSessionStartResponse:error:", a2);
}

- (void)_runCLinkActivate
{
  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu)) {
        goto LABEL_5;
      }
      ucat = self->_ucat;
    }
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUFileClient _runCLinkActivate]", 0x1Eu, (uint64_t)"CLink activate start", v2, v3, v4, v5, v12[0]);
  }
LABEL_5:
  self->_clinkActivated = 0;
  [(RPCompanionLinkClient *)self->_clinkClient invalidate];
  uint64_t v8 = (RPCompanionLinkClient *)objc_alloc_init((Class)getRPCompanionLinkClientClass[0]());
  clinkClient = self->_clinkClient;
  self->_clinkClient = v8;
  uint64_t v10 = v8;

  [(RPCompanionLinkClient *)v10 setDispatchQueue:self->_dispatchQueue];
  id v11 = objc_alloc_init((Class)getRPCompanionLinkDeviceClass[0]());
  [v11 setIdentifier:self->_destinationID];
  [(RPCompanionLinkClient *)v10 setDestinationDevice:v11];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __33__CUFileClient__runCLinkActivate__block_invoke;
  v13[3] = &unk_1E55BF170;
  v13[4] = v10;
  v13[5] = self;
  [(RPCompanionLinkClient *)v10 setInvalidationHandler:v13];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = (uint64_t)__33__CUFileClient__runCLinkActivate__block_invoke_2;
  v12[3] = (uint64_t)&unk_1E55BE328;
  v12[4] = (uint64_t)v10;
  v12[5] = (uint64_t)self;
  [(RPCompanionLinkClient *)v10 activateWithCompletion:v12];
}

uint64_t __33__CUFileClient__runCLinkActivate__block_invoke(uint64_t result)
{
  v1 = *(void **)(result + 32);
  uint64_t v2 = *(void *)(result + 40);
  if (v1 == *(void **)(v2 + 32))
  {
    uint64_t v3 = result;
    *(void *)(v2 + 32) = 0;

    uint64_t v4 = *(void **)(v3 + 40);
    return [v4 _invalidated];
  }
  return result;
}

void __33__CUFileClient__runCLinkActivate__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(void *)(a1 + 32) == *(void *)(*(void *)(a1 + 40) + 32))
  {
    id v16 = v3;
    id v8 = v3;
    uint64_t v9 = *(void *)(a1 + 40);
    if (v8)
    {
      uint64_t v10 = *(int **)(v9 + 96);
      if (*v10 <= 90)
      {
        if (*v10 == -1)
        {
          BOOL v13 = _LogCategory_Initialize((uint64_t)v10, 0x5Au);
          uint64_t v9 = *(void *)(a1 + 40);
          if (!v13) {
            goto LABEL_10;
          }
          uint64_t v10 = *(int **)(v9 + 96);
        }
        LogPrintF((uint64_t)v10, (uint64_t)"-[CUFileClient _runCLinkActivate]_block_invoke_2", 0x5Au, (uint64_t)"### CLink activate failed: %{error}", v4, v5, v6, v7, (uint64_t)v8);
        uint64_t v9 = *(void *)(a1 + 40);
      }
LABEL_10:
      [(id)v9 _reportError:v8 where:"CLink activate"];
LABEL_13:

      id v3 = v16;
      goto LABEL_14;
    }
    *(unsigned char *)(v9 + 24) = 1;
    id v11 = *(void **)(a1 + 40);
    uint64_t v12 = (int *)v11[12];
    if (*v12 <= 30)
    {
      if (*v12 == -1)
      {
        BOOL v14 = _LogCategory_Initialize((uint64_t)v12, 0x1Eu);
        id v11 = *(void **)(a1 + 40);
        if (!v14) {
          goto LABEL_12;
        }
        uint64_t v12 = (int *)v11[12];
      }
      LogPrintF((uint64_t)v12, (uint64_t)"-[CUFileClient _runCLinkActivate]_block_invoke_2", 0x1Eu, (uint64_t)"CLink activated", v4, v5, v6, v7, v15);
      id v11 = *(void **)(a1 + 40);
    }
LABEL_12:
    [v11 _run];
    goto LABEL_13;
  }
LABEL_14:
}

- (void)_run
{
  if (self->_activateCalled && !self->_invalidateCalled)
  {
    while (1)
    {
      while (1)
      {
        do
        {
          unint64_t state = self->_state;
          switch((int)state)
          {
            case 0:
              self->_unint64_t state = 10;
              break;
            case 10:
              self->_unint64_t state = 11;
              [(CUFileClient *)self _runCLinkActivate];
              break;
            case 11:
              if (self->_clinkActivated)
              {
                int v8 = 12;
                goto LABEL_12;
              }
              break;
            case 12:
              self->_unint64_t state = 13;
              [(CUFileClient *)self _runSessionStartRequest];
              break;
            case 13:
              if (self->_sessionID)
              {
                int v8 = 14;
LABEL_12:
                self->_unint64_t state = v8;
              }
              break;
            case 14:
              self->_unint64_t state = 15;
              [(CUFileClient *)self _runPrepare];
              break;
            case 15:
              [(CUFileClient *)self _runQueries];
              break;
            default:
              break;
          }
          if (self->_state == state) {
            return;
          }
          ucat = self->_ucat;
        }
        while (ucat->var0 > 30);
        if (ucat->var0 == -1) {
          break;
        }
LABEL_18:
        uint64_t v10 = "?";
        if (state <= 0xF) {
          uint64_t v10 = off_1E55BE048[state];
        }
        LogPrintF((uint64_t)ucat, (uint64_t)"-[CUFileClient _run]", 0x1Eu, (uint64_t)"State: %s -> %s", v2, v3, v4, v5, (uint64_t)v10);
      }
      if (_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
      {
        ucat = self->_ucat;
        goto LABEL_18;
      }
    }
  }
}

- (void)_sessionTimerFired
{
  uint64_t v7 = mach_absolute_time() - self->_lastRequestTicks;
  if (sUpTicksToSecondsOnce != -1) {
    dispatch_once_f(&sUpTicksToSecondsOnce, &sUpTicksToSecondsMultiplier, (dispatch_function_t)_UpTicksToSecondsInit);
  }
  double v8 = 15.0 - *(double *)&sUpTicksToSecondsMultiplier * (double)v7;
  if (v8 <= 45.0)
  {
    -[CUFileClient _sendKeepAlive:](self, "_sendKeepAlive:");
    double v8 = 15.0;
  }
  else
  {
    ucat = self->_ucat;
    if (ucat->var0 > 20) {
      goto LABEL_8;
    }
    if (ucat->var0 != -1) {
      goto LABEL_6;
    }
    if (_LogCategory_Initialize((uint64_t)ucat, 0x14u))
    {
      ucat = self->_ucat;
LABEL_6:
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUFileClient _sessionTimerFired]", 0x14u, (uint64_t)"Keep alive deferred: %.3f seconds", v3, v4, v5, v6, *(uint64_t *)&v8);
    }
  }
LABEL_8:
  sessionTimer = self->_sessionTimer;
  dispatch_time_t v11 = dispatch_time(0, (unint64_t)(v8 * 1000000000.0));
  dispatch_source_set_timer(sessionTimer, v11, 0xFFFFFFFFFFFFFFFFLL, 0x37E11D600uLL);
}

- (void)_sendSessionStop
{
  v20[1] = *MEMORY[0x1E4F143B8];
  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu)) {
        goto LABEL_5;
      }
      ucat = self->_ucat;
    }
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUFileClient _sendSessionStop]", 0x1Eu, (uint64_t)"Session stop", v4, v5, v6, v7, v15);
  }
LABEL_5:
  uint64_t v10 = NSPrintF((uint64_t)"FSSp:%@", (uint64_t)a2, v2, v3, v4, v5, v6, v7, (uint64_t)self->_serviceType);
  v19 = @"sid";
  v20[0] = self->_sessionID;
  dispatch_time_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
  uint64_t v12 = getRPOptionTimeoutSeconds[0]();
  uint64_t v17 = v12;
  uint64_t v18 = &unk_1EDD44080;
  BOOL v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v18 forKeys:&v17 count:1];

  clinkClient = self->_clinkClient;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __32__CUFileClient__sendSessionStop__block_invoke;
  v16[3] = &unk_1E55BDF10;
  v16[4] = self;
  [(RPCompanionLinkClient *)clinkClient sendRequestID:v10 request:v11 options:v13 responseHandler:v16];
  self->_lastRequestTicks = mach_absolute_time();
}

void __32__CUFileClient__sendSessionStop__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v17 = a2;
  id v7 = a3;
  id v12 = a4;
  uint64_t v13 = *(void *)(a1 + 32);
  BOOL v14 = *(int **)(v13 + 96);
  if (*v14 <= 30)
  {
    if (*v14 != -1)
    {
LABEL_3:
      LogPrintF((uint64_t)v14, (uint64_t)"-[CUFileClient _sendSessionStop]_block_invoke", 0x1Eu, (uint64_t)"Session stop response: %{error}", v8, v9, v10, v11, (uint64_t)v12);
      uint64_t v13 = *(void *)(a1 + 32);
      goto LABEL_5;
    }
    BOOL v15 = _LogCategory_Initialize((uint64_t)v14, 0x1Eu);
    uint64_t v13 = *(void *)(a1 + 32);
    if (v15)
    {
      BOOL v14 = *(int **)(v13 + 96);
      goto LABEL_3;
    }
  }
LABEL_5:
  id v16 = *(void **)(v13 + 72);
  *(void *)(v13 + 72) = 0;

  [*(id *)(*(void *)(a1 + 32) + 32) invalidate];
  [*(id *)(a1 + 32) _invalidated];
}

- (void)_sendKeepAlive:(double)a3
{
  v18[1] = *MEMORY[0x1E4F143B8];
  ucat = self->_ucat;
  if (ucat->var0 <= 20)
  {
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)ucat, 0x14u)) {
        goto LABEL_5;
      }
      ucat = self->_ucat;
    }
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUFileClient _sendKeepAlive:]", 0x14u, (uint64_t)"Keep alive request: %.3f delta seconds", v5, v6, v7, v8, *(uint64_t *)&a3);
  }
LABEL_5:
  id v12 = NSPrintF((uint64_t)"FSKA:%@", (uint64_t)a2, v3, v4, v5, v6, v7, v8, (uint64_t)self->_serviceType);
  sessionID = self->_sessionID;
  id v17 = @"sid";
  v18[0] = sessionID;
  BOOL v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
  clinkClient = self->_clinkClient;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __31__CUFileClient__sendKeepAlive___block_invoke;
  v16[3] = &unk_1E55BDF10;
  v16[4] = self;
  [(RPCompanionLinkClient *)clinkClient sendRequestID:v12 request:v14 options:0 responseHandler:v16];
  self->_lastRequestTicks = mach_absolute_time();
}

void __31__CUFileClient__sendKeepAlive___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v14 = a2;
  id v7 = a3;
  id v12 = a4;
  uint64_t v13 = *(int **)(*(void *)(a1 + 32) + 96);
  if (*v13 <= 20)
  {
    if (*v13 != -1)
    {
LABEL_3:
      LogPrintF((uint64_t)v13, (uint64_t)"-[CUFileClient _sendKeepAlive:]_block_invoke", 0x14u, (uint64_t)"Keep alive response: %##@, %{error}", v8, v9, v10, v11, (uint64_t)v14);
      goto LABEL_5;
    }
    if (_LogCategory_Initialize((uint64_t)v13, 0x14u))
    {
      uint64_t v13 = *(int **)(*(void *)(a1 + 32) + 96);
      goto LABEL_3;
    }
  }
LABEL_5:
  if (v12) {
    [*(id *)(a1 + 32) _reportError:v12 where:"Keep alive response"];
  }
}

- (void)_reportError:(id)a3 where:(const char *)a4
{
  id v13 = a3;
  ucat = self->_ucat;
  if (ucat->var0 <= 90)
  {
    if (ucat->var0 != -1)
    {
LABEL_3:
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUFileClient _reportError:where:]", 0x5Au, (uint64_t)"### Error: %s, %{error}", v6, v7, v8, v9, (uint64_t)a4);
      goto LABEL_5;
    }
    if (_LogCategory_Initialize((uint64_t)ucat, 0x5Au))
    {
      ucat = self->_ucat;
      goto LABEL_3;
    }
  }
LABEL_5:
  self->_unint64_t state = 3;
  uint64_t v11 = (void (**)(void *, id))_Block_copy(self->_activateCompletion);
  id activateCompletion = self->_activateCompletion;
  self->_id activateCompletion = 0;

  if (v11) {
    v11[2](v11, v13);
  }
}

- (void)_completeQuery:(id)a3 response:(id)a4 error:(id)a5
{
  v19 = (CUFileQuery *)a3;
  id v8 = a4;
  id v13 = a5;
  ucat = self->_ucat;
  int var0 = ucat->var0;
  if (v13)
  {
    if (var0 > 90) {
      goto LABEL_12;
    }
    uint64_t v16 = (uint64_t)v19;
    if (var0 != -1) {
      goto LABEL_4;
    }
    if (_LogCategory_Initialize((uint64_t)ucat, 0x5Au))
    {
      ucat = self->_ucat;
      uint64_t v16 = (uint64_t)v19;
LABEL_4:
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUFileClient _completeQuery:response:error:]", 0x5Au, (uint64_t)"### Query failed: %@, %{error}", v9, v10, v11, v12, v16);
    }
  }
  else
  {
    if (var0 > 30) {
      goto LABEL_12;
    }
    uint64_t v17 = (uint64_t)v19;
    if (var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu)) {
        goto LABEL_12;
      }
      ucat = self->_ucat;
      uint64_t v17 = (uint64_t)v19;
    }
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUFileClient _completeQuery:response:error:]", 0x1Eu, (uint64_t)"Query completed: %@, %@", v9, v10, v11, v12, v17);
  }
LABEL_12:
  uint64_t v18 = [(CUFileQuery *)v19 completionHandler];
  if (v18)
  {
    [(CUFileQuery *)v19 setCompletionHandler:0];
    ((void (**)(void, id, id))v18)[2](v18, v8, v13);
  }

  if (self->_currentQuery == v19)
  {
    self->_currentQuery = 0;

    [(CUFileClient *)self _run];
  }
}

- (void)performQuery:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __29__CUFileClient_performQuery___block_invoke;
  v7[3] = &unk_1E55BF170;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __29__CUFileClient_performQuery___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v10 = [*(id *)(a1 + 32) completionHandler];

  uint64_t v16 = *(void *)(a1 + 40);
  if (v10)
  {
    if (*(unsigned char *)(v16 + 40))
    {
      uint64_t v17 = *(void *)(a1 + 32);
      NSErrorF_safe((void *)*MEMORY[0x1E4F28760], 4294896148, (uint64_t)"Query after invalidate", v11, v12, v13, v14, v15, v24);
      id v25 = (id)objc_claimAutoreleasedReturnValue();
      [(id)v16 _completeQuery:v17 response:0 error:v25];
    }
    else
    {
      v19 = *(void **)(v16 + 56);
      if (!v19)
      {
        id v20 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        uint64_t v21 = *(void *)(a1 + 40);
        uint64_t v22 = *(void **)(v21 + 56);
        *(void *)(v21 + 56) = v20;

        v19 = *(void **)(*(void *)(a1 + 40) + 56);
      }
      [v19 addObject:*(void *)(a1 + 32)];
      uint64_t v23 = *(void **)(a1 + 40);
      [v23 _run];
    }
  }
  else
  {
    uint64_t v18 = *(int **)(v16 + 96);
    if (*v18 > 90) {
      return;
    }
    if (*v18 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)v18, 0x5Au)) {
        return;
      }
      uint64_t v18 = *(int **)(*(void *)(a1 + 40) + 96);
    }
    LogPrintF((uint64_t)v18, (uint64_t)"-[CUFileClient performQuery:]_block_invoke", 0x5Au, (uint64_t)"### Query without completion", v12, v13, v14, v15, a9);
  }
}

- (void)_invalidated
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateCalled
    || self->_invalidateDone
    || self->_clinkClient
    || self->_queryArray
    || self->_currentQuery
    || self->_sessionID)
  {
    return;
  }
  uint64_t v11 = (void (**)(void *))_Block_copy(self->_invalidationHandler);
  id invalidationHandler = self->_invalidationHandler;
  self->_id invalidationHandler = 0;

  id v8 = v11;
  if (v11)
  {
    v11[2](v11);
    id v8 = v11;
  }
  self->_invalidateDone = 1;
  uint64_t ucat = (uint64_t)self->_ucat;
  if (*(int *)ucat <= 30)
  {
    if (*(_DWORD *)ucat == -1)
    {
      uint64_t ucat = _LogCategory_Initialize(ucat, 0x1Eu);
      id v8 = v11;
      if (!ucat) {
        goto LABEL_14;
      }
      uint64_t ucat = (uint64_t)self->_ucat;
    }
    uint64_t ucat = LogPrintF(ucat, (uint64_t)"-[CUFileClient _invalidated]", 0x1Eu, (uint64_t)"Invalidated", v4, v5, v6, v7, v10);
    id v8 = v11;
  }
LABEL_14:
  MEMORY[0x1F41817F8](ucat, v8);
}

- (void)_invalidate
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (self->_invalidateCalled) {
    return;
  }
  self->_invalidateCalled = 1;
  uint64_t ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu)) {
        goto LABEL_6;
      }
      uint64_t ucat = self->_ucat;
    }
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUFileClient _invalidate]", 0x1Eu, (uint64_t)"Invalidate", v2, v3, v4, v5, v25);
  }
LABEL_6:
  if (self->_sessionID) {
    [(CUFileClient *)self _sendSessionStop];
  }
  else {
    [(RPCompanionLinkClient *)self->_clinkClient invalidate];
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v8 = self->_queryArray;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v9)
  {
    uint64_t v15 = v9;
    uint64_t v16 = *(void *)v26;
    uint64_t v17 = (void *)*MEMORY[0x1E4F28760];
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v26 != v16) {
          objc_enumerationMutation(v8);
        }
        uint64_t v19 = *(void *)(*((void *)&v25 + 1) + 8 * i);
        id v20 = NSErrorF_safe(v17, 4294896148, (uint64_t)"Invalidated", v10, v11, v12, v13, v14, v25);
        [(CUFileClient *)self _completeQuery:v19 response:0 error:v20];
      }
      uint64_t v15 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v15);
  }

  [(NSMutableArray *)self->_queryArray removeAllObjects];
  queryArray = self->_queryArray;
  self->_queryArray = 0;

  sessionTimer = self->_sessionTimer;
  if (sessionTimer)
  {
    uint64_t v23 = sessionTimer;
    dispatch_source_cancel(v23);
    uint64_t v24 = self->_sessionTimer;
    self->_sessionTimer = 0;
  }
  [(CUFileClient *)self _invalidated];
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __26__CUFileClient_invalidate__block_invoke;
  block[3] = &unk_1E55BFC18;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __26__CUFileClient_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

- (void)_activateWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = __Block_byref_object_copy__3068;
  uint64_t v24 = __Block_byref_object_dispose__3069;
  id v25 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __40__CUFileClient__activateWithCompletion___block_invoke;
  aBlock[3] = &unk_1E55BED88;
  uint64_t v19 = &v20;
  aBlock[4] = self;
  id v5 = v4;
  id v18 = v5;
  uint64_t v11 = (void (**)(void))_Block_copy(aBlock);
  if (!self->_destinationID)
  {
    uint64_t v14 = NSErrorF_safe((void *)*MEMORY[0x1E4F28760], 4294960591, (uint64_t)"No destination ID", v6, v7, v8, v9, v10, v16);
LABEL_9:
    uint64_t v15 = (void *)v21[5];
    v21[5] = v14;

    goto LABEL_5;
  }
  if (!self->_serviceType)
  {
    uint64_t v14 = NSErrorF_safe((void *)*MEMORY[0x1E4F28760], 4294960591, (uint64_t)"No service type", v6, v7, v8, v9, v10, v16);
    goto LABEL_9;
  }
  if (self->_activateCalled)
  {
    uint64_t v14 = NSErrorF_safe((void *)*MEMORY[0x1E4F28760], 4294960575, (uint64_t)"Activate already called", v6, v7, v8, v9, v10, v16);
    goto LABEL_9;
  }
  self->_activateCalled = 1;
  uint64_t v12 = _Block_copy(v5);
  id activateCompletion = self->_activateCompletion;
  self->_id activateCompletion = v12;

  [(CUFileClient *)self _run];
LABEL_5:
  v11[2](v11);

  _Block_object_dispose(&v20, 8);
}

uint64_t __40__CUFileClient__activateWithCompletion___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = *(void *)(*(void *)(*(void *)(result + 48) + 8) + 40);
  if (!v8) {
    return result;
  }
  uint64_t v9 = (void *)result;
  uint64_t v10 = *(int **)(*(void *)(result + 32) + 96);
  if (*v10 <= 90)
  {
    if (*v10 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)v10, 0x5Au)) {
        goto LABEL_7;
      }
      uint64_t v10 = *(int **)(v9[4] + 96);
      uint64_t v8 = *(void *)(*(void *)(v9[6] + 8) + 40);
    }
    LogPrintF((uint64_t)v10, (uint64_t)"-[CUFileClient _activateWithCompletion:]_block_invoke", 0x5Au, (uint64_t)"### Activate failed: %{error}", a5, a6, a7, a8, v8);
  }
LABEL_7:
  uint64_t v11 = *(uint64_t (**)(void))(v9[5] + 16);
  return v11();
}

- (void)activateWithCompletion:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __39__CUFileClient_activateWithCompletion___block_invoke;
  v7[3] = &unk_1E55BF148;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

uint64_t __39__CUFileClient_activateWithCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = *(void **)(a1 + 32);
  uint64_t v10 = (int *)v9[12];
  if (*v10 <= 30)
  {
    if (*v10 != -1)
    {
LABEL_3:
      LogPrintF((uint64_t)v10, (uint64_t)"-[CUFileClient activateWithCompletion:]_block_invoke", 0x1Eu, (uint64_t)"Activate", a5, a6, a7, a8, v14);
      uint64_t v9 = *(void **)(a1 + 32);
      goto LABEL_5;
    }
    BOOL v11 = _LogCategory_Initialize((uint64_t)v10, 0x1Eu);
    uint64_t v9 = *(void **)(a1 + 32);
    if (v11)
    {
      uint64_t v10 = (int *)v9[12];
      goto LABEL_3;
    }
  }
LABEL_5:
  uint64_t v12 = *(void *)(a1 + 40);
  return [v9 _activateWithCompletion:v12];
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
  id v5 = a3;
  p_uint64_t ucat = (uint64_t *)&self->_ucat;
  uint64_t v7 = qword_1E91CC838;
  id v14 = v5;
  [v14 UTF8String];
  LogCategoryReplaceF(p_ucat, (uint64_t)"%s-%s", v8, v9, v10, v11, v12, v13, v7);
}

- (void)dealloc
{
  uint64_t ucat = self->_ucat;
  if (ucat && (ucat->var3 & 0x40000) != 0)
  {
    LogCategory_Remove(ucat);
    self->_uint64_t ucat = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CUFileClient;
  [(CUFileClient *)&v4 dealloc];
}

- (CUFileClient)init
{
  v6.receiver = self;
  v6.super_class = (Class)CUFileClient;
  uint64_t v2 = [(CUFileClient *)&v6 init];
  uint64_t v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x1E4F14428]);
    v3->_uint64_t ucat = (LogCategory *)&gLogCategory_CUFileClient;
    objc_super v4 = v3;
  }

  return v3;
}

@end
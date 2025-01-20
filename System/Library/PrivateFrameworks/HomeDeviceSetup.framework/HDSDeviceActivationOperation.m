@interface HDSDeviceActivationOperation
+ (OS_os_log)signpostLog;
- (OS_dispatch_queue)dispatchQueue;
- (SFSession)sfSession;
- (double)metricTotalSeconds;
- (id)completionHandler;
- (unint64_t)signpostID;
- (unint64_t)startTicks;
- (void)_beginActivationWithCompletion:(id)a3;
- (void)_checkActivationStateWithCompletion:(id)a3;
- (void)_continueActivationWithSessionData:(id)a3 completion:(id)a4;
- (void)_finishActivation:(id)a3 responseHeader:(id)a4 completion:(id)a5;
- (void)_finishWithResult:(int64_t)a3 error:(id)a4;
- (void)_performActivationWithCompletion:(id)a3;
- (void)_sendActivationURLRequest:(id)a3 retries:(int)a4 completion:(id)a5;
- (void)activate;
- (void)setCompletionHandler:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setMetricTotalSeconds:(double)a3;
- (void)setSfSession:(id)a3;
- (void)setStartTicks:(unint64_t)a3;
@end

@implementation HDSDeviceActivationOperation

+ (OS_os_log)signpostLog
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__HDSDeviceActivationOperation_signpostLog__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (signpostLog_onceToken_1 != -1) {
    dispatch_once(&signpostLog_onceToken_1, block);
  }
  v2 = (void *)signpostLog_log_1;
  return (OS_os_log *)v2;
}

void __43__HDSDeviceActivationOperation_signpostLog__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.HomeDeviceSetup.signposts", (const char *)[v3 UTF8String]);
  v2 = (void *)signpostLog_log_1;
  signpostLog_log_1 = (uint64_t)v1;
}

- (unint64_t)signpostID
{
  id v3 = [(id)objc_opt_class() signpostLog];
  os_signpost_id_t v4 = os_signpost_id_make_with_pointer(v3, self);

  return v4;
}

- (void)activate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __40__HDSDeviceActivationOperation_activate__block_invoke;
  block[3] = &unk_26503F6A8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __40__HDSDeviceActivationOperation_activate__block_invoke(uint64_t a1)
{
  if (gLogCategory_HDSDeviceActivation <= 40
    && (gLogCategory_HDSDeviceActivation != -1 || _LogCategory_Initialize()))
  {
    objc_opt_class();
    LogPrintF();
  }
  *(void *)(*(void *)(a1 + 32) + 40) = mach_absolute_time();
  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __40__HDSDeviceActivationOperation_activate__block_invoke_2;
  v4[3] = &unk_2650401C0;
  v4[4] = v2;
  return [v2 _checkActivationStateWithCompletion:v4];
}

void __40__HDSDeviceActivationOperation_activate__block_invoke_2(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  v6 = v5;
  if (v5)
  {
    v7 = [v5 domain];
    v8 = v7;
    if (v7 == (void *)*MEMORY[0x263F08410])
    {
      uint64_t v12 = [v6 code];

      if (v12 == -6732)
      {
        v9 = *(void **)(a1 + 32);
        uint64_t v10 = 3;
LABEL_9:
        v11 = v6;
        goto LABEL_10;
      }
    }
    else
    {
    }
    v9 = *(void **)(a1 + 32);
    uint64_t v10 = 1;
    goto LABEL_9;
  }
  v9 = *(void **)(a1 + 32);
  if (!a3)
  {
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __40__HDSDeviceActivationOperation_activate__block_invoke_3;
    v13[3] = &unk_2650401C0;
    v13[4] = v9;
    [v9 _performActivationWithCompletion:v13];
    goto LABEL_11;
  }
  uint64_t v10 = 2;
  v11 = 0;
LABEL_10:
  [v9 _finishWithResult:v10 error:v11];
LABEL_11:
}

uint64_t __40__HDSDeviceActivationOperation_activate__block_invoke_3(uint64_t a1, uint64_t a2, int a3)
{
  id v3 = *(void **)(a1 + 32);
  if (a3)
  {
    uint64_t v4 = 0;
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v4 = 1;
    uint64_t v5 = a2;
  }
  return [v3 _finishWithResult:v4 error:v5];
}

- (void)_finishWithResult:(int64_t)a3 error:(id)a4
{
  id v9 = a4;
  if (gLogCategory_HDSDeviceActivation <= 30
    && (gLogCategory_HDSDeviceActivation != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  mach_absolute_time();
  UpTicksToSecondsF();
  self->_metricTotalSeconds = v7;
  if (gLogCategory_HDSDeviceActivation <= 40
    && (gLogCategory_HDSDeviceActivation != -1 || _LogCategory_Initialize()))
  {
    objc_opt_class();
    LogPrintF();
  }
  (*((void (**)(id, id, int64_t, uint64_t))self->_completionHandler + 2))(self->_completionHandler, v9, a3, v6);
  id completionHandler = self->_completionHandler;
  self->_id completionHandler = 0;
}

- (void)_checkActivationStateWithCompletion:(id)a3
{
  id v4 = a3;
  if (gLogCategory_HDSDeviceActivation <= 30
    && (gLogCategory_HDSDeviceActivation != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  uint64_t v5 = [(id)objc_opt_class() signpostLog];
  unint64_t v6 = [(HDSDeviceActivationOperation *)self signpostID];
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v7 = v6;
    if (os_signpost_enabled(v5))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_23EB5C000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v7, "DeviceActivationStepCheckState", "", buf, 2u);
    }
  }

  id v8 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  [v8 setObject:&unk_26F260F10 forKeyedSubscript:@"s"];
  sfSession = self->_sfSession;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __68__HDSDeviceActivationOperation__checkActivationStateWithCompletion___block_invoke;
  v11[3] = &unk_2650401E8;
  v11[4] = self;
  id v12 = v4;
  id v10 = v4;
  [(SFSession *)sfSession sendRequestID:@"_dA" options:&unk_26F260C08 request:v8 responseHandler:v11];
}

void __68__HDSDeviceActivationOperation__checkActivationStateWithCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  id v7 = a2;
  id v8 = [(id)objc_opt_class() signpostLog];
  uint64_t v9 = [*(id *)(a1 + 32) signpostID];
  if ((unint64_t)(v9 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v10 = v9;
    if (os_signpost_enabled(v8))
    {
      *(_WORD *)v11 = 0;
      _os_signpost_emit_with_name_impl(&dword_23EB5C000, v8, OS_SIGNPOST_INTERVAL_END, v10, "DeviceActivationStepCheckState", "", v11, 2u);
    }
  }

  CFDictionaryGetInt64();
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_performActivationWithCompletion:(id)a3
{
  id v4 = a3;
  if (gLogCategory_HDSDeviceActivation <= 30
    && (gLogCategory_HDSDeviceActivation != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __65__HDSDeviceActivationOperation__performActivationWithCompletion___block_invoke;
  v6[3] = &unk_265040260;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(HDSDeviceActivationOperation *)self _beginActivationWithCompletion:v6];
}

void __65__HDSDeviceActivationOperation__performActivationWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v6 = (void *)[objc_alloc(MEMORY[0x263F08928]) initForReadingFromData:v5 error:0];
    id v7 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"request"];

    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __65__HDSDeviceActivationOperation__performActivationWithCompletion___block_invoke_2;
    v10[3] = &unk_265040238;
    id v8 = *(void **)(a1 + 32);
    id v9 = *(id *)(a1 + 40);
    v10[4] = *(void *)(a1 + 32);
    id v11 = v9;
    [v8 _sendActivationURLRequest:v7 retries:2 completion:v10];
  }
}

void __65__HDSDeviceActivationOperation__performActivationWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2)
  {
    id v4 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v4();
  }
  else
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __65__HDSDeviceActivationOperation__performActivationWithCompletion___block_invoke_3;
    v8[3] = &unk_265040260;
    id v6 = *(void **)(a1 + 32);
    id v7 = *(id *)(a1 + 40);
    v8[4] = *(void *)(a1 + 32);
    id v9 = v7;
    [v6 _continueActivationWithSessionData:a3 completion:v8];
  }
}

void __65__HDSDeviceActivationOperation__performActivationWithCompletion___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v6 = (void *)[objc_alloc(MEMORY[0x263F08928]) initForReadingFromData:v5 error:0];
    id v7 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"request"];

    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __65__HDSDeviceActivationOperation__performActivationWithCompletion___block_invoke_4;
    v10[3] = &unk_265040238;
    id v8 = *(void **)(a1 + 32);
    id v9 = *(id *)(a1 + 40);
    v10[4] = *(void *)(a1 + 32);
    id v11 = v9;
    [v8 _sendActivationURLRequest:v7 retries:2 completion:v10];
  }
}

void __65__HDSDeviceActivationOperation__performActivationWithCompletion___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a2)
  {
    id v4 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v4();
  }
  else
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __65__HDSDeviceActivationOperation__performActivationWithCompletion___block_invoke_5;
    v8[3] = &unk_265040210;
    id v7 = *(void **)(a1 + 32);
    id v9 = *(id *)(a1 + 40);
    [v7 _finishActivation:a3 responseHeader:a4 completion:v8];
  }
}

uint64_t __65__HDSDeviceActivationOperation__performActivationWithCompletion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_beginActivationWithCompletion:(id)a3
{
  id v4 = a3;
  if (gLogCategory_HDSDeviceActivation <= 30
    && (gLogCategory_HDSDeviceActivation != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  id v5 = [(id)objc_opt_class() signpostLog];
  unint64_t v6 = [(HDSDeviceActivationOperation *)self signpostID];
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v7 = v6;
    if (os_signpost_enabled(v5))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_23EB5C000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v7, "DeviceActivationStepCreateSession", "", buf, 2u);
    }
  }

  id v8 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  [v8 setObject:&unk_26F260F28 forKeyedSubscript:@"s"];
  sfSession = self->_sfSession;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __63__HDSDeviceActivationOperation__beginActivationWithCompletion___block_invoke;
  v11[3] = &unk_2650401E8;
  v11[4] = self;
  id v12 = v4;
  id v10 = v4;
  [(SFSession *)sfSession sendRequestID:@"_dA" options:&unk_26F260C30 request:v8 responseHandler:v11];
}

void __63__HDSDeviceActivationOperation__beginActivationWithCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  id v7 = a2;
  id v8 = [(id)objc_opt_class() signpostLog];
  uint64_t v9 = [*(id *)(a1 + 32) signpostID];
  if ((unint64_t)(v9 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v10 = v9;
    if (os_signpost_enabled(v8))
    {
      *(_WORD *)id v12 = 0;
      _os_signpost_emit_with_name_impl(&dword_23EB5C000, v8, OS_SIGNPOST_INTERVAL_END, v10, "DeviceActivationStepCreateSession", "", v12, 2u);
    }
  }

  id v11 = [v6 objectForKeyedSubscript:@"r"];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_continueActivationWithSessionData:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (gLogCategory_HDSDeviceActivation <= 30
    && (gLogCategory_HDSDeviceActivation != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  id v8 = [(id)objc_opt_class() signpostLog];
  unint64_t v9 = [(HDSDeviceActivationOperation *)self signpostID];
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v10 = v9;
    if (os_signpost_enabled(v8))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_23EB5C000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v10, "DeviceActivationStepCreateActivation", "", buf, 2u);
    }
  }

  id v11 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  [v11 setObject:&unk_26F260F40 forKeyedSubscript:@"s"];
  [v11 setObject:v6 forKeyedSubscript:@"d"];
  sfSession = self->_sfSession;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __78__HDSDeviceActivationOperation__continueActivationWithSessionData_completion___block_invoke;
  v14[3] = &unk_2650401E8;
  v14[4] = self;
  id v15 = v7;
  id v13 = v7;
  [(SFSession *)sfSession sendRequestID:@"_dA" options:&unk_26F260C58 request:v11 responseHandler:v14];
}

void __78__HDSDeviceActivationOperation__continueActivationWithSessionData_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  id v7 = a2;
  id v8 = [(id)objc_opt_class() signpostLog];
  uint64_t v9 = [*(id *)(a1 + 32) signpostID];
  if ((unint64_t)(v9 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v10 = v9;
    if (os_signpost_enabled(v8))
    {
      *(_WORD *)id v12 = 0;
      _os_signpost_emit_with_name_impl(&dword_23EB5C000, v8, OS_SIGNPOST_INTERVAL_END, v10, "DeviceActivationStepCreateActivation", "", v12, 2u);
    }
  }

  id v11 = [v6 objectForKeyedSubscript:@"r"];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_finishActivation:(id)a3 responseHeader:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (gLogCategory_HDSDeviceActivation <= 30
    && (gLogCategory_HDSDeviceActivation != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  id v11 = [(id)objc_opt_class() signpostLog];
  unint64_t v12 = [(HDSDeviceActivationOperation *)self signpostID];
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v13 = v12;
    if (os_signpost_enabled(v11))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_23EB5C000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v13, "DeviceActivationStepActivate", "", buf, 2u);
    }
  }

  id v14 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  [v14 setObject:&unk_26F260F58 forKeyedSubscript:@"s"];
  [v14 setObject:v8 forKeyedSubscript:@"d"];
  [v14 setObject:v9 forKeyedSubscript:@"h"];
  sfSession = self->_sfSession;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __76__HDSDeviceActivationOperation__finishActivation_responseHeader_completion___block_invoke;
  v17[3] = &unk_2650401E8;
  v17[4] = self;
  id v18 = v10;
  id v16 = v10;
  [(SFSession *)sfSession sendRequestID:@"_dA" options:&unk_26F260C80 request:v14 responseHandler:v17];
}

void __76__HDSDeviceActivationOperation__finishActivation_responseHeader_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  id v7 = a2;
  id v8 = [(id)objc_opt_class() signpostLog];
  uint64_t v9 = [*(id *)(a1 + 32) signpostID];
  if ((unint64_t)(v9 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v10 = v9;
    if (os_signpost_enabled(v8))
    {
      *(_WORD *)id v11 = 0;
      _os_signpost_emit_with_name_impl(&dword_23EB5C000, v8, OS_SIGNPOST_INTERVAL_END, v10, "DeviceActivationStepActivate", "", v11, 2u);
    }
  }

  CFDictionaryGetInt64();
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_sendActivationURLRequest:(id)a3 retries:(int)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (gLogCategory_HDSDeviceActivation <= 40
    && (gLogCategory_HDSDeviceActivation != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  os_signpost_id_t v10 = [(id)objc_opt_class() signpostLog];
  unint64_t v11 = [(HDSDeviceActivationOperation *)self signpostID];
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v12 = v11;
    if (os_signpost_enabled(v10))
    {
      LOWORD(buf[0]) = 0;
      _os_signpost_emit_with_name_impl(&dword_23EB5C000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v12, "DeviceActivationServerRequest", "", (uint8_t *)buf, 2u);
    }
  }

  os_signpost_id_t v13 = [MEMORY[0x263F08C00] ephemeralSessionConfiguration];
  [v13 setTimeoutIntervalForResource:30.0];
  [v13 setWaitsForConnectivity:1];
  id v14 = [MEMORY[0x263F08BF8] sessionWithConfiguration:v13];
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  objc_initWeak(buf, self);
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __77__HDSDeviceActivationOperation__sendActivationURLRequest_retries_completion___block_invoke;
  v19[3] = &unk_265040288;
  v19[4] = self;
  int v23 = a4;
  objc_copyWeak(v22, buf);
  id v16 = v8;
  id v20 = v16;
  id v17 = v9;
  id v21 = v17;
  v22[1] = *(id *)&Current;
  id v18 = [v14 dataTaskWithRequest:v16 completionHandler:v19];
  [v18 resume];

  objc_destroyWeak(v22);
  objc_destroyWeak(buf);
}

void __77__HDSDeviceActivationOperation__sendActivationURLRequest_retries_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  v30[1] = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    os_signpost_id_t v10 = v8;
  }
  else {
    os_signpost_id_t v10 = 0;
  }
  id v11 = v10;
  uint64_t v12 = [v11 statusCode];
  os_signpost_id_t v13 = [(id)objc_opt_class() signpostLog];
  uint64_t v14 = [*(id *)(a1 + 32) signpostID];
  if ((unint64_t)(v14 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v15 = v14;
    if (os_signpost_enabled(v13))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_23EB5C000, v13, OS_SIGNPOST_INTERVAL_END, v15, "DeviceActivationServerRequest", "", buf, 2u);
    }
  }

  if (!v9 && v12 == 200)
  {
    if (gLogCategory_HDSDeviceActivation <= 40
      && (gLogCategory_HDSDeviceActivation != -1 || _LogCategory_Initialize()))
    {
      uint64_t v16 = *(void *)(a1 + 40);
      double v27 = CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 64);
      uint64_t v26 = v16;
      LogPrintF();
    }
    uint64_t v21 = *(void *)(a1 + 48);
    objc_msgSend(v11, "allHeaderFields", v26, *(void *)&v27);
    id v17 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void, id, id))(v21 + 16))(v21, 0, v7, v17);
    goto LABEL_34;
  }
  id v17 = v9;
  id v18 = [v17 domain];
  int v19 = [v18 isEqualToString:*MEMORY[0x263F08570]];

  if (v19
    && (uint64_t v20 = [v17 code], (unint64_t)(v20 + 1005) <= 4)
    && ((1 << (v20 - 19)) & 0x13) != 0)
  {

    if (*(int *)(a1 + 72) >= 1)
    {
      if (gLogCategory_HDSDeviceActivation <= 40
        && (gLogCategory_HDSDeviceActivation != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
      [WeakRetained _sendActivationURLRequest:*(void *)(a1 + 40) retries:(*(_DWORD *)(a1 + 72) - 1) completion:*(void *)(a1 + 48)];

      goto LABEL_34;
    }
  }
  else
  {
  }
  if (v9)
  {
    if (gLogCategory_HDSDeviceActivation <= 90
      && (gLogCategory_HDSDeviceActivation != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  else
  {
    if (gLogCategory_HDSDeviceActivation <= 90
      && (gLogCategory_HDSDeviceActivation != -1 || _LogCategory_Initialize()))
    {
      uint64_t v26 = v12;
      LogPrintF();
    }
    v22 = (void *)MEMORY[0x263F087E8];
    v29 = @"sc";
    int v23 = objc_msgSend(NSNumber, "numberWithInteger:", v12, v26);
    v30[0] = v23;
    v24 = [NSDictionary dictionaryWithObjects:v30 forKeys:&v29 count:1];
    id v17 = [v22 errorWithDomain:@"com.apple.soundboard.activation" code:0 userInfo:v24];
  }
  (*(void (**)(void, id, void, void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), v17, 0, 0);
LABEL_34:
}

- (SFSession)sfSession
{
  return self->_sfSession;
}

- (void)setSfSession:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (double)metricTotalSeconds
{
  return self->_metricTotalSeconds;
}

- (void)setMetricTotalSeconds:(double)a3
{
  self->_metricTotalSeconds = a3;
}

- (unint64_t)startTicks
{
  return self->_startTicks;
}

- (void)setStartTicks:(unint64_t)a3
{
  self->_startTicks = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_sfSession, 0);
}

@end
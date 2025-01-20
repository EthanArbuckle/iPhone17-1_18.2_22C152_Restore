@interface BiometricAutoBugCapture
- (BOOL)sendAutoBugCaptureEvent:(unint64_t)a3;
- (BOOL)sendSignature:(id)a3 withDuration:(double)a4;
- (BOOL)serialLogEnabled;
- (BiometricAutoBugCapture)initWithDomain:(id)a3 process:(id)a4 dispatchQueue:(id)a5;
- (NSString)domain;
- (NSString)process;
- (OS_dispatch_queue)dispatchQueue;
- (SDRDiagnosticReporter)reporter;
- (id)getSignatureForReason:(unint64_t)a3;
- (id)getSignatureWithType:(id)a3 subtype:(id)a4;
- (id)getSubtypeForReason:(unint64_t)a3;
- (id)getTypeForReason:(unint64_t)a3;
- (void)sendAutoBugCaptureEvent:(unint64_t)a3 withContext:(id)a4 replyBlock:(id)a5;
- (void)sendSignature:(id)a3 withDuration:(double)a4 replyBlock:(id)a5;
- (void)setDomain:(id)a3;
- (void)setProcess:(id)a3;
@end

@implementation BiometricAutoBugCapture

- (BiometricAutoBugCapture)initWithDomain:(id)a3 process:(id)a4 dispatchQueue:(id)a5
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v23.receiver = self;
  v23.super_class = (Class)BiometricAutoBugCapture;
  v12 = [(BiometricAutoBugCapture *)&v23 init];
  if (v12)
  {
    v13 = (SDRDiagnosticReporter *)objc_alloc_init(NSClassFromString(&cfstr_Sdrdiagnosticr.isa));
    reporter = v12->_reporter;
    v12->_reporter = v13;

    if (v12->_reporter)
    {
      objc_storeStrong((id *)&v12->_domain, a3);
      objc_storeStrong((id *)&v12->_process, a4);
      objc_storeStrong((id *)&v12->_dispatchQueue, a5);
      v12->_serialLogEnabled = 0;
      getBootArgs();
      v15 = (BiometricAutoBugCapture *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (v15)
      {
        uint64_t v17 = [(BiometricAutoBugCapture *)v15 rangeOfString:@"serial="];
        if (v18)
        {
          uint64_t v19 = v17 + v18;
          if (v17 + v18 < (unint64_t)[(BiometricAutoBugCapture *)v16 length])
          {
            v20 = -[BiometricAutoBugCapture substringWithRange:](v16, "substringWithRange:", v19, 1);
            v12->_serialLogEnabled = [v20 BOOLValue];
          }
        }
      }
    }
    else
    {
      if (__osLog) {
        v22 = __osLog;
      }
      else {
        v22 = &_os_log_internal;
      }
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v25 = "_reporter";
        __int16 v26 = 2048;
        uint64_t v27 = 0;
        __int16 v28 = 2080;
        v29 = &unk_22004A573;
        __int16 v30 = 2080;
        v31 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/BiometricAutoBugCapture.m";
        __int16 v32 = 1024;
        int v33 = 33;
        _os_log_impl(&dword_21FFF3000, v22, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      v16 = v12;
      v12 = 0;
    }
  }
  return v12;
}

- (id)getTypeForReason:(unint64_t)a3
{
  if (a3 - 4097 > 4) {
    return @"Default";
  }
  else {
    return off_26454E170[a3 - 4097];
  }
}

- (id)getSubtypeForReason:(unint64_t)a3
{
  if (a3 - 4097 > 4) {
    return @"Default";
  }
  else {
    return off_26454E198[a3 - 4097];
  }
}

- (id)getSignatureWithType:(id)a3 subtype:(id)a4
{
  return (id)[(SDRDiagnosticReporter *)self->_reporter signatureWithDomain:self->_domain type:a3 subType:a4 detectedProcess:self->_process triggerThresholdValues:0];
}

- (id)getSignatureForReason:(unint64_t)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v5 = -[BiometricAutoBugCapture getTypeForReason:](self, "getTypeForReason:");
  uint64_t v6 = [(BiometricAutoBugCapture *)self getSubtypeForReason:a3];
  v7 = (void *)v6;
  if (!v5)
  {
    if (__osLog) {
      id v10 = __osLog;
    }
    else {
      id v10 = &_os_log_internal;
    }
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      goto LABEL_18;
    }
    int v11 = 136316162;
    v12 = "type";
    __int16 v13 = 2048;
    uint64_t v14 = 0;
    __int16 v15 = 2080;
    v16 = &unk_22004A573;
    __int16 v17 = 2080;
    uint64_t v18 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/BiometricAutoBugCapture.m";
    __int16 v19 = 1024;
    int v20 = 143;
    goto LABEL_17;
  }
  if (v6)
  {
    v8 = [(BiometricAutoBugCapture *)self getSignatureWithType:v5 subtype:v6];
    goto LABEL_4;
  }
  if (__osLog) {
    id v10 = __osLog;
  }
  else {
    id v10 = &_os_log_internal;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    int v11 = 136316162;
    v12 = "subtype";
    __int16 v13 = 2048;
    uint64_t v14 = 0;
    __int16 v15 = 2080;
    v16 = &unk_22004A573;
    __int16 v17 = 2080;
    uint64_t v18 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/BiometricAutoBugCapture.m";
    __int16 v19 = 1024;
    int v20 = 144;
LABEL_17:
    _os_log_impl(&dword_21FFF3000, v10, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v11, 0x30u);
  }
LABEL_18:
  v8 = 0;
LABEL_4:

  return v8;
}

- (BOOL)sendAutoBugCaptureEvent:(unint64_t)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v4 = [(BiometricAutoBugCapture *)self getSignatureForReason:a3];
  if (v4)
  {
    BOOL v5 = [(BiometricAutoBugCapture *)self sendSignature:v4 withDuration:*(double *)&DEFAULT_SNAPSHOT_TIME];
  }
  else
  {
    if (__osLog) {
      v7 = __osLog;
    }
    else {
      v7 = &_os_log_internal;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136316162;
      id v9 = "signature";
      __int16 v10 = 2048;
      uint64_t v11 = 0;
      __int16 v12 = 2080;
      __int16 v13 = &unk_22004A573;
      __int16 v14 = 2080;
      __int16 v15 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/BiometricAutoBugCapture.m";
      __int16 v16 = 1024;
      int v17 = 156;
      _os_log_impl(&dword_21FFF3000, v7, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v8, 0x30u);
    }
    BOOL v5 = 0;
  }

  return v5;
}

- (void)sendAutoBugCaptureEvent:(unint64_t)a3 withContext:(id)a4 replyBlock:(id)a5
{
  id v8 = a4;
  id v9 = (void (**)(id, void))a5;
  __int16 v10 = [(BiometricAutoBugCapture *)self getSignatureForReason:a3];
  uint64_t v11 = v10;
  if (v10)
  {
    if (v8) {
      [v10 setObject:v8 forKeyedSubscript:*MEMORY[0x263F7C188]];
    }
    [(BiometricAutoBugCapture *)self sendSignature:v11 withDuration:v9 replyBlock:0.0];
  }
  else
  {
    if (__osLog) {
      __int16 v12 = __osLog;
    }
    else {
      __int16 v12 = &_os_log_internal;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)__int16 v13 = 0;
      _os_log_impl(&dword_21FFF3000, v12, OS_LOG_TYPE_ERROR, "Failed to create ABC signature\n", v13, 2u);
    }
    if (v9) {
      v9[2](v9, *MEMORY[0x263F7C0D8]);
    }
  }
}

- (void)sendSignature:(id)a3 withDuration:(double)a4 replyBlock:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  dispatchQueue = self->_dispatchQueue;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __65__BiometricAutoBugCapture_sendSignature_withDuration_replyBlock___block_invoke;
  v13[3] = &unk_26454E150;
  v13[4] = self;
  id v14 = v8;
  double v16 = a4;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(dispatchQueue, v13);
}

void __65__BiometricAutoBugCapture_sendSignature_withDuration_replyBlock___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v2 = (void *)os_transaction_create();
  v3 = (void *)MEMORY[0x223C64ED0]();
  v4 = *(void **)(a1 + 40);
  BOOL v5 = *(void **)(*(void *)(a1 + 32) + 40);
  double v6 = *(double *)(a1 + 56);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __65__BiometricAutoBugCapture_sendSignature_withDuration_replyBlock___block_invoke_2;
  v10[3] = &unk_26454E128;
  id v11 = v4;
  id v12 = *(id *)(a1 + 48);
  if (([v5 snapshotWithSignature:v11 duration:0 event:0 payload:v10 reply:v6] & 1) == 0)
  {
    if (__osLog) {
      v7 = __osLog;
    }
    else {
      v7 = &_os_log_internal;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      uint64_t v14 = v8;
      _os_log_impl(&dword_21FFF3000, v7, OS_LOG_TYPE_ERROR, "Failed to send auto bug capture signature: %@\n", buf, 0xCu);
    }
    uint64_t v9 = *(void *)(a1 + 48);
    if (v9) {
      (*(void (**)(uint64_t, void))(v9 + 16))(v9, *MEMORY[0x263F7C0D8]);
    }
  }
}

void __65__BiometricAutoBugCapture_sendSignature_withDuration_replyBlock___block_invoke_2(uint64_t a1, void *a2)
{
  *(void *)&v22[13] = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = [v3 objectForKeyedSubscript:*MEMORY[0x263F7C158]];
  int v5 = [v4 BOOLValue];

  if (v5)
  {
    if (__osLog) {
      double v6 = __osLog;
    }
    else {
      double v6 = &_os_log_internal;
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      uint64_t v8 = *MEMORY[0x263F7C148];
      uint64_t v9 = v6;
      __int16 v10 = [v3 objectForKeyedSubscript:v8];
      int v19 = 138412546;
      uint64_t v20 = v7;
      __int16 v21 = 2112;
      *(void *)v22 = v10;
      _os_log_impl(&dword_21FFF3000, v9, OS_LOG_TYPE_DEFAULT, "Successfully send auto bug capture signature: %@ with sessionID: %@\n", (uint8_t *)&v19, 0x16u);
    }
    uint64_t v11 = *MEMORY[0x263F7C0E0];
  }
  else
  {
    id v12 = [v3 objectForKeyedSubscript:*MEMORY[0x263F7C130]];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v11 = [v12 intValue];
    }
    else {
      uint64_t v11 = *MEMORY[0x263F7C0D8];
    }
    if (__osLog) {
      __int16 v13 = __osLog;
    }
    else {
      __int16 v13 = &_os_log_internal;
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = *(void *)(a1 + 32);
      uint64_t v15 = *MEMORY[0x263F7C140];
      double v16 = v13;
      int v17 = [v3 objectForKeyedSubscript:v15];
      int v19 = 138412802;
      uint64_t v20 = v14;
      __int16 v21 = 1024;
      *(_DWORD *)v22 = v11;
      v22[2] = 2112;
      *(void *)&v22[3] = v17;
      _os_log_impl(&dword_21FFF3000, v16, OS_LOG_TYPE_DEFAULT, "Dampened auto bug capture signature: %@ with error code: %d reason: %@\n", (uint8_t *)&v19, 0x1Cu);
    }
  }
  uint64_t v18 = *(void *)(a1 + 40);
  if (v18) {
    (*(void (**)(uint64_t, uint64_t))(v18 + 16))(v18, v11);
  }
}

- (BOOL)sendSignature:(id)a3 withDuration:(double)a4
{
  return 1;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (NSString)domain
{
  return self->_domain;
}

- (void)setDomain:(id)a3
{
}

- (NSString)process
{
  return self->_process;
}

- (void)setProcess:(id)a3
{
}

- (SDRDiagnosticReporter)reporter
{
  return self->_reporter;
}

- (BOOL)serialLogEnabled
{
  return self->_serialLogEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reporter, 0);
  objc_storeStrong((id *)&self->_process, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end
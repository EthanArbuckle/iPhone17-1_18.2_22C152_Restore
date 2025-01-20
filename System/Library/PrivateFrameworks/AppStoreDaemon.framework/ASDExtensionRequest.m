@interface ASDExtensionRequest
- ($9113E22C387CB8549570940FFDE4B24C)beginRequestForHostContext:(Class)a3 XPCInterface:(id)a4;
- (ASDExtensionRequest)initWithExtension:(id)a3 queue:(id)a4;
- (ASDExtensionRequest)initWithExtension:(id)a3 queue:(id)a4 serviceTime:(double)a5 graceTime:(double)a6;
- (NSExtension)extension;
- (id)errorBlock;
- (void)_cleanupPostExecution;
- (void)_endRequestWithCancelCall:(uint64_t)a1;
- (void)_onRunQueue_beginRequestForHostContext:(void *)a3 XPCInterface:(uint64_t)a4 retryCount:;
- (void)beginRequestForHostContext:(Class)a3 XPCInterface:(id)a4 executionBlock:(id)a5;
- (void)dealloc;
- (void)endRequest;
- (void)requestEnded;
- (void)setErrorBlock:(id)a3;
@end

@implementation ASDExtensionRequest

- (ASDExtensionRequest)initWithExtension:(id)a3 queue:(id)a4 serviceTime:(double)a5 graceTime:(double)a6
{
  id v11 = a3;
  id v12 = a4;
  v21.receiver = self;
  v21.super_class = (Class)ASDExtensionRequest;
  v13 = [(ASDExtensionRequest *)&v21 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_extension, a3);
    v15 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v16 = dispatch_queue_attr_make_with_qos_class(v15, QOS_CLASS_UTILITY, 0);
    v17 = [MEMORY[0x1E4F28C70] globalStateQueueForExtension:v11];
    dispatch_queue_t v18 = dispatch_queue_create_with_target_V2("com.apple.appstored.ASDExtensionRequest.dispatch", v16, v17);
    runQueue = v14->_runQueue;
    v14->_runQueue = (OS_dispatch_queue *)v18;

    objc_storeStrong((id *)&v14->_callbackQueue, a4);
    v14->_serviceTime = a5;
    v14->_graceTime = a6;
  }

  return v14;
}

- (ASDExtensionRequest)initWithExtension:(id)a3 queue:(id)a4
{
  return [(ASDExtensionRequest *)self initWithExtension:a3 queue:a4 serviceTime:0.0 graceTime:0.0];
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)ASDExtensionRequest;
  [(ASDExtensionRequest *)&v2 dealloc];
}

- (void)beginRequestForHostContext:(Class)a3 XPCInterface:(id)a4 executionBlock:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v10 = ASDLogHandleForCategory(12);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_19BF6A000, v10, OS_LOG_TYPE_DEBUG, "ASDExtensionRequest begin request", buf, 2u);
  }

  runQueue = self->_runQueue;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __78__ASDExtensionRequest_beginRequestForHostContext_XPCInterface_executionBlock___block_invoke;
  v14[3] = &unk_1E58B33F8;
  v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  Class v17 = a3;
  id v12 = v9;
  id v13 = v8;
  dispatch_async(runQueue, v14);
}

void __78__ASDExtensionRequest_beginRequestForHostContext_XPCInterface_executionBlock___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(*(void *)(a1 + 32) + 64);
  if (!v2)
  {
    -[ASDExtensionRequest _onRunQueue_beginRequestForHostContext:XPCInterface:retryCount:](*(void *)(a1 + 32), *(void *)(a1 + 56), *(void **)(a1 + 40), 0);
    id v2 = *(id *)(*(void *)(a1 + 32) + 64);
  }
  id v3 = *(id *)(*(void *)(a1 + 32) + 56);
  v4 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78__ASDExtensionRequest_beginRequestForHostContext_XPCInterface_executionBlock___block_invoke_2;
  block[3] = &unk_1E58B3068;
  id v5 = *(id *)(a1 + 48);
  id v10 = v3;
  id v11 = v5;
  id v9 = v2;
  id v6 = v3;
  id v7 = v2;
  dispatch_async(v4, block);
}

- (void)_onRunQueue_beginRequestForHostContext:(void *)a3 XPCInterface:(uint64_t)a4 retryCount:
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v49 = a3;
  if (!a1) {
    goto LABEL_59;
  }
  id v7 = *(void **)(a1 + 64);
  *(void *)(a1 + 64) = 0;

  id v9 = (void *)(a1 + 56);
  id v8 = *(void **)(a1 + 56);
  *(void *)(a1 + 56) = 0;

  id v10 = *(void **)(a1 + 88);
  id v54 = 0;
  id v11 = [v10 beginExtensionRequestWithOptions:0 inputItems:0 error:&v54];
  id v12 = v54;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (v11)
    {
      id v13 = ASDLogHandleForCategory(12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      {
        LODWORD(buf) = 138543362;
        *(void *)((char *)&buf + 4) = v11;
        _os_log_fault_impl(&dword_19BF6A000, v13, OS_LOG_TYPE_FAULT, "Wrong request identifier type: %{public}@", (uint8_t *)&buf, 0xCu);
      }
      goto LABEL_32;
    }
    id v13 = [v12 domain];
    uint64_t v14 = [v12 code];
    if ([v13 isEqualToString:*MEMORY[0x1E4F281F8]])
    {
      BOOL v15 = (unint64_t)(v14 - 4096) < 0x81;
      BOOL v16 = v14 != 4102;
      BOOL v17 = v16 && v15;
      if (v16 && v15) {
        os_log_type_t v18 = OS_LOG_TYPE_DEFAULT;
      }
      else {
        os_log_type_t v18 = OS_LOG_TYPE_FAULT;
      }
    }
    else
    {
      v19 = [v12 domain];
      if ([v19 isEqualToString:*MEMORY[0x1E4F914D0]])
      {
        BOOL v20 = [v12 code] == 4;

        if (v20)
        {
          objc_super v21 = [v12 userInfo];
          v22 = [v21 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];

          v23 = [v22 domain];
          int v24 = [v23 isEqualToString:*MEMORY[0x1E4F28798]];

          if (v24)
          {
            uint64_t v25 = [v22 code];
            v26 = v22;
            if (v25 == 80 || v25 == 85) {
              os_log_type_t v18 = OS_LOG_TYPE_ERROR;
            }
            else {
              os_log_type_t v18 = OS_LOG_TYPE_FAULT;
            }
          }
          else
          {
            v26 = v22;
            os_log_type_t v18 = OS_LOG_TYPE_FAULT;
          }

          BOOL v17 = 0;
          goto LABEL_26;
        }
      }
      else
      {
      }
      BOOL v17 = 0;
      os_log_type_t v18 = OS_LOG_TYPE_FAULT;
    }
LABEL_26:
    v28 = ASDLogHandleForCategory(12);
    if (os_log_type_enabled(v28, v18))
    {
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v12;
      _os_log_impl(&dword_19BF6A000, v28, v18, "Failed to begin extension request: %{public}@", (uint8_t *)&buf, 0xCu);
    }

    if (a4 <= 0 && v17)
    {
      v29 = ASDLogHandleForCategory(12);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        LODWORD(buf) = 134217984;
        *(void *)((char *)&buf + 4) = 2;
        _os_log_impl(&dword_19BF6A000, v29, OS_LOG_TYPE_INFO, "Attempt #%ld", (uint8_t *)&buf, 0xCu);
      }

      -[ASDExtensionRequest _onRunQueue_beginRequestForHostContext:XPCInterface:retryCount:](a1, a2, v49, 1);
    }
    goto LABEL_32;
  }
  objc_storeStrong((id *)(a1 + 56), v11);
  if (a4 < 1) {
    goto LABEL_33;
  }
  id v13 = ASDLogHandleForCategory(12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = 2;
    _os_log_impl(&dword_19BF6A000, v13, OS_LOG_TYPE_DEFAULT, "Succeeded on attempt %ld", (uint8_t *)&buf, 0xCu);
  }
LABEL_32:

LABEL_33:
  if (*v9)
  {
    v30 = objc_msgSend(*(id *)(a1 + 88), "_extensionContextForUUID:");
    if (objc_opt_isKindOfClass())
    {
      if (v30)
      {
        objc_initWeak(location, (id)a1);
        v52[0] = MEMORY[0x1E4F143A8];
        v52[1] = 3221225472;
        v52[2] = __86__ASDExtensionRequest__onRunQueue_beginRequestForHostContext_XPCInterface_retryCount___block_invoke;
        v52[3] = &unk_1E58B3448;
        objc_copyWeak(&v53, location);
        v31 = (void *)MEMORY[0x19F393180](v52);
        v32 = [v30 _auxiliaryConnection];
        v33 = [v32 remoteObjectProxyWithErrorHandler:v31];
        if ([v33 conformsToProtocol:v49])
        {
          id v34 = v33;
          v35 = *(NSObject **)(a1 + 64);
          *(void *)(a1 + 64) = v34;
        }
        else
        {
          v35 = ASDLogHandleForCategory(12);
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          {
            LODWORD(buf) = 138543362;
            *(void *)((char *)&buf + 4) = v33;
            _os_log_error_impl(&dword_19BF6A000, v35, OS_LOG_TYPE_ERROR, "Wrong remote context proxy %{public}@", (uint8_t *)&buf, 0xCu);
          }
        }

        objc_destroyWeak(&v53);
        objc_destroyWeak(location);
      }
      goto LABEL_45;
    }
    v36 = ASDLogHandleForCategory(12);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v30;
      _os_log_error_impl(&dword_19BF6A000, v36, OS_LOG_TYPE_ERROR, "Wrong host context %{public}@", (uint8_t *)&buf, 0xCu);
    }
  }
  v30 = 0;
LABEL_45:
  if (*(void *)(a1 + 64))
  {
    if (*(double *)(a1 + 24) > 0.0)
    {
      dispatch_source_t v37 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, *(dispatch_queue_t *)(a1 + 8));
      v38 = *(void **)(a1 + 32);
      *(void *)(a1 + 32) = v37;

      v39 = *(NSObject **)(a1 + 32);
      dispatch_time_t v40 = dispatch_time(0, (uint64_t)(*(double *)(a1 + 24) * 1000000000.0));
      dispatch_source_set_timer(v39, v40, 0xFFFFFFFFFFFFFFFFLL, 0);
      v41 = *(NSObject **)(a1 + 32);
      *(void *)&long long buf = MEMORY[0x1E4F143A8];
      *((void *)&buf + 1) = 3221225472;
      v57 = __35__ASDExtensionRequest__startTimers__block_invoke;
      v58 = &unk_1E58B2EB8;
      uint64_t v59 = a1;
      dispatch_source_set_event_handler(v41, &buf);
      if (*(double *)(a1 + 40) > 0.0)
      {
        dispatch_source_t v42 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, *(dispatch_queue_t *)(a1 + 8));
        v43 = *(void **)(a1 + 48);
        *(void *)(a1 + 48) = v42;

        v44 = *(NSObject **)(a1 + 48);
        double v45 = *(double *)(a1 + 24) - *(double *)(a1 + 40);
        dispatch_time_t v46 = dispatch_time(0, 1000000000 * ((uint64_t)v45 & ~((uint64_t)v45 >> 63)));
        dispatch_source_set_timer(v44, v46, 0xFFFFFFFFFFFFFFFFLL, 0);
        v47 = *(NSObject **)(a1 + 48);
        location[0] = (id)MEMORY[0x1E4F143A8];
        location[1] = (id)3221225472;
        location[2] = __35__ASDExtensionRequest__startTimers__block_invoke_2;
        location[3] = &unk_1E58B2EB8;
        location[4] = (id)a1;
        dispatch_source_set_event_handler(v47, location);
        dispatch_resume(*(dispatch_object_t *)(a1 + 48));
      }
      dispatch_resume(*(dispatch_object_t *)(a1 + 32));
    }
  }
  else
  {
    if (!v12)
    {
      ASDErrorWithUnderlyingErrorAndDescription(0, @"ASDErrorDomain", 507, @"Couldn't create extension request");
      id v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    if (*v9) {
      objc_msgSend(*(id *)(a1 + 88), "cancelExtensionRequestWithIdentifier:");
    }
    if (!*(unsigned char *)(a1 + 72))
    {
      *(unsigned char *)(a1 + 72) = 1;
      if (*(void *)(a1 + 80))
      {
        v48 = *(NSObject **)(a1 + 16);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __86__ASDExtensionRequest__onRunQueue_beginRequestForHostContext_XPCInterface_retryCount___block_invoke_9;
        block[3] = &unk_1E58B2DF0;
        void block[4] = a1;
        id v51 = v12;
        dispatch_async(v48, block);
      }
    }
    -[ASDExtensionRequest _cleanupPostExecution]((void *)a1);
  }

LABEL_59:
}

uint64_t __78__ASDExtensionRequest_beginRequestForHostContext_XPCInterface_executionBlock___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- ($9113E22C387CB8549570940FFDE4B24C)beginRequestForHostContext:(Class)a3 XPCInterface:(id)a4
{
  id v6 = a4;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x4012000000;
  objc_super v21 = __Block_byref_object_copy__1;
  v22 = __Block_byref_object_dispose__1;
  uint64_t v23 = 512;
  id v24 = 0;
  id v25 = 0;
  runQueue = self->_runQueue;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __63__ASDExtensionRequest_beginRequestForHostContext_XPCInterface___block_invoke;
  v14[3] = &unk_1E58B3420;
  v14[4] = self;
  id v15 = v6;
  BOOL v16 = &v18;
  Class v17 = a3;
  id v8 = v6;
  dispatch_async_and_wait(runQueue, v14);
  id v9 = v19;
  id v10 = (id)v19[6];
  id v11 = (id)v9[7];

  _Block_object_dispose(&v18, 8);
  id v12 = v10;
  id v13 = v11;
  result.var1 = v13;
  result.var0 = v12;
  return result;
}

void __63__ASDExtensionRequest_beginRequestForHostContext_XPCInterface___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 64);
  if (!v3)
  {
    -[ASDExtensionRequest _onRunQueue_beginRequestForHostContext:XPCInterface:retryCount:](v2, *(void *)(a1 + 56), *(void **)(a1 + 40), 0);
    id v3 = *(void **)(*(void *)(a1 + 32) + 64);
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 48), v3);
  v4 = *(void **)(*(void *)(a1 + 32) + 56);
  id v5 = (id *)(*(void *)(*(void *)(a1 + 48) + 8) + 56);
  objc_storeStrong(v5, v4);
}

void __86__ASDExtensionRequest__onRunQueue_beginRequestForHostContext_XPCInterface_retryCount___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v5 = ASDLogHandleForCategory(12);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138543362;
      id v11 = v3;
      _os_log_error_impl(&dword_19BF6A000, v5, OS_LOG_TYPE_ERROR, "Remote context error %{public}@", buf, 0xCu);
    }

    id v6 = WeakRetained[1];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __86__ASDExtensionRequest__onRunQueue_beginRequestForHostContext_XPCInterface_retryCount___block_invoke_6;
    v7[3] = &unk_1E58B2DF0;
    id v8 = WeakRetained;
    id v9 = v3;
    dispatch_async(v6, v7);
  }
}

void __86__ASDExtensionRequest__onRunQueue_beginRequestForHostContext_XPCInterface_retryCount___block_invoke_6(uint64_t a1)
{
  -[ASDExtensionRequest _cleanupPostExecution](*(void **)(a1 + 32));
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v2 + 72))
  {
    *(unsigned char *)(v2 + 72) = 1;
    id v3 = *(void **)(a1 + 32);
    if (v3[10])
    {
      v4 = v3[2];
      v5[0] = MEMORY[0x1E4F143A8];
      v5[1] = 3221225472;
      v5[2] = __86__ASDExtensionRequest__onRunQueue_beginRequestForHostContext_XPCInterface_retryCount___block_invoke_2;
      v5[3] = &unk_1E58B2DF0;
      id v6 = v3;
      id v7 = *(id *)(a1 + 40);
      dispatch_async(v4, v5);
    }
  }
}

- (void)_cleanupPostExecution
{
  if (a1)
  {
    uint64_t v2 = a1[6];
    if (v2)
    {
      dispatch_source_cancel(v2);
      id v3 = (void *)a1[6];
      a1[6] = 0;
    }
    v4 = a1[4];
    if (v4)
    {
      dispatch_source_cancel(v4);
      id v5 = (void *)a1[4];
      a1[4] = 0;
    }
    id v6 = (void *)a1[8];
    a1[8] = 0;

    id v7 = (void *)a1[7];
    a1[7] = 0;
  }
}

uint64_t __86__ASDExtensionRequest__onRunQueue_beginRequestForHostContext_XPCInterface_retryCount___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 80) + 16))();
}

uint64_t __86__ASDExtensionRequest__onRunQueue_beginRequestForHostContext_XPCInterface_retryCount___block_invoke_9(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 80) + 16))();
}

- (void)endRequest
{
  id v3 = ASDLogHandleForCategory(12);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v4 = 0;
    _os_log_debug_impl(&dword_19BF6A000, v3, OS_LOG_TYPE_DEBUG, "ASDExtensionRequest end request", v4, 2u);
  }

  -[ASDExtensionRequest _endRequestWithCancelCall:]((uint64_t)self, 1);
}

- (void)_endRequestWithCancelCall:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v2 = *(NSObject **)(a1 + 8);
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __49__ASDExtensionRequest__endRequestWithCancelCall___block_invoke;
    v3[3] = &unk_1E58B3470;
    v3[4] = a1;
    char v4 = a2;
    dispatch_async(v2, v3);
  }
}

- (void)requestEnded
{
  id v3 = ASDLogHandleForCategory(12);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)char v4 = 0;
    _os_log_debug_impl(&dword_19BF6A000, v3, OS_LOG_TYPE_DEBUG, "ASDExtensionRequest request ended", v4, 2u);
  }

  -[ASDExtensionRequest _endRequestWithCancelCall:]((uint64_t)self, 0);
}

void __49__ASDExtensionRequest__endRequestWithCancelCall___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 56))
  {
    if (*(double *)(v2 + 40) > 0.0)
    {
      [*(id *)(v2 + 64) serviceExtensionPerformCleanup];
      uint64_t v2 = *(void *)(a1 + 32);
    }
    if (*(unsigned char *)(a1 + 40))
    {
      [*(id *)(v2 + 88) cancelExtensionRequestWithIdentifier:*(void *)(v2 + 56)];
      uint64_t v2 = *(void *)(a1 + 32);
    }
    -[ASDExtensionRequest _cleanupPostExecution]((void *)v2);
  }
}

void __35__ASDExtensionRequest__startTimers__block_invoke(uint64_t a1)
{
  uint64_t v2 = ASDLogHandleForCategory(12);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)long long buf = 0;
    _os_log_error_impl(&dword_19BF6A000, v2, OS_LOG_TYPE_ERROR, "Extension request timeout", buf, 2u);
  }

  uint64_t v3 = *(void *)(a1 + 32);
  if (*(void *)(v3 + 56))
  {
    objc_msgSend(*(id *)(v3 + 88), "cancelExtensionRequestWithIdentifier:");
    uint64_t v3 = *(void *)(a1 + 32);
  }
  if (!*(unsigned char *)(v3 + 72))
  {
    *(unsigned char *)(v3 + 72) = 1;
    uint64_t v3 = *(void *)(a1 + 32);
    if (*(void *)(v3 + 80))
    {
      char v4 = *(NSObject **)(v3 + 16);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __35__ASDExtensionRequest__startTimers__block_invoke_10;
      block[3] = &unk_1E58B2EB8;
      void block[4] = v3;
      dispatch_async(v4, block);
      uint64_t v3 = *(void *)(a1 + 32);
    }
  }
  -[ASDExtensionRequest _cleanupPostExecution]((void *)v3);
}

void __35__ASDExtensionRequest__startTimers__block_invoke_10(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(v1 + 80);
  ASDErrorWithUnderlyingErrorAndDescription(0, @"ASDErrorDomain", 515, @"Request timeout");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, id))(v2 + 16))(v2, v1, v3);
}

void __35__ASDExtensionRequest__startTimers__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = ASDLogHandleForCategory(12);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_19BF6A000, v2, OS_LOG_TYPE_INFO, "Extension request time will expire", v5, 2u);
  }

  [*(id *)(*(void *)(a1 + 32) + 64) serviceExtensionTimeWillExpire];
  uint64_t v3 = *(void *)(a1 + 32);
  char v4 = *(void **)(v3 + 48);
  *(void *)(v3 + 48) = 0;
}

- (id)errorBlock
{
  return self->_errorBlock;
}

- (void)setErrorBlock:(id)a3
{
}

- (NSExtension)extension
{
  return self->_extension;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extension, 0);
  objc_storeStrong(&self->_errorBlock, 0);
  objc_storeStrong(&self->_remoteContextInterface, 0);
  objc_storeStrong((id *)&self->_requestUUID, 0);
  objc_storeStrong((id *)&self->_graceTimer, 0);
  objc_storeStrong((id *)&self->_serviceTimer, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_runQueue, 0);
}

@end
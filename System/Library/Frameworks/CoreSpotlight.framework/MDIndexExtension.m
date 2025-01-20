@interface MDIndexExtension
@end

@implementation MDIndexExtension

void __123___MDIndexExtension_initWithExtension_queue_containerPath_containerID_supportedFileTypes_extensionLabel_isAppleCodeSigned___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = (void *)MEMORY[0x192F99810]();
  v5 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    __123___MDIndexExtension_initWithExtension_queue_containerPath_containerID_supportedFileTypes_extensionLabel_isAppleCodeSigned___block_invoke_cold_1((uint64_t)v3, a1, v5);
  }
}

void __123___MDIndexExtension_initWithExtension_queue_containerPath_containerID_supportedFileTypes_extensionLabel_isAppleCodeSigned___block_invoke_1(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = (void *)MEMORY[0x192F99810]();
  v8 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    __123___MDIndexExtension_initWithExtension_queue_containerPath_containerID_supportedFileTypes_extensionLabel_isAppleCodeSigned___block_invoke_1_cold_1((uint64_t)v5, a1, v8);
  }
}

void __49___MDIndexExtension__performJob_completionBlock___block_invoke(id *a1, void *a2, void *a3)
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = (void *)MEMORY[0x192F99810]();
  v8 = logForCSLogCategoryIndex();
  v9 = v8;
  if (!v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      __49___MDIndexExtension__performJob_completionBlock___block_invoke_cold_3((uint64_t)v5, (uint64_t)a1, v9);
    }

    v11 = [a1[5] _extensionContextForUUID:v5];
    v12 = a1 + 4;
    if ([a1[4] _verifyIntegrityWithHostContext:v11]
      && ([v11 _auxiliaryConnection], (v13 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v14 = dispatch_get_global_queue(0, 0);
      dispatch_source_t v15 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v14);

      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      v46 = __Block_byref_object_copy__1;
      *(void *)&long long v47 = __Block_byref_object_dispose__1;
      *((void *)&v47 + 1) = 0;
      v41[0] = MEMORY[0x1E4F143A8];
      v41[1] = 3221225472;
      v41[2] = __49___MDIndexExtension__performJob_completionBlock___block_invoke_46;
      v41[3] = &unk_1E5549170;
      v16 = v15;
      v42 = v16;
      id v43 = a1[5];
      id v44 = a1[7];
      *((void *)&v47 + 1) = [v41 copy];
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __49___MDIndexExtension__performJob_completionBlock___block_invoke_2;
      handler[3] = &unk_1E55491C0;
      id v17 = v13;
      id v18 = a1[4];
      id v38 = v17;
      id v39 = v18;
      v40 = buf;
      dispatch_source_set_event_handler(v16, handler);
      dispatch_time_t v19 = dispatch_time(0, 610000000000);
      dispatch_source_set_timer(v16, v19, 0x8E06D55400uLL, 0x3B9ACA00uLL);
      dispatch_resume(v16);
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __49___MDIndexExtension__performJob_completionBlock___block_invoke_50;
      v32[3] = &unk_1E55491E8;
      id v33 = v5;
      v20 = (uint64_t *)(a1 + 6);
      id v21 = a1[6];
      id v22 = a1[4];
      id v34 = v21;
      id v35 = v22;
      v36 = buf;
      v23 = [v17 remoteObjectProxyWithErrorHandler:v32];
      v24 = logForCSLogCategoryIndex();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
        __49___MDIndexExtension__performJob_completionBlock___block_invoke_cold_2();
      }

      v25 = logForCSLogCategoryIndex();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
        __49___MDIndexExtension__performJob_completionBlock___block_invoke_cold_1();
      }

      uint64_t v26 = *v20;
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __49___MDIndexExtension__performJob_completionBlock___block_invoke_52;
      v31[3] = &unk_1E5549210;
      v31[4] = *v12;
      v31[5] = buf;
      [v23 performJob:v26 acknowledgementHandler:v31];

      _Block_object_dispose(buf, 8);
    }
    else
    {
      v27 = logForCSLogCategoryIndex();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        v29 = (void *(*)(uint64_t, uint64_t))a1[6];
        id v30 = a1[4];
        *(_DWORD *)buf = 138413058;
        *(void *)&buf[4] = v11;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v5;
        *(_WORD *)&buf[22] = 2112;
        v46 = v29;
        LOWORD(v47) = 2112;
        *(void *)((char *)&v47 + 2) = v30;
        _os_log_error_impl(&dword_18D0E3000, v27, OS_LOG_TYPE_ERROR, "Failed to get an XPC connnection for hostContext:%@, requestID:%@, job:%@, extension:%@", buf, 0x2Au);
      }

      v28 = (void (**)(id, void, id))a1[7];
      if (!v28) {
        goto LABEL_20;
      }
      id v17 = [MEMORY[0x1E4F28C58] errorWithDomain:@"CSIndexErrorDomain" code:-1 userInfo:0];
      v28[2](v28, 0, v17);
    }

LABEL_20:
    goto LABEL_21;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    __49___MDIndexExtension__performJob_completionBlock___block_invoke_cold_4((uint64_t)a1, (uint64_t)v6, v9);
  }

  v10 = (void (**)(id, void, id))a1[7];
  if (v10) {
    v10[2](v10, 0, v6);
  }
LABEL_21:
}

void __49___MDIndexExtension__performJob_completionBlock___block_invoke_46(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
  if (v5) {
    [*(id *)(a1 + 40) cancelExtensionRequestWithIdentifier:MEMORY[0x1E4F1CBF0]];
  }
  uint64_t v6 = *(void *)(a1 + 48);
  if (v6) {
    (*(void (**)(uint64_t, id, id))(v6 + 16))(v6, v7, v5);
  }
}

void __49___MDIndexExtension__performJob_completionBlock___block_invoke_2(uint64_t a1)
{
  v2 = (void *)MEMORY[0x192F99810]();
  id v3 = [*(id *)(a1 + 32) remoteObjectProxy];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __49___MDIndexExtension__performJob_completionBlock___block_invoke_3;
  v4[3] = &unk_1E5549198;
  long long v5 = *(_OWORD *)(a1 + 40);
  [v3 getLastUpdateTimeWithCompletionHandler:v4];
}

void __49___MDIndexExtension__performJob_completionBlock___block_invoke_3(uint64_t a1, double a2)
{
  v4 = (void *)MEMORY[0x192F99810]();
  double Current = CFAbsoluteTimeGetCurrent();
  if (Current >= a2)
  {
    double v6 = Current - a2;
    if (Current - a2 >= 600.0)
    {
      id v7 = logForCSLogCategoryIndex();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        __49___MDIndexExtension__performJob_completionBlock___block_invoke_3_cold_1(v7, a2, v6, v8, v9);
      }

      id v10 = *(id *)(a1 + 32);
      objc_sync_enter(v10);
      v11 = *(const void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      if (v11)
      {
        v12 = (void (**)(void *, void, void *))_Block_copy(v11);
        uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
        v14 = *(void **)(v13 + 40);
        *(void *)(v13 + 40) = 0;
      }
      else
      {
        v12 = 0;
      }
      objc_sync_exit(v10);

      if (v12)
      {
        dispatch_source_t v15 = [MEMORY[0x1E4F28C58] errorWithDomain:@"CSIndexErrorDomain" code:-1 userInfo:0];
        v12[2](v12, 0, v15);
      }
    }
  }
}

void __49___MDIndexExtension__performJob_completionBlock___block_invoke_50(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = (void *)MEMORY[0x192F99810]();
  long long v5 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __49___MDIndexExtension__performJob_completionBlock___block_invoke_50_cold_1();
  }

  id v6 = *(id *)(a1 + 48);
  objc_sync_enter(v6);
  id v7 = *(const void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  if (v7)
  {
    uint64_t v8 = (void (**)(void *, void, id))_Block_copy(v7);
    uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = 0;
  }
  else
  {
    uint64_t v8 = 0;
  }
  objc_sync_exit(v6);

  if (v8) {
    v8[2](v8, 0, v3);
  }
}

void __49___MDIndexExtension__performJob_completionBlock___block_invoke_52(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  id v6 = (void *)MEMORY[0x192F99810]();
  id v7 = *(id *)(a1 + 32);
  objc_sync_enter(v7);
  uint64_t v8 = *(const void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (v8)
  {
    uint64_t v9 = (void (**)(void *, id, id))_Block_copy(v8);
    uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
    v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = 0;
  }
  else
  {
    uint64_t v9 = 0;
  }
  objc_sync_exit(v7);

  if (v9) {
    v9[2](v9, v12, v5);
  }
}

void __48___MDIndexExtension_performJob_completionBlock___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x192F99810]();
  id v3 = [*(id *)(a1 + 32) queue];
  dispatch_suspend(v3);

  v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __48___MDIndexExtension_performJob_completionBlock___block_invoke_2;
  v6[3] = &unk_1E5549260;
  v6[4] = v4;
  id v7 = *(id *)(a1 + 48);
  [v4 _performJob:v5 completionBlock:v6];
}

void __48___MDIndexExtension_performJob_completionBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) queue];
  dispatch_resume(v6);

  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v8, v5);
  }
}

void __123___MDIndexExtension_initWithExtension_queue_containerPath_containerID_supportedFileTypes_extensionLabel_isAppleCodeSigned___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a2 + 32));
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_1(&dword_18D0E3000, a3, v5, "Request interrupted, requestID:%@, extension:%@", v6);
}

void __123___MDIndexExtension_initWithExtension_queue_containerPath_containerID_supportedFileTypes_extensionLabel_isAppleCodeSigned___block_invoke_1_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a2 + 32));
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_1(&dword_18D0E3000, a3, v5, "Request completed, requestID:%@, extension:%@", v6);
}

void __49___MDIndexExtension__performJob_completionBlock___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_1(&dword_18D0E3000, v0, v1, "~~~ Calling remoteContext's performJob", v2, v3, v4, v5, v6);
}

void __49___MDIndexExtension__performJob_completionBlock___block_invoke_cold_2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1(&dword_18D0E3000, v0, (uint64_t)v0, "Invoking extension:%@ with job:%@", v1);
}

void __49___MDIndexExtension__performJob_completionBlock___block_invoke_cold_3(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a2 + 32);
  int v4 = 138412546;
  uint64_t v5 = a1;
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  OUTLINED_FUNCTION_1_1(&dword_18D0E3000, a3, (uint64_t)a3, "Finished setting up a new request, requestID:%@, extension:%@", (uint8_t *)&v4);
}

void __49___MDIndexExtension__performJob_completionBlock___block_invoke_cold_4(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_18D0E3000, log, OS_LOG_TYPE_ERROR, "Failed to setup a new session for extension:%@, error:%@", (uint8_t *)&v4, 0x16u);
}

void __49___MDIndexExtension__performJob_completionBlock___block_invoke_3_cold_1(NSObject *a1, double a2, double a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v5 = 134218240;
  unint64_t v6 = (unint64_t)a2;
  __int16 v7 = 2048;
  unint64_t v8 = (unint64_t)a3;
  OUTLINED_FUNCTION_1_1(&dword_18D0E3000, a1, a5, "lastUpdateTime:%llu, delta:%llus", (uint8_t *)&v5);
}

void __49___MDIndexExtension__performJob_completionBlock___block_invoke_50_cold_1()
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2_0();
  __int16 v5 = v0;
  uint64_t v6 = v1;
  __int16 v7 = v0;
  uint64_t v8 = v2;
  _os_log_error_impl(&dword_18D0E3000, v3, OS_LOG_TYPE_ERROR, "Connection failed for requestID:%@, job:%@, extension:%@, error:%@", v4, 0x2Au);
}

@end
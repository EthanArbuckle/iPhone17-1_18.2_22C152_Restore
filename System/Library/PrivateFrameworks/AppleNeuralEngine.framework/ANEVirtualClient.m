@interface ANEVirtualClient
@end

@implementation ANEVirtualClient

uint64_t __37___ANEVirtualClient_sharedConnection__block_invoke()
{
  +[_ANEVirtualClient sharedConnection]::client = [[_ANEVirtualClient alloc] initWithSingletonAccess];
  return MEMORY[0x1F41817F8]();
}

void __65___ANEVirtualClient_evaluateWithModel_options_request_qos_error___block_invoke(uint64_t a1, void *a2)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) signaledValue];
  BOOL v5 = os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_DEBUG);
  if (v4 == 4097)
  {
    if (v5) {
      __65___ANEVirtualClient_evaluateWithModel_options_request_qos_error___block_invoke_cold_1();
    }
    v6 = [*(id *)(a1 + 40) completionHandler];
    v6[2](v6, 1, 0);
    v7 = v3;
  }
  else
  {
    if (v5) {
      __65___ANEVirtualClient_evaluateWithModel_options_request_qos_error___block_invoke_cold_2();
    }
    v8 = (void *)MEMORY[0x1E4F28C58];
    v9 = +[_ANEStrings errorDomainVirtIO];
    uint64_t v12 = *MEMORY[0x1E4F28568];
    v13[0] = @"Failed to match value in success handler";
    v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
    v7 = [v8 errorWithDomain:v9 code:0 userInfo:v10];

    v11 = [*(id *)(a1 + 40) completionHandler];
    ((void (**)(void, void, void *))v11)[2](v11, 0, v7);

    v6 = (void (**)(void, void, void))v3;
  }
}

void __65___ANEVirtualClient_evaluateWithModel_options_request_qos_error___block_invoke_61(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  v6 = (id)gLogger;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v13 = [*(id *)(a1 + 32) signaledValue];
    *(_DWORD *)buf = 134218496;
    id v17 = v5;
    __int16 v18 = 2048;
    uint64_t v19 = a3;
    __int16 v20 = 2048;
    uint64_t v21 = v13;
    _os_log_debug_impl(&dword_1DB8AB000, v6, OS_LOG_TYPE_DEBUG, "notifyListener failure. Sending error on completion handler: event:%p, value:%llx signaledValue %llx ", buf, 0x20u);
  }

  if ([*(id *)(a1 + 32) signaledValue] == -536870186)
  {
    v7 = objc_msgSend(NSString, "stringWithFormat:", @"%x: Program Inference timeout", 3758097110);
    v8 = +[_ANEErrors timeoutErrorForMethod:v7];
  }
  else
  {
    v7 = objc_msgSend(NSString, "stringWithFormat:", @"%llx", objc_msgSend(*(id *)(a1 + 32), "signaledValue"));
    v9 = (void *)MEMORY[0x1E4F28C58];
    v10 = +[_ANEStrings errorDomainVirtIO];
    uint64_t v14 = *MEMORY[0x1E4F28568];
    v15 = v7;
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v15 forKeys:&v14 count:1];
    v8 = [v9 errorWithDomain:v10 code:0 userInfo:v11];
  }
  uint64_t v12 = [*(id *)(a1 + 40) completionHandler];
  ((void (**)(void, void, void *))v12)[2](v12, 0, v8);
}

void __65___ANEVirtualClient_evaluateWithModel_options_request_qos_error___block_invoke_70(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  uint64_t v6 = *(void *)(a1 + 64);
  uint64_t v7 = *(unsigned int *)(a1 + 80);
  id v10 = 0;
  char v8 = [v2 doEvaluateWithModel:v3 options:v4 request:v5 qos:v7 completionEvent:v6 error:&v10];
  id v9 = v10;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = v8;
}

uint64_t __65___ANEVirtualClient_evaluateWithModel_options_request_qos_error___block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) doEvaluateWithModel:*(void *)(a1 + 40) options:*(void *)(a1 + 48) request:*(void *)(a1 + 56) qos:*(unsigned int *)(a1 + 80) completionEvent:0 error:*(void *)(a1 + 72)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = result;
  return result;
}

void __73___ANEVirtualClient_mapIOSurfacesWithModel_request_cacheInference_error___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(unsigned __int8 *)(a1 + 64);
  id v9 = 0;
  char v6 = [v2 doMapIOSurfacesWithModel:v3 request:v4 cacheInference:v5 error:&v9];
  id v7 = v9;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v6;
  char v8 = [*(id *)(a1 + 48) completionHandler];
  ((void (**)(void, void, id))v8)[2](v8, *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 56) + 8) + 24), v7);
}

uint64_t __73___ANEVirtualClient_mapIOSurfacesWithModel_request_cacheInference_error___block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) doMapIOSurfacesWithModel:*(void *)(a1 + 40) request:*(void *)(a1 + 48) cacheInference:*(unsigned __int8 *)(a1 + 72) error:*(void *)(a1 + 64)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = result;
  return result;
}

void __65___ANEVirtualClient_evaluateWithModel_options_request_qos_error___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_9(&dword_1DB8AB000, v0, (uint64_t)v0, "notifyListener success completion event: event:%p, 0x%llx\n", v1);
}

void __65___ANEVirtualClient_evaluateWithModel_options_request_qos_error___block_invoke_cold_2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_9(&dword_1DB8AB000, v0, (uint64_t)v0, "Failed to match success completion signal value. Sending error on completion handler: event:%p, value: 0x%llx", v1);
}

@end
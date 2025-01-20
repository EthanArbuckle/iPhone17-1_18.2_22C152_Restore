@interface AAURLSessionConfigurationTask
@end

@implementation AAURLSessionConfigurationTask

void __71___AAURLSessionConfigurationTask__unfairLock_initiateConfigurationTask__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  v6 = *(unsigned char **)(a1 + 32);
  if (v6[20])
  {
    v7 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F289A0] code:-999 userInfo:0];
    [*(id *)(a1 + 32) _invokeCompletionWithData:0 response:0 error:v7];
  }
  else if (v9)
  {
    objc_msgSend(v6, "_initiateSessionTaskWithConfiguration:");
  }
  else
  {
    if (v5) {
      id v8 = v5;
    }
    else {
      id v8 = 0;
    }
    [v6 _invokeCompletionWithData:0 response:0 error:v8];
  }
}

void __72___AAURLSessionConfigurationTask__initiateSessionTaskWithConfiguration___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    v10 = _AALogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __72___AAURLSessionConfigurationTask__initiateSessionTaskWithConfiguration___block_invoke_cold_1(a1, (uint64_t)v9, v10);
    }
  }
  [*(id *)(a1 + 32) _invokeCompletionWithData:v7 response:v8 error:v9];
}

void __41___AAURLSessionConfigurationTask_suspend__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 32);
  if (v3 || (v3 = *(void **)(v2 + 24)) != 0)
  {
    [v3 suspend];
  }
  else
  {
    id v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:*(void *)(a1 + 40) object:*(void *)(a1 + 32) file:@"AAURLSessionConfigurationTask.m" lineNumber:139 description:@"Attempt to suspend inactive task!"];
  }
}

uint64_t __40___AAURLSessionConfigurationTask_resume__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = (void *)v1[4];
  if (v2) {
    return [v2 resume];
  }
  uint64_t v2 = (void *)v1[3];
  if (v2) {
    return [v2 resume];
  }
  else {
    return objc_msgSend(v1, "_unfairLock_initiateConfigurationTask");
  }
}

__CFString *__45___AAURLSessionConfigurationTask_description__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 32);
  if (v2 || (uint64_t v2 = *(void **)(v1 + 24)) != 0)
  {
    v3 = [v2 description];
  }
  else
  {
    v3 = @"< Inactive AAURLSessionConfigurationTask >";
  }

  return v3;
}

void __72___AAURLSessionConfigurationTask__initiateSessionTaskWithConfiguration___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 32);
  int v4 = 138543618;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_1A11D8000, log, OS_LOG_TYPE_ERROR, "_sessionTask %{public}@ completed with error:%@", (uint8_t *)&v4, 0x16u);
}

@end
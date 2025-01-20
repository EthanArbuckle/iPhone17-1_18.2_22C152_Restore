@interface CacheDeleteRegisterInfoCallbacksForProcess
@end

@implementation CacheDeleteRegisterInfoCallbacksForProcess

void ___CacheDeleteRegisterInfoCallbacksForProcess_block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  unsigned __int8 v1 = atomic_load((unsigned __int8 *)(*(void *)(*(void *)(a1 + 96) + 8) + 24));
  if (v1)
  {
    v4 = CDGetLogHandle((uint64_t)"client");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v9) = 0;
      v6 = "deleted has launched";
      v7 = v4;
      uint32_t v8 = 2;
      goto LABEL_6;
    }
  }
  else
  {
    int v3 = _CacheDeleteRegister(*(void **)(a1 + 32), *(void **)(a1 + 48), *(void **)(a1 + 56), *(void **)(a1 + 64), *(void **)(a1 + 72), *(void **)(a1 + 80), *(void **)(a1 + 88), *(void **)(a1 + 40));
    v4 = CDGetLogHandle((uint64_t)"client");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v9 = 138543874;
      uint64_t v10 = v5;
      __int16 v11 = 2082;
      v12 = "_Anonymous";
      __int16 v13 = 1024;
      int v14 = v3;
      v6 = "deleted has been relaunched, re-registered %{public}@%{public}s, result: %d";
      v7 = v4;
      uint32_t v8 = 28;
LABEL_6:
      _os_log_impl(&dword_1A63D1000, v7, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v9, v8);
    }
  }
}

@end
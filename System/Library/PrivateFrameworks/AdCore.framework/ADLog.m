@interface ADLog
@end

@implementation ADLog

void ___ADLog_block_invoke_2(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = [(id)_ADLog_logHandles objectForKey:*(void *)(a1 + 32)];
  if (!v2)
  {
    v2 = os_log_create("com.apple.iad", (const char *)[*(id *)(a1 + 32) UTF8String]);
    [(id)_ADLog_logHandles setObject:v2 forKey:*(void *)(a1 + 32)];
  }
  os_log_type_t v3 = *(unsigned char *)(a1 + 48);
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = *(void *)(a1 + 40);
    int v5 = 138543362;
    uint64_t v6 = v4;
    _os_log_impl(&dword_1D0EEB000, v2, v3, "%{public}@", (uint8_t *)&v5, 0xCu);
  }
}

uint64_t ___ADLog_block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:0 valueOptions:1282 capacity:8];
  v1 = (void *)_ADLog_logHandles;
  _ADLog_logHandles = v0;

  uint64_t result = MGGetBoolAnswer();
  _ADLog_internalBuild = result;
  return result;
}

@end
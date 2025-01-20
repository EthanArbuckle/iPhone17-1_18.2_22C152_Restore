@interface RequestModeChangeAsync
@end

@implementation RequestModeChangeAsync

void __fsmcontroller_RequestModeChangeAsync_block_invoke(uint64_t a1)
{
  long long v7 = 0u;
  long long v8 = 0u;
  uint64_t v2 = fsm_requestModeChange(*(__n128 **)(a1 + 40), (long long *)(a1 + 48), *(const char **)(a1 + 120), 0, (uint64_t)&v7, *(unsigned __int8 *)(a1 + 128));
  free(*(void **)(a1 + 120));
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = *(void (**)(uint64_t, uint64_t, _OWORD *, uint64_t))(v3 + 16);
  v6[0] = v7;
  v6[1] = v8;
  v4(v3, v2, v6, v5);
  CFRelease(*(CFTypeRef *)(a1 + 40));
}

@end
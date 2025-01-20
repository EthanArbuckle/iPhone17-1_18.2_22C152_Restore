@interface GetCurrentMode
@end

@implementation GetCurrentMode

double __fsmcontroller_GetCurrentMode_block_invoke(uint64_t a1)
{
  *(void *)&double result = fsm_getCurrentMode((__n128 *)*(void *)(a1 + 32), (__n128 *)*(void *)(a1 + 40), 0).n128_u64[0];
  return result;
}

@end
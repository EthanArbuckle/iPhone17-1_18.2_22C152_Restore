@interface WakeUpHoses
@end

@implementation WakeUpHoses

uint64_t __audioHoseManagerBuffered_WakeUpHoses_block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)(a3 + 40) = 0;
  *(void *)(a3 + 56) = 0;
  if (*(_DWORD *)(*(void *)(result + 32) + 312) != 1886614642)
  {
    result = mach_absolute_time();
    *(void *)(a3 + 48) = result;
  }
  return result;
}

@end
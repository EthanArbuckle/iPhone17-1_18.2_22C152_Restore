@interface CMSessionEndInterruption
@end

@implementation CMSessionEndInterruption

uint64_t __CMSessionEndInterruption_WithInterruptionNotification_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    v3 = *(void **)(v2 + 16);
  }
  else {
    v3 = 0;
  }
  uint64_t result = MXCoreSessionEndInterruption_WithSecTaskAndStatus(v3, 0, *(const __CFString **)(a1 + 48), 1);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end
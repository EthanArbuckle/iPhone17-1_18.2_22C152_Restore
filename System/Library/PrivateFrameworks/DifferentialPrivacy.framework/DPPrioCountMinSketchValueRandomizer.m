@interface DPPrioCountMinSketchValueRandomizer
@end

@implementation DPPrioCountMinSketchValueRandomizer

BOOL __59___DPPrioCountMinSketchValueRandomizer_randomize_metadata___block_invoke(uint64_t a1, uint64_t a2, unint64_t a3)
{
  unsigned int v5 = uint32_from_string(*(_DWORD *)(a1 + 48), (const char *)[*(id *)(a1 + 32) UTF8String], *(_DWORD *)(a1 + 40));
  if (v5 < a3) {
    *(_DWORD *)(a2 + 4 * v5) = 1;
  }
  return v5 < a3;
}

@end
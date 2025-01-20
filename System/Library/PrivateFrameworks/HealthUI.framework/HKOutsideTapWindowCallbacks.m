@interface HKOutsideTapWindowCallbacks
@end

@implementation HKOutsideTapWindowCallbacks

BOOL __54___HKOutsideTapWindowCallbacks_removeCallbackForView___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 view];
  BOOL v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

@end
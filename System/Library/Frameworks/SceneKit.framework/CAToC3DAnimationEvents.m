@interface CAToC3DAnimationEvents
@end

@implementation CAToC3DAnimationEvents

uint64_t ___CAToC3DAnimationEvents_block_invoke(uint64_t a1, void *a2, void *a3)
{
  [a2 time];
  double v6 = v5;
  [a3 time];
  if (v6 < v7) {
    return -1;
  }
  [a2 time];
  double v10 = v9;
  [a3 time];
  return v10 != v11;
}

@end
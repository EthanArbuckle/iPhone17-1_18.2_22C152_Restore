@interface CTServerConnectionSetTargetQueue
@end

@implementation CTServerConnectionSetTargetQueue

void ___CTServerConnectionSetTargetQueue_block_invoke(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    dispatch_retain(*(dispatch_object_t *)(a1 + 40));
  }
  v4 = *(NSObject **)(v3 + 8);
  *(void *)(v3 + 8) = v2;
  if (v4) {
    dispatch_release(v4);
  }
  v5 = *(const void **)(a1 + 48);

  CFRelease(v5);
}

@end
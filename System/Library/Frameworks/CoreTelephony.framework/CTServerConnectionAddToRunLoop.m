@interface CTServerConnectionAddToRunLoop
@end

@implementation CTServerConnectionAddToRunLoop

void ___CTServerConnectionAddToRunLoop_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 16) = *(void *)(a1 + 40);
  *(void *)(*(void *)(a1 + 32) + 24) = *(void *)(a1 + 48);
  CFRelease(*(CFTypeRef *)(a1 + 56));
}

@end
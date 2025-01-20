@interface ASUIInputValueCallback
@end

@implementation ASUIInputValueCallback

void ___ASUIInputValueCallback_block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _handleMFIButtonDownValue:*(void *)(a1 + 40)];
  v2 = *(const void **)(a1 + 40);

  CFRelease(v2);
}

@end
@interface SFImageActivityItemProvider
@end

@implementation SFImageActivityItemProvider

void __42___SFImageActivityItemProvider__imageData__block_invoke(uint64_t a1, void *a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v3 = a2;
  id v4 = [MEMORY[0x1E4F1CAC0] currentRunLoop];

  CFRunLoopWakeUp((CFRunLoopRef)[v4 getCFRunLoop]);
}

@end
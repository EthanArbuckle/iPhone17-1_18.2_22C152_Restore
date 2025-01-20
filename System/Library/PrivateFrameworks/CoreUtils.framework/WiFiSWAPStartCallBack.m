@interface WiFiSWAPStartCallBack
@end

@implementation WiFiSWAPStartCallBack

void ___WiFiSWAPStartCallBack_block_invoke(uint64_t a1)
{
  (*(void (**)(void, void, void))(a1 + 32))(*(void *)(a1 + 40), *(unsigned int *)(a1 + 56), *(void *)(a1 + 48));
  v2 = *(const void **)(a1 + 40);
  CFRelease(v2);
}

@end